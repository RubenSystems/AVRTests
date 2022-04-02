.equ SREG,0x3f 

;;B
.equ DDRB,0x04
.equ PORTB,0x05

;;D
.equ DDRD,0x0A
.equ PORTD,0x0B

.org 0

main: 	ldi r16, 0
		out SREG, r16
		ldi r17, 0;;LOOP COUNTER

		ldi r16,0xFF
		out DDRB,r16
		out DDRD,r16

st:		ldi r21,0x81;;11011011
		mov r22, r21
		call disp
		call delay

		;;get upper nibble
		ldi r22,0xF0;;BIT MASK 11110000
		and r22, r21
		mov r23,r22
		lsr r23
		lsr r23
		lsr r23
		lsr r23
		

		;;get lower nibble 
		ldi r22, 0x0F;;BIT MASK 00001111
		and r22, r21
		mov r24, r22
		lsl r24
		lsl r24
		lsl r24
		lsl r24

		or r23, r24
		mov r22,r23 


		call disp
		call delay
		rjmp st



disp:	out PORTD, r22
		swap PORTB
		out PORTB, r22
		ret

		;;START LOOP
delay:	ldi r19, 10
		ldi r18, 10
loop:	nop
		dec r19
		cpi r19, 0
		brne loop
		ldi r19, 100
		dec r18
		cpi r18, 0
		brne loop
		ldi r18, 100
		ldi r19, 100
		dec r17
		cpi r17, 0
		brne loop
		ret 
		;;STOP LOOP
		

mainloop: rjmp mainloop


;;avr-as -g -mmcu=atmega328p -o led_on.o led_on.s;avr-ld -o led_on.elf led_on.o;avr-objcopy -O ihex -R .eeprom led_on.elf led_on.hex;avrdude -C ../avrdude.conf -p atmega328p -c arduino -P /dev/tty.usbserial-A104WLZP -b 57600 -D -U flash:w:led_on.hex:i

