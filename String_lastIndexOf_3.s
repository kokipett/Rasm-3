        .text
        .global String_lastIndexOf_3

String_lastIndexOf_3:
        // Argument 1: Address of the string (string1) in x0
        // Argument 2: Address of the substring (str) in x1

        mov x2, 0                                       // Initialize index counter to 0
        mov x3, x0                                      // Store the address of the string in x3

        // Get the length of the string and the substring
        bl String_length                        // Call the string_length function for string1
        mov x4, x0                                      // Store the length of the string in x4
        bl String_length                        // Call the string_length function for str
        mov x5, x0                                      // Store the length of the substring in x5

        // Ensure substring length is not greater than string length
        cmp x5, x4
        bgt not_found                           // If substring length is greater than string length, substring not found, jump to not_found

        // Move the address of the string to the end of the string
        add x3, x3, x4

search_loop:
        sub x3, x3, 1                           // Move the address of the string backwards by 1 byte
        ldrb    w6, [x3]                        // Load byte from address in x3
        cbz     w6, not_found           // If end of string, substring not found, jump to not_found

        mov     x7, x1                          // Store the address of the substring in x7
        mov     x8, x3                          // Store the current address of the string in x8

search_substring_loop:
        ldrb    w9, [x7], #1            // Load byte from address in x7, increment x7 by 1
        cbz     w9, found                       // If end of substring, substring found, jump to found

        ldrb    w10, [x8], #1           // Load byte from address in x8, increment x8 by 1
        cbz     w10, not_found          // If end of string, substring not found, jump to not_found

        cmp     w9, w10                         // Compare bytes of string and substring
        bne     search_loop                     // If bytes are not equal, restart search from the previous character in the string
        b       search_substring_loop   // Repeat loop

found:
        sub     x2, x3, x0                      // Calculate the index of the last occurrence of the substring
        ret                                                     // Return the index (stored in x2)

not_found:
        mov     x2, -1                                  // Substring not found, return -1
        ret                                                     // Return -1
