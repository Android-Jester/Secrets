//libraries
import 'dart:math';


// class Encryption {
//   // ignore: non_constant_identifier_names
//   Encryption({this.decoded_message, this.decoded_key1, this.decoded_key2});
//   // ignore: non_constant_identifier_names
//   static String encoded_message, encoded_key1, encoded_key2;
//
//   // ignore: non_constant_identifier_names
//   final String decoded_message, decoded_key1, decoded_key2;
//
//   int sqrrt(int number) {
//   double temp1;
//   for (var m = 1.0; (m * m) <= number; m += 0.00001) {
//     temp1 = m;
//   }
//   return temp1.round();
// }
//
// int letter(String lett) {
//   switch (lett) {
//     case '0':
//       return 0;
//       break;
//     case '1':
//       return 1;
//       break;
//     case '2':
//       return 2;
//       break;
//     case '3':
//       return 3;
//       break;
//     case '4':
//       return 4;
//       break;
//     case '5':
//       return 5;
//       break;
//     case '6':
//       return 6;
//       break;
//     case '7':
//       return 7;
//       break;
//     case '8':
//       return 8;
//       break;
//     case '9':
//       return 9;
//       break;
//     case 'A':
//       return 10;
//       break;
//     case 'B':
//       return 11;
//       break;
//     case 'C':
//       return 12;
//       break;
//     case 'D':
//       return 13;
//       break;
//     case 'E':
//       return 14;
//       break;
//     case 'F':
//       return 15;
//       break;
//     default:
//       return 0;
//       break;
//   }
// }
//
// bool isNumeric(String s) {
//   if (s == null) {
//     return false;
//   }
//   return double.tryParse(s) != null;
// }
//
// //encryption function
// String encrypt(String plain) {
//   var hex = [
//     '0',
//     '1',
//     '2',
//     '3',
//     '4',
//     '5',
//     '6',
//     '7',
//     '8',
//     '9',
//     'A',
//     'B',
//     'C',
//     'D',
//     'E',
//     'F'
//   ]; //characters to store hex values
//   int temp5extra, temp1, j = 0, temp7, temp3;
//   var temp6;
//   var tt = plain.length;
//   var record = List(tt);
//   double temp2, temp4;
//   String converted = '', rec = '', temp5;
//
//   //generate random numbers for keys
//   temp7 = Random().nextInt(1000);
//   for (var i = 0; i < plain.length; i++) {
//     //generate random letters for key1
//     temp6 = Random().nextInt(26);
//     temp5extra = (97 + temp6);
//     temp5 = String.fromCharCode(temp5extra);
//
//     //convert message to ascii
//     temp1 = plain.codeUnitAt(i);
//     //store position of spaces inputted in key1 add randomly generated letters to it
//     if (temp1 == 32) {
//       record[j] = i - j;
//       rec = rec + (record[j]).toString() + temp5;
//       j++;
//       continue;
//     }
//     //math operations on message
//     temp1 = temp1 * temp1;
//     temp1 = temp1 -
//         temp7; //subtract randomly generated number from message (key2)
//
//     //store encrypted message
//     while (temp1 > 0) {
//       temp2 = temp1 / 16.0;
//       temp3 = temp2.toInt();
//       temp2 = temp2 - temp3;
//       temp4 = temp2 * 16;
//       converted = converted + hex[temp4.round()];
//       temp1 = temp3.round();
//     }
//   }
//   encoded_message = converted;
//   encoded_key1 = rec;
//   encoded_key2 = temp7.toString();
//
//   //print encrypted message with keys
//   print('Message: ' + converted);
//   print('Key1: ' + rec);
//   print('Key3: ' + temp7.toString());
//
//   return converted;
// }
//
//
// //decryption system
// String decrypt(String cypher, String key1, int key2) {
//   int temp2 = 16,
//       temp3 = pow(16, 2),
//       temp4 = pow(16, 3),
//       temp9 = 0,
//       temp11,
//       temp12 = 0;
//   var temp6 = List(40000);
//   var temp1a = List(10000);
//   var temp8 = List(10000);
//   var temp5 = '', temp15 = '';
//   var deciphered = '';
//   var temp7;
//
//   //Get numbers from key1
//   for (var i = 0; i < key1.length; i++) {
//     if (isNumeric(key1[i])) {
//       temp15 = temp15 + key1[i].toString();
//       continue;
//     }
//
//     temp1a[temp9] = int.parse(temp15);
//     temp9++;
//     temp15 = '';
//   }
//   //reverse order of Key1
//   temp11 = temp9 - 1;
//   for (var i = 0; i < temp9; i++) {
//     temp8[i] = temp1a[temp11];
//     temp11--;
//   }
//
//   //stores encrypted message in reverse
//   for (var i = 0; i < cypher.length; i++) {
//     temp5 = cypher[i] + temp5;
//   }
//   //converts encrypted message in hex to numeric equivalent
//   for (var i = 1; i <= cypher.length; i++) {
//     temp6[i - 1] = letter(temp5[i - 1]);
//   }
//
//   //decryption works on a four character system so this converts four hex characters together back to one original text character
//   var temp13extra = cypher.length / 4;
//   var temp13 = temp13extra.toInt();
//
//   for (var i = 0; i < cypher.length; i += 4) {
//     temp7 = (temp6[i] * temp4) +
//         (temp6[i + 1] * temp3) +
//         (temp6[i + 2] * temp2) +
//         (temp6[i + 3]);
//     temp7 = temp7 + key2;
//     temp7 = sqrrt(temp7);
//     int metn = temp7.round();
//     var men = String.fromCharCode(metn);
//     if (temp13 == temp8[temp12]) {
//       deciphered = men +
//           ' ' +
//           deciphered; //store space if encountered with next letter
//       temp12++;
//     } else {
//       deciphered = men + deciphered; //store character
//     }
//     temp13--;
//   }
// return deciphered;
//   //print plain message
// }
// }


class Encrypted {
  static String encoded_message, decoded_message, key1, key2 = "";

//personal square root function
  int sqrrt(int number)
  {
    double temp1;
    for(var m = 1.0; (m * m) <= number; m += 0.00001) {
      temp1 = m;
    }
    return temp1.round();
  }

  int letter(String lett)
  {
    switch(lett)
    {
      case '0':
        return 0;
        break;
      case '1':
        return 1;
        break;
      case '2':
        return 2;
        break;
      case '3':
        return 3;
        break;
      case '4':
        return 4;
        break;
      case '5':
        return 5;
        break;
      case '6':
        return 6;
        break;
      case '7':
        return 7;
        break;
      case '8':
        return 8;
        break;
      case '9':
        return 9;
        break;
      case 'A':
        return 10;
        break;
      case 'B':
        return 11;
        break;
      case 'C':
        return 12;
        break;
      case 'D':
        return 13;
        break;
      case 'E':
        return 14;
        break;
      case 'F':
        return 15;
        break;
      default:
        return 0;
        break;
    }
  }

  bool isNumeric(String s)
  {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }


//encryption function
  void encrypt(String Plain)
  {
    var hex = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'];     //characters to store hex values
    int temp5extra, temp1, j = 0, temp7, temp3;
    var temp6;
    var tt = Plain.length;
    var record = List(tt);
    double temp2, temp4;
    String converted = '', rec = '', temp5;

    //generate random numbers for keys
    temp7 = Random().nextInt(1000);
    for(var i = 0; i < Plain.length; i++)
    {
      //generate random letters for key1
      temp6 = Random().nextInt(26);
      temp5extra = (97 + temp6);
      temp5 = String.fromCharCode(temp5extra);

      //convert message to ascii
      temp1 = Plain.codeUnitAt(i);
      //store position of spaces inputted in key1 add randomly generated letters to it
      if(temp1 == 32){
        record[j] = i - j;
        rec = rec + (record[j]).toString() + temp5;
        j++;
        continue;
      }
      //math operations on message
      temp1 = temp1 * temp1;
      temp1 = temp1 - temp7; //subtract randomly generated number from message (key2)

      //store encrypted message
      while(temp1 > 0)
      {
        temp2 = temp1 / 16.0;
        temp3 = temp2.toInt();
        temp2 = temp2 - temp3;
        temp4 = temp2 * 16;
        converted = converted + hex[temp4.round()];
        temp1 = temp3.round();
      }
    }

    //print encrypted message with keys
    print(converted + '~' + rec + '~' + temp7.toString() + '~');
    encoded_message = converted + '~' + rec + '~' + temp7.toString() + "~";
  }

//decryption system
  void decrypt(String Cypher, String Key, int Key2)
  {
    int temp2 = 16, temp3 = pow(16, 2), temp4 = pow(16, 3), temp9 = 0, temp11, temp12 = 0;
    var temp6 = List(40000);
    var temp1a = List(10000);
    var temp8 = List(10000);
    var temp5 = '', temp15 = '';
    var de_converted = '';
    var temp7;

    //Get numbers from key1
    for(var i = 0; i < Key.length; i++)
    {
      if(isNumeric(Key[i]))
      {
        temp15 = temp15 + Key[i].toString();
        continue;
      }

      temp1a[temp9] = int.parse(temp15);
      temp9++;
      temp15 = '';
    }
    //reverse order of Key1
    temp11 = temp9 - 1;
    for(var i = 0; i < temp9; i++)
    {
      temp8[i] = temp1a[temp11];
      temp11--;
    }

    //stores encrypted message in reverse
    for(var i = 0; i < Cypher.length; i++)
    {
      temp5 = Cypher[i] + temp5;
    }
    //converts encrypted message in hex to numeric equivalent
    for(var i = 1; i <= Cypher.length; i++)
    {
      temp6[i - 1] = letter(temp5[i - 1]);
    }

    //decryption works on a four character system so this converts four hex characters together back to one original text character
    var temp13extra = Cypher.length / 4;
    var temp13 = temp13extra.toInt();

    for(var i = 0; i < Cypher.length; i += 4)
    {
      temp7 = (temp6[i] * temp4) + (temp6[i + 1] * temp3) + (temp6[i + 2] * temp2) + (temp6[i + 3]);
      temp7 = temp7 + Key2;
      temp7 = sqrrt(temp7);
      int metn = temp7.round();
      var men = String.fromCharCode(metn);
      if(temp13 == temp8[temp12])
      {
        de_converted = men + ' ' + de_converted; //store space if encountered with next letter
        temp12++;
      }
      else
      {
        de_converted = men + de_converted; //store character
      }
      temp13--;
    }
  decoded_message = de_converted;
    //print plain message
  }
//convert hex back to numeric equivalent

  void separator(String temp) {
    String CypherText, Key1;
    int Key2;
    var temp2 = '';
    int i = 0;
    int checker = 0;
    int men = temp.length;
    while(i < men)
    {
      if(temp[i].compareTo('~') != 0)
      {
        temp2 = temp2 + temp[i];
        if(i < men)  i++;
      }
      else {
        if(checker == 0)
        {
          CypherText = temp2;
          i++;
          temp2 = '';
          checker++;
        }
        else if(checker == 1)
        {
          Key1 = temp2;
          i++;
          temp2 = '';
          checker++;
        }
        else if(checker == 2)
        {
          Key2 = int.parse(temp2);
          break;
        }
      }
    }
    decrypt(CypherText, Key1, Key2);

  }

}