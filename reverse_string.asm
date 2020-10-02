COMMENT @
This program will take a string of length 10 and will store its inverse in a separate string variable. And finally it will print
both original and reversed strings.

***** NOTE *****
Backspace to delete a char will not work. It will also treated as a character input.
@

INCLUDE Irvine32.inc

.data

;prompts for better UI
prompt1 BYTE "Please enter any string of lenght 10: ",0
prompt2 BYTE "Normal string: ",0
prompt3 BYTE "Reversed string: ",0

str1 BYTE "0123456789",0 ;giving a raw value because it will save some errors
rev_str1 BYTE ?

.code
main proc
	
	;printing prompt1
	mov edx, OFFSET prompt1
	call writestring

	mov eax,0
	mov ecx,10
	mov ebx,0

	;taking 10 characters as input and storing in str1
	input:
		call readchar
		call writechar
		mov str1[ebx],al
		inc ebx
	loop input
	call CRLF

	mov eax,0
	mov ecx,10
	mov ebx,0

	;pushing each character on stack so that str1 characters store in reversed order 
	push_rev: 
		mov al,str1[ebx]
		push eax
		inc ebx
	loop push_rev

	mov ecx,10
	mov ebx,0
	mov eax,0

	;poping each value and storing in rev_str1. String will automatically get reversed
	pop_rev: 
		pop eax
		mov rev_str1[ebx],al
		inc ebx
	loop pop_rev
	
	;printing original string
	mov edx,OFFSET prompt2
	call writestring
	mov edx,OFFSET str1
	call writestring
	call CRLF

	;printing reversed string
	mov edx,OFFSET prompt3
	call writestring
	mov edx,OFFSET rev_str1
	call writestring
	call CRLF

	call readint
	invoke ExitProcess,0
main endp
end main
