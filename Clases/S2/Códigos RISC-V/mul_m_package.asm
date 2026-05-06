.text
main:
  addi t0, zero, 10     # t0 = 0 + 10 = 10
  addi t1, zero, 200    # t1 = 0 + 200 = 200
  mul t2,t0,t1          # t2 = t0 * t1
  end:
    add a0, zero, t2    # a0 = 0 + t2 = t2
    addi a7, zero, 1    # a7 = 0 + 1 = 1
    ecall               # print a0
    addi a7, zero, 10   # a7 = 0 + 10 = 10
    ecall               # end exec
