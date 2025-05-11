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
mov ds, ax     ; initialize data segment register

mov dl, n

mov ah, 2
int 21h

mov no, 'h'
mov dl, no
mov ah, 2
int 21h

mov dx, offset nameOfPerson  ; can also write as lea dx, name
; dx is liye kion k offset 16 bit address return karta haye 

mov ah, 9
int 21h

mov ah, 4ch
int 21h



main endp
end main

