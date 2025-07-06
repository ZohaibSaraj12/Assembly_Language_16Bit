; Program to add two numbers 

dosseg
.model small 
.stack 100h
.data
.code
main proc

mov bl, 52
mov cl, 53

add bl, cl
sub bl, 48             ; adding ascii 0 to 3 so it would recognize it 
mov dl, bl
mov ah, 2 
int 21h


mov ah, 4ch
int 21h

main endp
end main