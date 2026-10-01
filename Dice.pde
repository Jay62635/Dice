int count = 0;
int sum;
int interval = 50;
void setup()
{
  size(285,315);
  noStroke();
  textAlign(CENTER);
}
void draw()
{
  fill(0,6);
  rect(0,0,width,height);
  count += 1;
  if (count % interval == 0){
    background(#5F5F5F);
    for (int i = 5; i<= 330; i+=35){
      for (int j = 5; j<= 280; j+=35){
        Die dice = new Die(i,j);
        dice.show();
        sum += dice.value;
      }
    }
    fill(255);
    textSize(20);
    text("Sum is "+String.valueOf(sum)+" !",142.5,305);
    textSize(5);
    text(String.valueOf(interval),280,310);
  }
}
void mousePressed()
{
  if (interval >= 10)
    interval -= 3;
}
class Die //models one single dice cube
{
  int myX;
  int myY;
  int value;
  int sum;
  
  Die(int x, int y) //constructor
  {
    myX = x;
    myY = y;
    value = (int)(Math.random()*6)+1;
    sum += value;
  }
  void roll()
  {
    value = (int)(Math.random()*6)+1;
  }
  void show()
  {
    fill(255);
    rect(myX, myY, 30,30,7);
    fill(0);
    if (value % 2 == 1){
      ellipse(myX+15, myY+15, 5,5);
      if (value-1 > 0){
        ellipse(myX+9, myY+9, 5,5);
        ellipse(myX+21, myY+21, 5,5);
        if (value == 5){
          ellipse(myX+21, myY+9, 5,5);
          ellipse(myX+9, myY+21, 5,5);
        }
      }
    }
    if (value%2 == 0){
      ellipse(myX+9, myY+9, 5,5);
      ellipse(myX+21, myY+21, 5,5);
      if (value-2 > 0){
        ellipse(myX+21, myY+9, 5,5);
        ellipse(myX+9, myY+21, 5,5);
        if (value == 6){
          ellipse(myX+9, myY+15, 5,5);
          ellipse(myX+21, myY+15, 5,5);
        }
      }
    }
  }
}
