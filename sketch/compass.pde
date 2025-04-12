void drawcompass(){
    colorMode(RGB,255,255,255);
    strokeWeight(0);
    if(darkmode==false){
      //方角
        pushMatrix();
        translate(minimapX, minimapY);
        rotate(radians(deg-90));
        fill(50);
        triangle(0+minimapScale*1.5, 0-minimapRadius+2, 
                0-minimapScale*1.5, 0-minimapRadius+2, 
                0, 0-minimapRadius-minimapScale*1.5);
        fill(255);
        textSize(minimapScale);
        strokeWeight(10);
        text("N",0-minimapScale*0.45,0-minimapRadius-minimapScale*0.375);
        popMatrix();
        
        strokeWeight(0);
        fill(50);
        ellipse(minimapX, minimapY,minimapRadius*2+10,minimapRadius*2+10);  
    }else{
        colorMode(RGB,255,255,255);
        strokeWeight(0);
        fill(50);
        ellipse(minimapX, minimapY,minimapRadius*2+10,minimapRadius*2+10); 
        fill(0);
        ellipse(minimapX, minimapY,minimapRadius*2,minimapRadius*2);

        drawdirection(-90,"N");
        drawdirection(90,"S");
        drawdirection(0,"E");
        drawdirection(180,"W");
        pushMatrix();
        translate(minimapX, minimapY);
        strokeWeight(0);
        fill(255, 0, 0);
        triangle(-minimapScale/1.25, 0, 
                minimapScale/1.25, 0, 
                0, -minimapRadius);
        stroke(255);
        fill(0,0,255);
        triangle(-minimapScale/1.25, 0, 
                minimapScale/1.25, 0, 
                0, minimapRadius);
        fill(127);
        ellipse(0, 0,minimapScale , minimapScale);
        popMatrix();
    }
    
}

void drawdirection(int degs,String direction){
    pushMatrix();
    translate(minimapX, minimapY);
    rotate(radians(deg+degs));
    fill(255);
    textSize(minimapScale*2);
    strokeWeight(20);
    text(direction,0-minimapScale*0.45,0-minimapRadius+minimapScale*1.5);
    popMatrix();
}