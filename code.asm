.include"m8def.inc" 
 
.equ en=PB3 
.equ rs=PB2 
.equ rw=PB1 
.org 0x00 
cli 
ldi r16,high(ramend) 
out sph,r16 
ldi r16,low(ramend) 
out spl,r16 
 
cbi ddrb,0 
cbi ddrb,1 
sbi ddrb,2 
sbi ddrb,3 
ldi r16,0xff 
out ddrc,r16 
out ddrd,r16 
 
ldi r16,0x00 
out portc,r16 
out portd,r16 
rcall delay_20ms 
rcall LCDinit 
rcall delay_20ms 
ldi r18,00 
ldi r19,00 
ldi r20,00 
ldi r29,00 
ldi r30,00 
ldi r31,00 
ldi r16,0x80 
rcall cmndwrt 
ldi r16,'S' 
rcall datawrt 
ldi r16,0x81 
rcall cmndwrt 
ldi r16,'T' 
rcall datawrt 
ldi r16,0x82 
rcall cmndwrt 
ldi r16,'A' 
rcall datawrt 
ldi r16,0x83 
rcall cmndwrt 
ldi r16,'R' 
rcall datawrt 
ldi r16,0x84 
rcall cmndwrt 
ldi r16,'T' 
rcall datawrt 
ldi r16,0x86 
rcall cmndwrt 
ldi r16,'V' 
rcall datawrt 
ldi r16,0x87 
rcall cmndwrt 
ldi r16,'O' 
rcall datawrt 
ldi r16,0x88 
rcall cmndwrt 
ldi r16,'T' 
rcall datawrt 
ldi r16,0x89 
rcall cmndwrt 
ldi r16,'I' 
rcall datawrt 
ldi r16,0x8A 
rcall cmndwrt 
ldi r16,'N' 
rcall datawrt 
ldi r16,0x8B 
rcall cmndwrt 
ldi r16,'G' 
rcall datawrt 
rcall delay_20ms 
rcall delay_20ms 
rcall delay_20ms 
rcall delay_20ms 
rcall delay_20ms 
 
ldi r16,0x80
rcall cmndwrt 
ldi r16,' ' 
rcall datawrt 
ldi r16,0x81 
rcall cmndwrt 
ldi r16,' ' 
rcall datawrt 
ldi r16,0x82 
rcall cmndwrt 
ldi r16,' ' 
rcall datawrt 
ldi r16,0x83 
rcall cmndwrt 
ldi r16,' ' 
rcall datawrt 
ldi r16,0x84 
rcall cmndwrt 
ldi r16,' ' 
rcall datawrt 
ldi r16,0x86 
rcall cmndwrt 
ldi r16,' ' 
rcall datawrt 
ldi r16,0x87 
rcall cmndwrt 
ldi r16,' ' 
rcall datawrt 
ldi r16,0x88 
rcall cmndwrt 
ldi r16,' ' 
rcall datawrt 
ldi r16,0x89 
rcall cmndwrt 
ldi r16,' ' 
rcall datawrt 
ldi r16,0x8A 
rcall cmndwrt 
ldi r16,' ' 
rcall datawrt 
ldi r16,0x8B 
rcall cmndwrt 
ldi r16,' ' 
rcall datawrt 

ldi r16,0x80 
rcall cmndwrt 
ldi r16,'B' 
rcall datawrt 
ldi r16,0x81 
rcall cmndwrt 
ldi r16,'j' 
rcall datawrt 
ldi r16,0x82 
rcall cmndwrt 
ldi r16,'P' 
rcall datawrt 
ldi r16,0x84 
rcall cmndwrt 
ldi r16,'=' 
rcall datawrt 
ldi r16,'0' 
rcall datawrt 
ldi r16,'0' 
rcall datawrt 
ldi r16,0xc0 
rcall cmndwrt 
ldi r16,'C' 
rcall datawrt 
ldi r16,0xc1 
rcall cmndwrt 
ldi r16,'O' 
rcall datawrt 
ldi r16,0xc2 
rcall cmndwrt 
ldi r16,'N' 
rcall datawrt 
ldi r16,0xc3 
rcall cmndwrt 
ldi r16,'G' 
rcall datawrt 
ldi r16,0xc4 
rcall cmndwrt 
ldi r16,'=' 
rcall datawrt 
ldi r16,'0' 
rcall datawrt 
ldi r16,'0' 
rcall datawrt 
 
rjmp l1 
LCDinit: 
ldi r16,0x01 
rcall cmndwrt 
ldi r16,0x06 
rcall cmndwrt 
ldi r16,0x38 
rcall cmndwrt 
ldi r16,0x0e 
rcall cmndwrt 
ret 
 
check: 
ret 
 
cmndwrt: 
cbi portc,en 
cbi portc,rs 
cbi portc,rw 
out portd,r16 
sbi portc,en 
rcall delay 
cbi portc,en 
ret 
datawrt: 
cbi portc,en 
sbi portc,rs 
cbi portc,rw 
out portd,r16 
sbi portc,en 
rcall delay 
cbi portc,en 
ret 
delay: 
push r16 
push r17 
ldi r16,0xff 
a1: 
ldi r17,0x3f 
a2: 
dec r17 
brne a2 
dec r16 
brne a1 
pop r16 
pop r17 
 
ret 
 
 
l1: 
sbis pinb,0 
rjmp l4 
rcall delay_20ms 
sbis pinb,0 
rjmp l1 
inc r18 
sbi portb,2 
rcall delay_20ms 
cbi portb,2 
l3: mov r20,r18 
ldi r16,0x85 
rcall cmndwrt 
mov r16,r19 
ori r16,0x30 
rcall datawrt 
ldi r16,0x86 
rcall cmndwrt 
mov r16,r20 
ori r16,0x30 
rcall datawrt 
cpi r18,9 
breq l2 
rjmp l1 
l2: 
ldi r18,00 
inc r19 
rjmp l3 
 
l4: 
sbis pinb,1 
rjmp l1 
rcall delay_20ms 
sbis pinb,1 

rjmp l4 
inc r30 
sbi portb,3 
rcall delay_20ms 
cbi portb,3 
l5: mov r29,r30 
ldi r16,0xC5 
rcall cmndwrt 
mov r16,r31 
ori r16,0x30 
rcall datawrt 
ldi r16,0xC6 
rcall cmndwrt 
mov r16,r29 
ori r16,0x30 
rcall datawrt 
cpi r30,9 
breq l6 
rjmp l4 
l6: 
ldi r30,00 
inc r31 
rjmp l5 
 
 
delay_20ms: 
// 20ms delay 
ldi r22,0xff  // delay counter 
counter1: 
ldi r23,0xff  // delay counter 
counter2: 
dec r23 
brne counter2 
dec r22 
brne counter1 
ret