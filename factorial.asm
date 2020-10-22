;////////////////////////////////////////////////////////////////////////////////////////////////
;/   					CSE 107 HW3 ÝBRAHÝM ÇETÝNKAYA 		   			/
;/							121044072			       		/
;////////////////////////////////////////////////////////////////////////////////////////////////


;Döngüye sokmadan önce iþlemin bitip bitmediðini kontrol eder
;Örneðin 2.1 ise 1 geldiðinde direk Finish döngülerine girer.
;Her bir deðer deðiþçeði için Geçici deðer ve Geçici counter tutulur
;***Main Memory çok dolu olduðundan her iþlem bitiminde clear edilmelidir
Ekran:
load rb,text                                      ;Metni Ekrana yazdýrmak için rb ye text  atanýr.
load rc,1						  	  ;Bir sonraki harfi arttýrmak için
load rd,0							    
nextchar:load rf,[rb]					  ;Bir sonraki harfi basar
	addi rb,rb,rc					  ;Harfi deðiþtirir Fa.. Fac... Fact...
	load rE,5
	jmpeq rf=r0,MAIN_LOOP
	jmp nextchar
text:
        db 10
	  db      "created by",10
         db      "Ibrahim Cetinkaya",10
         db      "Factorial is "                ;Alt satýra geçmesin diye 10 komutu eklemedim 
         db      0          
MAIN_LOOP:
load r1,5					 ; FAKTÖRÝYELÝ ALINACAK SAYI
load r2,0xff			       ;-1 Bir azaltmak için 5x4x3...
load r5,1					 ;Arttýrmak için 
START_LOOP:
load r0,0
jmpeq r1=r0,Finish_1   			 ;Eðer 0! faktoriyel ise Döngüye girmez direk Finish_1 e zýplar.  0=0 durumu ise
load r0,1 
jmpeq r1=r0,Finish_2			 ;Eðer 1! faktöriyel ise döngüye girmez direk Finish_2 e zýplar  1=1 durumu ise
LOOP_1:
load r4,0					 ;Program counter
load r6,0					 ;Geçici Deðer
addi r3,r1,r2 				 ;4 olmasý için 5.4....(4)
move r0,r5
jmpeq r3=r0,Finish_3			 ;2! Faktöriyeli buldurmak için sistemi sona götürüp tekrar getirilir R0 1 olduðundan Finish_3 döngüsüne sokulur.
geri:
	 addi r4,r4,r5			
	addi r6,r6,r3
	move r0,r1
	jmpeq r4=r0,LOOP_2		;Çarpma iþlemini bitirdikten sonra diðer iþleme girer 5x4 =20 ise LOOP_2 atla
	jmp geri
LOOP_2:
load r7,0 					;Geçici deðer   
load r8,0 					;Geçici counter

addi r3,r3,r2 ;5.4.3....(3)		;Her zaman denetler 1 gelip gelmediðini 5.4.3
move r0,r8
jmpeq r3=r0,Finish_4



move r0,r5
jmpeq r3=r0,Finish_4
geri2: addi r7,r7,r6           
	 addi r8,r8,r5	
	 move r0,r3
	 jmpeq r8=r0,LOOP_3		;Çarpma iþlemini bitirdikten sonra diðer iþleme girer 20x3=60 ise LOOP_3 atla
	 jmp geri2
LOOP_3:                             ;Burada iki durum olduðu için çarpma iþlemine her bir sayý için özellikle bakýlýr.
load r9,0 ;Geçici Deðer
load rA,0 ;Geçici counter
addi r3,r3,r2 ;5.4.3.2....(2)
move r0,r5
jmpeq r3=r0,Finish_5
geri3: addi rA,rA,r5
addi r9,r9,r7
move r0,r3	
jmpeq rA=r0,Finish
jmp geri3

Finish_1:	  ;0! faktöriyel için
addi r0,r0,r5
move r2,r0
load r3,$30
addi r3,r3,r2
move rf,r3
halt
Finish_2 : 	  ;1! faktöriyel için
move r2,r5
load r3,$30  ;Hexadecimal deðerinde  sayýlarý bastýrmak için $30 eklenir
addi rf,r2,r3   ;$30+1
halt
Finish_3:	  ;2! faktöriyel için
jmpeq r1=r0,ileri
jmp geri

ileri:

load r3,$30
addi r3,r2,r3  ;$30+2
move  rf,r3
halt
Finish_4:	  ;3! faktöriyel için
load r3,$30   ;Ekrana basmak için $30 r3 register'ýna atýlýr
move r2,r6   
addi rf,r2,r3 ;$30+6
halt
Finish_5: 	  ;4! faktöriyel için özel durum 2-4 Eðer sonuç $18 ise
load r3,$30
move r2,r7	  
load r4,2
addi  rf,r3,r4 ;Ýlk önce 2 basýlýr 
addi r4,r4,r4
addi rf,r4,r3  ;4 basýlýr.
halt
Finish: 	  ;5! faktöriyel için özel bir durum kullanýlýr  1-2-0 Eðer sonuç $78 ise
move r2,r9
load r4,1   
load r5,$ff
load r6,$30
addi rf,r4,r6 ;Ýlk önce 1 basýlýr
addi r4,r4,r4 ;Daha sonra 2 elde edilir 
addi rf,r4,r6 ;2 basýlýr
load r4,1	  ;0 basmak için r4 e tekrar 1 atýlýr
addi r4,r4,r5 ;1-1=0 dan 

addi rf,r4,r6 ;
halt
