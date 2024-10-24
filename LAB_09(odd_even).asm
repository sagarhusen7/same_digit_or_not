ORG 100h           ; Origin, to specify that the program starts at 100h (COM file format)

; Display message for single digit number input
MOV DX, OFFSET msg_input1
MOV AH, 09h        ; Function 09h to display a string
INT 21h            ; Call DOS interrupt to print the input message

; Read single digit number
MOV AH, 01h        ; Function 01h to read a single character from input
INT 21h            ; Call DOS interrupt to read the first digit
SUB AL, 30h        ; Convert ASCII to decimal (subtract '0')
MOV BL, AL         ; Store first number in BL

; Check if the number is odd or even
MOV AL, BL         ; Move first number to AL
AND AL, 01h        ; Perform bitwise AND with 1 to check if the number is odd
JZ first_even      ; If zero flag is set, the number is even
MOV DX, OFFSET odd_msg1
JMP display_first  ; If the number is odd, jump to display

first_even:
MOV DX, OFFSET even_msg1

display_first:
MOV AH, 09h        ; Function 09h to display a string
INT 21h            ; Call DOS interrupt to print the result of first number

end_program:
; Terminate the program
MOV AH, 4Ch        ; Function 4Ch to terminate the program
INT 21h            ; Call DOS interrupt to exit

; Data section
msg_input1 DB 0Dh, 0Ah, 'Enter the single digit number: $'

odd_msg1 DB 0Dh, 0Ah, 'The single digit number is odd.$'
even_msg1 DB 0Dh, 0Ah, 'The single digit number is even.$'

END
