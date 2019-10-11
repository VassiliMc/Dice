int sizeX = 600;
int sizeY = 600;
int sum = 0;
int diceSize = sizeX-1;
void setup()
{
	size(600,750);
	noLoop();
}
void draw()
{
	background(0,0,0);
	while(600%diceSize != 0){
		diceSize = (int)(Math.random()*581 + 20);
	}
	for(int x = 0; x < sizeX; x += diceSize){
		for(int y = 0; y < sizeY; y += diceSize){
			int num = (int)(Math.random()*6)+1;
			Die jokerMovie = new Die(x, y, num);
			sum += num;
			jokerMovie.show();
		}
	}
	fill(255);
	textSize(20);
	text(sum, sizeX/2, 675);

	
}
void mousePressed()
{

	redraw();
	while(600%diceSize == 0){
		diceSize = (int)(Math.random()*581 + 20);
	}
	sum = 0;
}
class Die 
{
	int inX, inY, inNum;
	
	Die(int x, int y, int num) 
	{
		 inX = x;
		 inY = y;
		 inNum = num;
	}
	void show()
	{
		fill(255);
		rect(inX, inY, diceSize-1, diceSize-1, diceSize/10);
		fill(0);
		if(inNum%2==1){
			fill(0);
			ellipse((float)(inX + diceSize/2), (float)(inY + diceSize/2), (float)(diceSize/6), (float)(diceSize/6));
			noFill();
		}
		if(inNum>=2){
			fill(0);
			ellipse((float)(inX + diceSize - diceSize/6), (float)(inY + diceSize - diceSize/6), (float)(diceSize/6), (float)(diceSize/6));
			ellipse((float)(inX + diceSize/6), (float)(inY + diceSize/6), (float)(diceSize/6), (float)(diceSize/6));
			noFill();
		}
		if(inNum>=4){
			fill(0);
			ellipse((float)(inX + diceSize - diceSize/6), (float)(inY + diceSize/6), (float)(diceSize/6), (float)(diceSize/6));
			ellipse((float)(inX + diceSize/6), (float)(inY + diceSize - diceSize/6), (float)(diceSize/6), (float)(diceSize/6));
			noFill();
		}
		if(inNum==6){
			fill(0);
			ellipse((float)(inX + diceSize - diceSize/6), (float)(inY + diceSize/2), (float)(diceSize/6), (float)(diceSize/6));
			ellipse((float)(inX + diceSize/6), (float)(inY + diceSize/2), (float)(diceSize/6), (float)(diceSize/6));
			noFill();
		}

	}
}
