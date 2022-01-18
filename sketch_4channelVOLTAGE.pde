import processing.serial.*;
Serial myPort;
PFont fnt;
int xPos;
int oldXpos=30;
int oldxtint;
int dx=30;

int xPos2;
int oldXpos2=30;
int oldxtint2;
int dx2=30;

int xPos3;
int oldXpos3=30;
int oldxtint3;
int dx3=30;

int xPos4;
int oldXpos4=30;
float oldxtint4;
int dx4=30;
int latitude=1260;


void init_graph() {
  background(255, 255, 255);
  stroke(0);
  line(30, 640, 1260, 640);
  line(30, 760, 30, 10);
   stroke(0,250,250);
  line(30,760,30,640);
  stroke(0,250,0);
  line(30,760,1260,760);
  textSize(12);
  fill(50,250,250);
  stroke(220,220,220);
 // 
 for ( int i=0; i<121; i++ ) { 
    text( ( i*2), 30+20*i, 750 );
    line(30+10*i,40,30+10*i,760);
    line(30,640-12*i,1260,640-12*i);
  }
  stroke(0,250,0);
  line(30,700,1260,700);
  for ( int i=0; i<121; i++ ) { 
    text( ( i*2), 30+20*i, 710 ); 
  }
 stroke(0,250,0);
  line(30,580,1260,580);
  for ( int i=0; i<121; i++ ) { 
    text( ( i*2), 30+20*i, 590 ); 
 //   text ("|", 30+30*i, 580);
  }
  stroke(0,250,0);
  line(30,520,1260,520);
  for ( int i=0; i<121; i++ ) { 
    text( ( i*2), 30+20*i, 530 ); 
  //  text ("|", 30+30*i, 520);
  }
  stroke(220,220,220);
  line(30,460,1260,460);
  fill(150,150,150);
  for ( int i=0; i<121; i++ ) { 
    text( ( i*2), 30+20*i, 470 ); 
  //  text ("|", 30+30*i, 460);
  }
  stroke(220,220,220);
  line(30,400,1260,400);
  fill(150,150,150);
  for ( int i=0; i<121; i++ ) { 
    text( ( i*2), 30+20*i, 410 ); 
  //  text ("|", 30+30*i, 400);
  }
  textSize(14);                  //textSize(14);///////////////////////////////////////////////
  fill(40);
 
  for ( int i=0; i<11; i++ ) { 
    text( ( i*10), 30, 640-60*i );
  }
  textSize(11);
  for ( int i=0; i<121; i++ ) { 
    text( ( i*2), 30+20*i, 650 ); 
  //  text ("|", 30+30*i, 640);
  }
  
  fill(0,250,250);
  for ( int i=0; i<3; i++ ) { 
    text( (-i*10), 30, 640+60*i );
  }
  textSize(16);
  fill(0,0,0);
  text(" [Y]-A2 (dVOLT) ", 31, 30);
  fill(250,0,0);
  text(" [Y]-A3 (dVOLT) ", 41, 44);
  text(" [X]-TIME (SEC) ", 1080, 630);
  fill(0,100,0);
  text(" [Y]-A4 (dVOLT)",42,300);
  fill(0,0,250);
  text("[Y]-A5 (dVOLT)",42,350);
}   
  

void setup()
{
  
 size(1260,760);
 init_graph();
 xPos=dx;
 xPos2=dx2;
 xPos3=dx3;
 xPos4=dx4;
   fnt = createFont("Arial", 16, true);
 myPort=new Serial(this,"COM65",9600);     //58 //11
}
void draw()

{
  
  int ixt=0,n=0;
  int ixt2=0,n2=0;
  int ixt3=0,n3=0;
  int ixt4=0,n4=0;
 //println("aaaa");
  String inString=myPort.readStringUntil('\n');
  if(inString!=null){
  String oldinString=""; 
  if (inString!=oldinString)
  {
    fill(255);
    rect(240,20,195,20);
    fill(0);
    stroke(0,0,0);
     text(inString,250,36);
     oldinString=inString;
     fill(0);//
     text("ΝΕΚΤΑΡΙΟΣ ΚΟΥΡΑΚΗΣ",3,730);
  } 
 
 
  String[] motors=splitTokens(inString,",");
  print(inString);
  String[] num=splitTokens(motors[0],".");
   n=Integer.parseInt(num[0]);
   ixt=(n*3); //maybe * up
   println(n);
   stroke(0,0,0);
   smooth();
  line(oldXpos,640-2*oldxtint,xPos,640-2*ixt);
  
  oldXpos=xPos;
  oldxtint=ixt;
  if (xPos >= width-dx)
  { xPos = dx;
    oldXpos=30;
    save("lineWIDTH.png");
    init_graph();
  }
  else { xPos+=10; }
  
  
  String[] num2=splitTokens(motors[1],".");
   n2=Integer.parseInt(num2[0]);
   ixt2=(n2*3); //maybe * up
   println(n2);
   stroke(250,0,0);
   smooth();
  // line(oldXpos2,640-2*oldxtint2,xPos2,640-2*ixt2);
   line(oldXpos2,640-2*oldxtint2,xPos2,640-2*ixt2);
    oldXpos2=xPos2;
    oldxtint2=ixt2;
  if (xPos2 >= width-dx2)
  { xPos2 = dx2;
    oldXpos2=30;  
  }
  else { xPos2+=10; }
  
  String[] num3=splitTokens(motors[2],".");
   n3=Integer.parseInt(num3[0]);
   ixt3=(n3*3); //maybe * up
   println(n3);
   stroke(0,100,0);
   smooth();
   line(oldXpos3,640-2*oldxtint3,xPos3,640-2*ixt3);
    oldXpos3=xPos3;
    oldxtint3=ixt3;
  if (xPos3 >= width-dx3)
  { xPos3 = dx3;
    oldXpos3=30;  
  }
  else { xPos3+=10; }
  
  String[] num4=splitTokens(motors[3],".");
   n4=Integer.parseInt(num4[0]);
   ixt4=(n4*3); //maybe * up
   println(n4);
   stroke(0,0,250);
   smooth();
   line(oldXpos4,640-2*oldxtint4,xPos4,640-2*ixt4);
    oldXpos4=xPos4;
    oldxtint4=ixt4;
  if (xPos4 >= width-dx4)
  { xPos4 = dx4;
    oldXpos4=30;  
  }
  else { xPos4+=10; } 
}
saveFrame("output/TEST_####.PNG"); ////////////////////////////////////
}

void mousePressed() {
  save("line.png");
 init_graph();
}
