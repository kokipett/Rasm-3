        .data
concatenated_string:   .space 256    // Assuming a maximum length of 256 characters for the concatenated string

        .text
        .global String_concat

String_concat:
        // Argument 1: Address of the string (string1) in x0
        // Argument 2: Address of the substring (str) in x1

        // Copy the first string to the concatenated_string buffer
        mov x2, x0                                                      // Copy the address of string1 to x2
        mov x3, x0                                                      // Copy the address of string1 to x3
        bl String_length                                        // Get the length of string1
        add x4, x0, 1                                           // Add 1 for the null terminator
        add x5, x2, x4                                          // Calculate the end address of string1
        mov x6, xzr                                                     // Clear the counter

copy_loop1:
        ldrb    w7, [x2], #1                            // Load byte from address in x2, increment x2 by 1
        strb    w7, [x3], #1                            // Store byte at address in x3, increment x3 by 1
        add x6, x6, 1                                           // Increment counter
        cmp     x6, x4                                          // Compare counter with string1 length
        b.ne    copy_loop1                                      // If not equal, repeat loop

        // Copy the second string to the concatenated_string buffer
        mov x2, x1                                                      // Copy the address of str to x2
        mov x3, x5                                                      // Copy the end address of string1 to x3
        bl String_length                                        // Get the length of str
        add x4, x0, 1                                           // Add 1 for the null terminator
        add x5, x3, x4                                          // Calculate the end address of concatenated_string buffer
        mov x6, xzr                                                     // Clear the counter

copy_loop2:
        ldrb    w7, [x2], #1                            // Load byte from address in x2, increment x2 by 1
        strb    w7, [x3], #1                            // Store byte at address in x3, increment x3 by 1
        add x6, x6, 1                                           // Increment counter
        cmp     x6, x4                                          // Compare counter with str length
        b.ne    copy_loop2                                      // If not equal, repeat loop

        // Null-terminate the concatenated string
        strb    wzr, [x5]                                       // Null-terminate the concatenated string

        // Return the address of the concatenated string
        mov     x0, x0                                          // Return the address of concatenated_string (already in x0)
        ret                                                                     // Return
