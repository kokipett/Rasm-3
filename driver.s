        .global _start

        .data
dbBuffer: .skip 20
szBuffer: .skip 20

szLength1: .asciz "1. s1.length() = "
szLength2: .asciz "   s2.length() = "
szLength3: .asciz "   s3.length() = "

szIndex1:  .asciz "13. String_indexOf_1(s2,'g')      = "
szIndex2:  .asciz "14. String_indexOf_2(s2,'g',9)    = "
szIndex3:  .asciz "15. String_indexOf_3(s2,\"eggs\")   = "

szLast1:   .asciz "16. String_lastIndexOf_1(s2,'g')     = "
szLast2:   .asciz "17. String_lastIndexOf_2(s2,'g',6)   = "
szLast3:   .asciz "18. String_lastIndexOf_3(s2,\"egg\")   = "

szReplace: .asciz "19. String_replace(s1,'a','o') = "

szLower:   .asciz "20. String_toLowerCase(s1) = "

szUpper:   .asciz "21. String_toUpperCase(s1) = "

szConcat1: .asciz "22. String_concat(s1, ' ') = "
szConcat2: .asciz "    String_concat(s1, s2)  = "

//Strings
s1:     .asciz "Cat in the hat."
s2:     .asciz "Green eggs and ham."
s3:     .asciz "cat in the hat."

chLF: .byte 0xa

        .text
_start:
        // Print new line feed
        ldr x0, =chLF           // Load new line feed
        bl putch                // Print it

// Test Case #1
        // Print szLength1
        mov x0, #1              // 1 for stdout
        ldr x1, =szLength1      // Load String
        mov x2, #18             // Load length of String
        mov x8, #64             // 64 for write syscall
        svc 0                   // Execute syscall

        // Branch to the function
        ldr x0, =s1             // Load s1 string
        bl String_length        // Branch

        // Print new line feed
        ldr x0, =chLF           // Load new line feed
        bl putch                // Print it



        // Print szLength2
        mov x0, #1              // 1 for stdout
        ldr x1, =szLength2      // Load String
        mov x2, #18             // Load length of String
        mov x8, #64             // 64 for write syscall
        svc 0                   // Execute syscall

        // Branch to the function
        ldr x0, =s1             // Load s1 string
        bl String_length        // Branch

        // Print new line feed
        ldr x0, =chLF           // Load new line feed
        bl putch                // Print it



        // Print szLength3
        mov x0, #1              // 1 for stdout
        ldr x1, =szLength3      // Load String
        mov x2, #18             // Load length of String
        mov x8, #64             // 64 for write syscall
        svc 0                   // Execute syscall

        // Branch to the function
        ldr x0, =s1             // Load s1 string
        bl String_length        // Branch

/*
        ldr     x0,=dbBuffer //load the address of dbSum into x4
        str     x0,[w1] //store the numerical result into dbSum
        ldr     x1,=szBuffer //load szSum into x3
        bl      int64asc //convert the result to ascii and store it in szSum

        ldr x0,=szSum //Load szSum
        bl putstring //Print szSum
*/

        // Print new line feed
        ldr x0, =chLF
        bl putch
        // Print new line feed
        ldr x0, =chLF           // Load line feed
        bl putch                // Print

// Test Case #13
        // Print szIndex1
        mov x0, #1              // 1 for stdout
        ldr x1, =szIndex1       // Load String
        mov x2, #37             // String length
        mov x8, #64             // Write syscall number
        svc 0                   // Execute syscall

        // Branch to function

        // Print new line feed
        ldr x0, =chLF           // Load line feed
        bl putch                // Print


// Test Case #14
        // Print szIndex2
        mov x0, #1              // 1 for stdout
        ldr x1, =szIndex2       // Load String
        mov x2, #37             // String length
        mov x8, #64             // Write syscall number
        svc 0                   // Execute syscall

        // Branch to function

        // Print new line feed
        ldr x0, =chLF           // Load line feed
        bl putch                // Print


// Test Case #15
        // Print szIndex3
        mov x0, #1              // 1 for stdout
        ldr x1, =szIndex3       // Load String
        mov x2, #37             // String length
        mov x8, #64             // Write syscall number
        svc 0                   // Execute syscall

        // Branch to function

        // Print new line feed
        ldr x0, =chLF           // Load line feed
        bl putch                // Print
        // Print new line feed
        ldr x0, =chLF           // Load line feed
        bl putch                // Print



// Test Case #16
        // Print szLast1
        mov x0, #1              // 1 for stdout
        ldr x1, =szLast1        // Load String
        mov x2, #40             // String length
        mov x8, #64             // Write syscall number
        svc 0                   // Execute syscall

        // Branch to function

        // Print new line feed
        ldr x0, =chLF           // Load line feed
        bl putch                // Print


// Test Case #17
        // Print szLast2
        mov x0, #1              // 1 for stdout
        ldr x1, =szLast2        // Load String
        mov x2, #40             // String length
        mov x8, #64             // Write syscall number
        svc 0                   // Execute syscall

        // Branch to function

        // Print new line feed
        ldr x0, =chLF           // Load line feed
        bl putch                // Print


// Test Case #18
        // Print szLast3
        mov x0, #1              // 1 for stdout
        ldr x1, =szLast3        // Load String
        mov x2, #40             // String length
        mov x8, #64             // Write syscall number
        svc 0                   // Execute syscall

        // Branch to function

        // Print new line feed
        ldr x0, =chLF           // Load line feed
        bl putch                // Print
        // Print new line feed
        ldr x0, =chLF           // Load line feed
        bl putch                // Print

// Test Case #19
        // Print szReplace
        mov x0, #1              // 1 for stdout
        ldr x1, =szReplace      // Load String
        mov x2, #34             // String length
        mov x8, #64             // Write syscall number
        svc 0                   // Execute syscall

        // Branch to function

        // Print new line feed
        ldr x0, =chLF           // Load line feed
        bl putch                // Print
        // Print new line feed
        ldr x0, =chLF           // Load line feed
        bl putch                // Print


// Test Case #20
        // Print szLower
        mov x0, #1              // 1 for stdout
        ldr x1, =szLower        // Load String
        mov x2, #30             // String length
        mov x8, #64             // Write syscall number
        svc 0                   // Execute syscall

        // Branch to function

        // Print new line feed
        ldr x0, =chLF           // Load line feed
        bl putch                // Print


// Test Case #21
        // Print szUpper
        mov x0, #1              // 1 for stdout
        ldr x1, =szUpper        // Load String
        mov x2, #30             // String length
        mov x8, #64             // Write syscall number
        svc 0                   // Execute syscall

        // Branch to function

        // Print new line feed
        ldr x0, =chLF           // Load line feed
        bl putch                // Print
        // Print new line feed
        ldr x0, =chLF           // Load line feed
        bl putch                // Print


// Test Case #22
        // Print szConcat1
        mov x0, #1              // 1 for stdout
        ldr x1, =szConcat1      // Load String
        mov x2, #30             // String length
        mov x8, #64             // Write syscall number
        svc 0                   // Execute syscall

        // Branch to function

        // Print new line feed
        ldr x0, =chLF           // Load line feed
        bl putch                // Print

        // Print szConcat2
        mov x0, #1              // 1 for stdout
        ldr x1, =szConcat2      // Load String
        mov x2, #30             // String length
        mov x8, #64             // Write syscall number
        svc 0                   // Execute syscall

        // Branch to function

        // Print new line feed
        ldr x0, =chLF           // Load line feed
        bl putch                // Print
        // Print new line feed
        ldr x0, =chLF           // Load new line feed
        bl putch                // Print it


        // Exit program
        mov x0, #0      // Exit status
        mov x8, #93     // syscall number for exit
        svc #0          // make syscall
