	.text
	.align	2
	.global	decrypt
	.type	decrypt, %function
	/* 字符串解密函数 
	* r0:要解密的字节数组，以0结尾
	*/
decrypt:
	stmfd	sp!, {r1, lr}
	ldrb r1, [r0] 	@取一个字节
	cmp r1, #0		@不为0就进行循环解密
	beq L2			@解密完后返回
L1:
	mvns r1, r1		@字节取反
	strb r1, [r0]	@重新写回去
	adds r0, #1		@移动字节数组指针
	ldrb r1, [r0]	@取下一个字节
	cmp r1, #0		@不为0就进行循环解密
	bne L1			@循环解密
L2:
	ldmfd	sp!, {r1, pc}
	
