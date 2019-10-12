COMMENT @
This program will print a triangle. To change the length of triangle, simply change the value of
ecx register. Number of lines of triangle are eqaul to ecx register value.
@

INCLUDE Irvine32.inc

.data

star BYTE '*',0
r DWORD ?

.code
main proc

	mov ecx,5
	mov edx,OFFSET star
		
	row:
	;one method is simply saving the ecx and do not inverting it for col. But it will print inverted triangle
	;if we want to print non-inverted triangle, we have to invert the value by subtracting from one greater than of ecx value
		mov r,ecx
		mov eax,6
		sub eax,ecx
		mov ecx,eax
	
		col: 
			call writestring
			loop col
		
		call CRLF
		mov ecx,r

	loop row
	
	call readint
	invoke ExitProcess,0
main endp
end main
