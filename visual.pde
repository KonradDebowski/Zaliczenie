import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*; //inicjalizacja biblioteki wykorzystanej do wizualizacji dźwięku


Minim minim;            //obiekt z biblioteki minim
AudioPlayer player;     //odtwarzacz audio z biblioteki minim
FFT fft;                //zmienna służąca do zamiany danych na częstotliwość (liczbę) przy pomocy fast fourier transformation 

PImage fade;            //zmienna przechowująca zrzut ekranu 
float minusWidth,minusHeight; //zmienne służące do zmiejszenia zrzutu ekranu w celu uzyskania pseudo 3d
int hue = 0;             // zmienna wspomagająca zmiany kolorów

void setup() {
size(500,250);
background(0);

minim = new Minim(this);
player = minim.loadFile("taylor.mp3",1024);
fft = new FFT(player.bufferSize(),player.sampleRate());
fft.logAverages(11,1);            //uśrednienie sczytanych częstotliwości do kilku zakresów
fade = get(0,0, width,height);    //bo w tej metodzie wizualizacji nie jest konieczna ich tak duża liczba jak np. przy oscyloskopie
minusWidth = width*0.99;
minusHeight = height*0.99;
}

void mousePressed() {          //kliknięcie lewym przyciskiem myszki uruchamia odtwarzacz
if (player.isPlaying()) {
player.pause();                //ponowne kliknięcie w trakcie odtwarzania działa jak pauza
} else {
player.loop();
}
}

void draw() {
background(0);
noStroke();
tint(255,255,255,240);                                            //konieczne do zaciemniania starszych zrzutów ekranu
image(fade,(width-minusWidth)/2,(height-minusHeight)/2,minusWidth,minusHeight);   //zmniejszanie zrzutów -> pseudo 3d                                           
smooth();
colorMode(HSB);
fill(hue, 255,255);                                               //wszelkie zabawy kolorami i trybami mają znaczenie estetyczne
colorMode(RGB);                                                   //w innych kombinacjach wychodziły okropne szaro-bure kompozycje
fft.forward(player.mix);
float step = width/11;                                            //liczba prostokątów w wizualizacji

for (int i =0; i < 11; i++) {                                     //pętla for  
  float value = fft.getAvg(i)*2;                                    
  rect(step * i,height-value,step,value);                          //rysująca wizualizację  
  fade = get(0,0,width,height);                                     //zrzucająca ekran do zmiennej fade 
  hue +=1;                                                        //zmieniająca kolor wizualizacji
  
    if(hue>255)                                                     //pętla if
    {
      hue=0;                                                        //zapętlająca zmiany kolorów
    }

}
}
