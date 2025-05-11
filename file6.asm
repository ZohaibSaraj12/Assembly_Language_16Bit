; Program to input two numbers from user and add 

dosseg
.model small 
.stack 100h
.data
.code

main proc
mov ah, 1
int 21h

mov bl, al

mov ah, 1
int 21h

mov cl, al

add bl, cl
mov dl, bl
sub dl, 48    ;sub karein gy kion k 2 character k ascii code hain 2(50) + 1(49) ab hoga 99 to 99 - 48 = 51 ==> convert ==> 3


mov ah, 2
int 21h

mov ah, 4ch
int 21h
main endp
end main