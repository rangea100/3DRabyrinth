int cols, rows;
float cellSize = 25;
int count=0;
int gnc = 0;
int[][] grid;
int placolx,placoly; 
ArrayList<int[]> stack = new ArrayList<int[]>();
float playerX,playerY,deg,delta,mult;
boolean a_pres,d_pres,w_pres,s_pres,v_pres,shift_pres;
boolean darkmode = false;
boolean thrddim = false;
boolean slid = false;
boolean startwall,goalwall;
int rayx,res,scan_line;
float deg2,rayhi;
float fov = 60;
int dakdis = 4;
void setup() {
  size(900, 900);
  cols = floor(width / cellSize);
  rows = floor(height / cellSize);
  grid = new int[cols][rows];
  playerX =cellSize*1.5;
  playerY = cellSize*1.5;
  generateMaze();
}

void draw() {
  colorMode(RGB,255,255,255);
  background(0);
  if(gnc==0){

  }else if(gnc==1){
    play();
  }
  
}

void play(){
  dark();
  moDelta();
  playerMove();
  slid = false;
  if(thrddim){
    threedcast();
    if(darkmode==false){
      drawcompass();
      drawMinimap();
    }else{
      drawcompass();
    }
  }else{
   drawMaze();
   playerDisp(); 
  }
}

void dark(){
    placolx = int(floor(playerX/cellSize));
    placoly = int(floor(playerY/cellSize));
    
}
