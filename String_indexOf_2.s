        .text
        .global String_indexOf_2

String_indexOf_2:
        // Argument 1: Address of the string (string1) in x0
        // Argument 2: Character to search for (ch) in w1
        // Argument 3: Starting index (fromIndex) in x2

        mov x3, x2                  // Move fromIndex to x3
        mov x4, 0                   // Initialize index counter to 0

        // Ensure fromIndex is not negative
        cmp x3, 0
        blt not_found               // If fromIndex is negative, character not found, jump to not_found

        // Get the length of the string
        bl String_length            // Call the string_length function
        mov x5, x0                  // Store the length of the string in x5

        // Ensure fromIndex is within the bounds of the string
        cmp x3, x5
        bge not_found               // If fromIndex is greater than or equal to the length of the string, character not found, jump to not_found

        // Increment the address of the string to fromIndex
        add x0, x0, x3

search_loop:
        ldrb w6, [x0], #1           // Load the next byte of the string into w6 and increment x0
        cbz w6, not_found          // If end of string, character not found, jump to not_found

        cmp w6, w1                  // Compare the character with the current byte of the string
        beq found                   // If character found, jump to found

        add x4, x4, 1               // Increment index counter
        b search_loop               // Repeat loop

found:
        add x4, x4, x3              // Add fromIndex to the found index
        ret                         // Return the index (stored in x4)

not_found:
        mov x4, -1                  // Character not found, set index to -1
        ret                         // Return -1
