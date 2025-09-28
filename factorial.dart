void main(List<String> args) {
  int num = 1;
  int originalNum = num;
  int temp = 1;
  if(num != 0){
  print("$originalNum! is equal to = $temp");
  while(num > 1){
    temp = num*temp;
    num--;
  }
  }else if(num == 0){
    print("0! is equal to 1");
  }else{
    print("invalid num");
  }
}