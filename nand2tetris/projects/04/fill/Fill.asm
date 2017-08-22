// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


// check if any key is pressed



// while(true){
//	var key = getKeyVal();
//  if(key != 0){
//		SCREEN = -1
//}	
//}


	

(LOOP)
	
	@24576
	D=M
	@CLEARSCREEN
	D;JEQ



	// requires 8192 writes
	@iclear
	M=0
	
	@8192
	D=A
	@limclear  // save max into value
	M=D

	@16384
	D=A
	
	@currentclear // save current memory address to some value
	M=D

	@i
	M=0
	
	@8192
	D=A
	@lim  // save max into value
	M=D

	@16384
	D=A
	
	@current // save current memory address to some value
	M=D

(WRITESCREEN)
	// if i >= 8192 then jump to start
	
	// check if key still pressed

	@24576
	D=M
	@CLEARSCREEN
	D;JEQ

	@lim
	D=M

	@i
	D=D-M // 8192 - i

	@LOOP
	D;JLE // jump if less than

	@current
	A=M
	M=-1
	
	@i
	M=M+1 // increment i

	@current
	M=M+1 // increment current

	@WRITESCREEN
	0;JMP




(CLEARSCREEN)

	@limclear
	D=M

	@iclear
	D=D-M // 8192 - i

	@LOOP
	D;JLE // jump if less than

	@currentclear
	A=M
	M=0
	
	@iclear
	M=M+1 // increment i

	@currentclear
	M=M+1 // increment current

	@CLEARSCREEN
	0;JMP

(END)
