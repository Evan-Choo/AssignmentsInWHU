BEGIN: 
	MOV AL, 00H; 下限值

UP:
	MOV DX, 220H
	OUT DX, AL; D/A转换
	INC AL; 数值增加1
	CMP AL, FFH; 是否超过上限
	JNZ UP; 没有则继续增加

DOWN:
	MOV DX, 220H
	OUT DX, AL; D/A转换
	DEC AL; 数值减少1
	CMP AL, 00H; 是否低于下限值
	JNZ DOWN; 没有则继续下降
	JMP BEGIN; 低于下限则回到周期开始