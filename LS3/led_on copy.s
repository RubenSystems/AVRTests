.equ SREG,0x3f 
.equ DDRB,0x04
.equ PORTB,0x05
.equ DDRC,0x07
.equ PINC,0x06

.org 0

main: 	ldi r16,0
		out SREG,r16 

		ldi r16,0x0F
		out DDRB,r16

		;start
		ldi r16,0xF0
		out DDRC,r16

		;end
		in r16,PINC

		out PORTB,r16 

mainloop: rjmp mainloop

