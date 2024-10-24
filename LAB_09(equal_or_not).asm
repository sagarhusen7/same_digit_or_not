ORG 100h           ; Origin, to specify that the program starts at 100h (COM file format)

; Display message for first number input
MOV DX, OFFSET msg_input1
MOV AH, 09h        ; Function 09h to display a string
INT 21h            ; Call DOS interrupt to print the input message

; Read first number
MOV AH, 01h        ; Function 01h to read a single character from input
INT 21h            ; Call DOS interrupt to read the first digit
SUB AL, 30h        ; Convert ASCII to decimal (subtract '0')
MOV BL, AL         ; Store first number in BL

; Display message for second number input
MOV DX, OFFSET msg_input2
MOV AH, 09h        ; Function 09h to display a string
INT 21h            ; Call DOS interrupt to print the input message

; Read second number
MOV AH, 01h        ; Function 01h to read a single character from input
INT 21h            ; Call DOS interrupt to read the second digit
SUB AL, 30h        ; Convert ASCII to decimal (subtract '0')
MOV BH, AL         ; Store second number in BH

; Compare the two numbers
CMP BL, BH         ; Compare BL and BH
JE equal_msg       ; If they are equal, jump to equal_msg

; Display message "The numbers are not equal."
MOV DX, OFFSET not_equal_msg
MOV AH, 09h        ; Function 09h to display a string
INT 21h            ; Call DOS interrupt to print the output message
JMP end_program    ; Jump to the end of the program

equal_msg:
; Display message "The numbers are equal."
MOV DX, OFFSET equal_msg_txt
MOV AH, 09h        ; Function 09h to display a string
INT 21h            ; Call DOS interrupt to print the output message

end_program:
; Terminate the program
MOV AH, 4Ch        ; Function 4Ch to terminate the program
INT 21h            ; Call DOS interrupt to exit

; Data section
msg_input1 DB 0Dh, 0Ah, 'Enter the first digit: $'
msg_input2 DB 0Dh, 0Ah, 'Enter the second digit: $'
equal_msg_txt DB 0Dh, 0Ah, 'The numbers are equal.$'
not_equal_msg DB 0Dh, 0Ah, 'The numbers are not equal.$'

END
