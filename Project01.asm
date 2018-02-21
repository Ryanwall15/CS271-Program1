TITLE Program Template     (Project01.asm)

; Author: Ryan Wallerius
; Course / Project ID  Program 1               Date: 4/16/2017
; Description: For this project I will need to ask the user to enter two numbers and based on those
; I will show them the sum, difference, product, quotient, and remainder

INCLUDE Irvine32.inc

.data

greeting_message	BYTE	"					Easy Math		By Ryan Wallerius", 0
user_prompt			BYTE	"Please enter two numbers", 0
prompt_1	BYTE	"	Please enter two numbers below and I will show you the sum, difference, product, quotient, and remainder", 0
number_1_prompt		BYTE	"Number 1: ", 0
number_2_prompt		BYTE	"Number 2: ", 0
adding				BYTE	" + ", 0
subtracting			BYTE	" - ", 0
dividing			BYTE	" / ", 0
multiplying			BYTE	" * ", 0
equal				BYTE	" = ", 0
number_1			DWORD	?
number_2			DWORD	?
sum					DWORD   ?
difference			DWORD	?
product				DWORD	?
quotient			DWORD	?
remainder			DWORD	?
remainder_prompt	BYTE	" remainder: ", 0
goodbye				BYTE	"I'm not sure how I was able to do this but thanks for using my program!"

.code
main PROC

;Introduce myself
	mov  edx, OFFSET greeting_message
	call WriteString
	call CrLf
	mov	 edx, OFFSET prompt_1
	call WriteString
	call CrLf

;Get data from user
	call CrLf
	mov  edx, OFFSET user_prompt
	call WriteString

	call CrLf
	mov	 edx, OFFSET number_1_prompt
	call WriteString
	call ReadDec								;Gets number 1 from user
	mov	 number_1, eax							;Store in variable thats in eax register

	mov	 edx, OFFSET number_2_prompt
	call WriteString
	call ReadDec								;Gets number 2 from user
	mov	 number_2, eax							;Store in variable thats in eax register

;Add numbers
	call CrLf
	mov	eax, number_1							;Get number 1 from eax
	call WriteDec
	mov edx, OFFSET adding
	call WriteString
	mov	eax, number_2							;Get number 2 from eax
	call WriteDec

	mov	 eax, number_1							;Get number 1 again
	add	 eax, number_2							;add number 1 and 2 together (number 1 in eax register)
	mov	 sum, eax								;Store in sum variable that sin eax register
	mov  edx, OFFSET equal
	call WriteString
	call WriteDec
	call CrLf

;Subtract numbers
	
	mov	eax, number_1							;Get number 1 from eax
	call WriteDec
	mov edx, OFFSET subtracting
	call WriteString
	mov	eax, number_2							;Get number 2 from eax
	call WriteDec
		
	mov	 eax, number_1							;Get number 1 again and store in eax
	sub	 eax, number_2							;Subtract number 2 from eax (number 1 in eax register)
	mov	 difference, eax
	mov  edx, OFFSET equal
	call WriteString
	call WriteDec
	call CrLf

;Multiplying numbers

	mov eax, number_1
	call WriteDec
	mov	 edx, OFFSET multiplying
	call WriteString
	mov	 eax, number_2
	call WriteDec

	mov	 eax, number_1						;Put number 1 in eax
	mov  ebx, number_2						;Put number 2 in ebx
	mul  ebx								;Mulitply eax (num 1) and ebx (num 2)
	mov  product, ebx
	mov  edx, OFFSET equal
	call WriteString
	call WriteDec 
	call CrLf

;Dividing numbers
	
	mov	 eax, number_1
	call WriteDec
	mov  edx, OFFSET dividing
	call WriteString
	mov	 eax, number_2
	call WriteDec

	cdq
	mov	eax, number_1					;Num 1 in eax
	mov ebx, number_2					;Num 2 in ebx
	div ebx								;Divide num 1/num2
	mov	quotient, eax					;Quotient stored in eax
	mov remainder, edx					;Remainder stored in edx 
	mov	edx, OFFSET equal
	call WriteString
	call WriteDec
	mov	 eax, remainder
	mov	 edx, OFFSET remainder_prompt
	call WriteString
	call WriteDec
	call CrLf
	call CrLf

;Goodbye
	
	mov edx, OFFSET goodbye 
	call WriteString
	call CrLf

	exit	; exit to operating system
main ENDP


END main
