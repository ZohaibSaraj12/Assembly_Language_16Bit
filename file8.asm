; Program to Print String using variables and print numbers too
; initialize variables and assign values
dosseg
.model small 
.stack 100h
.data

n db '1'
no db ?
nameOfPerson db 'zohaib$'

.code

main proc

mov ax, @data
mov ds, ax


mov dl, n
mov ah, 2
int 21h

mov no, 'h'
mov dl, no
mov ah, 2
int 21h


lea dx, nameOfPerson
mov ah, 9
int 21h

mov ah, 4ch
int 21h


main endp
end main

