; Polinom Carpmasi
; x+x2
;1+x
;Result x+x2+x2+x3 = x + 2x2 + x3
;isimiz katsayilarla x ler hayali
;Xlerin Derecesi 0 1 2 3 4
; yani soncumuz 0 1 2 1 seklinde saklanmali 
DRIVER:	
	load r1,0x60
	load r2,3
	load r3,0x70
	load r4,3
	load r5,0x80
	
START:
	load rc,1 ;counter
	
	load r9,1
	load r7,0 ; total
	move rd,r1
LOOP_NEXT:
load r8,1 ; counter
	
load r7,0
load r0,0

load r6,[r1]
load ra,[r3]
;e�er �arpan�m�z 0 ise sonu� belli oldu�undan direk store k�sm�na gidiyoruz.
jmpEQ ra=r0,LOOP_STORE
move r0,ra

LOOP_CROSS_ACTION:
;�arpma ileminin yap�ld��� k�s�m
;r7 de toplam tutuluyor �arpma i�lemin sonucu

		addi r7,r7,r6
		addi r8,r8,r9
		jmple r8<=r0,LOOP_CROSS_ACTION
	
		
LOOP_STORE:
;�arpman�n sonucu veya �arpan 0 ise adrese saklan�yor
	move r0,r2  ; birinci dizinin size n�n loop �art�na atanmas�
	addi r0,r0,r9

		store r7,[r5]
		addi r5,r5,r9
		addi rc,rc,r9
		addi r1,r1,r9
		jmple rc<=r0,LOOP_NEXT
;2. dizinin 1. say�s�yla 1. dizinin b�t�n elemanlar� �arp�p storelad�k.
;burdada 2. dizinin	eleman�n� 1 artt�tr�p 1. dizinin elemanlar�yla �arp�lmas� i�in gereken ad�mlar�
;uyguloruz. 
	move r0,r4
	addi r0,r0,r9

	move r1,rd
	addi r0,r0,r3
	addi r3,r3,r9
	load rc,1
	jmple r3<=r0,LOOP_NEXT


FIND_DEGREE_CROSS_POLNYMAL:
		addi r1,r2,r4




halt




org 0x60
db 0,1,1

org 0x70
db 1,1
