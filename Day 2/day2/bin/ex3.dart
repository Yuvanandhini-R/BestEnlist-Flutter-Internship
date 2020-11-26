
import 'dart:io';

void main() {
  var input = stdin
    .readLineSync()
    .split(' ')
    .map((String s) => int.parse(s))
    .toList();

  var evenNums = <int>[];
  var oddNums = <int>[];
  var primeNums = <int>[];

  for(var i = 0; i < input.length; i++) {
    var isPrime = true;

    if(input[i] == 1) {
      isPrime = false;
    }

    if(input[i] % 2 == 0) {
      evenNums.add(input[i]);

      if(input[i] != 2) {
        isPrime = false;
      }
    } else if(input[i] % 2 != 0) {
      oddNums.add(input[i]);
    }

    if(isPrime) {
      if(input[i] == 2) {
        primeNums.add(2);
      } else {
        conclude:
        for(var j = 3; j <= input[i] / 2; j += 2) {
          if(input[i] % j == 0) {
            isPrime = false;
            break conclude;
          }
        }

        if(isPrime) {
          primeNums.add(input[i]);
        }
      }
    }
  }

  print('Even Numbers in the input are $evenNums');
  print('Odd Numbers in the input are $oddNums');
  print('Prime Numbers in the input are $primeNums');
}

