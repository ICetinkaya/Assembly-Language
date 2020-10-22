;///////////////////////////////////////////////////////////////////////////////
;/				CSE 107 HW3 ÝBRAHÝM ÇETÝNKAYA 		  	    /
;/		HW4_121044072_part1			121044072		    	    /
;///////////////////////////////////////////////////////////////////////////////

MAIN_LOOP:
load r1,0x50 		;dizinin baþlangýç adresi
load r9,0x51		; karþýlaþtýracaðý deðerin bþalngýç adresi
load r5,4			;eleman sayýsý
load r2,5 			;eleman sayýsý
load rA,1 			;arttýrmak için 
load r7,1 			; sayýlarý hangi sýrada oldugunu gösterir
load rB,0 			;program counter için 
load r3,0xff 		;-1
addi r4,r1,r2		; dizinin dýþarý çýkmamasý için
addi r4,r4,r3		;dizinin bitiþ adresi
addi r6,r9,r5		;karþýlaþtýracaðý deðer için bitiþ adresi
addi r6,r6,r3 		;karþýlaþtýracaðým deðer 

 	
START_LOOP:
geri : 
addi rB,rB,rA 		;programýn bitip bitmediðini kontrol ediyo
addi r7,r7,rA 		;hangi sýrada 
load r8,[r1] 		;okunacak deðer
load r0,[r9] 		;karþýlaþtýracaðým deðer

move r0,r2
jmpeq rb=r0,son
load r0,[r9]		;karþýlaþtýracaðým deðer
jmple r8<=r0,ileri
move r8,r0 			;Küçük sayýnýn geçici olarak tutulduðu yer
move rC,r7 			;HANGÝ SAYI oldugunu gösterir
move rD,r8			;O SAYININ SIRASINI  gösterir
addi r1,r1,rA		; okunacak deðeri 1 arttýrýr
addi r9,r9,rA 		;karþýlaþtýracaðým deðeri 1 arttýrýr.
jmp geri
ileri:
addi r1,r1,rA		; okunacak deðeri 1 arttýrýr
addi r9,r9,rA 		;karþýlaþtýracaðým deðeri 1 arttýrýr.

jmp geri
son:
move r1,rd 			;Dizinin En Küçük Deðeri
move r2,rc		 	;Dizinin En Küçük Deðerinin Sýrasý
load r3,[0x50]
move r0,r1
jmple r3<=r0,son2
halt
son2:
move r1,r3
load r2,1

halt
org 0x50
db 4,1,5,6,9

