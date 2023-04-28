.586
mystrlen MACRO string
		mov eax, 0
		lea ecx, string

	LEN:	cmp string[eax], 0

		je mLENGTHEND
		inc eax
		jmp LEN

mLENGTHEND:
ENDM