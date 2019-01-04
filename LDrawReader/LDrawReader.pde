import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

//To get this running: download the ldraw parts archives and unzip them somewhere keeping the dir structure intact

//http://www.ldraw.org/library/updates/complete.zip
//http://www.ldraw.org/library/unofficial/ldrawunf.zip -> copy in subdir ldraw/unofficial

//location of ldraw directory from above archives, in my case d:\resources\ldraw\
String path="d:/resources/ldraw/";

//dirs where to look for parts, subparts and models
String[] dataDir=new String[]{
  path+"parts/", 
  path+"p/", 
  path+"models/", 
  path+"unofficial/p/", 
  path+"unofficial/parts/",
  "d:/downloads/"};

String mainFile;
String[] data;
PShape model, tris, quads, edges;
List<ConditionalLine> condLines;
float zoom;
float dx, dy;
Map<String, String[]> parts;
Map<Integer, Integer> colors;
Map<Integer, Integer> edgeColors;
Map<Integer, Integer> alpha;

void setup() {
  fullScreen(P3D);
  smooth(8);
  hint(ENABLE_DEPTH_SORT);
  setColors(150);
  parts=new HashMap<String, String[]>();
  load("car.ldr");//should be able to load .dat, .ldr and .mpd (http://omr.ldraw.org/list/). L3B and other derived file formats might work too.
  zoom=1.0;
}

void draw() {
  background(136,240,240);
  translate(width/2+dx, height/2+dy);
  lights();
  rotateX(mouseY*TWO_PI/height);
  rotateY(-mouseX*TWO_PI/width);
  scale(zoom);
  strokeWeight(1.0/zoom);
  shape(edges);
  shape(model);
  for(ConditionalLine condLine:condLines){
   condLine.draw(); 
  }
}

void keyPressed() {
  if (key=='+') {
    zoom+=0.1;
  } else if (key=='-') {
    zoom-=0.1;
  }
  if (key==CODED) {
    if (keyCode==UP) {
      dy+=10;
    } else if (keyCode==DOWN) {
      dy-=10;
    } else  if (keyCode==LEFT) {
      dx-=10;
    } else if (keyCode==RIGHT) {
      dx+=10;
    }
  }
}