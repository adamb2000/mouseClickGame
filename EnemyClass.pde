class Enemy 
{
  int health, damage;
  float speed, x, y;
  PImage fighter,fighter2,tank,tank2;
  int counter = 0;
  
  Enemy()
  {
    fighter = loadImage("enemyship.png");
    fighter.resize(50, 75);
    fighter2 = loadImage("enemyship2.png");
    fighter2.resize(50, 75);
    tank = loadImage("tank.png");
    tank.resize(60,80);
    tank2 = loadImage("tank2.png");
    tank2.resize(60, 80);
  }
  
  void move()
  {
    if(x-750>50 || y>50)
    {
      if(x-750>50)
      {
        x-=speed; 
      }
      else if (x-750<-50)
      {
        x+=speed; 
      }
      if(y>50)
      {
        y-=speed; 
      }
      else if (y<50)
      {
        y+=speed; 
      }
    }
    else
    {
     attack(); 
    }
  }
  
  boolean destroy()
  {
    if((abs(x-(Player1.x-25))<30) && (abs(y-(Player1.y-30))<30))
    {
      if(mousePressed)
        {
         health = health - 100;
         if (health<=0)
         {
          Player1.kills +=1;
          Player1.levelKills +=1;
          return true;
         }
         else
         {
          return false; 
         }
        }
       else
       {
        return false; 
       }
    }
    else
    {
      return false;
    }
      
  }
  
  void attack()
  {
    base.takedamage(damage);
  }

}


//SUBCLASS FOR FIGHTER ENEMY




class Fighter extends Enemy
{
  Fighter(int x, int y)
  {
    health = 100;
    this.x = x;
    this.y = y;
    speed = 1;
    damage = 5;
    
  }
  
  void display()
  {
    if (counter >= 0 && counter <=5)
    {
      counter++;
      image(fighter,x,y);  
    }
    else if(counter >5 && counter <= 10)
    {
      counter++;
      image(fighter2,x,y); 
    }
    else
    {
     image(fighter2,x,y);
     counter=0;
    }
  }
  
  
}

//SUBCALSS FOR TANK ENEMY

class Tank extends Enemy
{
  Tank(int x, int y)
  {
    health = 1000;
    this.x = x;
    this.y = y;
    speed = 0.5;
    damage = 20;
  }
  
  void display()
  {
     if (counter >= 0 && counter <=5)
    {
      counter++;
      image(tank,x,y);  
    }
    else if(counter >5 && counter <= 10)
    {
      counter++;
      image(tank2,x,y); 
    }
    else
    {
     image(tank2,x,y);
     counter=0;
    } 
  }
  
  
}
