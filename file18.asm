.model small 
.stack 100h
.data
string db 'zohaib'
.code
main proc

mov ax, @data
mov ds, ax

mov si, offset string

mov cl, 6
l1:
mov bx, [si]
push bx
inc si
loop l1

mov cl, 6


l2:
pop dx
mov ah, 2
int 21h
loop l2

mov ah, 4ch
int 21h
main endp
end main 