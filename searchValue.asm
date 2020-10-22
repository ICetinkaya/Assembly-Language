;//////////////////////////////////////////////////////////////////////////
;/   		CSE 107 HW4-3 �BRAH�M �ET�NKAYA 	   121044072              /
;/			HW03b_<121044072>_part3.asm  		 	     /
;/////////////////////////////////////////////////////////////////////////

MAIN_LOOP:
load r1,0x40 	;Dizinin ba�lang�� adresi 
load r2,10 		; Eleman Say�s�
load r4,0xFF 	;-1
addi r3,r1,r2 	;Dizinin biti� adresi 
addi r3,r3,r4 	;Dizinin d��ar� ��kmamas� i�in -1 ile toplan�r.
load r0,40  	;Dizinin elemanlar�yla kar��la�t�r�laca�� de�er
load r6,0 		;Program counter 
load r7,1 		;Artt�rmak i�in
START_LOOP:
geri :
addi r6,r6,r7 	;Program counter'� artt�r�r
load r5,[r1] 	;Dizinin okunacak verisi 
move r0,r2 
jmpeq r6=r0,son 	;Dizinin bitip bitmedi�ini kontrol eder.
load r0,40		;Kar��la�t�raca��m de�er 
jmpeq r5=r0,ileri 
load r9,0x00 	;Kar��la�t�rma de�eri ile dizinin eleman�nda bulunmuyorsa 00 basar
addi r1,r1,r7 	;Bir sonraki adresi getirmek i�in artt�r�l�r.
jmp geri
ileri:
load r8,0x01 	;Kar��la�t�rma de�eri  dizinin eleman�nda bulunuyorsa 01 basar
load rA,$30
addi rF,rA,r8      ;Ekrana 1 basar 
move r1,r8

halt

son:
load r9,0x00	;Kar��la�t�rma de�eri dizinin eleman�nda bulunmuyorsa 00 basar
load rA,$30
addi rf,rA,r9	;Ekrana 0 basar
move r1,r9
halt

org 0x40
db 12,56,32,67,81,55,10,90,42,83