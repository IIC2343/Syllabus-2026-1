.text   # CODE:
main:
  addi t0, zero, 10            # t0 = 0 + 10 = 10
  addi t1, zero, 200           # t1 = 0 + 200 = 200
  add t2, zero, zero           # t2 = 0 + 0 = 0
  mul_loop:
    beq t0,zero,end            # if t0 == 0 goto end
    add t2,t2,t1               # t2 += t1 -> t2 = t2 + t1
    addi t0,t0,-1              # t0 -= 1
    beq zero, zero, mul_loop   # goto mul_loop
  end:
    add a0, zero, t2           # a0 = 0 + t2 = t2
    addi a7, zero, 1           # a7 = 0 + 1 = 1
    ecall                      # print a0
    addi a7, zero, 10          # a7 = 0 + 10 = 10
    ecall                      # end exec
