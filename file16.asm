;input a string from a user

dosseg
.model small
.stack 100h
.data
var1 db 100 dup('$')
.code

main proc

mov ax, @data
mov ds, ax

mov si, offset var1     ; source index to point address of string
l1:                     ; Label to run loop 
mov ah, 1               ; Function and 1 service routine
int 21h                 ; interrupt with 21h dosbox to get out from the register


cmp al, 13              ; compare al, with enter key if equal to the character then terminate program

je program              ; jump to program label

mov [si], al            ;now move what you have input to at address of si, [] works as * like pointer in c++
inc si                  ; increment places of array 
jmp l1                  ; jump to l1 label
program:
mov dx, offset var1     ; offset return 16 bit address so store in 16 bit dx register
mov ah, 9               ;
int 21h

mov ah, 4ch
int 21h

main endp
end main 