        .text
        .global String_lastIndexOf_1

String_lastIndexOf_1:
        // Argument 1: Address of the string (string1) in x0
        // Argument 2: Character to search for (ch) in w1

        mov x1, x0                                      // Move the address of the string to x1
        ldr x2, =-1                                     // Initialize index counter to -1

search_loop:
        ldrb    w3, [x0], #1                    // Load byte from address in x0, increment x0 by 1
        cbz     w3, not_found                   // If end of string, character not found, jump to not_found

        cmp     w3, w1                                  // Compare the byte with the specified character
        bne     search_continue                 // If bytes are not equal, continue searching

        mov x2, x0                                      // Update index counter with the current address
        b       search_loop                             // Repeat loop

search_continue:
        b       search_loop                             // Continue searching

not_found:
        ret                                                     // Return the index (stored in x2)
