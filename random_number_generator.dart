import 'dart:math';

void main(List<String> args) {
  List<int> randomNums = List<int>.filled(100, 0);
  for(int i=0;i<randomNums.length;i++){
    Random random = Random();
    randomNums[i] = random.nextInt(101);
  }
  print(randomNums);
  var withoutRepeat = Set.from(randomNums);
  print(withoutRepeat);
  print(withoutRepeat.length);
}