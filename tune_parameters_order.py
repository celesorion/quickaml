import os
from itertools import permutations
import subprocess

pas = [('bc_t *restrict ip', 'ip'),
       ('bc_t insn', 'insn'),
       ('val_t *restrict bp', 'bp'),
       ('int32_t a2sb', 'a2sb'),
       ('uint8_t a3a', 'a3a'),
       #('val_t *sp', 'sp'),
       ('void *restrict dispatch', 'dispatch'),
       ('struct vm_fn *restrict fns[]', 'fns')]

result = []

for i in permutations(pas):
    params, args = zip(*i)
    params = ", ".join(params)
    args = ", ".join(args)
    os.system(f'clang -Wall -Wextra -O3 -std=c2x src/vm.c -masm=intel -S -o vm.s -DEXTPA=1 -DPARAMS="{params}" -DARGS="{args}"')
    count = 0
    with open('vm.s') as f:
        count = sum(1 for _ in f)
    r = (f'PARAMS="{params}" ARGS="{args}"',
                   count)
    result.append(r)
    print(r)

result.sort(key=lambda xy: xy[1])

for i in result[0:100]:
    print(">>> ", i)

