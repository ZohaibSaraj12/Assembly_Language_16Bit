; addition of 10 numbers using loop 

dosseg
.model small
.stack 100h
.data
.code

main proc
mov bl, 1
mov dl, 0

mov cl, 10

l1:
add dl, bl
inc bl

loop l1
mov bl, dl
sub dl, 6
mov ah, 2
int 21h
mov dl, bl
sub dl, 7
mov ah, 2
int 21h

mov ah, 4ch
int 21h


main endp
end main 
