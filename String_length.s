        .text
        .global String_length

String_length:
        // X0 contains the address of the string
        mov w1, #0      //Initialize the counter to loop through the string

loop:
        ldrb w2, [x0], #1       // Load byte from the string in x0 and increment x0 by 1

        // Check if there is a null terminator
        cmp w2, #0      // Compare the byte with null
        beq end_loop    //Branch if equal to null to end_loop

        //Increment the counter
        add w1, w1, #1  //Add 1 to w1

        b loop  //Repeat the loop

end_loop:
        // Return the length stored in w1
        ret     // Return
