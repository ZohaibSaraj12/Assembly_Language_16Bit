 dosseg
.model small 
.stack 100h
.data
.code 

mian proc

mov dl, 'Z'
mov ah, 2
int 21h
mov dl, 'a'
mov ah, 2
int 21h
mov dl, 'b'
mov ah, 2
int 21h
mov dl, 'i'
mov ah, 2
int 21h


mov ah, 4ch
int 21h
main endp
end main