# Opis

Zadaniem programu jest wizualizacja zaladowanej uprzednio mp3 (w tym wypadku taylor.mp3).
Kliknicie lewym klawiszem myszki uruchamia odtwarzanie. Klikniecie w trakcie odtwarzania wstrzymuje je (pauza).
Zawarty w bibliotece minim algorytm fast fourier transformation przeksztalca dane sczytane z pliku na zakresy czestotliwosci (liczby). Te wartosci sa usredniane do kilku zakresow
te z kolei sa wykorzystywane do okreslenia wpólrzednych kolorowych prostokatów uzytych do wizualizacji utworu
żeby urozmaicić wizualizacje zastosowalem efekt pseudo 3d, który polega na tym, że
uprzednie realizacje wizualizacji sprawiaja wrazenie oddalania sie i stopniowego zanikania w tle.
Zmienne i petle sa opisane w kodzie programu (komentarze)
W przypadku wykorzystanego pliku .mp3 pojawia sie blad 
==== JavaSound Minim Error ====
==== Don't know the ID3 code APIC
ale nie wplywa na dzialanie programu. Wydaje mi sie, że odgrywaloby role przy odczytywaniu danych z tagów ID3.
