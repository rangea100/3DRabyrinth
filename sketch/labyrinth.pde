void generateMaze() {
  // すべて壁で初期化
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = 0;
    }
  }

  // スタート地点（奇数の座標）
  int x = 1;
  int y = 1;
  grid[x][y] = 1;
  stack.add(new int[]{x, y});

  while (!stack.isEmpty()) {
    int[] current = stack.get(stack.size() - 1);
    int cx = current[0];
    int cy = current[1];

    // 掘る方向をランダムにシャッフル
    int[][] directions = {{2, 0}, {-2, 0}, {0, 2}, {0, -2}};
    shuffleArray(directions);

    boolean dug = false;
    for (int[] dir : directions) {
      int nx = cx + dir[0];
      int ny = cy + dir[1];

      if (nx > 0 && ny > 0 && nx < cols - 1 && ny < rows - 1 && grid[nx][ny] == 0) {
        // 2マス先を掘る
        grid[nx][ny] = 1;
        grid[cx + dir[0] / 2][cy + dir[1] / 2] = 1;
        stack.add(new int[]{nx, ny});
        dug = true;
        break;
      }
    }

    if (!dug) {
      stack.remove(stack.size() - 1);
    }
  }
}

// 配列をランダムシャッフル
void shuffleArray(int[][] array) {
  for (int i = array.length - 1; i > 0; i--) {
    int index = int(random(i + 1));
    int[] temp = array[i];
    array[i] = array[index];
    array[index] = temp;
  }
}

// 迷路を描画
void drawMaze() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      
      if (grid[i][j] == 0 || grid[i][j] == 2 ||grid[i][j] == 3) {
        fill(0);
        if(darkmode&&!(i >= placolx-dakdis && i <= placolx+dakdis && j >= placoly-dakdis && j <= placoly+dakdis)){
            fill(50);
        }
      } else {
        fill(255);
        if(darkmode&&!(i >= placolx-dakdis && i <= placolx+dakdis && j >= placoly-dakdis && j <= placoly+dakdis)){
            fill(50);
        }
      }
      if(i==1&&j==1){
        fill(255,0,0);
          grid[0][1] = 2;
          grid[1][0] = 2;
          grid[0][0] = 2;
      }
      if(cols%2==1){
        if(i==cols-2&&j==rows-2){
          fill(0,255,0);
          grid[cols-1][rows-2] = 3;
          grid[cols-2][rows-1] = 3;
          grid[cols-1][rows-1] = 3;
        }
      }else{
        if(i==cols-3&&j==rows-3){
          fill(0,255,0);
          grid[cols-2][rows-3] = 3;
          grid[cols-3][rows-2] = 3;
          grid[cols-2][rows-2] = 3;
        }
      }
      
      noStroke();
      rect(i * cellSize, j * cellSize, cellSize, cellSize);
    }
  }
}