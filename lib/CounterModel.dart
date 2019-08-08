import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterModel with ChangeNotifier {
  int count = 0;
  var _countName;

  Map<String, String> ones = {
    "0": "Zero",
    "1": "One",
    "2": "Two",
    "3": "Three",
    "4": "Four",
    "5": "Five",
    "6": "Six",
    "7": "Seven",
    "8": "Eight",
    "9": "Nine",
    "10": "Ten",
    "11": "Eleven",
    "12": "Twelve",
    "13": "Thirteen",
    "14": "Forteen",
    "15": "Fifteen",
    "16": "Sixteen",
    "17": "Seventeen",
    "18": "Eighteen",
    "19": "Nineteen",
  };

  Map<String, String> tens = {
    "20": "Twenty",
    "30": "Thirty",
    "40": "Forty",
    "50": "Fifty",
    "60": "Sixty",
    "70": "Seventy",
    "80": "Eighty",
    "90": "Ninety",
  };

  get increment {
    count++;
    keyValues(count);
    notifyListeners();
  }

  getCounterModel() => _countName;

  void keyValues(int count) {
    var a = count.toString();

    if (ones.containsKey(a)) {
      for (var i = 0; i < ones.length; i++) {
        _countName = ones[a];

        break;
      }
    } else {
      String firstDigit() =>
          a.contains("0") ? a.substring(0, 1) : a.substring(0, 1) + "0";
      String secondDigit = a.substring(1);
      print("--------------${firstDigit()}----------- $secondDigit");

      if (tens.containsKey(firstDigit()) && ones.containsKey(secondDigit)) {
        for (var i = 0; i < tens.length; i++) {
          _countName = tens[firstDigit()] + " " + ones[secondDigit]; //-------
          print(tens[firstDigit()] + " " + ones[secondDigit]);

          break;
        }
      } else {
        var combineValue = firstDigit() + secondDigit;

        if (tens.containsKey(combineValue)) {
          _countName = tens[combineValue];
          print(tens[combineValue]);
        }
      }
    }
  }
}
