.386
.model flat,stdcall
.stack 4096
INCLUDE Irvine32.inc
.data
        output1 BYTE "Valid",0
        output2 BYTE "Invalid",0
        minimum BYTE 5,2,4,1,3
        maximum BYTE 9,5,8,4,6
        pin1 BYTE 6,3,4,7,8
        pin2 BYTE 9,3,7,8,3
        pin3 BYTE 6,4,6,2,4
        pin4 BYTE 7,4,5,2,5

.code
main PROC
        call Clrscr
        mov ebx,OFFSET pin1
        mov esi,OFFSET minimum
        mov edi,OFFSET maximum
        call Validate_PIN
        ; code to check validity of PIN 1
        .IF eax==0
                mov edx,OFFSET output1
                call WriteString
                call Crlf

        .ELSE
                mov edx,OFFSET output2
                call WriteString
                call Crlf

        .ENDIF

        ; code to check validity of PIN 2
        mov ebx,OFFSET pin2
        call Validate_PIN

        .IF eax==0
                mov edx,OFFSET output1
                call WriteString
                call Crlf

        .ELSE
                mov edx,OFFSET output2
                call WriteString
                call Crlf

        .ENDIF


        ; code to check validity of PIN 3
        mov ebx,OFFSET pin3

        call Validate_PIN

        .IF eax==0
                mov edx,OFFSET output1
                call WriteString
                call Crlf

        .ELSE
                mov edx,OFFSET output2
                call WriteString
                call Crlf

        .ENDIF

        ; code to check validity of PIN 4
        mov ebx,OFFSET pin4

        call Validate_PIN

        .IF eax==0
                mov edx,OFFSET output1
                call WriteString
                call Crlf

        .ELSE
                mov edx,OFFSET output2
                call WriteString
                call Crlf
        .ENDIF

         exit

main ENDP

Validate_PIN PROC USES ecx edx esi edi
        mov ecx,5
        mov eax,0

L1:
        mov al,[ebx]
        .IF(al >= [esi]) && (al <= [edi])
                inc ebx
                inc esi
                inc edi

        .ELSE
                mov eax,6
                sub eax,ecx
                ja L2

        .ENDIF

        loop L1
        mov eax,0

L2:
        ret

Validate_PIN ENDP

END main

 