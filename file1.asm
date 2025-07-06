; ; ; Program to print a single character in MASM assembly 
; ; ; dosseg
; ; ; .model small
; ; ; .stack 100h
; ; ; .data
; ; ; .code 

; ; ; main proc

; ; ; mov dl, 97
; ; ; mov ah, 2
; ; ; int 21h
; ; ; mov ah, 4ch
; ; ; int 21h
; ; ; main endp
; ; ; end main



; ; .model small 
; ; .stack 100h    ; stack of size 100h which is enough to p
; ; .data   ; data section where variables are declared 
; ; .code  ; code section which tells that code starts from here 
; ; main proc   ; procedure --> Function 

; ; mov dl, 97    ; moving character into a data register
; ; mov ah, 2    ; service routine acts as a argument of function and ah is used for input and output
; ; int 21h      ; interrupt which tells the CPU to stop working and to print something, 

; ; mov ah, 4ch    ; now we are in register, to go outside of that register we have to give service routine of 4ch 
; ; int 21h       ; again interrupt to do that work, 

; ; main endp   ; end of the procedure main, 
; ; end main    ; starting of the main function 



; .model small
; .stack 100h
; .data
;     line1 db '*', ' ', ' ', ' ', '*',13, 10, '$'
;     line2 db '*', '*', '*', '*', '*', 13, 10, '$'
;     line3 db '*', '*', '*', '*', '*', 13, 10, '$'
;     line4 db '*', '*', '*', '*', '*', 13, 10, '$'
;     line5 db '*', '*', '*', '*', '*', 13, 10, '$'
; .code
; main proc 

;     ;moving data to code section by implementing left triangle 
;     mov ax, @data
;     mov ds, ax
    
;     ; print line 1 
;     ; load efffective address, to get address of 1st element and traversing through the whole
;     lea dx, line1       ; starting address of string 
;     mov ah, 09h         ; String print..., service routine 
;     int 21h             ; 21h to print on the screen 

;     ; print line 2    void functionName ( Register 09h) {}


;     lea dx, line2
;     mov ah, 09h
;     int 21h

;     ; print line 3
;     lea dx, line3
;     mov ah, 09h
;     int 21h

;     ; print line 4
;     lea dx, line4
;     mov ah, 09h
;     int 21h

;     ; print line 5
;     lea dx, line5
;     mov ah, 09h
;     int 21h

;     ; Exit
;     mov ah, 4Ch
;     int 21h

; main endp
; end main         ; Masm is two-face assembler, so it starts from here 


; ;code of assembly in which yes is printed 5 times 
; .model small
; .stack 100h
; .data
; var1 db 'yes', 13, 10, '$'
; .code


; main proc
; mov ax, @data
; mov ds, ax
; mov cx, 5




; label1: 
; lea dx, var1
; mov ah, 09h
; int 21h

; loop label1


; mov ah, 4ch
; int 21h





; main endp
; end main

; ; without using loop program of printing yes 5 times

; .model small
; .stack 100h
; .data
;     line1 db 'yes', 13, 10, '$'

; .code
; main proc 

;     ;moving data to code section by implementing left triangle 
;     mov ax, @data
;     mov ds, ax
    
;     ; print line 1 
;     ; load efffective address, to get address of 1st element and traversing through the whole
;     lea dx, line1       ; starting address of string 
;     mov ah, 09h         ; String print..., service routine 
;     int 21h             ; 21h to print on the screen 

;     ; print line 1   


;     lea dx, line1
;     mov ah, 09h
;     int 21h

;     ; print line 1
;     lea dx, line1
;     mov ah, 09h
;     int 21h

;     ; print line 1
;     lea dx, line1
;     mov ah, 09h
;     int 21h

;     ; print line 1
;     lea dx, line1
;     mov ah, 09h
;     int 21h

;     ; Exit
;     mov ah, 4Ch
;     int 21h

; main endp
; end main         ; Masm is two-face assembler, so it starts from here 





; This is a MASM-compatible DOS .COM program for 8086
.MODEL SMALL
.STACK 100h
.DATA

menu_msg        DB 'Choose Option:',13,10,'1. Digital Clock',13,10,'2. Countdown Timer',13,10,'3. Stopwatch',13,10,'4. View Last Mode',13,10,'Select (1-4): $'
set_time_msg    DB 13,10,'Set Hour (00-23): $'
set_min_msg     DB 13,10,'Set Min (00-59): $'
set_sec_msg     DB 13,10,'Set Sec (00-59): $'
set_day_msg     DB 13,10,'Set Day (01-31): $'
set_month_msg   DB 13,10,'Set Month (01-12): $'
set_year_msg    DB 13,10,'Set Year (00-99): $'
alarm_header    DB 13,10,'Setting Alarm Time:',13,10,'$'
start_msg       DB 13,10,'Press any key to start...$'
pause_msg       DB 13,10,'[PAUSED - Press P to Resume]$'
alarm_msg       DB 13,10,'*** ALARM TRIGGERED! *** $'
countdown_done  DB 13,10,'*** COUNTDOWN FINISHED! *** $'
stopwatch_done  DB 13,10,'*** STOPWATCH STOPPED *** $'
last_mode_msg   DB 13,10,'Last Used Mode: $'
mode_clock      DB 'Digital Clock',13,10,'$'
mode_countdown  DB 'Countdown Timer',13,10,'$'
mode_stopwatch  DB 'Stopwatch',13,10,'$'
mode_unknown    DB 'None',13,10,'$'
press_esc_msg   DB 13,10,'Press ESC to return to menu$'

hours           DB 0
minutes         DB 0
seconds         DB 0

count_min       DB 0
count_sec       DB 0

stop_min        DB 0
stop_sec        DB 0

pause_flag      DB 0
last_mode       DB 0

alarm_hour      DB 0
alarm_min       DB 0
alarm_sec       DB 0
alarm_day       DB 0
alarm_month     DB 0
alarm_year      DB 0

alarm_triggered DB 0

day             DB 1
month           DB 1
year            DB 24

.CODE
ORG 100h

start:
    JMP main_menu

; ========== MAIN MENU ==========
main_menu:
    MOV AH, 0
    MOV AL, 3
    INT 10h

    LEA DX, menu_msg
    MOV AH, 09h
    INT 21h

    MOV AH, 01h
    INT 21h

    CMP AL, '1'
    JE digital_option
    CMP AL, '2'
    JE countdown_option
    CMP AL, '3'
    JE stopwatch_option
    CMP AL, '4'
    JE last_mode_option
    JMP main_menu

digital_option:
    MOV last_mode, 1
    CALL DIGITAL_CLOCK
    JMP main_menu

countdown_option:
    MOV last_mode, 2
    CALL COUNTDOWN_TIMER
    JMP main_menu

stopwatch_option:
    MOV last_mode, 3
    CALL STOPWATCH
    JMP main_menu

last_mode_option:
    CALL SHOW_LAST_MODE
    JMP main_menu

; === STUBS FOR PROCEDURES ===
DIGITAL_CLOCK     PROC NEAR
    RET
DIGITAL_CLOCK     ENDP

COUNTDOWN_TIMER   PROC NEAR
    RET
COUNTDOWN_TIMER   ENDP

STOPWATCH         PROC NEAR
    RET
STOPWATCH         ENDP

SHOW_LAST_MODE    PROC NEAR
    RET
SHOW_LAST_MODE    ENDP

END start