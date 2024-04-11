        .data
updated_string:   .space 256    // Assuming a maximum length of 256 characters for the updated string

        .text
        .global String_replace

String_replace:
    // Argument 1: Address of the string (string1) in x0
    // Argument 2: Old character to replace (oldChar) in w1
    // Argument 3: New character (newChar) in w2

    mov x3, x0                  // Copy the address of string1 to x3
    mov x4, x0                  // Copy the address of string1 to x4
    mov x5, xzr                 // Clear the counter

replace_loop:
    ldrb w6, [x0], #1           // Load byte from address in x0, increment x0 by 1
    cbz w6, copy_rest          // If end of string, exit loop and copy the remaining characters

    cmp w6, w1                  // Compare the byte with the oldChar
    b.eq replace_char           // If bytes are equal, replace the character

    b continue_loop             // Continue loop

replace_char:
    mov w6, w2                  // Replace the oldChar with the newChar

continue_loop:
    strb w6, [x4], #1           // Store byte at address in x4, increment x4 by 1
    add x5, x5, 1               // Increment counter
    b replace_loop              // Repeat loop

copy_rest:
    // Null-terminate the updated string
    strb wzr, [x4]              // Null-terminate the updated string

    // Return the address of the updated string
    mov x0, x3                  // Return the address of updated_string (already in x3)
    ret                         // Return
