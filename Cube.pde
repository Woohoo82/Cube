int[] a = {0, 1, 3, 2, 0, 1, 3, 2, 4, 5, 7, 6};
int[] b = {1, 3, 2, 0, 4, 5, 7, 6, 5, 7, 6, 4};
int n = 12;
int x, y;
float S = 20.0;
float angle = 0.0;
float[] p = {0, 0, 0};

void setup(){
  size(640, 360);
  stroke(100);
}

void transform(float angle, int t1, int t2){
  float s = sin(angle);
  float c = cos(angle);
  float q1 = p[t1] * c - p[t2] * s;
  float q2 = p[t1] * s + p[t2] * c;
  p[t1] = q1;
  p[t2] = q2;
}

void getXY(int n) {
  int k = n;
  for (int j=0; j<3; j++) {
    p[j] = ((k % 2)==1 ? 1 : -1) * S;
    k = k / 2;
  }
  transform(angle,     0, 2);
  transform(angle/3.0, 1, 2);
  p[2] += 200.0;
  p[0] *= 500.0 / p[2];
  p[1] *= 500.0 / p[2];
  x = round(p[0]) + width  / 2;
  y = round(p[1]) + height / 2;
}

void draw(){
  background(0);
  for (int i=0; i<n; i++) {
    int ax, ay;
    getXY(a[i]);
    ax = x; ay = y;
    getXY(b[i]);
    line(ax, ay, x, y);
  }
  angle += 0.01;
}