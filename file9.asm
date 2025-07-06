;looping program 
; loop to make Aa Bb Cc Dd Ee  tilllllll Zz
dosseg
.model small 
.stack 100h
.data
n db 65
.code 


main proc
mov ax, @data
mov ds, ax
mov cl, 26
mov bl, 97


l1:

mov dl, n
mov ah, 2
int 21h
inc n
mov dl, bl
mov ah, 2
int 21h
inc bl

mov dl, 32
mov ah, 2
int 21h


loop l1

mov ah, 4ch
int 21h

main endp
end main