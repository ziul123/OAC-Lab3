.data

TEST:	.space 4

.text

	lui t0,0x12345		#testa lui
	lui t1,0x12345
	auipc a1,0
	jal COMP


	addi t0,zero,2		#testa addi
	addi t1,zero,2
	auipc a1,0
	jal COMP

	
	auipc t0,0		#testa auipc
	lui t1,0x00400
	addi t1,t1,0x020
	auipc a1,0
	jal COMP

	addi t0,zero,3		#testa slli
	slli t0,t0,1
	addi t1,zero,6
	auipc a1,0
	jal COMP
	
	addi t0,zero,-1		#testa slti
	slti t0,t0,1
	addi t1,zero,1
	auipc a1,0
	jal COMP

	addi t0,zero,1		#testa sltiu
	sltiu t0,t0,-1
	addi t1,zero,1
	auipc a1,0
	jal COMP

	addi t0,zero,0x0F	#testa xori
	xori t0,t0,0x0C
	addi t1,zero,3
	auipc a1,0
	jal COMP

	addi t0,zero,0x03	#testa ori
	ori t0,t0,0x0C
	addi t1,zero,0x0F
	auipc a1,0
	jal COMP

	addi t0,zero,0xF	#testa andi
	andi t0,t0,1
	addi t1,zero,1
	auipc a1,0
	jal COMP

	lui t1,0xF0CAF		#testa sw e lw
	addi t1,t1,0x0FA
	lui t2,0x10010
	sw t1,0(t2)
	lw t0,0(t2)
	auipc a1,0
	jal COMP
	
	addi t0,zero,2		#testa add
	addi t2,zero,3
	add t0,t0,t2
	addi t1,zero,5
	auipc a1,0
	jal COMP

	addi t0,zero,5		#testa sub
	addi t2,zero,3
	sub t0,t2,t0
	addi t1,zero,-2
	auipc a1,0
	jal COMP
	
	addi t0,zero,3		#testa sll
	addi t2,zero,1
	sll t0,t0,t2
	addi t1,zero,6
	auipc a1,0
	jal COMP
	
	addi t0,zero,-1		#testa slt
	addi t2,zero,1
	slt t0,t0,t2
	addi t1,zero,1
	auipc a1,0
	jal COMP
	
	addi t0,zero,1		#testa sltu
	addi t2,zero,-1
	sltu t0,t0,t2
	addi t1,zero,1
	auipc a1,0
	jal COMP
	
	addi t0,zero,0x0F	#testa xor
	addi t2,zero,0x0C
	xor t0,t0,t2
	addi t1,zero,3
	auipc a1,0
	jal COMP
	
	addi t0,zero,0x03	#testa or
	addi t2,zero,0x0C
	or t0,t0,t2
	addi t1,zero,0x0F
	auipc a1,0
	jal COMP
	
	addi t0,zero,0xF	#testa and
	addi t2,zero,1
	and t0,t0,t2
	addi t1,zero,1
	auipc a1,0
	jal COMP
	li a0,0xCCCCCCCC
	
	
FIM:
	jal FIM	

ERRO:
	li a0,0xEEEEEEEE
	jal FIM

	
COMP:
	beq t0,t1,OK
	jal ERRO
OK:
	jalr zero,ra,0
	
