.model small 
.stack 100h
.data
q db ?
r db ?
msg1 db 'Quotient:', 32, '$'
msg2 db 13, 10, 'Remainder:', 32, '$'
msg3 db 13, 10, 'EvenIs$'
msg4 db 13, 10, 'OddIs$'

.code
main proc

mov ax, @data
mov ds, ax

mov ax, 26
mov bl, 5
div bl


mov q, al
mov r, ah


mov dx, offset msg1
mov ah, 9
int 21h


mov dl, q
add dl, 48
mov ah, 2
int 21h

mov dx, offset msg2
mov ah, 9
int 21h

mov dl, r
add dl, 48
mov ah, 2
int 21h

cmp r, '0'
je l1
mov dx, offset msg4 
mov ah, 9
int 21h

mov ah, 4ch
int 21h


l1:

mov dx, offset msg3
mov ah, 9
int 21h



mov ah, 4ch
int 21h


main endp
end main 

