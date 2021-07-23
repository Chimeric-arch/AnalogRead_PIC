
_main:

L_main0:
	GOTO       L_main0
L_end_main:
	GOTO       $+0

_AD_init:

	MOVLW      20
	MOVWF      AD_init_clk_L0+0
	MOVLW      1
	SUBWF      AD_init_clk_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_AD_init2
	BCF        ADCON0+0, 6
	BCF        ADCON0+0, 7
	BCF        ADCON1+0, 6
	GOTO       L_AD_init3
L_AD_init2:
	MOVF       AD_init_clk_L0+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L_AD_init6
	MOVF       AD_init_clk_L0+0, 0
	SUBLW      2
	BTFSS      STATUS+0, 0
	GOTO       L_AD_init6
L__AD_init36:
	BCF        ADCON0+0, 6
	BCF        ADCON0+0, 7
	BSF        ADCON1+0, 6
	GOTO       L_AD_init7
L_AD_init6:
	MOVF       AD_init_clk_L0+0, 0
	SUBLW      2
	BTFSC      STATUS+0, 0
	GOTO       L_AD_init10
	MOVF       AD_init_clk_L0+0, 0
	SUBLW      5
	BTFSS      STATUS+0, 0
	GOTO       L_AD_init10
L__AD_init35:
	BSF        ADCON0+0, 6
	BCF        ADCON0+0, 7
	BCF        ADCON1+0, 6
	GOTO       L_AD_init11
L_AD_init10:
	MOVF       AD_init_clk_L0+0, 0
	SUBLW      5
	BTFSC      STATUS+0, 0
	GOTO       L_AD_init14
	MOVF       AD_init_clk_L0+0, 0
	SUBLW      10
	BTFSS      STATUS+0, 0
	GOTO       L_AD_init14
L__AD_init34:
	BSF        ADCON0+0, 6
	BCF        ADCON0+0, 7
	BSF        ADCON1+0, 6
	GOTO       L_AD_init15
L_AD_init14:
	MOVF       AD_init_clk_L0+0, 0
	SUBLW      10
	BTFSC      STATUS+0, 0
	GOTO       L_AD_init18
	MOVLW      20
	SUBWF      AD_init_clk_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_AD_init18
L__AD_init33:
	BCF        ADCON0+0, 6
	BSF        ADCON0+0, 7
	BSF        ADCON1+0, 6
L_AD_init18:
L_AD_init15:
L_AD_init11:
L_AD_init7:
L_AD_init3:
	BSF        ADCON1+0, 7
	BCF        ADCON1+0, 0
	BCF        ADCON1+0, 1
	BCF        ADCON1+0, 2
	BCF        ADCON1+0, 3
L_end_AD_init:
	RETURN

_analogRead:
	GOTO       L_analogRead19
L_analogRead21:
	BCF        ADCON0+0, 3
	BCF        ADCON0+0, 4
	BCF        ADCON0+0, 5
	GOTO       L_analogRead20
L_analogRead22:
	BSF        ADCON0+0, 3
	BCF        ADCON0+0, 4
	BCF        ADCON0+0, 5
	GOTO       L_analogRead20
L_analogRead23:
	BCF        ADCON0+0, 3
	BSF        ADCON0+0, 4
	BCF        ADCON0+0, 5
	GOTO       L_analogRead20
L_analogRead24:
	BSF        ADCON0+0, 3
	BSF        ADCON0+0, 4
	BCF        ADCON0+0, 5
	GOTO       L_analogRead20
L_analogRead25:
	BCF        ADCON0+0, 3
	BCF        ADCON0+0, 4
	BSF        ADCON0+0, 5
	GOTO       L_analogRead20
L_analogRead26:
	BSF        ADCON0+0, 3
	BCF        ADCON0+0, 4
	BSF        ADCON0+0, 5
	GOTO       L_analogRead20
L_analogRead27:
	BCF        ADCON0+0, 3
	BSF        ADCON0+0, 4
	BSF        ADCON0+0, 5
	GOTO       L_analogRead20
L_analogRead28:
	BSF        ADCON0+0, 3
	BSF        ADCON0+0, 4
	BSF        ADCON0+0, 5
	GOTO       L_analogRead20
L_analogRead19:
	MOVF       FARG_analogRead_pinAD+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_analogRead21
	MOVF       FARG_analogRead_pinAD+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_analogRead22
	MOVF       FARG_analogRead_pinAD+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_analogRead23
	MOVF       FARG_analogRead_pinAD+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_analogRead24
	MOVF       FARG_analogRead_pinAD+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_analogRead25
	MOVF       FARG_analogRead_pinAD+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_analogRead26
	MOVF       FARG_analogRead_pinAD+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_analogRead27
	MOVF       FARG_analogRead_pinAD+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_analogRead28
L_analogRead20:
	BSF        ADCON0+0, 0
	MOVLW      33
	MOVWF      R13+0
L_analogRead29:
	DECFSZ     R13+0, 1
	GOTO       L_analogRead29
	BSF        ADCON0+0, 2
L_analogRead30:
	BTFSS      ADCON0+0, 2
	GOTO       L_analogRead31
	GOTO       L_analogRead30
L_analogRead31:
	MOVF       ADRESH+0, 0
	MOVWF      R2+1
	CLRF       R2+0
	MOVF       ADRESL+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDWF      R2+0, 1
	BTFSC      STATUS+0, 0
	INCF       R2+1, 1
	MOVLW      33
	MOVWF      R13+0
L_analogRead32:
	DECFSZ     R13+0, 1
	GOTO       L_analogRead32
	BCF        ADCON0+0, 0
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R2+1, 0
	MOVWF      R0+1
L_end_analogRead:
	RETURN
