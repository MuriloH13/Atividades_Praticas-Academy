import 'dart:math';

void main() {
  int random1 = Random().nextInt(100), random2 = Random().nextInt(100);
  print("$random1 $random2");
  final temp = random1;
  random1 = random2;
  random2 = temp;
  print("$random1 $random2");
}
