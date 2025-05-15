; program to print A to Z or a to z

.model small 
.stack 100h
.data
.code 

main proc

mov dl, 'a'
mov cx, 26

l1:
mov ah, 2
int 21h
inc dl

loop l1


mov ah, 4ch
int 21h

main endp
end main 