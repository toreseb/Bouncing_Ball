
float   ballX             = 1000 ,  ballY             = 500;
float   eyeLeftRelativeX  = -10  ,  eyeLeftRelativeY  = 5  ;
float   eyeRightRelativeX = 10   ,  eyeRightRelativeY = 5  ;   
float   speedX            = 5    ,  speedY            = 6  ;
float   ballSize          = 50   ;
float   eyeSize           = 5    ;
float lineVUX = 0    , lineVUY = 0   ;// koordinaterne for boxen 
float lineHUX = 1920 , lineHUY = 0   ;// U = up, D = Down, V = Venstre, H  = Højre
float lineVDX = 0    , lineVDY = 1080;
float lineHDX = 1920 , lineHDY = 1080;


void setup() {  
  size(1920, 1080);
  frameRate(30);
}


void draw() {                         
  ballX             +=speedX    ; 
  ballY             +=speedY    ;
  if (ballY+speedY>lineHUY+ballSize/2){ // Hvis den kommer uden for boxen, ændre den retning
    speedY = -speedY;
  }
  if (ballX+speedX>lineHDX-ballSize/2){
    speedX = -speedX;
  }
 if (ballY-speedY<lineHDY-ballSize/2){
     speedY = -speedY;
  } 
  if (ballX+speedX<lineVDX+ballSize/2){
    speedX = -speedX;
  } 
  stroke(152);
  lineVUX += 2 ; lineVUY +=1   ;  //selve linjerne der laver boksen. Jeg har valgt at bruge linjer da jeg syntes at de ville være næmmere and ændre på
  lineHUX -= 2 ; lineHUY +=1   ;
  lineVDX += 2 ; lineVDY -=1   ;
  lineHDX -= 2 ; lineHDY -=1   ;
  clear();
  ellipse(ballX, ballY, ballSize, ballSize);
  ellipse(eyeLeftRelativeX + ballX, ballY, eyeSize,eyeSize); 
  ellipse(eyeRightRelativeX + ballX, ballY, eyeSize,eyeSize);
  line(lineVUX,lineVUY,lineHUX,lineHUY);
  line(lineVUX,lineVUY,lineVDX,lineVDY);
  line(lineHUX,lineHUY,lineHDX,lineHDY);
  line(lineVDX,lineVDY,lineHDX,lineHDY);
}
