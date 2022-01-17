float rotx, roty;
PImage diamond, dirt, grassTop, grassSide;


void setup() {
  size(800, 800, P3D);
  diamond = loadImage("diamond.png");
  dirt = loadImage("bottomblock.png");
  grassTop = loadImage("topblock.png");
  grassSide = loadImage("sideblock.png");
  textureMode(NORMAL);
}

void draw() {
  background(0);
  
  texturedCube(width/2, height/2, 0, diamond, 100);
  texturedCube(100, 100, 0, dirt, 100);
  texturedCube(width/2, 100, 0, grassTop, grassSide, dirt, 100);

  //cube(width/2, height/2, 0, #0AFCCE, 200); 
  //ball(100, 100, 0, #0AA9FC, 100);
}

void texturedCube(float x, float y, float z, PImage texture, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);


  noStroke();
  beginShape(QUADS);
  texture(texture);

  //top
  vertex(0, 0, 0, 0, 0); //x , y, z, tx, ty
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  //bottom
  vertex(0, 1, 0, 0, 0); //x , y, z, tx, ty
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //right
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);


  endShape();
  popMatrix();
}

void texturedCube(float x, float y, float z, PImage top, PImage side, PImage bottom, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);


  noStroke();
  beginShape(QUADS);
  texture(top);

  //top
  vertex(0, 0, 0, 0, 0); //x , y, z, tx, ty
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);
  
  endShape();

  beginShape(QUADS);
  texture(bottom);
  //bottom
  vertex(0, 1, 0, 0, 0); //x , y, z, tx, ty
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);
  
  endShape();

  beginShape(QUADS);
  texture(side);
  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1);
  vertex(0, 1, 0, 0, 1);

  //right
  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 1, 0, 0, 1);


  endShape();
  popMatrix();
}

void ball(float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z); //x, y, z; z = towards or further from screen

  rotateX(rotx);
  rotateY(roty);
  //rotateZ();
  fill(c);
  strokeWeight(3);
  stroke(255);
  sphere(size); 
  popMatrix();
}

void cube(float x, float y, float z, color c, float size) {
  pushMatrix();
  translate(x, y, z); //x, y, z; z = towards or further from screen

  rotateX(rotx);
  rotateY(roty);
  //rotateZ();
  fill(c);
  strokeWeight(3);
  box(size); 
  popMatrix();
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*0.01; 
  roty = roty + (pmouseX - mouseX)*-0.01;
}
