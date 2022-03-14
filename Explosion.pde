class Explosion
{
  PImage explosion,explosion2;
  int counter=0;
  float x,y;
  
  Explosion(float x,float y)
  {
    this.x = x;
    this.y = y;
    explosion = loadImage("Explosion.png");
    explosion.resize(50,50);
  }
  
  void display()
  {
    if(counter==10)
    {
      explosion.resize(40,40);
    }
    else if(counter==20)
    {
      explosion.resize(30,30);
    }
    else if(counter==30)
    {
      explosion.resize(20,20);
    }
    else if(counter==40)
    {
      explosion.resize(10,10);
    }
    else if(counter==50)
    {
      explosion.resize(5,5);
    }
    image(explosion,x,y);
  }
  
  
  
  
  
}
