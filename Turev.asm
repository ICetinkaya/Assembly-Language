; Turev ...
; ismiz yine katsayilarla ve üstün dereceleriyle
; x+x2+x4
;Result:1+2x+4x3
;Result: 1,2,0,4
;Algorithm Derivative
;step 1 x in derecesi 0 sa yok say.
;step 2 if (çarpan=0) do " 0 storing adress "
;else do "dereceyi bir artýrak kat sayýlarla çarp ve yeni adrese kaydet"
;stop.
DRIVER:
	
	load r1,0x90
	load r2,7
	load r3,0xA0

START:

	move re,r1
	LOAD R5,1 ;INCREMENTAL
	
	
	load ra,0 ;control "0"
	load r8,1 ; polinomun türevi alýnacak derecesi

	addi rd,r2,r1 ; end adress REader
	; first adress deritaves is 0 because start second reader adress
	addi re,re,r5 
	
START_LOOP:

	load r6,1 ; reset counter of cross action
	
	load r0,[re]
	
	load r7,0 ; total of cross action
	jmpEQ ra=r0,STORE_LOOP ; Eðer çarpan 0 ise çarpma iþlemi uygulama!

CROSS_ACTION_LOOP:
;x in derecesi ile kat sayýnýn çarpýldýðý bölüm
;			
			addi r7,r7,r8
			addi r6,r6,r5
			jmple	r6<=r0,CROSS_ACTION_LOOP



STORE_LOOP:
;sonuçlarýn kaydedildiði,
;counterlarýn arttýrýldðý bölüm.
		store r7,[r3]
	
		addi r8,r8,r5 
		addi r3,r3,r5
		addi re,re,r5
	

		move r0,rd
		jmple re<=r0,START_LOOP ; end adress loop conditional
END_LOOP:

	addi r1,r2,r4 ; new polynomial deegre
	halt

ORG 0X90
DB 6,0,2,0,5,9,0,2