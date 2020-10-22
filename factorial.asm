;////////////////////////////////////////////////////////////////////////////////////////////////
;/   					CSE 107 HW3 �BRAH�M �ET�NKAYA 		   			/
;/							121044072			       		/
;////////////////////////////////////////////////////////////////////////////////////////////////


;D�ng�ye sokmadan �nce i�lemin bitip bitmedi�ini kontrol eder
;�rne�in 2.1 ise 1 geldi�inde direk Finish d�ng�lerine girer.
;Her bir de�er de�i��e�i i�in Ge�ici de�er ve Ge�ici counter tutulur
;***Main Memory �ok dolu oldu�undan her i�lem bitiminde clear edilmelidir
Ekran:
load rb,text                                      ;Metni Ekrana yazd�rmak i�in rb ye text  atan�r.
load rc,1						  	  ;Bir sonraki harfi artt�rmak i�in
load rd,0							    
nextchar:load rf,[rb]					  ;Bir sonraki harfi basar
	addi rb,rb,rc					  ;Harfi de�i�tirir Fa.. Fac... Fact...
	load rE,5
	jmpeq rf=r0,MAIN_LOOP
	jmp nextchar
text:
        db 10
	  db      "created by",10
         db      "Ibrahim Cetinkaya",10
         db      "Factorial is "                ;Alt sat�ra ge�mesin diye 10 komutu eklemedim 
         db      0          
MAIN_LOOP:
load r1,5					 ; FAKT�R�YEL� ALINACAK SAYI
load r2,0xff			       ;-1 Bir azaltmak i�in 5x4x3...
load r5,1					 ;Artt�rmak i�in 
START_LOOP:
load r0,0
jmpeq r1=r0,Finish_1   			 ;E�er 0! faktoriyel ise D�ng�ye girmez direk Finish_1 e z�plar.  0=0 durumu ise
load r0,1 
jmpeq r1=r0,Finish_2			 ;E�er 1! fakt�riyel ise d�ng�ye girmez direk Finish_2 e z�plar  1=1 durumu ise
LOOP_1:
load r4,0					 ;Program counter
load r6,0					 ;Ge�ici De�er
addi r3,r1,r2 				 ;4 olmas� i�in 5.4....(4)
move r0,r5
jmpeq r3=r0,Finish_3			 ;2! Fakt�riyeli buldurmak i�in sistemi sona g�t�r�p tekrar getirilir R0 1 oldu�undan Finish_3 d�ng�s�ne sokulur.
geri:
	 addi r4,r4,r5			
	addi r6,r6,r3
	move r0,r1
	jmpeq r4=r0,LOOP_2		;�arpma i�lemini bitirdikten sonra di�er i�leme girer 5x4 =20 ise LOOP_2 atla
	jmp geri
LOOP_2:
load r7,0 					;Ge�ici de�er   
load r8,0 					;Ge�ici counter

addi r3,r3,r2 ;5.4.3....(3)		;Her zaman denetler 1 gelip gelmedi�ini 5.4.3
move r0,r8
jmpeq r3=r0,Finish_4



move r0,r5
jmpeq r3=r0,Finish_4
geri2: addi r7,r7,r6           
	 addi r8,r8,r5	
	 move r0,r3
	 jmpeq r8=r0,LOOP_3		;�arpma i�lemini bitirdikten sonra di�er i�leme girer 20x3=60 ise LOOP_3 atla
	 jmp geri2
LOOP_3:                             ;Burada iki durum oldu�u i�in �arpma i�lemine her bir say� i�in �zellikle bak�l�r.
load r9,0 ;Ge�ici De�er
load rA,0 ;Ge�ici counter
addi r3,r3,r2 ;5.4.3.2....(2)
move r0,r5
jmpeq r3=r0,Finish_5
geri3: addi rA,rA,r5
addi r9,r9,r7
move r0,r3	
jmpeq rA=r0,Finish
jmp geri3

Finish_1:	  ;0! fakt�riyel i�in
addi r0,r0,r5
move r2,r0
load r3,$30
addi r3,r3,r2
move rf,r3
halt
Finish_2 : 	  ;1! fakt�riyel i�in
move r2,r5
load r3,$30  ;Hexadecimal de�erinde  say�lar� bast�rmak i�in $30 eklenir
addi rf,r2,r3   ;$30+1
halt
Finish_3:	  ;2! fakt�riyel i�in
jmpeq r1=r0,ileri
jmp geri

ileri:

load r3,$30
addi r3,r2,r3  ;$30+2
move  rf,r3
halt
Finish_4:	  ;3! fakt�riyel i�in
load r3,$30   ;Ekrana basmak i�in $30 r3 register'�na at�l�r
move r2,r6   
addi rf,r2,r3 ;$30+6
halt
Finish_5: 	  ;4! fakt�riyel i�in �zel durum 2-4 E�er sonu� $18 ise
load r3,$30
move r2,r7	  
load r4,2
addi  rf,r3,r4 ;�lk �nce 2 bas�l�r 
addi r4,r4,r4
addi rf,r4,r3  ;4 bas�l�r.
halt
Finish: 	  ;5! fakt�riyel i�in �zel bir durum kullan�l�r  1-2-0 E�er sonu� $78 ise
move r2,r9
load r4,1   
load r5,$ff
load r6,$30
addi rf,r4,r6 ;�lk �nce 1 bas�l�r
addi r4,r4,r4 ;Daha sonra 2 elde edilir 
addi rf,r4,r6 ;2 bas�l�r
load r4,1	  ;0 basmak i�in r4 e tekrar 1 at�l�r
addi r4,r4,r5 ;1-1=0 dan 

addi rf,r4,r6 ;
halt
