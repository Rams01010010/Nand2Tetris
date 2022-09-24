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
//Initialize Constants
@KBD
D=A
@SCREEN
D=D-A
@n
M=D

//Infinite Loop for detecting keyboard
(START)
@KBD  //Keyboard Register
D=M
@WHITE
D;JEQ   //Jump to White if the register value is 0

(BLACK)
@i
M=0

(BLOOP) //Loop for producing black screen

@i
D=M
@n
D=D-M

@START
D;JEQ

@SCREEN
D=A
@i
A=D+M
M=-1
@i
M=M+1

@BLOOP
0;JMP

(WHITE) //Loop for producing white screen
@i
M=0

(WLOOP)
@i
D=M
@n
D=D-M

@START
D;JEQ

@SCREEN
D=A
@i
A=D+M
M=0
@i
M=M+1

@WLOOP
0;JMP