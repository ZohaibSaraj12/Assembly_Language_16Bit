; odd even check 


.model small 
.stack 100h
.data
r db ?
msg1 db 'OddIs$'
msg2 db 'EvenIs$'

.code

main proc

mov ax, @data
mov ds, ax


mov ah, 1
int 21h

mov bl, 2
div bl

add ah, 48

cmp ah, 48
je l1

mov dx, offset msg1
mov ah, 9
int 21h

mov ah, 4ch
int 21h
l1: 

mov dx, offset msg2
mov ah, 9
int 21h

mov ah, 4ch
int 21h


main endp
end main 