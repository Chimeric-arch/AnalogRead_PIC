
_main:

;Conversao_AD.c,19 :: 		void main()
;Conversao_AD.c,23 :: 		while(1)
L_main0:
;Conversao_AD.c,35 :: 		}
	GOTO       L_main0
;Conversao_AD.c,36 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_AD_init:

;Conversao_AD.c,40 :: 		void AD_init()
;Conversao_AD.c,42 :: 		unsigned short clk = Clock_MHz();
	MOVLW      20
	MOVWF      AD_init_clk_L0+0
;Conversao_AD.c,43 :: 		if (clk < 0x01)
	MOVLW      1
	SUBWF      AD_init_clk_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_AD_init2
;Conversao_AD.c,45 :: 		ADCON0.ADCS0 = 0x00;
	BCF        ADCON0+0, 6
;Conversao_AD.c,46 :: 		ADCON0.ADCS1 = 0x00;
	BCF        ADCON0+0, 7
;Conversao_AD.c,47 :: 		ADCON1.ADCS2 = 0x00;
	BCF        ADCON1+0, 6
;Conversao_AD.c,48 :: 		}
	GOTO       L_AD_init3
L_AD_init2:
;Conversao_AD.c,49 :: 		else if (clk  > 0x01 && clk <= 0x02)
	MOVF       AD_init_clk_L0+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L_AD_init6
	MOVF       AD_init_clk_L0+0, 0
	SUBLW      2
	BTFSS      STATUS+0, 0
	GOTO       L_AD_init6
L__AD_init36:
;Conversao_AD.c,51 :: 		ADCON0.ADCS0 = 0x00;
	BCF        ADCON0+0, 6
;Conversao_AD.c,52 :: 		ADCON0.ADCS1 = 0x00;
	BCF        ADCON0+0, 7
;Conversao_AD.c,53 :: 		ADCON1.ADCS2 = 0x01;
	BSF        ADCON1+0, 6
;Conversao_AD.c,54 :: 		}
	GOTO       L_AD_init7
L_AD_init6:
;Conversao_AD.c,55 :: 		else if (clk  > 0x02 && clk <= 0x05)
	MOVF       AD_init_clk_L0+0, 0
	SUBLW      2
	BTFSC      STATUS+0, 0
	GOTO       L_AD_init10
	MOVF       AD_init_clk_L0+0, 0
	SUBLW      5
	BTFSS      STATUS+0, 0
	GOTO       L_AD_init10
L__AD_init35:
;Conversao_AD.c,57 :: 		ADCON0.ADCS0 = 0x01;
	BSF        ADCON0+0, 6
;Conversao_AD.c,58 :: 		ADCON0.ADCS1 = 0x00;
	BCF        ADCON0+0, 7
;Conversao_AD.c,59 :: 		ADCON1.ADCS2 = 0x00;
	BCF        ADCON1+0, 6
;Conversao_AD.c,60 :: 		}
	GOTO       L_AD_init11
L_AD_init10:
;Conversao_AD.c,61 :: 		else if (clk  > 0x05 && clk <= 0x0A)
	MOVF       AD_init_clk_L0+0, 0
	SUBLW      5
	BTFSC      STATUS+0, 0
	GOTO       L_AD_init14
	MOVF       AD_init_clk_L0+0, 0
	SUBLW      10
	BTFSS      STATUS+0, 0
	GOTO       L_AD_init14
L__AD_init34:
;Conversao_AD.c,63 :: 		ADCON0.ADCS0 = 0x01;
	BSF        ADCON0+0, 6
;Conversao_AD.c,64 :: 		ADCON0.ADCS1 = 0x00;
	BCF        ADCON0+0, 7
;Conversao_AD.c,65 :: 		ADCON1.ADCS2 = 0x01;
	BSF        ADCON1+0, 6
;Conversao_AD.c,66 :: 		}
	GOTO       L_AD_init15
L_AD_init14:
;Conversao_AD.c,67 :: 		else if (clk  > 0x0A && clk < 0x14)
	MOVF       AD_init_clk_L0+0, 0
	SUBLW      10
	BTFSC      STATUS+0, 0
	GOTO       L_AD_init18
	MOVLW      20
	SUBWF      AD_init_clk_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_AD_init18
L__AD_init33:
;Conversao_AD.c,69 :: 		ADCON0.ADCS0 = 0x00;
	BCF        ADCON0+0, 6
;Conversao_AD.c,70 :: 		ADCON0.ADCS1 = 0x01;
	BSF        ADCON0+0, 7
;Conversao_AD.c,71 :: 		ADCON1.ADCS2 = 0x01;
	BSF        ADCON1+0, 6
;Conversao_AD.c,72 :: 		}
L_AD_init18:
L_AD_init15:
L_AD_init11:
L_AD_init7:
L_AD_init3:
;Conversao_AD.c,73 :: 		ADCON1.ADFM = 0x01;
	BSF        ADCON1+0, 7
;Conversao_AD.c,74 :: 		ADCON1.PCFG0= 0x00;
	BCF        ADCON1+0, 0
;Conversao_AD.c,75 :: 		ADCON1.PCFG1= 0x00;
	BCF        ADCON1+0, 1
;Conversao_AD.c,76 :: 		ADCON1.PCFG2= 0x00;
	BCF        ADCON1+0, 2
;Conversao_AD.c,77 :: 		ADCON1.PCFG3= 0x00;
	BCF        ADCON1+0, 3
;Conversao_AD.c,78 :: 		}
L_end_AD_init:
	RETURN
; end of _AD_init

_analogRead:

;Conversao_AD.c,83 :: 		int analogRead(unsigned char pinAD)
;Conversao_AD.c,86 :: 		switch (pinAD)
	GOTO       L_analogRead19
;Conversao_AD.c,88 :: 		case 0:
L_analogRead21:
;Conversao_AD.c,89 :: 		ADCON0.CHS0 = 0x00;
	BCF        ADCON0+0, 3
;Conversao_AD.c,90 :: 		ADCON0.CHS1 = 0x00;
	BCF        ADCON0+0, 4
;Conversao_AD.c,91 :: 		ADCON0.CHS2 = 0x00;
	BCF        ADCON0+0, 5
;Conversao_AD.c,92 :: 		break;
	GOTO       L_analogRead20
;Conversao_AD.c,94 :: 		case 1:
L_analogRead22:
;Conversao_AD.c,95 :: 		ADCON0.CHS0 = 0x01;
	BSF        ADCON0+0, 3
;Conversao_AD.c,96 :: 		ADCON0.CHS1 = 0x00;
	BCF        ADCON0+0, 4
;Conversao_AD.c,97 :: 		ADCON0.CHS2 = 0x00;
	BCF        ADCON0+0, 5
;Conversao_AD.c,98 :: 		break;
	GOTO       L_analogRead20
;Conversao_AD.c,100 :: 		case 2:
L_analogRead23:
;Conversao_AD.c,101 :: 		ADCON0.CHS0 = 0x00;
	BCF        ADCON0+0, 3
;Conversao_AD.c,102 :: 		ADCON0.CHS1 = 0x01;
	BSF        ADCON0+0, 4
;Conversao_AD.c,103 :: 		ADCON0.CHS2 = 0x00;
	BCF        ADCON0+0, 5
;Conversao_AD.c,104 :: 		break;
	GOTO       L_analogRead20
;Conversao_AD.c,106 :: 		case 3:
L_analogRead24:
;Conversao_AD.c,107 :: 		ADCON0.CHS0 = 0x01;
	BSF        ADCON0+0, 3
;Conversao_AD.c,108 :: 		ADCON0.CHS1 = 0x01;
	BSF        ADCON0+0, 4
;Conversao_AD.c,109 :: 		ADCON0.CHS2 = 0x00;
	BCF        ADCON0+0, 5
;Conversao_AD.c,110 :: 		break;
	GOTO       L_analogRead20
;Conversao_AD.c,112 :: 		case 4:
L_analogRead25:
;Conversao_AD.c,113 :: 		ADCON0.CHS0 = 0x00;
	BCF        ADCON0+0, 3
;Conversao_AD.c,114 :: 		ADCON0.CHS1 = 0x00;
	BCF        ADCON0+0, 4
;Conversao_AD.c,115 :: 		ADCON0.CHS2 = 0x01;
	BSF        ADCON0+0, 5
;Conversao_AD.c,116 :: 		break;
	GOTO       L_analogRead20
;Conversao_AD.c,118 :: 		case 5:
L_analogRead26:
;Conversao_AD.c,119 :: 		ADCON0.CHS0 = 0x01;
	BSF        ADCON0+0, 3
;Conversao_AD.c,120 :: 		ADCON0.CHS1 = 0x00;
	BCF        ADCON0+0, 4
;Conversao_AD.c,121 :: 		ADCON0.CHS2 = 0x01;
	BSF        ADCON0+0, 5
;Conversao_AD.c,122 :: 		break;
	GOTO       L_analogRead20
;Conversao_AD.c,124 :: 		case 6:
L_analogRead27:
;Conversao_AD.c,125 :: 		ADCON0.CHS0 = 0x00;
	BCF        ADCON0+0, 3
;Conversao_AD.c,126 :: 		ADCON0.CHS1 = 0x01;
	BSF        ADCON0+0, 4
;Conversao_AD.c,127 :: 		ADCON0.CHS2 = 0x01;
	BSF        ADCON0+0, 5
;Conversao_AD.c,128 :: 		break;
	GOTO       L_analogRead20
;Conversao_AD.c,130 :: 		case 7:
L_analogRead28:
;Conversao_AD.c,131 :: 		ADCON0.CHS0 = 0x01;
	BSF        ADCON0+0, 3
;Conversao_AD.c,132 :: 		ADCON0.CHS1 = 0x01;
	BSF        ADCON0+0, 4
;Conversao_AD.c,133 :: 		ADCON0.CHS2 = 0x01;
	BSF        ADCON0+0, 5
;Conversao_AD.c,134 :: 		break;
	GOTO       L_analogRead20
;Conversao_AD.c,135 :: 		}
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
;Conversao_AD.c,136 :: 		ADCON0.ADON = 0x01;
	BSF        ADCON0+0, 0
;Conversao_AD.c,137 :: 		delay_us (0x14);
	MOVLW      33
	MOVWF      R13+0
L_analogRead29:
	DECFSZ     R13+0, 1
	GOTO       L_analogRead29
;Conversao_AD.c,138 :: 		ADCON0.GO_NOT_DONE = 0x01;
	BSF        ADCON0+0, 2
;Conversao_AD.c,139 :: 		while (ADCON0.GO_NOT_DONE);
L_analogRead30:
	BTFSS      ADCON0+0, 2
	GOTO       L_analogRead31
	GOTO       L_analogRead30
L_analogRead31:
;Conversao_AD.c,140 :: 		resultAD = (ADRESH << 0x08) + (ADRESL >> 0x00);
	MOVF       ADRESH+0, 0
	MOVWF      R2+1
	CLRF       R2+0
	MOVF       ADRESL+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDWF      R2+0, 1
	BTFSC      STATUS+0, 0
	INCF       R2+1, 1
;Conversao_AD.c,141 :: 		delay_us (0x14);
	MOVLW      33
	MOVWF      R13+0
L_analogRead32:
	DECFSZ     R13+0, 1
	GOTO       L_analogRead32
;Conversao_AD.c,142 :: 		ADCON0.ADON = 0x00;
	BCF        ADCON0+0, 0
;Conversao_AD.c,143 :: 		return (resultAD);
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R2+1, 0
	MOVWF      R0+1
;Conversao_AD.c,144 :: 		}
L_end_analogRead:
	RETURN
; end of _analogRead
