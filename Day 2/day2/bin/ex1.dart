
import 'dart:io';

void main() {
  var input = stdin.readLineSync();
  var result = '';

  for(var i = input.length - 1; i >= 0; i--) {
    result += input[i];
  }

  print(result);
}

