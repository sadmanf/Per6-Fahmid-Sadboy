int rows = 20;
int cols = 10;
int boardWidth = 300;
int boardHeight = 600;
int width = 977;
int height = 650;
int squareLength = boardWidth/10;
int topLeftw = (width/2) - (boardWidth/2);
int topLefth = (height - boardHeight) / 2;
int current;
int timer = 0;
int speed = 1000;
PFont f;

float r, b, g;
color c = color(r, g, b);

boolean gameOver;
boolean paused;
boolean inAction = false;
boolean flat;

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
  f = createFont("Gothic Bold", 20, true);

  stroke(255);
  strokeWeight(2);
  fill(153, 204, 255, 10);
  rect(topLeftw, topLefth, boardWidth, boardHeight); 

  for (int x = 0; x < rows; x++) {
    for (int y = 0; y < cols; y++) {
      if (Grid[x][y] == 0) {
        stroke(255);
        strokeWeight(0.5);
        fill(153, 204, 255, 130);
        rect(topLeftw + (squareLength * y), topLefth + (squareLength * x), squareLength, squareLength);
      }
    }
  }
}

void setGrid(int[] L, int val) {
  for (int x = 0; x < 7; x+=2) {
    Grid[C[x]][C[x+1]] = val;
  }
}

void check() {
  // REDRAWS THE ENTIRE BOARD
  int timer = 0;
  size(width, height);
  PImage bg = loadImage("stars.jpg");
  background(bg);
  f = createFont("Gothic Bold", 20, true);

  stroke(255);
  strokeWeight(2);
  fill(153, 204, 255, 10);
  rect(topLeftw, topLefth, boardWidth, boardHeight); 

  for (int x = 0; x < rows; x++) {
    for (int y = 0; y < cols; y++) {
      if (Grid[x][y] == 0) {
        stroke(255);
        strokeWeight(0.5);
        fill(153, 204, 255, 130);
        rect(topLeftw + (squareLength * y), topLefth + (squareLength * x), squareLength, squareLength);
      }
    }
  }

  // WRITE MY NAME IN THE BOTTOM RIGHT CORNER


  r = noise(frameCount) + 10;//255 - noise(frameCount * 0.01) * 255;
  b = 255;
  g = noise(frameCount * 0.025) * 255;
  fill(c);
  textFont(f, 30);
  textAlign(RIGHT);
  text("Sadman Fahmid", width - 15, height - 15);


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
        //fill(153, 204, 255, 10);
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
  Grid[0][0] = 3;
}


void spawn() {

  /*
   1. I = cyan rgb(0,255,255)
   2. O = yellow rgb(255,255,0)
   3. T = purple rgb(160,32,240)
   4. S = green rgb(0,255,0)
   5. Z = red rgb (255,0,0)
   6. J = blue rgb(0,0,255)
   7. L = orange rgb(255,140,0)
   */

  flat = true;
  inAction = true;
  current = (int)random(1, 7);
  if (current == 1) {    
    C[0] = 0;
    C[1] = cols/2 - 2;
    C[2] = 0;
    C[3] = cols/2 - 1;
    C[4] = 0;
    C[5] = cols/2;
    C[6] = 0;
    C[7] = cols/2 + 1;
  }
  if (current == 2) {
    C[0] = 0;
    C[1] = cols/2 - 1;
    C[2] = 0;
    C[3] = cols/2;
    C[4] = 1;
    C[5] = cols/2 - 1;
    C[6] = 1;
    C[7] = cols/2;
  }
  if (current == 3) {
    C[0] = 0;
    C[1] = cols/2 - 1;
    C[2] = 1;
    C[3] = cols/2 - 2;
    C[4] = 1;
    C[5] = cols/2 - 1;
    C[6] = 1;
    C[7] = cols/2;
  }
  if (current == 4) {
    C[0] = 0;
    C[1] = cols/2 - 2;
    C[2] = 0;
    C[3] = cols/2 - 1;
    C[4] = 1;
    C[5] = cols/2 - 1;
    C[6] = 1;
    C[7] = cols/2;
  }
  if (current == 5) {
    C[0] = 0;
    C[1] = cols/2;
    C[2] = 0;
    C[3] = cols/2 - 1;
    C[4] = 1;
    C[5] = cols/2 - 1;
    C[6] = 1;
    C[7] = cols/2 - 2;
  }
  if (current == 6) {
    C[0] = 0;
    C[1] = cols/2 - 1;
    C[2] = 1;
    C[3] = cols/2 - 1;
    C[4] = 1;
    C[5] = cols/2;
    C[6] = 1;
    C[7] = cols/2 + 1;
  }
  if (current == 7) {
    C[0] = 0;
    C[1] = cols/2 + 1;
    C[2] = 1;
    C[3] = cols/2 + 1;
    C[4] = 1;
    C[5] = cols/2;
    C[6] = 1;
    C[7] = cols/2 - 1;
  }


  setGrid(C, current);
}



boolean canMoveLeft() {
  for (int x = 1; x < 8; x+=2) {
    if (C[x] <= 0) return false;
  } 
  return true;
}

boolean canMoveRight() {
  for (int x = 1; x < 8; x+=2) {
    if (C[x] >= cols-1) return false;
  }
  return true;
}

boolean canMoveDown() {
  for (int x = 0; x < 7; x+=2) {
    if (C[x] >= rows-1 )return false;
  }
  return true;
}

void keyPressed() {

  int res = keyCode==LEFT ? -1 : (keyCode==RIGHT ? 1 : (keyCode==DOWN ? 2 : 0));
  print(canMoveDown());
  if (res == -1 && canMoveLeft()) {
    setGrid(C, 0);
    for (int x = 1; x < 8; x+=2) {
      C[x]--;
    }
  }
  if (res == 1 && canMoveRight()) {
    setGrid(C, 0);
    for (int x = 1; x < 8; x+=2) {
      C[x]++;
    }
  }
  if (res == 2 && canMoveDown()) {
    setGrid(C, 0);
    for (int x = 0; x < 7; x+=2) {
      C[x]++;
    }
  }
  setGrid(C, current);
}


void draw() {
  r = noise(frameCount) + 10;//255 - noise(frameCount * 0.01) * 255;
  b = /*frameCount % */ 255;
  g = noise(frameCount * 0.025) * 255;
  text("Sadman Fahmid", width - 15, height - 15);
  if (gameOver) {
    fill(r, g, b, 2);
    textFont(f, 90);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
  } else {
    if (!inAction) { 
      timer = 0;
      spawn();
      println("Has Spawned");
      check();
    }
    if (millis() - timer >= speed && canMoveDown()) {  
      setGrid(C, 0);
      for (int x = 0; x < 7; x+=2) {
        C[x]++;
      }
      timer = millis();
      setGrid(C, current);
    }
    check();
  }
  fill(c);
}

