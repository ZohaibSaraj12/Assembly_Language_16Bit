; Program to subtract two numbers

dosseg
.model small
.stack 100h
.data
.code

main proc
; mov bl, 3
; mov cl, 2

; sub bl, cl

; add bl, 48
; mov dl, bl

; mov ah, 2
; int 21h

; mov ah, 4ch
; int 21h


mov bl, 4
mov cl, 5
sub bl, cl
add bl, 48
mov dl, bl

mov ah, 2
int 21h

mov ah, 4ch
int 21h

main endp
end main