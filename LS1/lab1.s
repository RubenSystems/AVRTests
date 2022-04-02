.equ SREG ,0x3f 
.org 0
main:	ldi r16,0
		out SREG,r16 
mainloop: rjmp mainloop


;avr-as -g -mmcu=atmega328p -o lab1.o lab1.sa
;avr-ld -o lab1.elf lab1.o
;avr-objcopy -O ihex -R .eeprom lab1.elf lab1.hex