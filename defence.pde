class Defence
{
  int health;
  PImage Earth;
  
  Defence(int health)
  {
   this.health = health; 
   Earth = loadImage("Earth.png");
  }
  
  boolean checkhealth()
  {
    if(health>0)
    {
      return true;
    }
    else
    {
     return false; 
    }
  }
  
  void takedamage(int hit)
  {
   health -= hit; 
   fill(255,0,0);
   rect(0,0,width,10);
   rect(0,height-10,width,10);
   rect(0,0,10,height);
   rect(width-10,0,10,height);
  }
  
  void reset()
  {
   health = 100;
  }
  
  void display()
  {
    image(Earth,680,0);
    text("Health: "+health,width-400, 50);
  }
  
}
