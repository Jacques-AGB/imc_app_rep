import 'dart:developer';
import 'package:imc_app/constants_app/app_constants.dart';
import 'package:flutter/material.dart';

class LeftBar extends StatelessWidget{
  final double barWidth;

   const LeftBar({  required this.barWidth}) ;


  @override
  Widget build(BuildContext context){
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 25,
            width: barWidth,
            decoration:  BoxDecoration(
                borderRadius:   const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: accentHexcolor
            ),
          ),
        ],
      );

  }
}
