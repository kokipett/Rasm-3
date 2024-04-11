        .text
        .global String_indexOf_1

String_indexOf_1:
        // Argument 1: Address of the string (string1) in x0
        // Argument 2: Character to search for (ch) in x1

        mov x1, x0                  // Move the address of the string to x1
        mov x2, 0                   // Initialize index counter to 0

search_loop:
        ldrb w3, [x1], #1           // Load the next byte of the string into w3 and increment x1
        cbz w3, not_found          // If end of string, character not found, jump to not_found

        cmp w3, w1                  // Compare the character with the current byte of the string
        beq found                   // If character found, jump to found

        add x2, x2, 1               // Increment index counter
        b search_loop               // Repeat loop

found:
        ret                         // Return the index (stored in x2)

not_found:
        mov x2, -1                  // Character not found, set index to -1
        ret                         // Return -1
