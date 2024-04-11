        .data
uppercase_string:   .space 256    // Assuming a maximum length of 256 characters for the uppercase string

        .text
        .global String_toUpperCase

String_toUpperCase:
        // Argument 1: Address of the string (string1) in x0

        mov x2, x0                  // Copy the address of string1 to x2
        mov x3, x0                  // Copy the address of string1 to x3
        mov x4, xzr                 // Clear the counter

toupper_loop:
        ldrb    w5, [x0], #1           // Load byte from address in x0, increment x0 by 1
        cbz     w5, null_terminate      // If end of string, exit loop

        cmp     w5, #'a'                // Compare the byte with 'a'
        blt     continue_loop           // If byte is less than 'a', continue loop

        cmp     w5, #'z'                // Compare the byte with 'z'
        bgt     continue_loop           // If byte is greater than 'z', continue loop

        add     w5, w5, #32             // Convert lowercase letter to uppercase

continue_loop:
        strb    w5, [x3], #1           // Store byte at address in x3, increment x3 by 1
        add     x4, x4, 1               // Increment counter
        b       toupper_loop              // Repeat loop

null_terminate:
        // Null-terminate the uppercase string
        strb    wzr, [x3]              // Null-terminate the uppercase string

        // Return the address of the uppercase string
        mov     x0, x2                  // Return the address of uppercase_string (already in x2)
        ret                         // Return
