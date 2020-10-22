;//////////////////////////////////////////////////////////////////////////
;/   		CSE 107 HW4-3 ÝBRAHÝM ÇETÝNKAYA 	   121044072              /
;/			HW03b_<121044072>_part3.asm  		 	     /
;/////////////////////////////////////////////////////////////////////////

MAIN_LOOP:
load r1,0x40 	;Dizinin baþlangýç adresi 
load r2,10 		; Eleman Sayýsý
load r4,0xFF 	;-1
addi r3,r1,r2 	;Dizinin bitiþ adresi 
addi r3,r3,r4 	;Dizinin dýþarý çýkmamasý için -1 ile toplanýr.
load r0,40  	;Dizinin elemanlarýyla karþýlaþtýrýlacaðý deðer
load r6,0 		;Program counter 
load r7,1 		;Arttýrmak için
START_LOOP:
geri :
addi r6,r6,r7 	;Program counter'ý arttýrýr
load r5,[r1] 	;Dizinin okunacak verisi 
move r0,r2 
jmpeq r6=r0,son 	;Dizinin bitip bitmediðini kontrol eder.
load r0,40		;Karþýlaþtýracaðým deðer 
jmpeq r5=r0,ileri 
load r9,0x00 	;Karþýlaþtýrma deðeri ile dizinin elemanýnda bulunmuyorsa 00 basar
addi r1,r1,r7 	;Bir sonraki adresi getirmek için arttýrýlýr.
jmp geri
ileri:
load r8,0x01 	;Karþýlaþtýrma deðeri  dizinin elemanýnda bulunuyorsa 01 basar
load rA,$30
addi rF,rA,r8      ;Ekrana 1 basar 
move r1,r8

halt

son:
load r9,0x00	;Karþýlaþtýrma deðeri dizinin elemanýnda bulunmuyorsa 00 basar
load rA,$30
addi rf,rA,r9	;Ekrana 0 basar
move r1,r9
halt

org 0x40
db 12,56,32,67,81,55,10,90,42,83