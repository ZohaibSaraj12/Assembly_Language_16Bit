; Program to add two numbers

dosseg
.model small 
.stack 100h
.data
.code
main proc
mov bl, 2
add bl, 1
mov dl, bl
add dl, 48

mov ah, 2
int 21h

mov ah, 4ch
int 21h
main endp
end main