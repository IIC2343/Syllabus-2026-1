.data
  N:       .word 13
.text
  main:
    lw a0, N				# a0 = N = parameter
    li s0, 1				# Constant s0 = 1
    addi sp, sp, -4			# save ra
    sw ra, 0(sp)
    jal ra, check_is_twin_prime
    lw ra, 0(sp)				# restore ra and stack
    addi sp, sp, 4
    li a7, 1				# print
    ecall
    li a7, 10				# exit
    ecall
  check_is_twin_prime:
    addi sp, sp, -8			# Save ra and a0
    sw ra, 0(sp)
    sw a0, 4(sp)
    jal ra, check_is_prime			# Check if N is prime
    bne a0, s0, is_not_twin_prime	# a0 != 1 -> is not twin prime
    lw a0, 4(sp)				# Restore a0
    addi a0, a0, -2
    jal ra, check_is_prime			# Check if N - 2 is prime
    beq a0, s0, is_twin_prime		# If N - 2 is prime -> N is twin prime
    lw a0, 4(sp)				# Restore a0
    addi a0, a0, 2
    jal ra, check_is_prime			# Check if N + 2 is prime
    beq a0, s0, is_twin_prime		# If N + 2 is prime -> N is twin prime
    # Else: N is not twin prime
    is_not_twin_prime:
      li a0, 0
      jal zero, end
    is_twin_prime:
      li a0, 1
    end:
      lw ra, 0(sp)			# Restore ra and stack
      addi sp, sp, 8
      jalr zero, 0(ra)
  check_is_prime:
    ble a0, s0, is_not_prime		# a0 <= 1 -> is_not_prime
    # Check divisors from 2 to sqrt_2(N).
    fcvt.s.w ft0, a0
    fsqrt.s ft0, ft0
    fcvt.w.s t1, ft0
    li t0, 2 				# Starting divisor. t0 = 2
    division_loop:
      rem t2, a0, t0			# If a0 % t0 == 0 -> Divisible, not prime.
      beqz t2, is_not_prime
      addi t0, t0, 1			# t0 += 1
      ble t0, t1, division_loop	# while t0 <= t1, keep looking for divisors.
    is_prime:
      li a0, 1
      jal zero, end_check_is_prime
    is_not_prime:
      li a0, 0
    end_check_is_prime:
      jalr zero, 0(ra)
