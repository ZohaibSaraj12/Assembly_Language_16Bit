; Program to print a single character in MASM assembly 
; dosseg
; .model small
; .stack 100h
; .data
; .code 

; main proc

; mov dl, 97
; mov ah, 2
; int 21h
; mov ah, 4ch
; int 21h
; main endp
; end main



.model small 
.stack 100h    ; stack of size 100h which is enough to p
.data   ; data section where variables are declared 
.code  ; code section which tells that code starts from here 
main proc   ; procedure --> Function 

mov dl, 97    ; moving character into a data register
mov ah, 2    ; service routine acts as a argument of function and ah is used for input and output
int 21h      ; interrupt which tells the CPU to stop working and to print something, 

mov ah, 4ch    ; now we are in register, to go outside of that register we have to give service routine of 4ch 
int 21h       ; again interrupt to do that work, 

main endp   ; end of the procedure main, 
end main    ; starting of the main function 
