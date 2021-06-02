/*
        Conversão AD
        Daniel Gier Arndt
        MCU - PIC16F877A
        25/02/21
*/

// Definições

// Protótipo de funções
void AD_init();
int analogRead(unsigned char pinAD);

// Variáveis globais


//============================================================================//
//============================================================================//
void main() 
{
  //AD_init();

  while(1)
  {
  /*
    analogRead(0);
    analogRead(1);
    analogRead(2);
    analogRead(3);
    analogRead(4);
    analogRead(5);
    analogRead(6);
    analogRead(7);
  */
  }
}

//============================================================================//
//============================================================================//
void AD_init()
{
  unsigned short clk = Clock_MHz();
  if (clk < 0x01)
  {
    ADCON0.ADCS0 = 0x00;
    ADCON0.ADCS1 = 0x00;
    ADCON1.ADCS2 = 0x00;
  }
  else if (clk  > 0x01 && clk <= 0x02)
  {
    ADCON0.ADCS0 = 0x00;
    ADCON0.ADCS1 = 0x00;
    ADCON1.ADCS2 = 0x01;
  }
  else if (clk  > 0x02 && clk <= 0x05)
  {
    ADCON0.ADCS0 = 0x01;
    ADCON0.ADCS1 = 0x00;
    ADCON1.ADCS2 = 0x00;
  }
  else if (clk  > 0x05 && clk <= 0x0A)
  {
    ADCON0.ADCS0 = 0x01;
    ADCON0.ADCS1 = 0x00;
    ADCON1.ADCS2 = 0x01;
  }
  else if (clk  > 0x0A && clk < 0x14)
  {
    ADCON0.ADCS0 = 0x00;
    ADCON0.ADCS1 = 0x01;
    ADCON1.ADCS2 = 0x01;
  }
  ADCON1.ADFM = 0x01;
  ADCON1.PCFG0= 0x00;
  ADCON1.PCFG1= 0x00;
  ADCON1.PCFG2= 0x00;
  ADCON1.PCFG3= 0x00;
}


//============================================================================//
//============================================================================//
int analogRead(unsigned char pinAD)
{
  int resultAD;
  switch (pinAD)
  {
    case 0: 
      ADCON0.CHS0 = 0x00;
      ADCON0.CHS1 = 0x00;
      ADCON0.CHS2 = 0x00;
    break;

    case 1:
      ADCON0.CHS0 = 0x01;
      ADCON0.CHS1 = 0x00;
      ADCON0.CHS2 = 0x00;
    break;
    
    case 2:
      ADCON0.CHS0 = 0x00;
      ADCON0.CHS1 = 0x01;
      ADCON0.CHS2 = 0x00;
    break;
    
    case 3:
      ADCON0.CHS0 = 0x01;
      ADCON0.CHS1 = 0x01;
      ADCON0.CHS2 = 0x00;
    break;
    
    case 4:
      ADCON0.CHS0 = 0x00;
      ADCON0.CHS1 = 0x00;
      ADCON0.CHS2 = 0x01;
    break;
    
    case 5:
      ADCON0.CHS0 = 0x01;
      ADCON0.CHS1 = 0x00;
      ADCON0.CHS2 = 0x01;
    break;
    
    case 6:
      ADCON0.CHS0 = 0x00;
      ADCON0.CHS1 = 0x01;
      ADCON0.CHS2 = 0x01;
    break;
    
    case 7:
      ADCON0.CHS0 = 0x01;
      ADCON0.CHS1 = 0x01;
      ADCON0.CHS2 = 0x01;
    break;
  }
  ADCON0.ADON = 0x01;
  delay_us (0x14);
  ADCON0.GO_NOT_DONE = 0x01;
  while (ADCON0.GO_NOT_DONE);
  resultAD = (ADRESH << 0x08) + (ADRESL >> 0x00);
  delay_us (0x14);
  ADCON0.ADON = 0x00;
  return (resultAD);
}