
import 'dart:io';

void main(){
  const vowel = 'aeiouAEIOU';

  var input = stdin.readLineSync();
  var res   = '';

  for(var i = 0; i <= input.length - 1; i++) {
    if(vowel.contains(input[i])) {
      res += input[i];
    }
  }

  print(res);
}

