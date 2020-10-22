;///////////////////////////////////////////////////////////////////////////////
;/				CSE 107 HW3 �BRAH�M �ET�NKAYA 		  	    /
;/		HW4_121044072_part1			121044072		    	    /
;///////////////////////////////////////////////////////////////////////////////

MAIN_LOOP:
load r1,0x50 		;dizinin ba�lang�� adresi
load r9,0x51		; kar��la�t�raca�� de�erin b�alng�� adresi
load r5,4			;eleman say�s�
load r2,5 			;eleman say�s�
load rA,1 			;artt�rmak i�in 
load r7,1 			; say�lar� hangi s�rada oldugunu g�sterir
load rB,0 			;program counter i�in 
load r3,0xff 		;-1
addi r4,r1,r2		; dizinin d��ar� ��kmamas� i�in
addi r4,r4,r3		;dizinin biti� adresi
addi r6,r9,r5		;kar��la�t�raca�� de�er i�in biti� adresi
addi r6,r6,r3 		;kar��la�t�raca��m de�er 

 	
START_LOOP:
geri : 
addi rB,rB,rA 		;program�n bitip bitmedi�ini kontrol ediyo
addi r7,r7,rA 		;hangi s�rada 
load r8,[r1] 		;okunacak de�er
load r0,[r9] 		;kar��la�t�raca��m de�er

move r0,r2
jmpeq rb=r0,son
load r0,[r9]		;kar��la�t�raca��m de�er
jmple r8<=r0,ileri
move r8,r0 			;K���k say�n�n ge�ici olarak tutuldu�u yer
move rC,r7 			;HANG� SAYI oldugunu g�sterir
move rD,r8			;O SAYININ SIRASINI  g�sterir
addi r1,r1,rA		; okunacak de�eri 1 artt�r�r
addi r9,r9,rA 		;kar��la�t�raca��m de�eri 1 artt�r�r.
jmp geri
ileri:
addi r1,r1,rA		; okunacak de�eri 1 artt�r�r
addi r9,r9,rA 		;kar��la�t�raca��m de�eri 1 artt�r�r.

jmp geri
son:
move r1,rd 			;Dizinin En K���k De�eri
move r2,rc		 	;Dizinin En K���k De�erinin S�ras�
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

