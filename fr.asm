include inout.asm
.model small,c

; this program shall compute (fx)= 3x -2y+5;
;

.486

.STACK   

.data
     
	     x dw 1;
		 y dw 2;
		 sum dw ?
		 msg   db 13,10,"The answer=",13,10,'$';
		 newLine   db 13,10,"$"
		 prmp  db 13,10,"Enter a value?$";
		 
		 
.CODE
; this program shall compute (fx)= 3x -2y+5;
   start:
          mov  cx,@data
		  mov  ds,cx
		  xor  ax,ax  ; zero out  AX register
		  
		  call puts, offset prmp
		  call getint  ;   int getint(void)
		  
		  mov  x,ax
		  call puts, offset prmp
		  call getint  ;   int getint(void)
		 
		  mov  y,ax
		  xor  ax,ax
		  
		  mov  si,offset x     ;  si=&x
		;  mov  ax,x
		;  add  ax,x
		;  add  ax,x
		  mov  ax,[si]   ; ax=p or   ax=*p
		  add  ax,[si]
		  add  ax,[si]
		  
		  mov  di, offset y    ; di=&y
		 ; mov  bx,y
		 ; add  bx,bx
		  mov    bx,[di]
		  add    bx,[di]  ; bx=bx+*di
		  sub   ax,bx
		  add   ax,5
		  
		  mov    bx,offset sum
		  mov   [bx],ax
		  
		  ; int *p;
		  ;int x;
		  ;  p =&x;
		  call  puts, offset newline
		  call  puts, offset newline
		  call  puts,offset msg     ; void puts(char *s)   &
		  call  endl
		  call  putint, word ptr [bx] ; (int *)p  ; void putw(int)
		  call  endl
		  
		  
		  mov  ah,04ch
		  xor  al,al   ;  mov al ,0
		  
		  int   21h
		  
		  END   start
		  
		  
		  
		  
		  
		  
