#ifdef DEBUG

#include "hash.h"
#include "hashtbl.h"
#include "dynstr.h"
#include "utest/utest.h"

UTEST(dynstr, dynstr) {
  dynstr_t s1 = dynstr_from_cstr("dynstr");
  EXPECT_EQ(6u, dynstr_size(s1));
  EXPECT_EQ(6u, dynstr_capacity(s1));
  EXPECT_EQ(0u, dynstr_available(s1));
  EXPECT_EQ(DYNSTR_6, dynstr_type(s1));

  dynstr_t s2 = dynstr_from_cstr(" is good");
  EXPECT_EQ(8u, dynstr_size(s2));
  EXPECT_EQ(8u, dynstr_capacity(s2));
  EXPECT_EQ(0u, dynstr_available(s2));
  EXPECT_EQ(DYNSTR_6, dynstr_type(s2));

  const size_t N = 100;
  s2 = dynstr_reserve(s2, N);
  EXPECT_EQ(8u, dynstr_size(s2));
  EXPECT_EQ(100u, dynstr_capacity(s2));
  EXPECT_EQ(92u, dynstr_available(s2));
  EXPECT_EQ(DYNSTR_32, dynstr_type(s2));

  s1 = dynstr_concat(s1, s2);
  EXPECT_EQ(14u, dynstr_size(s1));
  EXPECT_EQ(21u, dynstr_capacity(s1));
  EXPECT_EQ(7u, dynstr_available(s1));
  EXPECT_EQ(DYNSTR_32, dynstr_type(s2));

  s2 = dynstr_concat_cstr(s2, " and nice");
  EXPECT_EQ(17u, dynstr_size(s2));
  EXPECT_EQ(100u, dynstr_capacity(s2));
  EXPECT_EQ(83u, dynstr_available(s2));
  EXPECT_EQ(DYNSTR_32, dynstr_type(s2));

  dynstr_t s3 = dynstr_from_cstr(" is good and nice");
  dynstr_t s4 = dynstr_concat(dynstr_new_empty(), s3);
  EXPECT_EQ(0, dynstr_compare(s2, s3));
  EXPECT_TRUE(dynstr_eq(s2, s3));
  EXPECT_EQ(0, dynstr_compare(s3, s4));
  EXPECT_TRUE(dynstr_eq(s3, s4));

  dynstr_free(s1);
  dynstr_free(s2);
  dynstr_free(s3);
  dynstr_free(s4);
}

UTEST(hashtbl, normcap) {
  EXPECT_EQ(1u, hashtbl_normalize_capacity(0));
  EXPECT_EQ(1u, hashtbl_normalize_capacity(1));
  EXPECT_EQ(3u, hashtbl_normalize_capacity(2));
  EXPECT_EQ(3u, hashtbl_normalize_capacity(3));
  EXPECT_EQ(7u, hashtbl_normalize_capacity(4));
  EXPECT_EQ(7u, hashtbl_normalize_capacity(7));
  EXPECT_EQ(15u, hashtbl_normalize_capacity(8));
  EXPECT_EQ(15u, hashtbl_normalize_capacity(15));
  EXPECT_EQ(15u * 2 + 1, hashtbl_normalize_capacity(15 + 1));
  EXPECT_EQ(15u * 2 + 1, hashtbl_normalize_capacity(15 + 2));
}

UTEST(hashtbl, growcap) {
  for (size_t growth = 0; growth < 10000; ++growth) {
    size_t capacity = hashtbl_normalize_capacity(hashtbl_growth_to_lower_bound_capacity(growth));
    EXPECT_GE(hashtbl_capacity_to_growth(capacity), growth);
    if (capacity + 1 < GROUP_WIDTH) {
      EXPECT_EQ(hashtbl_capacity_to_growth(capacity), capacity);
    } else {
      EXPECT_LT(hashtbl_capacity_to_growth(capacity), capacity);
    }
    if (growth != 0 && capacity > 1) {
      EXPECT_LT(hashtbl_capacity_to_growth(capacity / 2), growth);
    }
  }

  for (size_t capacity = GROUP_WIDTH  - 1; capacity < 10000;
       capacity = 2 * capacity + 1) {
    size_t growth = hashtbl_capacity_to_growth(capacity);
    EXPECT_LT(growth, capacity);
    EXPECT_LE(hashtbl_growth_to_lower_bound_capacity(growth), capacity);
    EXPECT_EQ(hashtbl_normalize_capacity(hashtbl_growth_to_lower_bound_capacity(growth)),
              capacity);
  }
}

UTEST(hashtbl, probeseq) {
  struct probe_seq seq;
  size_t expected1[] = {0, 16, 48, 96, 32, 112, 80, 64};
  size_t expected2[] = {0, 8, 24, 48, 80, 120, 40, 96};
  size_t *expected;

  if (GROUP_WIDTH == 16) {
    expected = expected1;
  } else if (GROUP_WIDTH == 8) {
    expected = expected2;
  } else {
    EXPECT_TRUE_MSG(0, "No test for given GROUP_WIDTH");
  }

  seq = probe_seq(0, 127);
  for (size_t i = 0; i < 8; ++i) {
    size_t res = hashtbl_probe_seq_offset(&seq, 0);
    hashtbl_probe_seq_next(&seq);

    EXPECT_EQ(res, expected[i]);
  }

  seq = probe_seq(128, 127);
  for (size_t i = 0; i < 8; ++i) {
    size_t res = hashtbl_probe_seq_offset(&seq, 0);
    hashtbl_probe_seq_next(&seq);

    EXPECT_EQ(res, expected[i]);
  }
}


UTEST(hashtbl, maskbits) {
  struct bitmask x1 = { .mask = 0, .width = 8, .shift = 0 };  
  struct bitmask x2 = { .mask = 1, .width = 8, .shift = 0 };  
  struct bitmask x3 = { .mask = 2, .width = 8, .shift = 0 };  
  struct bitmask x4 = { .mask = 3, .width = 8, .shift = 0 };  
  struct bitmask x5 = { .mask = 4, .width = 8, .shift = 0 };  
  struct bitmask x6 = { .mask = 5, .width = 8, .shift = 0 };  
  struct bitmask x7 = { .mask = 0x55, .width = 8, .shift = 0 };  
  struct bitmask x8 = { .mask = 0xaa, .width = 8, .shift = 0 };  

  uint32_t x;

#define EXPECT_BITMASK_END(v) \
  EXPECT_FALSE(bitmask_next(&v, &x))

#define EXPECT_BITMASK_NEXT(v, n) \
  EXPECT_TRUE(bitmask_next(&v, &x)); \
  EXPECT_EQ((uint64_t)x, (uint64_t)n)

  EXPECT_BITMASK_END(x1);
  
  EXPECT_BITMASK_NEXT(x2, 0);
  EXPECT_BITMASK_END(x2);

  EXPECT_BITMASK_NEXT(x3, 1);
  EXPECT_BITMASK_END(x3);

  EXPECT_BITMASK_NEXT(x4, 0);
  EXPECT_BITMASK_NEXT(x4, 1);
  EXPECT_BITMASK_END(x4);

  EXPECT_BITMASK_NEXT(x5, 2);
  EXPECT_BITMASK_END(x5);

  EXPECT_BITMASK_NEXT(x6, 0);
  EXPECT_BITMASK_NEXT(x6, 2);
  EXPECT_BITMASK_END(x6);

  EXPECT_BITMASK_NEXT(x7, 0);
  EXPECT_BITMASK_NEXT(x7, 2);
  EXPECT_BITMASK_NEXT(x7, 4);
  EXPECT_BITMASK_NEXT(x7, 6);
  EXPECT_BITMASK_END(x7);

  EXPECT_BITMASK_NEXT(x8, 1);
  EXPECT_BITMASK_NEXT(x8, 3);
  EXPECT_BITMASK_NEXT(x8, 5);
  EXPECT_BITMASK_NEXT(x8, 7);
  EXPECT_BITMASK_END(x8);
}

UTEST(hashtbl, withshift) {
  uint64_t ctrl = 0x1716151413121110;
  uint64_t hash = 0x12;
  uint64_t msbs = 0x8080808080808080ULL;
  uint64_t lsbs = 0x0101010101010101ULL;

  uint64_t x = ctrl ^ (lsbs * hash);
  uint64_t mask = (x - lsbs) & ~x & msbs;

  struct bitmask bm = { .width = 8, .shift = 3, .mask = mask };
  EXPECT_EQ(bitmask_lsb_set(&bm), 2u);
}

UTEST(hashtbl, clzctz) {
  struct bitmask x1 = { .mask = 0x00001a40, .width = 16, .shift = 0 };  
  struct bitmask x2 = { .mask = 0x00000001, .width = 16, .shift = 0 };  
  struct bitmask x3 = { .mask = 0x00008000, .width = 16, .shift = 0 };  
  struct bitmask x4 = { .mask = 0x0000008080808000, .width = 8, .shift = 3 };  
  struct bitmask x5 = { .mask = 0x0000000000000080, .width = 8, .shift = 3 };  
  struct bitmask x6 = { .mask = 0x8000000000000000, .width = 8, .shift = 3 };  

  EXPECT_EQ(bitmask_clz(&x1), 3u);
  EXPECT_EQ(bitmask_ctz(&x1), 6u);

  EXPECT_EQ(bitmask_clz(&x2), 15u);
  EXPECT_EQ(bitmask_ctz(&x2), 0u);

  EXPECT_EQ(bitmask_clz(&x3), 0u);
  EXPECT_EQ(bitmask_ctz(&x3), 15u);

  EXPECT_EQ(bitmask_clz(&x4), 3u);
  EXPECT_EQ(bitmask_ctz(&x4), 1u);
  
  EXPECT_EQ(bitmask_clz(&x5), 7u);
  EXPECT_EQ(bitmask_ctz(&x5), 0u);

  EXPECT_EQ(bitmask_clz(&x6), 0u);
  EXPECT_EQ(bitmask_ctz(&x6), 7u);
}

static ctrl_t ctrl(int i) { return (ctrl_t){.x = i}; }

UTEST(hashtbl, match) {
  if (GROUP_WIDTH == 16) {
    ctrl_t group[] = {
      CTRL_EMPTY, ctrl(1), CTRL_DELETED,  ctrl(3),
      CTRL_EMPTY, ctrl(5), CTRL_SENTINEL, ctrl(7),
      ctrl(7),    ctrl(5), ctrl(3),       ctrl(1),
      ctrl(1),    ctrl(1), ctrl(1),       ctrl(1),
    };
    
    uint32_t x;
    group_t g = hashtbl_group_new(group);

    struct bitmask x1 = hashtbl_group_match(&g, 0);
    struct bitmask x2 = hashtbl_group_match(&g, 1);
    struct bitmask x3 = hashtbl_group_match(&g, 3);
    struct bitmask x4 = hashtbl_group_match(&g, 5);
    struct bitmask x5 = hashtbl_group_match(&g, 7);

    EXPECT_BITMASK_END(x1);

    EXPECT_BITMASK_NEXT(x2, 1);
    EXPECT_BITMASK_NEXT(x2, 11);
    EXPECT_BITMASK_NEXT(x2, 12);
    EXPECT_BITMASK_NEXT(x2, 13);
    EXPECT_BITMASK_NEXT(x2, 14);
    EXPECT_BITMASK_NEXT(x2, 15);
    EXPECT_BITMASK_END(x2);


    EXPECT_BITMASK_NEXT(x3, 3);
    EXPECT_BITMASK_NEXT(x3, 10);
    EXPECT_BITMASK_END(x3);

    EXPECT_BITMASK_NEXT(x4, 5);
    EXPECT_BITMASK_NEXT(x4, 9);
    EXPECT_BITMASK_END(x4);
    
    EXPECT_BITMASK_NEXT(x5, 7);
    EXPECT_BITMASK_NEXT(x5, 8);
    EXPECT_BITMASK_END(x5);
  } else if (GROUP_WIDTH == 8) {
    ctrl_t group[] = {
      CTRL_EMPTY, ctrl(1), ctrl(2),       CTRL_DELETED,
      ctrl(2),    ctrl(1), CTRL_SENTINEL, ctrl(1),
    };
    
    uint32_t x;
    group_t g = hashtbl_group_new(group);

    struct bitmask x1 = hashtbl_group_match(&g, 0);
    struct bitmask x2 = hashtbl_group_match(&g, 1);
    struct bitmask x3 = hashtbl_group_match(&g, 2);

    EXPECT_BITMASK_END(x1);

    EXPECT_BITMASK_NEXT(x2, 1);
    EXPECT_BITMASK_NEXT(x2, 5);
    EXPECT_BITMASK_NEXT(x2, 7);
    EXPECT_BITMASK_END(x2);

    EXPECT_BITMASK_NEXT(x3, 2);
    EXPECT_BITMASK_NEXT(x3, 4);
    EXPECT_BITMASK_END(x3);
  } else {
    EXPECT_TRUE_MSG(0, "No test for given GROUP_WIDTH");
  }
}

UTEST(hashtbl, matchempty) {
  if (GROUP_WIDTH == 16) {
    ctrl_t group[] = {
      CTRL_EMPTY, ctrl(1), CTRL_DELETED,  ctrl(3),
      CTRL_EMPTY, ctrl(5), CTRL_SENTINEL, ctrl(7),
      ctrl(7),    ctrl(5), ctrl(3),       ctrl(1),
      ctrl(1),    ctrl(1), ctrl(1),       ctrl(1),
    };
    
    uint32_t x;
    group_t g = hashtbl_group_new(group);

    struct bitmask x1 = hashtbl_group_match_empty(&g);

    EXPECT_BITMASK_NEXT(x1, 0);
    EXPECT_BITMASK_NEXT(x1, 4);
    EXPECT_BITMASK_END(x1);

  } else if (GROUP_WIDTH == 8) {
    ctrl_t group[] = {
      CTRL_EMPTY, ctrl(1), ctrl(2),       CTRL_DELETED,
      ctrl(2),    ctrl(1), CTRL_SENTINEL, ctrl(1),
    };
    
    uint32_t x;
    group_t g = hashtbl_group_new(group);

    struct bitmask x1 = hashtbl_group_match_empty(&g);

    EXPECT_BITMASK_NEXT(x1, 0);
    EXPECT_BITMASK_END(x1);
  } else {
    EXPECT_TRUE_MSG(0, "No test for given GROUP_WIDTH");
  }
}

UTEST(hashtbl, matchempdel) {
  if (GROUP_WIDTH == 16) {
    ctrl_t group[] = {
      CTRL_EMPTY, ctrl(1), CTRL_DELETED,  ctrl(3),
      CTRL_EMPTY, ctrl(5), CTRL_SENTINEL, ctrl(7),
      ctrl(7),    ctrl(5), ctrl(3),       ctrl(1),
      ctrl(1),    ctrl(1), ctrl(1),       ctrl(1),
    };
    
    uint32_t x;
    group_t g = hashtbl_group_new(group);

    struct bitmask x1 = hashtbl_group_match_empty_or_deleted(&g);

    EXPECT_BITMASK_NEXT(x1, 0);
    EXPECT_BITMASK_NEXT(x1, 2);
    EXPECT_BITMASK_NEXT(x1, 4);
    EXPECT_BITMASK_END(x1);

  } else if (GROUP_WIDTH == 8) {
    ctrl_t group[] = {
      CTRL_EMPTY, ctrl(1), ctrl(2),       CTRL_DELETED,
      ctrl(2),    ctrl(1), CTRL_SENTINEL, ctrl(1),
    };
    
    uint32_t x;
    group_t g = hashtbl_group_new(group);

    struct bitmask x1 = hashtbl_group_match_empty(&g);

    EXPECT_BITMASK_NEXT(x1, 0);
    EXPECT_BITMASK_NEXT(x1, 3);
    EXPECT_BITMASK_END(x1);
  } else {
    EXPECT_TRUE_MSG(0, "No test for given GROUP_WIDTH");
  }
}

UTEST(hashtbl, dropdel) {
  ctrl_t cs[63 + 1 + GROUP_WIDTH];
  cs[63].x = CTRL_SENTINEL.x;

  ctrl_t pat[] = {
    CTRL_EMPTY, ctrl(2), CTRL_DELETED, ctrl(2),
    CTRL_EMPTY, ctrl(1), CTRL_DELETED 
  };

  for (size_t i = 0; i < 63; ++i) {
    cs[i].x = pat[i % (sizeof(pat)/sizeof(pat[0]))].x;
    if (i < GROUP_WIDTH - 1)
      cs[i + 63 + 1].x = pat[i % (sizeof(pat)/sizeof(pat[0]))].x;
  }

  hashtbl_convert_deleted_to_empty_and_full_to_deleted(cs, 63);

  EXPECT_EQ(cs[63].x, CTRL_SENTINEL.x);

  for (size_t i = 0; i < 63 + GROUP_WIDTH; ++i) {
    ctrl_t expected = { pat[i % (63 + 1) % (sizeof(pat)/sizeof(pat[0]))].x };
    if (i == 63) {
      expected.x = CTRL_SENTINEL.x;
    }
    if (expected.x == CTRL_DELETED.x) {
      expected.x = CTRL_EMPTY.x;
    }
    if (hashtbl_ctrl_is_full(expected)) {
      expected.x = CTRL_DELETED.x;
    }

    EXPECT_EQ(cs[i].x, expected.x);
  }
}

#define STR_EQ(x, y) (strcmp((x), (y))==0)
#define STR_HASH(x) (hashtbl_default_hash((x), strlen(x)))

// HASHSET_NEW_KIND(strset, const char *, 8, DEFAULT_ALLOC, DEFAULT_COPY, DEFAULT_DEL, STR_EQ, DEFAULT_FREE, DEFAULT_GET, STR_HASH, DEFAULT_INIT, DEFAULT_MOVE)
HASHSET_NEW_KIND_WITH_DEFAULTS(i64set, int64_t, 8)


UTEST(hashtbl, empty) {
  struct i64set *is = i64set_new(0);

  EXPECT_EQ(i64set_size(is), 0u);
  EXPECT_TRUE(i64set_is_empty(is));

  i64set_destroy(is);
}

UTEST(hashtbl, lookupempty) {
  struct i64set *is = i64set_new(0);

  int64_t v = 10;
  EXPECT_FALSE(i64set_contains(is, &v));

  i64set_destroy(is);
}

UTEST(hashtbl, insert1) {
  struct i64set *is = i64set_new(0);

  int64_t v = 0;
  EXPECT_FALSE(i64set_contains(is, &v));

  struct i64set_insert i = i64set_insert(&is, &v);
  EXPECT_TRUE(i.inserted);
  EXPECT_EQ(*i64set_iter_get(&i.iter), 0u);
  EXPECT_EQ(i64set_size(is), 1u);

  struct i64set_iterator it = i64set_find(is, &v);
  EXPECT_EQ(*i64set_iter_get(&it), 0u);


  i64set_destroy(is);
}

UTEST(hashtbl, insert2) {
  struct i64set *is = i64set_new(0);
  
  int64_t v = 0;
  EXPECT_FALSE(i64set_contains(is, &v));

  struct i64set_insert i = i64set_insert(&is, &v);
  EXPECT_TRUE(i.inserted);
  EXPECT_EQ(*i64set_iter_get(&i.iter), v);
  EXPECT_EQ(i64set_size(is), 1u);

  int64_t v2 = 1;
  struct i64set_insert i2 = i64set_insert(&is, &v2);
  EXPECT_TRUE(i2.inserted);
  EXPECT_EQ(*i64set_iter_get(&i2.iter), v2);
  EXPECT_EQ(i64set_size(is), 2u);

  struct i64set_iterator it = i64set_find(is, &v);
  EXPECT_EQ(*i64set_iter_get(&it), v);
  struct i64set_iterator it2 = i64set_find(is, &v2);
  EXPECT_EQ(*i64set_iter_get(&it2), v2);

  i64set_destroy(is);
}

#define BAD_HASH(x) (0u)
HASHSET_NEW_KIND(badset, size_t, 8, DEFAULT_ALLOC, DEFAULT_COPY, DEFAULT_DEL, DEFAULT_EQ, DEFAULT_FREE, DEFAULT_GET, BAD_HASH, DEFAULT_INIT, DEFAULT_MOVE)

UTEST(hashtbl, inscollision) {
  struct badset *is = badset_new(0);
  
  size_t v = 0;
  EXPECT_FALSE(badset_contains(is, &v));

  struct badset_insert i = badset_insert(&is, &v);
  EXPECT_TRUE(i.inserted);
  EXPECT_EQ(*badset_iter_get(&i.iter), v);
  EXPECT_EQ(badset_size(is), 1u);

  size_t v2 = 1;
  struct badset_insert i2 = badset_insert(&is, &v2);
  EXPECT_TRUE(i2.inserted);
  EXPECT_EQ(*badset_iter_get(&i2.iter), v2);
  EXPECT_EQ(badset_size(is), 2u);

  struct badset_iterator it = badset_find(is, &v);
  EXPECT_EQ(*badset_iter_get(&it), v);
  struct badset_iterator it2 = badset_find(is, &v2);
  EXPECT_EQ(*badset_iter_get(&it2), v2);


  badset_destroy(is);
}

UTEST(hashtbl, inscol_finddel) {
  struct badset *is = badset_new(0);

  size_t N = GROUP_WIDTH * 2 + 5;
  for (size_t i = 0; i < N; ++i) {
    struct badset_insert i1 = badset_insert(&is, &i);
    EXPECT_TRUE(i1.inserted);
    EXPECT_EQ(*badset_iter_get(&i1.iter), i);
    EXPECT_EQ(badset_size(is), i + 1);
  }

  for (size_t i = 0; i < N; ++i) {
    EXPECT_TRUE(badset_erase(is, &i));

    for (size_t j = i + 1; j < N; ++j) {
      struct badset_iterator it = badset_find(is, &j);
      EXPECT_EQ(*badset_iter_get(&it), j);

      struct badset_insert i2 = badset_insert(&is, &j);
      EXPECT_FALSE(i2.inserted);
      EXPECT_EQ(*badset_iter_get(&i2.iter), j);
      EXPECT_EQ(badset_size(is), N - i - 1);
    }
  }
  EXPECT_TRUE(badset_is_empty(is));
  badset_destroy(is);
}

UTEST(hashtbl, insertcap) {
  struct i64set *is = i64set_new(0);

  is = i64set_reserve(is, 10);
  size_t original_capacity = i64set_capacity(is);

  int64_t v = 0;
  i64set_insert(&is, &v);

  EXPECT_EQ(i64set_capacity(is), original_capacity);
  uintptr_t original_addr_0 = (uintptr_t)i64set_find(is, &v).raw.slot;

  i64set_insert(&is, &v);
  EXPECT_EQ(i64set_capacity(is), original_capacity);
  EXPECT_EQ((uintptr_t)i64set_find(is, &v).raw.slot, original_addr_0);

  for (int i = 0; i < 100; ++i) {
    v = i % 10;
    i64set_insert(&is, &v);
  }
  v = 0;
  EXPECT_EQ(i64set_capacity(is), original_capacity);
  EXPECT_EQ((uintptr_t)i64set_find(is, &v).raw.slot, original_addr_0);

  i64set_destroy(is);
}


UTEST(hashtbl, largetbl) {
  struct i64set *is = i64set_new(0);

  for (size_t i = 0; i != 100000; i++) {
    int64_t v = i << 20;
    i64set_insert(&is, &v);
  }

  for (size_t i = 0; i != 100000; i++) {
    int64_t v = i << 20;
    struct i64set_iterator iter = i64set_find(is, &v);
    ASSERT_NE(i64set_iter_get(&iter), nullptr);
    ASSERT_EQ(*i64set_iter_get(&iter), v);
  }

  i64set_destroy(is);
}

UTEST(hashtbl, itercopy) {
  struct i64set *is = i64set_new(0);

  size_t N = 1 << 16;
  for (int64_t i = 0; i != (int64_t)N; i++) {
    i64set_insert(&is, &i);
  }

  struct i64set *is2 = i64set_new(0);
  for (struct i64set_iterator it = i64set_iter(is);
      i64set_iter_get(&it);
      i64set_iter_next(&it)) {
    i64set_insert(&is2, i64set_iter_get(&it));
  }

  i64set_destroy(is);
  i64set_destroy(is2);

  EXPECT_TRUE(true);
}

UTEST(hashtbl, erase) {
  struct i64set *is = i64set_new(0);

  int64_t v = 0;
  EXPECT_FALSE(i64set_contains(is, &v));

  struct i64set_insert i1 = i64set_insert(&is, &v);
  EXPECT_TRUE(i1.inserted);
  EXPECT_EQ(*i64set_iter_get(&i1.iter), v);

  i64set_erase(is, &v);
  EXPECT_FALSE(i64set_contains(is, &v));

  i64set_destroy(is);
}

UTEST(hashtbl, erasecol) {
  struct badset *is = badset_new(0);

  for (size_t i = 1; i <= 3; ++i) {
    badset_insert(&is, &i);
  }
  struct badset_iterator iter;
  for (size_t i = 1; i <= 3; ++i) {
    iter = badset_find(is, &i);
    EXPECT_EQ(*badset_iter_get(&iter), i);
  }

  size_t v = 2;
  badset_erase(is, &v);
  v = 1;
  iter = badset_find(is, &v); 
  EXPECT_EQ(*badset_iter_get(&iter), v);
  v = 2;
  EXPECT_FALSE(badset_contains(is, &v));
  v = 3;
  iter = badset_find(is, &v); 
  EXPECT_EQ(*badset_iter_get(&iter), v);
  EXPECT_EQ(badset_size(is), 2u);
  
  v = 1;
  badset_erase(is, &v);
  v = 1;
  EXPECT_FALSE(badset_contains(is, &v));
  v = 2;
  EXPECT_FALSE(badset_contains(is, &v));
  v = 3;
  iter = badset_find(is, &v); 
  EXPECT_EQ(*badset_iter_get(&iter), v);
  EXPECT_EQ(badset_size(is), 1u);

  v = 3;
  badset_erase(is, &v);
  v = 1;
  EXPECT_FALSE(badset_contains(is, &v));
  v = 2;
  EXPECT_FALSE(badset_contains(is, &v));
  v = 3;
  EXPECT_FALSE(badset_contains(is, &v));
  EXPECT_EQ(badset_size(is), 0u);

  badset_destroy(is);
}

UTEST(hashtbl, clear) {
  struct i64set *is = i64set_new(0);

  int64_t v = 0;
  EXPECT_FALSE(i64set_contains(is, &v));

  i64set_clear(is);
  EXPECT_FALSE(i64set_contains(is, &v));

  i64set_insert(&is, &v);
  EXPECT_EQ(i64set_size(is), 1u);

  i64set_clear(is);
  EXPECT_EQ(i64set_size(is), 0u);
  EXPECT_FALSE(i64set_contains(is, &v));

  i64set_destroy(is);
}

UTEST(hashtbl, rehash) {
  struct i64set *is = i64set_new(0);

  int64_t v = 0;
  i64set_insert(&is, &v);
  v = 1;
  i64set_insert(&is, &v);
  EXPECT_EQ(i64set_size(is), 2u);

  is = i64set_rehash(is, 128);

  EXPECT_EQ(i64set_size(is), 2u);
  v = 0;
  EXPECT_TRUE(i64set_contains(is, &v));
  v = 1;
  EXPECT_TRUE(i64set_contains(is, &v));

  i64set_destroy(is);
}

#endif

