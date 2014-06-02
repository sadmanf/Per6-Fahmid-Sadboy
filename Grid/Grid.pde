int rows = 20;
int cols = 10;
int boardWidth = 300;
int boardHeight = 600;
int width = 977;
int height = 650;
int squareLength = boardWidth/10;
int topLeftw = (width/2) - (boardWidth/2);
int topLefth = (height - boardHeight) / 2;

//Coordinates of Current Pieces 
int[] C = new int[8];


int[][] Grid = new int[rows][cols];

void clearGrid() {
  for (int x = 0; x < rows; x++) {
    for (int y = 0; y < cols; y++) {
      Grid[x][y] = 0;
    }
  }
  //  Grid[rows-1][0] = 1;
}

void setup() { 
  clearGrid();
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
}

void setGrid(int row, int col, int val) {
  Grid[row][col] = val;
}

class LTet {

  boolean flat = true;

  void setup() {
    C[0] = 0;
    C[1] = cols/2 - 2;
    C[2] = 0;
    C[3] = cols/2 - 1;
    C[4] = 0;
    C[5] = cols/2;
    C[6] = 0;
    C[7] = cols/2 + 1;   
    println(C[1] + C[3]);
  }

  void keyPressed() {
  }

  void draw() {
    println(C[1] + "" + C[3]);  
    for (int x = 0; x < 4; x+=2) {
      setGrid(C[x], C[x+1], 1);
    }
  }
}



void check() {
  /*
   1. I = cyan rgb(0,255,255)
   2. O = yellow rgb(255,255,0)
   3. T = purple rgb(160,32,240)
   4. S = green rgb(0,255,0)
   5. Z = red rgb (255,0,0)
   6. J = blue rgb(0,0,255)
   7. L = orange rgb(255,140,0)
   */
  for (int x = 0; x < rows; x++) {
    for (int y = 0; y < cols; y++) {
      if (Grid[x][y] == 0) {       
        noFill();
        //        rect(topLeftw + (squareLength * y), topLefth + (squareLength * x), squareLength, squareLength);
      } else if (Grid[x][y] == 1) {
        fill(0, 255, 255);
      } else if (Grid[x][y] == 2) {
        fill(255, 255, 0);
      } else if (Grid[x][y] == 3) {
        fill(160, 32, 240);
      } else if (Grid[x][y] == 4) {
        fill(0, 255, 0);
      } else if (Grid[x][y] == 5) {
        fill(255, 0, 0);
      } else if (Grid[x][y] == 6) {
        fill(0, 0, 255);
      } else if (Grid[x][y] == 7) {
        fill(255, 140, 0);
      }
      rect(topLeftw + (squareLength * y), topLefth + (squareLength * x), squareLength, squareLength);
    }
  }
}

void draw() {
  check();
  LTet n = new LTet();
  n;
}

