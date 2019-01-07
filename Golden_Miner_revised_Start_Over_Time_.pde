// global variables:
PImage[]miners=new PImage[9];
int index=0;
float w=30;
float h=25;
float x,y,a,b,c,speedx,speedy,distance1,distance2,distance3;
PImage miner;//cread an image object
PImage gold;
PImage diamond;
PImage tnt;
PImage underground;
float speedx1 =0.5;
float speedy1 =2.4;
float speedx2 =1;
float speedy2 =3;
float speedx3 =0.7;
float speedy3 =1;
float xM1 =100;
float yM1 =200;
float xM2 =100;
float yM2 =500;
float xM3 =300;
float yM3 =400;
float s=0;
boolean overBtn=false,isClick=false;
// start btn width height
int wBtn=130,wText=300,hBtn=40,hText=40;
// start btn x y
float xBtn,yBtn;
float xText,yText;
boolean score=false;
boolean score1=false;
boolean score2=false;
boolean countB=false;
boolean gameOver=false;
int count = 120;
int cCounter = 0;
import processing.sound.*;
SoundFile mySound;
// setup:
int counter = 0;
int counter1 = 0;
int counter2 = 0;
// setup
void setup()
{
  size(600,600);
for(int i=0;i<miners.length;i++){
  miners[i] = loadImage("Miner"+(i+1)+".png");
}
miner=miners[index];
frameRate(20);
  xBtn=(width-wBtn)/2.0;
  yBtn=(height-hBtn)/2.0;
  xText=(width-wText)/2.0;
  yText=(height-hText)/2.0;
  mySound=new SoundFile(this, "music.wav");
  mySound.play();
 
  gold=loadImage("gold.png");
  diamond=loadImage("diamond.png");
  tnt=loadImage("TNT.png");
  underground=loadImage("underground.png");
  imageMode(CENTER);
}

// draw:

void draw(){
background(underground);
 if(gameOver){
   fill(255);
   textSize(24);
   //text("Start Game",xBtn,yBtn,wBtn,hBtn);
   text("Game Over! Score:"+s,xText,yText,wText,hText);
   count=120;
 }else{
 if(index==0){
    for(int i = 0;i<miners.length;i++)
    {
      index=i;
    }
  }
 if(index==miners.length-1){
     for(int i = index;i>=0;i--)
    {
      index=i;
    }
 }
 tint(a, b, c, 255);
 a=255;
 b=255;
 c=255;
   image(miners[index],x,y,w,h);
   startBtn();
   miner();
   monsters();
   BOUNCECHECK();
   change();
   KEYLOGIC();
 }
  
  textAlign(RIGHT,TOP);
  fill(255);
  textSize(14);
  text("Score: "+s, 562  ,10);
  textAlign(CENTER,TOP);
  fill(255);
  textSize(14);
  text("Time: "+count,529,30);
  textAlign(CENTER,TOP);
  if(count==0){
    gameOver=true;
  }
  if(isClick){
    trackpoints();
  }
 
  if (mouseX > xBtn-wBtn && mouseX < xBtn+wBtn &&
      mouseY > yBtn-hBtn && mouseY < yBtn+hBtn) {
    overBtn = false;
  }else{
    overBtn = true;  
  }
}
void startBtn(){
  fill(255,0,0);
  textSize(24);
text("Start Game",xBtn,yBtn,wBtn,hBtn);
}
void mousePressed() {
  if(!overBtn) {
    wBtn=0;
    hBtn=0;
    isClick=true;
  }
}
void miner(){


if (index<miners.length){
index++;
}else{
index=0;
}
}

void KEYLOGIC(){
 x=constrain(x,0,600);
 y=constrain(y,0,600);
  if (keyPressed==true){
    if(keyCode==UP){
      y=y-5;}
      
    if(keyCode==DOWN){
      y=y+5;}
      
    if(keyCode==LEFT){
      x=x-5;}
      
    if(keyCode==RIGHT){
      x=x+5;}
  }
}

void monsters(){
  tint(255);
  gold();
  diamond();
  tnt();
 
  image(gold,xM1,yM1,100,100);
  image(diamond,xM2,yM2,50,55);
  image(tnt,xM3,yM3,50,55);
}
void gold(){
 xM1+=speedx1;
  yM1+=speedy1;
   if ((xM1<0)&(xM1>width))
 {
 speedx1 *= -1;}
  if ((yM1<0)||(yM1>height))
  {
 speedy1 *= -1;}
 }
 
 void diamond(){
   xM2+=speedx2;
  yM2+=speedy2;
   if ((xM2<0)&(xM2>width))
 {
 speedx1 *=-1;}
  if ((yM1<0)||(yM1>height))
  {
 speedy2 *= -1;}
 }
  void tnt(){
     xM3+=speedx3;
  yM3+=speedy3;
   if ((xM1<0)&(xM1>width))
 {
 speedx3 *= -1;}
  if ((yM1<0)||(yM1>height))
  {
 speedy3 *= -1;}
 }
    

void BOUNCECHECK(){

  xM1=xM1+speedx1;
  yM1=yM1+speedy1;

      if ((xM1<0)||(xM1>width))
  {
  speedx1=speedx1*-1;}
 
      if ((yM1<0)||(yM1>height))
  {
  speedy1=speedy1*-1;}
 
 
  xM2=xM2+speedx2;
  yM2=yM2+speedy2;

      if ((xM2<0)||(xM2>width))
  {
  speedx2=speedx2*-1;}
 
      if ((yM2<0)||(yM2>height))
  {
  speedy2=speedy2*-1;}
 
 
 
  xM3=xM3+speedx3;
  yM3=yM3+speedy3;

      if ((xM3<0)||(xM3>width))
  {
  speedx3=speedx3*-1;}
 
      if ((yM3<0)||(yM3>height))
  {
  speedy3=speedy3*-1;}
}
void trackpoints(){
  distance1=dist(x,y,xM1,yM1);
  distance2=dist(x,y,xM2,yM2);
  distance3=dist(x,y,xM3,yM3);
    //count
    cCounter++;
    if(cCounter==60){
      count--;
      cCounter = 0;
    }
    //gold
  if(distance1<50 && score==false){
      s += 1;
      score = true;
  }
  if(score){
  counter++;
   if(counter>45){ 
   score = false; 
   counter=0;
 }
 }
  //diamond
  if(distance2<50 && score1==false){
     s += 5;
     score1 = true;
  }
  if(score1){
    counter1 += 1;
    if(counter1>45){
      score1=false;
      counter1=0;
    }
  }
    //tnt
  if(distance3<50 && score2==false){
     s -= 3;
     score2 = true;
  }
  if(score2){
    counter2 += 1;
    if(counter2>45){
    score2=false;
    counter2=0;
    }
  }
}
  //change
void change(){
  distance1=dist(x,y,xM1,yM1);
  distance2=dist(x,y,xM2,yM2);
  distance3=dist(x,y,xM3,yM3);
    //gold
  if(distance1<50){
      a=0;
      b=0;
      c=255;
  }
  //diamond
  if(distance2<50){
        a=255;
      b=255;
      c=105;
  }
    //tnt
  if(distance3<50){
    a=255;
    b=0;
    c=0;
  }
  }
