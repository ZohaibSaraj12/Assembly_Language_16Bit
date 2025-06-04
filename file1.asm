; ; Program to print a single character in MASM assembly 
; ; dosseg
; ; .model small
; ; .stack 100h
; ; .data
; ; .code 

; ; main proc

; ; mov dl, 97
; ; mov ah, 2
; ; int 21h
; ; mov ah, 4ch
; ; int 21h
; ; main endp
; ; end main



; .model small 
; .stack 100h    ; stack of size 100h which is enough to p
; .data   ; data section where variables are declared 
; .code  ; code section which tells that code starts from here 
; main proc   ; procedure --> Function 

; mov dl, 97    ; moving character into a data register
; mov ah, 2    ; service routine acts as a argument of function and ah is used for input and output
; int 21h      ; interrupt which tells the CPU to stop working and to print something, 

; mov ah, 4ch    ; now we are in register, to go outside of that register we have to give service routine of 4ch 
; int 21h       ; again interrupt to do that work, 

; main endp   ; end of the procedure main, 
; end main    ; starting of the main function 



.model small
.stack 100h
.data
    line1 db '*', 13, 10, '$'s
    line2 db '*', '*', 13, 10, '$'
    line3 db '*', '*', '*', 13, 10, '$'
    line4 db '*', '*', '*', '*', 13, 10, '$'
    line5 db '*', '*', '*', '*', '*', 13, 10, '$'
.code
main:
    mov ax, @data
    mov ds, ax

    ; print line 1
    lea dx, line1
    mov ah, 09h
    int 21h

    ; print line 2
    lea dx, line2
    mov ah, 09h
    int 21h

    ; print line 3
    lea dx, line3
    mov ah, 09h
    int 21h

    ; print line 4
    lea dx, line4
    mov ah, 09h
    int 21h

    ; print line 5
    lea dx, line5
    mov ah, 09h
    int 21h

    ; Exit
    mov ah, 4Ch
    int 21h
end main
