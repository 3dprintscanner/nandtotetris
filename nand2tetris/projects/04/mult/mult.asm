// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
//x*y // var sum = 0 // for(i=0;i<=y;++i){//   sum = sum + x //} //return x;

// set memory[2] to 0



//set i = 0
	@i
	M=0

	@ARG
	M=0

	// check if either inputs are zero
	
	@SP
	D=M
	@END
	D;JEQ

	@LCL
	D=M
	@END
	D;JEQ

(LOOP)
	// check i <=y e.g y - i > 0, use JLE 
	
	// set input 0 to D register
	@LCL
	D=M

	// compute i value
	@i
	D=D-M


	@END
	D;JLE

	// increment i
	@i
	M=M+1
	// multiply numbers by addition
	@SP
	D=M

	@ARG
	M=D+M
	
	@LOOP
	0;JMP
(END)
	@END
	0;JMP





