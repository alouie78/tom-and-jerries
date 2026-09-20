ArrayList<Furniture> forbidden;
ArrayList<Mice> mice;
Cat avatar;
boolean dead;
boolean setup;
boolean won;
int level;
int timer;
boolean passed;
static int highScore;
int timePassed;

void setup(){
  size(1000, 800);
  mice = new ArrayList<Mice>();
  forbidden = new ArrayList<Furniture>();
  PVector loc = new PVector(50,50);
  avatar = new Cat(loc, "images/cat.png");
  level = 0;
  setup = false;
  dead = false;
  won = false;
  passed = false;
  highScore = 0;
}

void death(){
  for(int i = 0; i < forbidden.size(); i++){
    if(avatar.getLocation().x >= forbidden.get(i).getCorner().x - 40 && avatar.getLocation().x <= forbidden.get(i).getCorner().x + forbidden.get(i).getWidth()-30){
      if(avatar.getLocation().y >= forbidden.get(i).getCorner().y - 20 && avatar.getLocation().y <= forbidden.get(i).getCorner().y + forbidden.get(i).getHeight()-40){
        dead = true;
      }
    }
  }
  if(timer == 0 && mice.size() > (level*2 + 3)){
    dead = true;
  }
  if(dead){
    background(0);
    level = -1;
  }
}

void restart(){
  level = 0;
  avatar.resetScore();
  avatar.changeLocation(50, 50);
  dead = false;
  setup = false;
  mice = new ArrayList<Mice>();
  forbidden = new ArrayList<Furniture>();
}

void checkMouse(){
  for(int i = 0; i<mice.size(); i++){
    if(avatar.getLocation().x < mice.get(i).getLocation().x + 60 && avatar.getLocation().x > mice.get(i).getLocation().x - 60){
      if(avatar.getLocation().y < mice.get(i).getLocation().y + 60 && avatar.getLocation().y > mice.get(i).getLocation().y - 46){
        if(mice.get(i).isVisible()){
          avatar.addPoints(1);
          mice.remove(i);
          if(avatar.getCurrentScore() > highScore && passed == false){
            highScore++;
          }
        }
      }
    }
  }
}

void keyPressed(){
  if(key == CODED && keyCode == LEFT){
    avatar.move(1);
  }
  if(key == CODED && keyCode == RIGHT){
    avatar.move(2);
  }
  if(key == CODED && keyCode == UP){
    avatar.move(3);
  }
  if(key == CODED && keyCode == DOWN){
    avatar.move(4);
  }
}

void levelSetup(){
  if(level == 1 && setup == false){ // 5 mice
    timer = 120;
    
    PVector loc = new PVector(500,500);
    Furniture f1 = new Furniture(loc, "images/level1_furniture/furniture2.png", 300, 300);
    forbidden.add(f1);
    loc = new PVector(200,20);
    Furniture f2 = new Furniture(loc, "images/level1_furniture/furniture5.png", 280, 210);
    forbidden.add(f2);
    loc = new PVector(70,510);
    Furniture f3 = new Furniture(loc, "images/level1_furniture/furniture12.png", 100, 70);
    forbidden.add(f3);
    loc = new PVector(50,400);
    Furniture f4 = new Furniture(loc, "images/level1_furniture/furniture6.png", 150, 200);
    forbidden.add(f4);
    loc = new PVector(350,550);
    Furniture f5 = new Furniture(loc, "images/level1_furniture/furniture8.png", 200, 100);
    forbidden.add(f5);
    loc = new PVector(600,20);
    Furniture f6 = new Furniture(loc, "images/level1_furniture/furniture10.png", 250, 200);
    forbidden.add(f6);
    
    loc = new PVector(400,400);
    Mice m1 = new Mice(loc, "images/mouse.png", 8, true);
    mice.add(m1);
    loc = new PVector(900,700);
    Mice m2 = new Mice(loc, "images/mouse.png", 5, true);
    mice.add(m2);
    loc = new PVector(460,50);
    Mice m3 = new Mice(loc, "images/mouse.png", 6, true);
    mice.add(m3);
    loc = new PVector(70,650);
    Mice m4 = new Mice(loc, "images/mouse.png", 8, true);
    mice.add(m4);
    loc = new PVector(50,200);
    Mice m5 = new Mice(loc, "images/mouse.png", 6, true);
    mice.add(m5);
    loc = new PVector(900,50);
    Mice m6 = new Mice(loc, "images/mouse.png", 6, true);
    mice.add(m6);
    
    setup = true;
  }  
  if(level == 2 && setup == false){
    timer = 90;
    
    mice = new ArrayList<Mice>();
    forbidden = new ArrayList<Furniture>();
    avatar.changeLocation(50,50);
    
    PVector loc = new PVector(200,220);
    Furniture f1 = new Furniture(loc, "images/level2_furniture/furniture6.png", 200, 200);
    forbidden.add(f1);
    loc = new PVector(450,220);
    Furniture f2 = new Furniture(loc, "images/level2_furniture/furniture6.png", 200, 200);
    forbidden.add(f2);
    loc = new PVector(720,220);
    Furniture f3 = new Furniture(loc, "images/level2_furniture/furniture1.png", 200, 200);
    forbidden.add(f3);
    loc = new PVector(50,500);
    Furniture f4 = new Furniture(loc, "images/level2_furniture/furniture3.png", 300, 200);
    forbidden.add(f4);
    loc = new PVector(300,0);
    Furniture f5 = new Furniture(loc, "images/level2_furniture/furniture4.png", 150, 125);
    forbidden.add(f5);
    loc = new PVector(500,0);
    Furniture f6 = new Furniture(loc, "images/level2_furniture/furniture7.png", 150, 125);
    forbidden.add(f6);
    loc = new PVector(750,0);
    Furniture f7 = new Furniture(loc, "images/level2_furniture/furniture8.png", 150, 125);
    forbidden.add(f7);
    loc = new PVector(400,620);
    Furniture f8 = new Furniture(loc, "images/level2_furniture/furniture9.png", 180, 200);
    forbidden.add(f8);
    loc = new PVector(700,620);
    Furniture f9 = new Furniture(loc, "images/level2_furniture/furniture9.png", 180, 200);
    forbidden.add(f9);
    loc = new PVector(740,530);
    Furniture f10 = new Furniture(loc, "images/level2_furniture/furniture2.png", 90, 120);
    forbidden.add(f10);
    
    loc = new PVector(400,300);
    Mice m1 = new Mice(loc, "images/mouse.png", 3, true);
    mice.add(m1);
    loc = new PVector(650,300);
    Mice m2 = new Mice(loc, "images/mouse.png", 4, true);
    mice.add(m2);
    loc = new PVector(435,20);
    Mice m3 = new Mice(loc, "images/mouse.png", 7, true);
    mice.add(m3);
    loc = new PVector(650,20);
    Mice m4 = new Mice(loc, "images/mouse.png", 3, true);
    mice.add(m4);
    loc = new PVector(300,670);
    Mice m5 = new Mice(loc, "images/mouse.png", 4, true);
    mice.add(m5);
    loc = new PVector(620,700);
    Mice m6 = new Mice(loc, "images/mouse.png", 5, true);
    mice.add(m6);
    loc = new PVector(920,685);
    Mice m7 = new Mice(loc, "images/mouse.png", 4, true);
    mice.add(m7);
    loc = new PVector(920,300);
    Mice m8 = new Mice(loc, "images/mouse.png", 3, true);
    mice.add(m8);
    loc = new PVector(500,500);
    Mice m9 = new Mice(loc, "images/mouse.png", 2, true);
    mice.add(m9);
    
    setup = true;
  }
  if(level == 3 && setup == false){
    timer = 80;
    
    mice = new ArrayList<Mice>();
    forbidden = new ArrayList<Furniture>();
    avatar.changeLocation(50,50);
    
    PVector loc = new PVector(150,20);
    Furniture f1 = new Furniture(loc, "images/level3_furniture/furniture1.png", 200, 200);
    forbidden.add(f1);
    loc = new PVector(100,140);
    Furniture f2 = new Furniture(loc, "images/level3_furniture/furniture2.png", 300, 300);
    forbidden.add(f2);
    loc = new PVector(480,20);
    Furniture f3 = new Furniture(loc, "images/level3_furniture/furniture4.png", 200, 400);
    forbidden.add(f3);
    loc = new PVector(600,200);
    Furniture f4 = new Furniture(loc, "images/level3_furniture/furniture3.png", 200, 100);
    forbidden.add(f4);
    loc = new PVector(750,310);
    Furniture f5 = new Furniture(loc, "images/level3_furniture/furniture8.png", 60, 60);
    forbidden.add(f5);
    loc = new PVector(530,310);
    Furniture f6 = new Furniture(loc, "images/level3_furniture/furniture12.png", 90, 40);
    forbidden.add(f6);
    loc = new PVector(530,600);
    Furniture f7 = new Furniture(loc, "images/level3_furniture/furniture7.png", 200, 450);
    forbidden.add(f7);
    loc = new PVector(820,380);
    Furniture f8 = new Furniture(loc, "images/level3_furniture/furniture5.png", 150, 170);
    forbidden.add(f8);
    loc = new PVector(300,550);
    Furniture f9 = new Furniture(loc, "images/level3_furniture/furniture11.png", 175, 175);
    forbidden.add(f9);
    loc = new PVector(20,600);
    Furniture f10 = new Furniture(loc, "images/level3_furniture/furniture10.png", 200, 200);
    forbidden.add(f10);
    
    loc = new PVector(380,20);
    Mice m1 = new Mice(loc, "images/mouse.png", 3, true);
    mice.add(m1);
    loc = new PVector(900,20);
    Mice m2 = new Mice(loc, "images/mouse.png", 2, true);
    mice.add(m2);
    loc = new PVector(530,220);
    Mice m3 = new Mice(loc, "images/mouse.png", 2, true);
    mice.add(m3);
    loc = new PVector(850,240);
    Mice m4 = new Mice(loc, "images/mouse.png", 3, true);
    mice.add(m4);
    loc = new PVector(700,290);
    Mice m5 = new Mice(loc, "images/mouse.png", 3, true);
    mice.add(m5);
    loc = new PVector(900,520);
    Mice m6 = new Mice(loc, "images/mouse.png", 2, true);
    mice.add(m6);
    loc = new PVector(350,450);
    Mice m7 = new Mice(loc, "images/mouse.png", 2, true);
    mice.add(m7);
    loc = new PVector(250,720);
    Mice m8 = new Mice(loc, "images/mouse.png", 3, true);
    mice.add(m8);
    loc = new PVector(480,630);
    Mice m9 = new Mice(loc, "images/mouse.png", 2, true);
    mice.add(m9);
    
    setup = true;
  }
}

void mousePressed(){
  if(level==0 && highScore > 0){
    if((mouseX > 360 && mouseX < 360+260) && (mouseY>330 && mouseY<330+60)){
      mouseX = 0;
      mouseY = 0;
      level = 1;
      setup = false;
    }
  }
  if(level==0){
    if((mouseX > 360 && mouseX < 360+260) && (mouseY>330 && mouseY<330+60)){
      mouseX = 0;
      mouseY = 0;
      level = -2;
    }
  }
  if(level==-1 || won){
    if((mouseX > 360 && mouseX < 360+260) && (mouseY>190 && mouseY<190+60)){
      mouseX = 0;
      mouseY = 0;
      restart();
      level = 0;
    }
  }
  if(level==-2){
    if((mouseX > 360 && mouseX < 360+260) && (mouseY>250 && mouseY<250+60)){
      level = 1;
      mouseX = 0;
      mouseY = 0;
    }
  }
  if(level==1 && passed){
    if((mouseX > 360 && mouseX < 360+260) && (mouseY>250 && mouseY<250+60)){
      mouseX = 0;
      mouseY = 0;
      level = 2;
      passed = false;
    }
  }
  if(level==2 && passed){
    if((mouseX > 360 && mouseX < 360+260) && (mouseY>250 && mouseY<250+60)){
      mouseX = 0;
      mouseY = 0;
      level = 3;
      passed = false;
    }
  }
}

void draw(){
  if (level==-2){
    background(320);
    
    fill(247, 205, 141);
    textSize(100);
    text("Instructions", 250, 150); 
    
    fill(255, 221, 171);
    stroke(1255, 163, 23);
    rect(360, 250, 260, 60, 28);
    fill(255, 163, 23);
    textSize(30);
    text("Start Level 1", 410, 290);
    
    fill(255, 221, 171);
    textSize(20);
    stroke(1255, 163, 23);
    rect(50, 340, 900, 190, 28);
    fill(255, 163, 23);
    text("Welcome to Tom and Jerries' House! You are now Tom and need to catch as many Jerries as possible.", 75, 380);
    text("At each level, you will use the arrow keys to move Tom up/down/left/right to catch Jerries across the", 75, 400);
    text("screen, the Jerries are caught when Tom reaches their position. Jerries will disappear and reappear", 75, 420);
    text("until caught. You will be given a goal number of Jerries to catch at each level within a given time limit.", 75, 440);
    text("If you catch the goal number of Jerries before time is up, catch more Jerries! There will also be furniture", 75, 460);
    text("you need to avoid. Time will decrease as you pass levels and furniture and mice to catch will increase.", 75, 480);
    text("If you touch furniture or do not catch enough Jerries in time, you will lose the game :( Good luck!", 75, 500);
    text("Tom -->", 545, 650);
    text("A Jerry -->", 245, 650);
    
    PImage cat = loadImage("images/cat.png");
    cat.resize(100,100);
    image(cat, 600, 600);
    
    PImage mouse = loadImage("images/mouse.png");
    mouse.resize(90,135);
    image(mouse, 350, 580);
    
  }
  if (level==-1){
    fill(247, 205, 141);
    textSize(100);
    text("YOU DIED :(", 250, 150); 
    
    fill(255, 221, 171);
    stroke(1255, 163, 23);
    rect(360, 190, 260, 60, 28);
    fill(255, 163, 23);
    textSize(30);
    text("Click to restart", 400, 230);
  }
  if(level==0){
    PImage back = loadImage("images/load_wall.jpg");
    back.resize(1000,800);
    image(back, 0, 0);
    
    fill(247, 205, 141);
    textSize(100);
    text("TOM AND JERRIES", 130, 150); 
    fill(255, 163, 23);
    textSize(100);
    text("TOM AND JERRIES", 120, 140); 
    
    fill(255, 221, 171);
    stroke(1255, 163, 23);
    rect(360, 330, 260, 60, 28);
    fill(255, 163, 23);
    textSize(30);
    text("Click to Start!", 405, 370);
  }
  if(level==1){
    PImage back = loadImage("images/backgrounds/background.jpg");
    back.resize(1000,800);
    image(back, 0, 0);
  }
  if(passed==true && level == 1){
    PImage back = loadImage("images/backgrounds/door.png");
    back.resize(1000,800);
    image(back, 0, 0);
    
    fill(247, 205, 141);
    textSize(75);
    text("YOU COMPLETED LEVEL 1", 100, 150); 
    fill(255, 163, 23);
    
    fill(255, 221, 171);
    stroke(1255, 163, 23);
    rect(360, 250, 260, 60, 28);
    fill(255, 163, 23);
    textSize(30);
    text("Go to Level 2", 410, 290);
    
    mice = new ArrayList<Mice>(0);
    forbidden = new ArrayList<Furniture>(0);
  }
  if(level==2){
    PImage back = loadImage("images/backgrounds/backgroundkitchentiles.jpg");
    back.resize(1000,800);
    image(back, 0, 0);
  }
  if(passed==true && level == 2){
    PImage back = loadImage("images/backgrounds/door2.jpg");
    back.resize(1000,800);
    image(back, 0, 0);
    
    fill(247, 205, 141);
    textSize(75);
    text("YOU COMPLETED LEVEL 2", 100, 150); 
    fill(255, 163, 23);
    
    fill(255, 221, 171);
    stroke(1255, 163, 23);
    rect(360, 250, 260, 60, 28);
    fill(255, 163, 23);
    textSize(30);
    text("Go to Level 3", 410, 290);
  }
  if(level==3){
    PImage back = loadImage("images/backgrounds/backgroundbluetiles.jpg");
    back.resize(1000,800);
    image(back, 0, 0);
  }
  if (won){
    background(0);
    
    fill(157, 204, 170);
    textSize(100);
    text("YOU WON!!", 250, 150); 
    
    fill(255, 221, 171);
    stroke(1255, 163, 23);
    rect(360, 190, 260, 60, 28);
    fill(255, 163, 23);
    textSize(30);
    text("Click to replay", 400, 230);
  }
  if(level>0 && passed == false && won == false){
    avatar.display();
    for(int i = 0; i<mice.size(); i++){
      mice.get(i).display();
      if(timer % mice.get(i).getTime() == 0){
        mice.get(i).changeVisibility();
      }
    }
    for(int i = 0; i < forbidden.size(); i++){
      forbidden.get(i).display();
    }
    levelSetup();
    
    timePassed++;
    if(timePassed%11 == 0 && setup){
      timer--;
    }
    
    fill(255, 221, 171);
    rect(850, 10, 140, 40, 28);
    fill(255, 163, 23);
    textSize(25);
    text("Timer: " + timer, 865, 40); 
    
    fill(255, 221, 171);
    rect(820, 60, 170, 40, 28);
    fill(255, 163, 23);
    textSize(25);
    text("High Score: " + highScore, 835, 90);
    
    fill(255, 221, 171);
    rect(790, 110, 200, 40, 28);
    fill(255, 163, 23);
    textSize(25);
    text("Current Score: " + avatar.getCurrentScore(), 805, 140);
    
    fill(255, 221, 171);
    stroke(1255, 163, 23);
    rect(890, 160, 100, 40, 28);
    fill(255, 163, 23);
    textSize(25);
    int goal = level * 2 + 3;
    text("Goal: " + goal, 905, 190);
    
    checkMouse();
    death();
    
    if(mice.size() == 0 && level != 3){
      passed = true;
      setup = false;
    }
    else if(timer == 0 && mice.size() <= (level*2+3) && level != 3){
      passed = true;
      setup = false;
    }
    else if((mice.size() == 0 && level ==3) || (timer == 0 && mice.size() <= (level*2+3) && level == 3)){
      won = true;
    }
  }
}
