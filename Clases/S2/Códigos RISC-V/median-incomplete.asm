# Este programa debe obtener la mediana de un arreglo ordenado de enteros
# No obstante, solo retorna la posicion de esta
# Su tarea es completarlo de forma que compute la mediana y la retorne en el registro a0 

.data
  arr: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  len: .word 10
.text
  lw a0, len
  la a1, arr
  addi s0, zero, 2				# Constante para obtener promedios y restos
  addi s1, zero, 4
  jal ra, find_median			# find_median(len, puntero_arr)
  addi a7, zero, 1				# Imprimir resultado
  ecall
  addi a7, zero, 10				# Terminar programa
  ecall
  find_median:
    rem t0, a0, s0				# t0 = a0 % s0 = len % 2
    div t1, a0, s0				# t1 = a0 // s0 = len // 2
    beq t0, zero, even_length	# Si t0 = 0, entonces el arreglo es par
    odd_length:
      add a0, zero, t1			# a0 = indice de la mediana
      beq zero, zero, end
    even_length:
      add a0, zero, t1			# a0 = indice del segundo elemento de la mediana
      addi a0, a0, -1			# a0 = indice del primer elemento de la mediana
    end:
       jalr zero, 0(ra)			# Se retorna la mediana en el registro a0
