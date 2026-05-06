.data
  x_value: .word 7
  n:       .word 3
  x_pow_n: .word 0
.text
  main:
    # lw a0, x_value
    la a0, x_value
    lw a0, 0(a0)
    lw a1, n
    la s0, x_pow_n
    addi sp, sp, -4
    sw ra, 0(sp)
    jal ra, pow
    lw ra, 0(sp)
    addi sp, sp, 4
    sw a0, 0(s0)
    addi a7, zero, 10
    ecall
  pow:
    add t0, zero, a0  # t0 = 0 + a0 => t0 = a0
    mul_loop:
      addi a1, a1, -1  # n = 3 -> n = 2 => n = 1 => n = 0
      beq a1, zero, end  
      mul a0, a0, t0   #  7 * 7 = 49 => 49 * 7 = 343
      jal zero, mul_loop
    end:
      jalr zero, 0(ra)
  
