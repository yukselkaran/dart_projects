import 'dart:io';

void main(List<String> args) {
  print("Enter midterm grade for this lecture: ");
  int midtermGrade = int.parse(stdin.readLineSync()!);

  print("Enter percentage(%) that effect for midterm exam: ");
  int midtermPercentage = int.parse(stdin.readLineSync()!);

  print("Enter final grade for this lecture: ");
  int finalGrade = int.parse(stdin.readLineSync()!);

  print("Enter percentage(%) that effect for final exam: ");
  int finalPercentage = int.parse(stdin.readLineSync()!);

  print("Enter the passing grade for this course: ");
  double passingGrade = double.parse(stdin.readLineSync()!);

  double studentGrade = ( (midtermGrade * midtermPercentage) + (finalGrade * finalPercentage) ) / 100;
  if(studentGrade >= passingGrade){
    print("Congratulations, your grade is $studentGrade have been passed this course.");
  }else{
    print("Sorry, $studentGrade is not enough for passing this course you have been failed for this course.");
  }
}