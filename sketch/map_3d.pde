int viewRange = 4; // ミニマップの描画範囲（プレイヤーの前後左右何マス表示するか）
int minimapScale = 20; // ミニマップの1マスのサイズ
int minimapX = 750, minimapY = 750; // ミニマップの位置
int minimapRadius = (viewRange * 2 + 1) * minimapScale / 2; // 円形サイズ

void drawMinimap() {
  PGraphics mask = createGraphics(minimapRadius * 2, minimapRadius * 2);
  colorMode(RGB,255,255,255);
  strokeWeight(0);
  mask.beginDraw();
  mask.background(0);
  mask.fill(255);
  mask.ellipse(minimapRadius, minimapRadius, minimapRadius * 2, minimapRadius * 2);
  mask.endDraw();
  
  PGraphics minimap = createGraphics(minimapRadius * 2, minimapRadius * 2);
  minimap.beginDraw();
  minimap.translate(minimapRadius, minimapRadius);
  minimap.fill(0);
  minimap.strokeWeight(0);
  minimap.ellipse(0, 0, minimapRadius * 2, minimapRadius * 2);
  minimap.rotate(radians(deg - 90)); // 右向きを 0 度に調整
  minimap.scale(1, 1);
  float relativeX = playerX - placolx * cellSize;
  float relativeY = playerY - placoly * cellSize;
  float offsetX = minimapScale * (relativeX / cellSize);
  float offsetY = minimapScale * (relativeY / cellSize);

  int startX = max(0, placolx - viewRange);
  int startY = max(0, placoly - viewRange);
  int endX = min(grid[0].length - 1, placolx + viewRange);
  int endY = min(grid.length - 1, placoly + viewRange);

  for (int y = startY; y <= endY; y++) {
    for (int x = startX; x <= endX; x++) {
      int drawX = (x - placolx) * minimapScale;
      int drawY = (y - placoly) * minimapScale;

      if (grid[x][y] == 1) {
        if(x==1&&y==1){
            minimap.fill(255,0,0);
        }else if(cols%2==1&&(x==grid[0].length - 2&&y==grid.length - 2)){
            minimap.fill(0,255,0);
        }else if(cols%2==0&&(x==grid[0].length - 3&&y==grid.length - 3)){
            minimap.fill(0,255,0);
        }else{
            minimap.fill(255);
        }
        minimap.rect(drawX-offsetX, drawY-offsetY, minimapScale, minimapScale);
      }
    }
  }

  
  

  // マスクを適用
  minimap.mask(mask);
  image(minimap, minimapX - minimapRadius, minimapY - minimapRadius);
  
  // プレイヤーの位置を描画 
  pushMatrix();
  translate(minimapX, minimapY);
  fill(0, 0, 255);
  triangle(-minimapScale / 2, minimapScale / 3, 
           minimapScale / 2, minimapScale / 3, 
           0, -minimapScale / 2);
  popMatrix();
}