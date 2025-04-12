void threedcast(){
    res =4;
    float startAngle = -(fov/2); // 画角60度の左端
    float angleStep = fov / (width / res);
    rayx = (res/2)-(width/2);
    scan_line = width/res;
    for(int i=0;i<scan_line;i++){
      //println("Ray " + i + " Angle: " + (deg + deg2)+"scan: "+60/scan_line);
      deg2 = startAngle + (i * angleStep);
      singleRay();
      rayx += res;
    }
    
}

void singleRay(){
  float distanceToWall = castRay(playerX, playerY, radians(deg+deg2));
  float correctedDistance = distanceToWall* cos(radians(deg2));
  float endX = playerX + cos(radians(deg+deg2)) * correctedDistance;
  float endY = playerY + sin(radians(deg+deg2)) * correctedDistance;
  rayhi = (height*7) / (correctedDistance + 1);
  strokeWeight(res);
  colorMode(HSB,100,100,100);
  if(startwall){
    stroke(0,100,120-(correctedDistance/1.5));
  }else if(goalwall){
    stroke(33,100,120-(correctedDistance/1.5));
  }else{
    if(direwall){
      stroke(53,100,120-(correctedDistance/1.5));
    }else{
      stroke(58,100,120-(correctedDistance/1.5));
    }
  }
  line((width/2)-rayx, (height/2)-rayhi, (width/2)-rayx, (height/2)+rayhi);
}