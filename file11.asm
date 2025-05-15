; Program to print two strings on separate lines
dosseg
.model small 
.stack 100h
.data
 msg1 db 'hello$'
 msg2 db 'world$'
.code

main proc

mov ax, @data
mov ds, ax

mov dx, offset msg1 ; lazmi offset yaad rakhna
mov ah, 9
int 21h

mov dl, 10
mov ah, 2
int 21h

mov dl, 13
mov ah, 2
int 21h


mov dx, offset msg2  ;we use offset for starting address of the given string to print the whole string, offset return 16 bit address to store we use dx data register
mov ah, 9
int 21h

mov ah, 4ch
int 21h


main endp
end main