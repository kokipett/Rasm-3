        .text
        .global String_lastIndexOf_2

String_lastIndexOf_2:
        // Argument 1: Address of the string (string1) in x0
        // Argument 2: Character to search for (ch) in w1
        // Argument 3: Starting index (fromIndex) in x2

        mov x3, x2                                      // Move fromIndex to x3
        ldr x4, =-1                                     // Initialize index counter to -1

        // Ensure fromIndex is not negative
        cmp x3, 0
        blt not_found                           // If fromIndex is negative, character not found, jump to not_found

        // Get the length of the string
        bl String_length                        // Call the string_length function
        mov x5, x0                                      // Store the length of the string in x5

        // Ensure fromIndex is within the bounds of the string
        cmp x3, x5
        bge not_found                           // If fromIndex is greater than or equal to the length of the string, character not found, jump to not_found

        // Increment the address of the string to fromIndex
        add x0, x0, x3

search_loop:
        ldrb    w6, [x0], #1                    // Load byte from address in x0, increment x0 by 1
        cbz     w6, not_found                   // If end of string, character not found, jump to not_found

        cmp     w6, w1                                  // Compare the byte with the specified character
        bne     search_continue                 // If bytes are not equal, continue searching

        mov x4, x0                                      // Update index counter with the current address
        b       search_loop                             // Repeat loop

search_continue:
        b       search_loop                             // Continue searching

not_found:
        ret                                                     // Return the index (stored in x4)
