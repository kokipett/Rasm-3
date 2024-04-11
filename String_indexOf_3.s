        .text
        .global String_indexOf_3

String_indexOf_3:
        // Argument 1: Address of the string (string1) in x0
        // Argument 2: Address of the substring (str) in x1

        mov x2, 0                                       // Initialize index counter to 0

        // Get the length of the string and the substring
        bl String_length                        // Call the string_length function for string1
        mov x3, x0                                      // Store the length of the string in x3
        bl String_length                        // Call the string_length function for str
        mov x4, x0                                      // Store the length of the substring in x4

        // If substring length is greater than string length, substring can't exist
        cmp x3, x4
        blt not_found                           // If string length is less than substring length, substring not found, jump to not_found

search_loop:
        // Load a byte from the address pointed by x0 into w5
        ldrb    w5, [x0], #1                    // Load byte from address in x0, increment x0 by 1

        // Check if the byte is null terminator
        cbz     w5, not_found                   // If end of string, substring not found, jump to not_found

        // Load the first byte from the substring into w6
        ldrb    w6, [x1], #1                    // Load byte from address in x1, increment x1 by 1

        // Check if the byte is null terminator
        cbz     w6, found                               // If end of substring, substring found, jump to found

        // Compare the current byte of the string with the current byte of the substring
        cmp     w5, w6
        bne     search_restart                  // If bytes are not equal, restart the search from next character in the string

search_continue:
        // Load the next byte from the substring into w6
        ldrb    w6, [x1], #1                    // Load byte from address in x1, increment x1 by 1

        // Check if the byte is null terminator
        cbz     w6, found                               // If end of substring, substring found, jump to found

        // Load the next byte from the string into w5
        ldrb    w5, [x0], #1                    // Load byte from address in x0, increment x0 by 1

        // Check if the byte is null terminator
        cbz     w5, not_found                   // If end of string, substring not found, jump to not_found

        // Compare the current byte of the string with the current byte of the substring
        cmp     w5, w6
        bne     search_restart                  // If bytes are not equal, restart the search from next character in the string
        b       search_continue                 // Repeat loop

search_restart:
        // Reset the substring pointer
        sub     x1, x1, x4                              // Move the substring pointer back to the start of the substring
        // Reset the string pointer to the next character
        sub     x0, x0, 1                               // Move the string pointer back to the character just compared
        // Increment the index counter
        add     x2, x2, 1                               // Increment index counter
        b       search_loop                             // Restart the search

found:
        // Return the index where the substring was found
        ret                                                     // Return the index (stored in x2)

not_found:
        // Substring not found, return -1
        mov     x2, -1                                  // Set index to -1
        ret                                                     // Return -1
