int rows = 20;
int cols = 10;
int boardWidth = 300;
int boardHeight = 600;
int width = 977;
int height = 650;
int squareLength = boardWidth/10;
int topLeftw = (width/2) - (boardWidth/2);
int topLefth = (height - boardHeight) / 2;

int[][] Grid = new int[rows][cols];

void clearGrid() {
  for (int x = 0; x < rows; x++) {
    for (int y = 0; y < cols; y++) {
      Grid[x][y] = 0;
    }
  }
  Grid[0][0] = 1;
}

void setup() { 
  size(width, height);
  PImage bg = loadImage("stars.jpg");
  background(bg);

  stroke(255);
  strokeWeight(2);
  fill(48, 139, 206, 85);
  rect(topLeftw, topLefth, boardWidth, boardHeight); 

  for (int x = 0; x < rows; x++) {
    for (int y = 0; y < cols; y++) {
      stroke(255);
      strokeWeight(0.5);
      noFill();
      rect(topLeftw + (squareLength * y), topLefth + (squareLength * x), squareLength, squareLength);
    }
  }
  fill(255);
  //rect(0, 0, 50, 50);
}

void check() {
  for (int x = 0; x < rows; x++) {
    for (int y = 0; y < cols; y++) {
      if (Grid[x][y] != 0) {
        fill(255);
        rect(topLeftw + (squareLength * y), topLefth + (squareLength * x), squareLength, squareLength);
      }
    }
  }
  fill(255);
  //rect(topLeftw + (squareLength * 0), topLefth + (squareLength * x), squareLength, squareLength);
  rect(0, 0, 50, 50);
}

void draw() {
  check();
}

