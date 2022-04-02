.equ SREG,0x3f
.equ DDRB,0x04
.equ PORTB,0x05

.org 0

main:		ldi r16,0
			out SREG, r16

			;DDRB conrol
			ldi r16,0x0F
			out DDRB,r16

			;Port b control
			ldi r16,0x0D
			out PORTB, r16

mainloop: rjmp mainloop

;avr-as -g -mmcu=atmega328p -o led_on.o led_on.s;avr-ld -o led_on.elf led_on.o;avr-objcopy -O ihex -R .eeprom led_on.elf led_on.hex
;avrdude -C /etc/avrdude.conf -p atmega328p -c arduino -P /dev/ttyUSB0 \ -b 57600 -D -U flash:w:led_on.hex:i
