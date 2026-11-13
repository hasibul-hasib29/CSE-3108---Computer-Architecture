;; Directives
PRESERVE8
THUMB
; Vector Table Mapped to Address 0 at Reset
; Linker requires __Vectors to be exported
AREA RESET, DATA, READONLY
EXPORT __Vectors
__Vectors
DCD 0x20001000
; stack pointer value when stack is empty
DCD Reset_Handler ; reset vector
ALIGN
; The program
; Linker requires Reset_Handler
AREA MYCODE, CODE, READONLY
ENTRY
EXPORT Reset_Handler
	
	
	
Reset_Handler
WHILE   ; New label for the loop start
    CMP R0, #128    ; Compare R0 with 128
    BEQ DONE        ; Branch to DONE if R0 == 128
    LSL R0, R0, #1  ; Shift left R0 (pow = pow * 2)
    ADD R1, R1, #1  ; Increment R1 (x = x + 1)
    B WHILE         ; Branch back to WHILE to continue the loop
DONE   ; New label for the end of the loop
STOP  
    B STOP          ; Infinite loop to stop execution

END 