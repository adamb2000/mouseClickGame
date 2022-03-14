class Player
{
  int x, y, prevx, prevy;
  PImage DownRight, DownLeft, UpRight, UpLeft, lastImage;
  int counter;
  int kills = 0;
  int levelKills = 0;
  float angle;
  
  Player(int x,int y)
  {
    this.x = x;
    this.y = y;
    DownRight = loadImage("DownRight.png");
    DownLeft = loadImage("DownLeft.png");
    UpRight = loadImage("UpRight.png");
    UpLeft = loadImage("UpLeft.png");
    DownRight.resize(100, 50);
    DownLeft.resize(100, 50);
    UpRight.resize(100, 50);
    UpLeft.resize(100, 50);
    lastImage = UpRight;
    
  }
  
  void display()
  {
    int dx, dy;
    dx = this.x - this.prevx;
    dy = this.y - this.prevy;
    if(dx>0 && dy<0)
    {
     image(UpRight,x,y);
     lastImage = UpRight;
    }
    else if(dx>0 && dy>0)
    {
      image(DownRight,x,y);
      lastImage = DownRight;
    }
    else if(dx<0 && dy>0)
    {  
     image(DownLeft,x,y);
     lastImage = DownLeft;
    }
    else if(dx<0 && dy<0)
    {
     image(UpLeft,x,y);
     lastImage = UpLeft;
    }
    else
    {
      image(lastImage,x,y);
    }
    text("kills: "+kills,width-600, 50);
  }

  void move()
  {
    x = mouseX;
    y = mouseY;
    display();
  }
  
  void updatecoord()
  {
   this.prevx = this.x;
   this.prevy = this.y;
  }
  
  
}
