.data

TEST:	.space 4

.text

	lui t0,0x12345		#testa lui
	lui t1,0x12345
	jal COMP

	addi t0,zero,2		#testa addi
	addi t1,zero,2
	jal COMP

	addi t0,zero,3		#testa slli
	slli t0,t0,1
	addi t1,zero,6
	jal COMP

	addi t0,zero,-1		#testa slti
	slti t0,t0,1
	addi t1,zero,1
	jal COMP

	addi t0,zero,1		#testa sltiu
	sltiu t0,t0,-1
	addi t1,zero,1

	addi t0,zero,0x0F	#testa xori
	xori t0,t0,0x0C
	addi t1,zero,3
	jal COMP

	addi t0,zero,0x03	#testa ori
	ori t0,t0,0x0C
	addi t1,zero,0x0F
	jal COMP

	addi t0,zero,0xF	#testa andi
	andi t0,t0,1
	addi t1,zero,1
	jal COMP

	auipc t0,0			#testa auipc
	lui t1,0x00400
	addi t1,t1,0x074
	jal COMP
	#0x00400098

	lui t1,0xF0CAF		#testa sw e lw
	addi t1,t1,0x0FA
	lui t2,0x10010
	sw t1,0(t2)
	lw t0,0(t2)
	jal COMP

	addi t0,zero,2		#testa add
	addi t2,zero,3
	addi t1,zero,5
	add t0,t0,t2
	jal COMP

	
	
ERRO:
	addi a1,ra,-8
	li a0, 0xEEEEEEEE
	#lui a0,0xFFFEEEEF
FIM:
	jal FIM
	
COMP:
	beq t0,t1,OK
	jal ERRO
OK:
	jalr zero,ra,0
	
