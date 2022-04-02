.equ SREG,0x3f 
.equ DDRB,0x04
.equ PORTB,0x05
.equ DDRC,0x07
.equ PINC,0x06

.org 0

main: 	ldi r16, 0
		out SREG, r16

start:	ldi r16,0x0F
		out DDRB,r16
		out PORTB,r16

		



		;;START LOOP
		ldi r17, 20
		call delay

		ldi r16,0x00
		out PORTB,r16

		;;START LOOP
		ldi r17, 2
		call delay




		rjmp start


		;;START LOOP
delay:	ldi r19, 255
		ldi r18, 255
loop:	nop
		dec r19
		cpi r19, 0
		brne loop
		ldi r19, 255
		dec r18
		cpi r18, 0
		brne loop
		ldi r18, 255
		ldi r19, 255
		dec r17
		cpi r17, 0
		brne loop
		ret 

		;;STOP LOOP


		

mainloop: rjmp mainloop

;;9 : NOP, DEC = 1, CPI, BRNE = 0.5 so 2 + 1 = 3 clock cycles
;;10 : 1.875e-5
;;11: 48 000 000 
;;12: 


;;avr-as -g -mmcu=atmega328p -o led_on.o led_on.s;avr-ld -o led_on.elf led_on.o;avr-objcopy -O ihex -R .eeprom led_on.elf led_on.hex;avrdude -C ../avrdude.conf -p atmega328p -c arduino -P /dev/tty.usbserial-A104WLZP -b 57600 -D -U flash:w:led_on.hex:i

