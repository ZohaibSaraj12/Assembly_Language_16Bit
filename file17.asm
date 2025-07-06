.model small 
.stack 100h
.data
msg1 db 'before swap $'
msg2 db 13, 10, 'after swap $'
.code
main proc
mov ax, @data
mov ds, ax

mov ax, 48
mov bx, 49

push ax
push bx

mov dx, offset msg1
mov ah, 9
int 21h

mov dx, ax
mov ah, 2
int 21h

mov dx, 32
mov ah, 2
int 21h

mov dx, bx
mov ah, 2
int 21h


pop ax
pop bx

mov dx, offset msg2
mov ah, 9
int 21h

mov dx, ax
mov ah, 2
int 21h

mov dx, 32
mov ah, 2
int 21h
mov dx, 32
mov ah, 2
int 21h


mov dx, bx
mov ah, 2
int 21h

mov ah, 4ch
int 21h


main endp
end main 