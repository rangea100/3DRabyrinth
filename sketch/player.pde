void playerMove(){
    if(slid==false){
        move(delta*cos(deg*PI/180),0);
        move(0,delta*sin(deg*PI/180));   
    }else{
        move(delta*cos((deg-90)*PI/180),0);
        move(0,delta*sin((deg-90)*PI/180));
    }
    
    
}
void move(float mx,float my){
    playerX = playerX+mx;
    playerY = playerY-my;

    for (int i=0;i<rows;i++){
        for (int j=0;j<cols;j++){
            if((grid[j][i]==0||grid[j][i]==2||grid[j][i]==3) &&playerX > j * cellSize &&playerY > i * cellSize && playerX < j * cellSize+cellSize&&playerY<i * cellSize+ cellSize){
                playerX = playerX-mx;
                playerY = playerY+my;
                break;
            }
        }
    }
}
void playerDisp(){
    strokeWeight(0);
    fill(0,0,255);
    drawTriangle(playerX,playerY,-deg,10);
}
void drawTriangle(float x, float y, float angle, float size) {
  float halfSize = size / 2;
  
  // 三角形の頂点（未回転の状態）
  float x1 = size;  float y1 = 0;    // 前方の頂点
  float x2 = -halfSize; float y2 = -halfSize; // 左後方
  float x3 = -halfSize; float y3 = halfSize;  // 右後方
  
  // 角度をラジアンに変換
  float rad = radians(angle);
  float cosA = cos(rad);
  float sinA = sin(rad);

  // 回転後の座標を計算
  float rx1 = x + x1 * cosA - y1 * sinA;
  float ry1 = y + x1 * sinA + y1 * cosA;

  float rx2 = x + x2 * cosA - y2 * sinA;
  float ry2 = y + x2 * sinA + y2 * cosA;

  float rx3 = x + x3 * cosA - y3 * sinA;
  float ry3 = y + x3 * sinA + y3 * cosA;

  // 三角形を描画
  triangle(rx1, ry1, rx2, ry2, rx3, ry3);
}

void keyPressed(){
    //println("Pressed key: " + key + ", keyCode: " + keyCode);
    if (keyCode==CONTROL) {
        v_pres = true;
    }
    if (key == 'a' || key == 'A' || keyCode == 65|| keyCode==LEFT) {
        a_pres = true;
    }
    if (key == 'd' || key == 'D' || keyCode == 68|| keyCode==RIGHT) {
        d_pres = true;
        //println("right: "+count);
        count += 1;
    }
    if (key == 'w' || key == 'W' || keyCode == 87|| keyCode==UP) {
        w_pres = true;
    }
    if (key == 's' || key == 'S' || keyCode == 83|| keyCode==DOWN) {
        s_pres = true;
    }
    if(keyCode==SHIFT){
      shift_pres = true;
    }
    
    if (key == ' '){
        generateMaze();
        playerX =cellSize*1.5;
        playerY = cellSize*1.5;
        if(thrddim){
          thrddim = false;
          thrddim = true;
        }
    }
    if(key == 'b' || key == 'B'){
        darkmode = !darkmode;
    }
    if(key == 'n' || key == 'N'){
      thrddim = !thrddim;
    }
}
void keyReleased() {
  if (key == 'a' || key == 'A'|| keyCode == 65|| keyCode==LEFT) {
    a_pres = false;
  }
  if (key == 'd' || key == 'D'|| keyCode == 68|| keyCode==RIGHT) {
    d_pres = false;
  }
  if (key == 'w' || key == 'W'|| keyCode == 87|| keyCode==UP) {
    w_pres = false;
  }
  if (key == 's' || key == 'S'|| keyCode == 83|| keyCode==DOWN) {
    s_pres = false;
  }
  if (keyCode==CONTROL) {
    v_pres = false;
  }
  if(keyCode==SHIFT){
    shift_pres = false;
  }
}
void moDelta(){
    if(v_pres){
      mult = 2;
    }else{
      mult = 1;
    }
    
    if (w_pres && s_pres) {
        delta = 0;  // A と D の同時押しなら 0
    } else if (w_pres) {
        delta = 1*mult; // D が押されている
    } else if (s_pres) {
        delta = -1*mult; // A が押されている
    } else {
        delta = 0; // どのキーも押されていない
    }
    
    
    if(a_pres && d_pres && shift_pres == false){     
        deg +=0;
    }else if(a_pres && shift_pres == false){
        deg += 3*mult;
    }else if(d_pres && shift_pres == false){
        deg += -3*mult;
    }else{
        deg +=0;
    }
    if(a_pres && d_pres && shift_pres){     
        
    }else if(a_pres && shift_pres){
        slid = true;
        delta = -1*mult;
    }else if(d_pres && shift_pres){
        slid = true;
        delta = 1*mult;
    }else{
        
    }
    
}