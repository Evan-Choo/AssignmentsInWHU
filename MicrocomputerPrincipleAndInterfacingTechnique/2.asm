BEGIN:
	MOV AL, 3DH; 下限值
	MOV DX, 220H

UP:
	OUT DX, AL; D/A转换
	CALL DELAY
	INC AL; 数值加一
	CMP AL, 0CDH; 是否超过上界
	JNZ UP; 没有则继续增加
	OUT DX, AL
	CALL DELAY_20MS; 达到上界延时输出方波
	DEC AL

DOWN:
	OUT DX, AL; D/A转换
	CALL DELAY
	DEC AL; 数值减一
	CMP AL, 3DH; 是否低于下限
	JNZ DOWN; 没有继续减小
	OUT DX, AL
	CALL DELAY_20MS; 达到下界输出方波
	INC AL
	JMP UP; 返回周期开始

