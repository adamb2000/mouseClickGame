
Player Player1;
Defence base;
ArrayList<Fighter> fighters = new ArrayList<Fighter>();
ArrayList<Tank> tanks = new ArrayList<Tank>();
ArrayList<Explosion> explosions = new ArrayList<Explosion>();
int gameMode;
PImage splashscreen, endScreen, Background;
int fighterMax = 15, tankMax = 10, level=1; 

void setup()
{
  textSize(40);
  fill(255);
  size(1500,800);
  splashscreen = loadImage("splashScreen.jpg");
  splashscreen.resize(width,height);
  endScreen = loadImage("endScreen.jpg");
  endScreen.resize(width,height);
  Background = loadImage("Background.jpg");
  Background.resize(width,height);
  background(splashscreen);
  base = new Defence(10000);
  Player1 = new Player(50,100);
  
  for (int i = 0; i<15; i++)
  {
    fighters.add(new Fighter (int(random(width)),height+20)) ;
  }
  
  for (int i = 0; i<10; i++)
  {
    tanks.add(new Tank (int(random(width)),height+20)) ;
  }
  
}


void draw()
{
  
  if(gameMode == 1)
  {
    //---------------------------------------- GAME ACTIVE
    if(base.checkhealth())
    {
      Player1.counter += 1;
      background(Background);
      fill(255);
      text("Level: "+level,80,50);
      if (Player1.counter == 5)
      {
       Player1.updatecoord();
       Player1.counter = 0; 
      }
      Player1.move();
      base.display();
      
      for (int i = 0; i < fighters.size(); i++) 
      {
        Fighter enemy = fighters.get(i);
        enemy.move();
        enemy.display();
        if(enemy.destroy())
        {
          explosions.add(new Explosion(enemy.x,enemy.y));
          fighters.remove(i);
        }
      }
          
      for (int i = 0; i < tanks.size(); i++) 
      {
        Tank enemy = tanks.get(i);
        enemy.move();
        enemy.display();
        if(enemy.destroy())
        {
          explosions.add(new Explosion(enemy.x,enemy.y));
          tanks.remove(i);
        }
      }
      
      for (int i = 0; i < explosions.size(); i++) 
      {
        Explosion explode = explosions.get(i);
        explode.display();
        explode.counter ++;
        if(explode.counter > 60)
        {
          explosions.remove(i);
        }
      }
      
      if(Player1.levelKills >= 30)
      {
        level += 1; 
        fighterMax += 5;
        tankMax += 5;
        Player1.levelKills = 0;
      }
      addEnemy();     
    }
    //--------------------------------------- GAME ACTIVE
    
    else
    {
      gameMode = 2;  //Gamemode 2 = Game over screen
    }
  }
  else if(gameMode == 0) //gamemode 0 = initial start up
  {
   if(keyPressed)
   {
    gameMode = 1; //Gamemode 1 = game active 
   }
   background(splashscreen);
   text("Click To Play",100,700);
  }
  else if(gameMode == 2)  
  {
    background(endScreen);
    fill(0);
    text("Game Over",width/2,height/2);
    removeEnemy();
    Player1.kills = 0;
    level = 1;
    fighterMax = 15;
    tankMax = 10;
    if(mousePressed)
    {
      base.reset();
      setup();
    }
    
  }
  
}


void removeEnemy()
{
  for (int i = 0; i < tanks.size(); i++) 
  {
    tanks.remove(i);
  }
  
  for (int i = 0; i < fighters.size(); i++) 
  {
    fighters.remove(i);
  }
}

void addEnemy()
{
 if(fighters.size() < fighterMax)
 {
  fighters.add(new Fighter (int(random(width)),height+20));
 }
  if(tanks.size() < tankMax)
 {
  tanks.add(new Tank (int(random(width)),height+20));
 }
}

void mousePressed()
{
  if(mousePressed) //<>//
  {
   gameMode = 1;      //Gamemode set to 1 when mouse is pressed on splashscreens 
  }
}
