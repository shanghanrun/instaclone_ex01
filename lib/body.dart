import 'package:flutter/material.dart';
import 'package:instaclone_ex01/homescreen.dart';
import 'package:instaclone_ex01/searchscreen.dart';

class InstaBody extends StatelessWidget {
  final int index;
  InstaBody({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return HomeScreen();
    }
    return SearchScreen();
  }
}


