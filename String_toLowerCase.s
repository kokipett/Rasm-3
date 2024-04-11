        .data
lowercase_string:   .space 256    // Assuming a maximum length of 256 characters for the lowercase string

        .text
        .global String_toLowerCase

String_toLowerCase:
        // Argument 1: Address of the string (string1) in x0

        mov x2, x0                  // Copy the address of string1 to x2
        mov x3, x0                  // Copy the address of string1 to x3
        mov x4, xzr                 // Clear the counter

tolower_loop:
        ldrb    w5, [x0], #1           // Load byte from address in x0, increment x0 by 1
        cbz     w5, null_terminate      // If end of string, exit loop

        cmp     w5, #'A'                // Compare the byte with 'A'
        blt     continue_loop           // If byte is less than 'A', continue loop

        cmp     w5, #'Z'                // Compare the byte with 'Z'
        bgt     continue_loop           // If byte is greater than 'Z', continue loop

        sub     w5, w5, #32         // Convert uppercase letter to lowercase

continue_loop:
        strb    w5, [x3], #1           // Store byte at address in x3, increment x3 by 1
        add     x4, x4, 1               // Increment counter
        b       tolower_loop              // Repeat loop

null_terminate:
        // Null-terminate the lowercase string
        strb    wzr, [x3]              // Null-terminate the lowercase string

        // Return the address of the lowercase string
        mov     x0, x2                  // Return the address of lowercase_string (already in x2)
        ret                         // Return
