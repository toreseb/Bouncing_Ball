//Dette skulle være løsningen på "Creature Walk", men der er noget galt!
//
//Opgave 1: Læs programmet med en ven og find ud af hvordan koden fungerer
//Opgave 2: Boldens øjne bevæger sig og forstørres forkert. Det skal rettes
//Opgave 3: Bolden hopper ikke op og ned. Det skal fikses (hint: se ballwalk)
//Opgave 4: Skriv kode-kommentarer, der forklarer dine rettelser og upload til gitHub.
//Opgave 5: Aflever dokument med link på lectio (lectio registrerer ikke en kommentar som aflevering)

float   ballX             = 1000 ,  ballY             = 500;
float   eyeLeftRelativeX  = -10  ,  eyeLeftRelativeY  = 5  ; // Begge eyeLeftRelativeX og eyeRightRelativeX er positiv
float   eyeRightRelativeX = 10   ,  eyeRightRelativeY = 5  ;   
float   speedX            = 10   ,  speedY            = 12 ;
float   ballSize          = 50   ;
float   eyeSize           = 5    ;
float   zoomFactor        = 1;
float ballwalk =  sin(ballX*0.5)*10;  //svingning på +10 til -10 pixels
float lineVUX = 0    , lineVUY = 0   ;
float lineHUX = 1920 , lineHUY = 0   ;
float lineVDX = 0    , lineVDY = 1080;
float lineHDX = 1920 , lineHDY = 1080;

//setup: kører kun en gang ved progam-start
// De to tegn: { } betyder kode scope. Variabler har altid et scope de lever indenfor!
void setup() {  
  size(1920, 1080);
  frameRate(30);
}

//draw: kører default 30  gange per sekund
void draw() {                         
  ballX             +=speedX    ;//flytter min bold 
  ballY             +=speedY    ;
  ballSize          *=zoomFactor; //gør mit bold størrere
  eyeSize           *=zoomFactor;
  eyeRightRelativeX *=zoomFactor;
  eyeRightRelativeY *=zoomFactor;
  eyeLeftRelativeX  *=zoomFactor;
  eyeLeftRelativeY  *=zoomFactor;
  if (ballY+speedY>lineHUY+ballSize/2){
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
  lineVUX += 1 ; lineVUY +=1   ;
  lineHUX -= 1 ; lineHUY +=1   ;
  lineVDX += 1 ; lineVDY -=1   ;
  lineHDX -= 1 ; lineHDY -=1   ;
  clear();
  ellipse(ballX, ballY+ballwalk, ballSize, ballSize);
  ellipse(eyeLeftRelativeX + ballX, ballY+ballwalk, eyeSize,eyeSize); // ballY skal ikke ændre sig da den skal være i midten af bolden.
  ellipse(eyeRightRelativeX + ballX, ballY+ballwalk, eyeSize,eyeSize);
  line(lineVUX,lineVUY,lineHUX,lineHUY);
  line(lineVUX,lineVUY,lineVDX,lineVDY);
  line(lineHUX,lineHUY,lineHDX,lineHDY);
  line(lineVDX,lineVDY,lineHDX,lineHDY);
}
