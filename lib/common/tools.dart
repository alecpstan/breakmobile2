import 'package:flutter/material.dart';


IconData iconLookup(String? iconName) {


  switch(iconName) {
    case 'arrow_right': { return Icons.arrow_right; }
    case 'question': { return Icons.question_mark; }
    case 'tick': { return Icons.check; }
    case 'warning': { return Icons.warning_rounded; }
    default:{ return Icons.arrow_right; }
  }


}