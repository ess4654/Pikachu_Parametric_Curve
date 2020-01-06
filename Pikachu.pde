import ddf.minim.*;

Minim minim;
AudioPlayer player;

float DefaultScale = 0.70;
float FR = 28;
float SampleRate = 3;

boolean running = true;
boolean DEBUGGING = false;
boolean SoundOn = true;

float t = 0;
float scale = DefaultScale;
color transparent = color(0, 0, 0, 0);
color yellow = color(255, 215, 62);
color darkYellow = color(231, 167, 66);
color brown = color(144, 64, 37);
color red = color(238, 79, 53);
color black = color(40, 40, 40);
color pink = color(238, 133, 121);
color white = color(255, 255, 255);
ArrayList<PVector> points = new ArrayList<PVector>();
ArrayList<Integer> lineColor = new ArrayList<Integer>();
ArrayList<Integer> strokes = new ArrayList<Integer>();

void setup()
{
  fullScreen(P2D);
  //size(800, 800, P2D);
  background(0);
  noFill();
  smooth();
  frameRate(FR);
  
  minim = new Minim(this);
  player = minim.loadFile("Pokemon Theme.mp3");
  if(SoundOn)
    player.loop();
}

void keyPressed() {
  if(key == ' ')
    running = !running;
  if(key == 'r')
    reset();
}

void reset()
{
  frameCount = -1;
  t = 0;
  lineColor.clear();
  strokes.clear();
  points.clear();
  minim.stop();
  minim = new Minim(this);
  if(SoundOn)
    player.loop();
  scale = DefaultScale;
}

float updateT(float T)
{
  T += 0.004;
  
  if(T >= 154.207) {
    strokes.add(1);
    lineColor.add(color(0,0,0));
    return 52 * PI;
  }
  if(T >= 150.889 && T < 154.207) { //RIGHT ARM
    strokes.add(3);
    lineColor.add(yellow);
    return T + 0.004;
  }
  if(T >= 144.501 && T < 150.889) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 150.889;
  }
  if(T >= 141.447 && T < 144.501) { //LEFT ARM
    strokes.add(3);
    lineColor.add(yellow);
    return T + 0.004;
  }
  if(T >= 131.932 && T < 141.447) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 141.447;
  }
  if(T >= 128.960 && T < 131.932) { //MOUTH
    strokes.add(2);
    //if(T > 128.960 && T < 131.700)
    // T = 131.700;
    lineColor.add(pink);
    return T + 0.008;
  }
  if(T >= 119.361 && T < 128.960) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 128.960;
  }
  if(T >= 113.137 && T < 119.361) { //RIGHT EYEBALL
    strokes.add(1);
    lineColor.add(white);
    return T + 0.018;
  }
  if(T >= 106.797 && T < 113.137) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 113.137;
  }
  if(T >= 100.517 && T < 106.797) { //LEFT EYEBALL
    strokes.add(1);
    lineColor.add(white);
    return T + 0.018;
  }
  if(T >= 93.99 && T < 100.517) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 100.517;
  }
  if(T >= 88.288 && T < 93.99) { //CHIN
    strokes.add(6);
    lineColor.add(darkYellow);
    return T + 0.012;
  }
  if(T >= 81.665 && T < 88.288) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 88.288;
  }
  if(T >= 75.454 && T < 81.665) { //NOSE
    strokes.add(4);
    lineColor.add(black);
    return T + 0.01;
  }
  if(T >= 69.106 && T < 75.454) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 75.454;
  }
  if(T >= 62.841 && T < 69.106) { //TAIL
    strokes.add(3);
    if(T < 65.540) //YELLOW
      lineColor.add(yellow);
    else if(T < 66.589) //BROWN
      lineColor.add(brown);
    else //YELLOW
      lineColor.add(yellow);
    return T + 0.006;
  }
  if(T >= 56.485 && T < 62.841) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 62.841;
  }
  if(T >= 50.298 && T < 56.485) { //RIGHT BLUSH
    strokes.add(3);
    if(53.818 < T && T < 54.633)
      T = 54.633;
    lineColor.add(red);
    return T + 0.007;
  }
  if(T >= 43.882 && T < 50.298) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 50.298;
  }
  if(T >= 37.755 && T < 43.882) { //LEFT BLUSH
    strokes.add(3);
    lineColor.add(red);
    return T + 0.007;
  }
  if(T >= 31.409 && T < 37.755) { //SKIP
    strokes.add(2);
    lineColor.add(white);
    return 37.755;
  }
  if(T >= 25.233 && T < 31.409) { //RIGHT EYE
    strokes.add(2);
    lineColor.add(black);
    return T + 0.01;
  }
  if(T >= 18.815 && T < 25.233) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 25.233;
  }
  if(T >= 12.585 && T < 18.815) { //LEFT EYE
    strokes.add(2);
    lineColor.add(black);
    return T + 0.01;
  }
  if(T >= 6.284 && T < 12.585) { //SKIP
    strokes.add(1);
    lineColor.add(white);
    return 12.585;
  }
  else { //BODY
    strokes.add(4);
    if(T < 3.412) //YELLOW
      lineColor.add(yellow);
    else if(T < 3.804) //BLACK
      lineColor.add(black);
    else if(T < 4.72) //YELLOW
      lineColor.add(yellow);
    else if(T < 5.100) //BLACK
      lineColor.add(black);
    else //YELLOW
      lineColor.add(yellow);
  }
  return T;
}

void draw()
{ 
  if(frameCount < 10) return;
  if(t <= 52 * PI && running)
  {
    for(int z = 0; z<SampleRate; z++) {
      t = updateT(t);
      if(x(t) == 0 && y(t) == 0) continue;
      points.add(new PVector(x(t), -y(t)));
      if(DEBUGGING)
        print(t + "\n");
    }
  } else {
    if(!DEBUGGING)
      scale += 0.001;
  }
  
  translate(width/2 + 100, height/2);
  background(0);
  
  beginShape();
  for(int i = 0; i < points.size(); i++)
  {
    strokeWeight(strokes.get(i));
    stroke(lineColor.get(i));
    point(points.get(i).x * scale, points.get(i).y * scale);
  }
  endShape();
}

float sgn(float x)
{
  if(x == 0) return 0;
  else if(x > 0) return 1;
  else return -1;
}

float theta(float x)
{
  if(x == 0) return 0.5;
  else if(x > 0) return 1;
  else return 0;
}

float SIN(float x)
{
  return sin(x);
}

float x(float t)
{
  return ((-1.0/4*sin(10.0/7 - 23*t) - 3.0/10*sin(4.0/3 - 22*t) - 2.0/5*sin(7.0/5 - 19*t) - 1.0/5*
  sin(7.0/5 - 16*t) - 3.0/7*sin(10.0/7 - 15*t) - 3.0/8*sin(13.0/9 - 9*t) - 19.0/13*sin(11.0/7 - 3*t) + 
  222.0/5*sin(t + 11.0/7) + 41.0/2*sin(2*t + 11.0/7) + 34.0/9*sin(4*t + 11.0/7) + 1.0/3*sin(5*t + 8.0/5) 
  + 3.0/8*sin(6*t + 8.0/5) + 12.0/7*sin(7*t + 13.0/8) + 11.0/7*sin(8*t + 13.0/8) + 1.0/4*sin(10*t + 20.0/13) 
  + 2.0/9*sin(11*t + 16.0/9) + 3.0/8*sin(12*t + 8.0/5) + 1.0/3*sin(13*t + 7.0/4) + 1.0/2*sin(14*t + 17.0/10)
  + 5.0/7*sin(17*t + 17.0/10) + 1.0/28*sin(18*t + 9.0/2) + 1.0/2*sin(20*t + 12.0/7) + 3.0/7*sin(21*t + 16.0/9)
  + 6.0/11*sin(24*t + 7.0/4) - 979.0/9)*theta(51*PI -t)*theta(t - 47*PI) + (-6.0/5*sin(14.0/9 - 22*t) - 
  1.0/9*sin(7.0/5 - 19*t) - 9.0/8*sin(14.0/9 - 18*t) - 1.0/14*sin(15.0/11 - 15*t) - 6.0/5*sin(11.0/7 - 12*t)
  - 7.0/6*sin(11.0/7 - 8*t) - 29.0/10*sin(11.0/7 - 6*t) - 104.0/3*sin(11.0/7 - 2*t) + 415.0/18*sin(t + 11.0/7)
  + 71.0/18*sin(3*t + 11.0/7) + 19.0/8*sin(4*t + 33.0/7) + 22.0/21*sin(5*t + 8.0/5) + 3.0/8*sin(7*t + 61.0/13)
  + 5.0/9*sin(9*t + 11.0/7) + 1.0/8*sin(10*t + 14.0/3) + 4.0/7*sin(11*t + 11.0/7) + 4.0/11*sin(13*t + 14.0/3) 
  + 1.0/7*sin(14*t + 14.0/3) + 2.0/7*sin(16*t + 5.0/3) + 1.0/6*sin(17*t + 5.0/3) + 6.0/7*sin(20*t + 8.0/5) +
  1.0/7*sin(21*t + 5.0/3) + 1.0/6*sin(23*t + 8.0/5) - 2765.0/8)*theta(47*PI -t)*theta(t - 43*PI) + (1189.0/22
  *sin(t + 11.0/7) + 3.0/4*sin(2*t + 13.0/8) + 11.0/2*sin(3*t + 8.0/5) + 2.0/7*sin(4*t + 17.0/7) + 22.0/9*
  sin(5*t + 18.0/11) + 1.0/4*sin(6*t + 17.0/7) + 16.0/17*sin(7*t + 20.0/11) + 1.0/5*sin(8*t + 29.0/9) - 
  1627.0/7)*theta(43*PI -t)*theta(t - 39*PI) + (-3.0/7*sin(1.0/18 - 5*t) - 3.0/4*sin(1.0/2 - 3*t) + 109.0/9*
  sin(t + 13.0/10) + 5.0/8*sin(2*t + 11.0/3) + 5.0/9*sin(4*t + 10.0/3) + 3.0/10*sin(6*t + 21.0/8) + 2.0/9*
  sin(7*t + 2.0/3) + 1.0/4*sin(8*t + 23.0/8) - 1190.0/9)*theta(39*PI -t)*theta(t - 35*PI) + (188.0/21*
  sin(t + 27.0/28) + 2.0/5*sin(2*t + 17.0/6) + 2.0/3*sin(3*t + 91.0/23) + 3.0/8*sin(4*t + 53.0/18) + 2.0/11*
  sin(5*t + 1.0/7) - 369)*theta(35*PI -t)*theta(t - 31*PI) + (-8.0/9*sin(1.0/10 - 12*t) - 34.0/9*
  sin(10.0/9 - 6*t) - 137.0/10*sin(5.0/7 - 2*t) + 26.0/5*sin(t + 13.0/4) + 118.0/5*sin(3*t + 11.0/8) + 43.0/8*
  sin(4*t + 13.0/7) + 49.0/6*sin(5*t + 11.0/12) + 22.0/5*sin(7*t + 13.0/4) + 17.0/16*sin(8*t + 1.0/7) + 5.0/4*
  sin(9*t + 1.0/4) + 5.0/7*sin(10*t + 17.0/5) + 29.0/15*sin(11*t + 5.0/6) - 1915.0/8)*theta(31*PI -t)*
  theta(t - 27*PI) + (-2.0/7*sin(10.0/7 - 7*t) -sin(1.0/27 - 4*t) + 68.0/7*sin(t + 44.0/15) + 76.0/9*
  sin(2*t + 37.0/10) + 30.0/7*sin(3*t + 1) + 8.0/9*sin(5*t + 3.0/2) + 4.0/5*sin(6*t + 31.0/8) + 3.0/7*
  sin(8*t + 10.0/3) + 6.0/13*sin(9*t + 8.0/7) + 1.0/3*sin(10*t + 31.0/9) - 2135.0/9)*theta(27*PI -t)*
  theta(t - 23*PI) + (-3.0/8*sin(1.0/4 - 23*t) - 3.0/5*sin(1.0/8 - 22*t) - 13.0/8*sin(5.0/4 - 20*t) - 9.0/7*
  sin(3.0/2 - 16*t) - 41.0/5*sin(4.0/3 - 4*t) + 768.0/7*sin(t + 11.0/5) + 109.0/5*sin(2*t + 16.0/7) + 
  150.0/13*sin(3*t + 11.0/6) + 33.0/7*sin(5*t + 97.0/24) + 23.0/4*sin(6*t + 5.0/7) + 69.0/7*sin(7*t + 9.0/8) 
  + 32.0/5*sin(8*t + 21.0/5) + 7.0/6*sin(9*t + 22.0/9) + 28.0/5*sin(10*t + 5.0/6) + 43.0/10*sin(11*t + 26.0/7)
  + 14.0/9*sin(12*t + 5.0/11) + 13.0/9*sin(13*t + 40.0/9) + 11.0/6*sin(14*t + 2.0/5) + 3.0/2*
  sin(15*t + 17.0/10) + 7.0/11*sin(17*t + 4.0/3) + 3.0/8*sin(18*t + 31.0/10) + 4.0/7*sin(19*t + 14.0/9) + 
  6.0/5*sin(21*t + 17.0/7) + 4.0/7*sin(24*t + 27.0/8) + 1006.0/11)*theta(23*PI -t)*theta(t - 19*PI) + 
  (-63.0/8*sin(2.0/7 - 8*t) - 38.0/13*sin(11.0/9 - 6*t) - 14.0/5*sin(1.0/17 - 4*t) + 77.0/9*sin(t + 1.0/2) + 
  52.0/7*sin(2*t + 10.0/3) + 22.0/9*sin(3*t + 76.0/17) + 21.0/8*sin(5*t + 26.0/7) + 3*sin(7*t + 15.0/8) + 
  64.0/7*sin(9*t + 57.0/14) + 6*sin(10*t + 17.0/6) - 544.0/7)*theta(19*PI -t)*theta(t - 15*PI) + (-37.0/10*
  sin(4.0/7 - 5*t) - 3*sin(3.0/7 - 3*t) + 24.0/7*sin(t + 7.0/6) + 9.0/7*sin(2*t + 2.0/5) + 31.0/15*sin(4*t + 
  37.0/8) + 9.0/5*sin(6*t + 12.0/5) + 59.0/12*sin(7*t + 13.0/6) + 15.0/7*sin(8*t + 25.0/8) + 134.0/15*sin(9*t 
  + 7.0/3) + 73.0/8*sin(10*t + 1.0/5) - 4406.0/11)*theta(15*PI -t)*theta(t - 11*PI) + (236.0/7*sin(t + 6.0/5)
  + 1.0/2*sin(2*t + 47.0/12) - 627.0/5)*theta(11*PI -t)*theta(t - 7*PI) + (69.0/2*sin(t + 5.0/6) - 715.0/2)
  *theta(7*PI -t)*theta(t - 3*PI) + (-19.0/9*sin(6.0/5 - 21*t) - 37.0/10*sin(7.0/9 - 19*t) - 23.0/8*sin(1 - 
  17*t) - 16.0/3*sin(7.0/6 - 16*t) - 29.0/5*sin(1.0/5 - 9*t) - 919.0/11*sin(1.0/7 - 3*t) + 1573.0/6*sin(t + 
  91.0/45) + 214.0/5*sin(2*t + 33.0/8) + 421.0/14*sin(4*t + 13.0/8) + 61.0/6*sin(5*t + 19.0/5) + 401.0/16*
  sin(6*t + 43.0/14) + 511.0/51*sin(7*t + 35.0/8) + 144.0/7*sin(8*t + 5.0/6) + 137.0/10*sin(10*t + 25.0/13) + 
  18.0/7*sin(11*t + 15.0/7) + 17.0/9*sin(12*t + 41.0/9) + 9.0/7*sin(13*t + 13.0/7) + 29.0/10*sin(14*t + 22.0/7)
  + 25.0/8*sin(15*t + 1.0/4) + 12.0/5*sin(18*t + 11.0/8) + 14.0/5*sin(20*t + 27.0/7) + 13.0/8*sin(22*t + 12.0/7)
  + 7.0/6*sin(23*t + 7.0/9) + 26.0/11*sin(24*t + 23.0/7) - 1891.0/8)*theta(3*PI -t)*theta(t +PI))*
  theta(sqrt(sgn(sin(t/2))));
}

float y(float t)
{
  return ((-8.0/11*sin(11.0/8 - 22*t) - 1.0/2*sin(10.0/7 - 21*t) + 67.0/6*sin(t + 33.0/7) + 1478.0/29*
  sin(2*t + 11.0/7) + 3.0/5*sin(3*t + 30.0/7) + 26.0/3*sin(4*t + 11.0/7) + 1.0/6*sin(5*t + 13.0/9) + 
  30.0/29*sin(6*t + 8.0/5) + 2.0/5*sin(7*t + 14.0/3) + 88.0/29*sin(8*t + 8.0/5) + 1.0/4*sin(9*t + 31.0/7)
  + 11.0/8*sin(10*t + 8.0/5) + 1.0/16*sin(11*t + 9.0/2) + 1.0/12*sin(12*t + 5.0/4) + 1.0/10*sin(13*t + 
  25.0/11) + 11.0/8*sin(14*t + 18.0/11) + 2.0/7*sin(15*t + 37.0/8) + 1.0/6*sin(16*t + 11.0/8) + 2.0/9*
  sin(17*t + 5.0/3) + 1.0/5*sin(18*t + 17.0/10) + 1.0/13*sin(19*t + 19.0/8) + 23.0/24*sin(20*t + 12.0/7) 
  + 7.0/11*sin(23*t + 9.0/5) + 9.0/7*sin(24*t + 7.0/4) - 1538.0/7)*theta(51*PI -t)*theta(t - 47*PI) + 
  (-2.0/7*sin(20.0/13 - 23*t) - 1.0/6*sin(3.0/2 - 20*t) - 5.0/7*sin(20.0/13 - 17*t) - 1.0/9*sin(20.0/13 
  - 11*t) - 1.0/6*sin(13.0/9 - 9*t) - 19.0/6*sin(17.0/11 - 3*t) + 263.0/5*sin(t + 11.0/7) + 614.0/15*
  sin(2*t + 11.0/7) + 87.0/10*sin(4*t + 11.0/7) + 1.0/7*sin(5*t + 11.0/8) + 19.0/11*sin(6*t + 11.0/7) + 
  7.0/5*sin(7*t + 11.0/7) + 4.0/3*sin(8*t + 8.0/5) + 9.0/5*sin(10*t + 14.0/9) + 4.0/7*sin(12*t + 8.0/5) 
  + 3.0/11*sin(13*t + 3.0/2) + 1.0/8*sin(14*t + 22.0/15) + 1.0/9*sin(15*t + 12.0/7) + 6.0/5*sin(16*t + 
  11.0/7) + 2.0/9*sin(18*t + 11.0/7) + 3.0/5*sin(19*t + 8.0/5) + 1.0/26*sin(21*t + 15.0/11) + 6.0/7*
  sin(22*t + 8.0/5) - 1867.0/8)*theta(47*PI -t)*theta(t - 43*PI) + (118.0/39*sin(t + 11.0/7) + 40.0/7*
  sin(2*t + 33.0/7) + 49.0/25*sin(3*t + 14.0/3) + 12.0/5*sin(4*t + 8.0/5) + 1.0/9*sin(5*t + 32.0/13) + 
  5.0/2*sin(6*t + 13.0/8) + 2.0/5*sin(7*t + 22.0/5) + 3.0/4*sin(8*t + 7.0/4) - 143.0/10)*theta(43*PI -t)
  *theta(t - 39*PI) + (-1.0/8*sin(2.0/3 - 8*t) - 1.0/2*sin(7.0/5 - 2*t) - 246.0/19*sin(1.0/7 -t) + 1.0/4
  *sin(3*t + 33.0/16) + 1.0/6*sin(4*t + 17.0/6) + 1.0/5*sin(5*t + 31.0/7) + 1.0/11*sin(6*t + 50.0/17) + 
  1.0/8*sin(7*t + 30.0/7) + 665.0/6)*theta(39*PI -t)*theta(t - 35*PI) + (-119.0/10*sin(7.0/15 -t) + 
  2.0/11*sin(2*t + 25.0/7) + 2.0/9*sin(3*t + 5.0/8) + 1.0/5*sin(4*t + 33.0/7) + 1.0/4*sin(5*t + 19.0/10) + 
  1023.0/10)*theta(35*PI -t)*theta(t - 31*PI) + (-1.0/7*sin(2.0/7 - 12*t) - 1.0/8*sin(3.0/10 - 5*t) + 
  25.0/7*sin(t + 77.0/17) + 355.0/59*sin(2*t + 41.0/40) + 27.0/5*sin(3*t + 46.0/15) + 33.0/7*sin(4*t + 
  11.0/3) + 27.0/10*sin(6*t + 13.0/9) + 5.0/11*sin(7*t + 11.0/5) + 5.0/8*sin(8*t + 3) + 8.0/5*sin(9*t + 
  16.0/15) + 16.0/15*sin(10*t + 1.0/7) + 7.0/9*sin(11*t + 12.0/5) - 862.0/7)*theta(31*PI -t)*theta(t - 
  27*PI) + (-1.0/3*sin(5.0/4 - 8*t) - 2.0/5*sin(5.0/9 - 7*t) - 5.0/7*sin(11.0/8 - 5*t) - 7.0/2*sin(15.0/14 
  - 2*t) + 29.0/8*sin(t + 41.0/10) + 11.0/6*sin(3*t + 13.0/3) + 7.0/6*sin(4*t + 1.0/27) + 2.0/7*sin(6*t +
  8.0/7) + 1.0/9*sin(9*t + 9.0/5) + 2.0/7*sin(10*t + 1.0/10) + 201.0/5)*theta(27*PI -t)*theta(t - 23*PI) 
  + (-4.0/11*sin(8.0/9 - 12*t) - 10.0/7*sin(19.0/13 - 10*t) + 623.0/3*sin(t + 10.0/7) + 39.0/5*sin(2*t + 
  10.0/11) + 251.0/9*sin(3*t + 4.0/3) + 5.0/7*sin(4*t + 4.0/3) + 61.0/6*sin(5*t + 4.0/3) + 14.0/9*sin(6*t 
  + 23.0/7) + 76.0/25*sin(7*t + 9.0/7) + 3.0/4*sin(8*t + 1.0/4) + 19.0/5*sin(9*t + 3.0/2) + 17.0/6*sin(11*t 
  + 6.0/5) + 13.0/8*sin(13*t + 14.0/13) + 8.0/9*sin(14*t + 17.0/6) + 24.0/25*sin(15*t + 1.0/2) + 1.0/6*
  sin(16*t + 13.0/8) + 5.0/8*sin(17*t + 1) + 1.0/7*sin(18*t + 18.0/17) + 6.0/7*sin(19*t + 1) + 1.0/4*
  sin(20*t + 4.0/9) + 2.0/7*sin(21*t + 7.0/5) + 1.0/3*sin(22*t + 8.0/7) + 2.0/5*sin(23*t + 1.0/26) + 2.0/11*
  sin(24*t + 8.0/7) - 243.0/8)*theta(23*PI -t)*theta(t - 19*PI) + (-111.0/10*sin(4.0/5 - 9*t) - 12.0/5*
  sin(7.0/13 - 2*t) + 1.0/6*sin(t + 48.0/11) + 13.0/8*sin(3*t + 27.0/7) + 71.0/24*sin(4*t + 6.0/11) + 22.0/9
  *sin(5*t + 7.0/2) + 19.0/7*sin(6*t + 8.0/17) + 20.0/7*sin(7*t + 34.0/9) + 55.0/7*sin(8*t + 6.0/5) + 64.0/9
  *sin(10*t + 38.0/9) + 27.0/5)*theta(19*PI -t)*theta(t - 15*PI) + (-22.0/7*sin(4.0/3 - 8*t) - 19.0/7*
  sin(20.0/13 - 6*t) + 38.0/13*sin(t + 1.0/24) + 12.0/11*sin(2*t + 5.0/9) + 26.0/7*sin(3*t + 7.0/9) + 
  11.0/5*sin(4*t + 12.0/11) + 37.0/10*sin(5*t + 17.0/10) + 51.0/10*sin(7*t + 10.0/3) + 33.0/4*sin(9*t + 
  26.0/7) + 41.0/5*sin(10*t + 9.0/5) - 27.0/2)*theta(15*PI -t)*theta(t - 11*PI) + (-172.0/5*sin(3.0/8 -t) 
  + 5.0/4*sin(2*t + 7.0/2) + 2303.0/24)*theta(11*PI -t)*theta(t - 7*PI) + (441.0/5 - 455.0/12*
  sin(7.0/9 -t))*theta(7*PI -t)*theta(t - 3*PI) + (-1.0/3*sin(1.0/20 - 18*t) - 7.0/5*sin(7.0/9 - 17*t) - 
  18.0/11*sin(2.0/5 - 14*t) - 24.0/5*sin(1.0/13 - 9*t) + 2767.0/7*sin(t + 11.0/3) + 229.0/5*
  sin(2*t + 17.0/7) + 313.0/8*sin(3*t + 22.0/5) + 32.0/3*sin(4*t + 22.0/5) + 169.0/6*sin(5*t + 21.0/8) + 
  23.0/7*sin(6*t + 26.0/11) + 21.0/2*sin(7*t + 5.0/6) + 55.0/6*sin(8*t + 14.0/5) + 212.0/13*sin(10*t + 
  24.0/7) + 26.0/9*sin(11*t + 9.0/2) + 16.0/5*sin(12*t + 25.0/6) + 35.0/17*sin(13*t + 4.0/11) + 15.0/8*
  sin(15*t + 7.0/10) + 2.0/3*sin(16*t + 20.0/9) + 16.0/7*sin(19*t + 4.0/5) + 13.0/7*sin(20*t + 29.0/7) + 
  14.0/3*sin(21*t + 7.0/5) + 4.0/3*sin(22*t + 7.0/4) + 12.0/7*sin(23*t + 34.0/33) + 7.0/4*sin(24*t + 
  27.0/7) - 211.0/5)*theta(3*PI -t)*theta(t +PI))*theta(sqrt(sgn(sin(t/2))));
}
