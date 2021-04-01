import 'package:flutter/material.dart';
import 'package:search_repos/consts/consts.dart';

class BadgeWidget extends StatelessWidget {
  final String number;

  const BadgeWidget({this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 24,
      child: Stack(
        children: <Widget>[
          Positioned(
              child: Container(
            width: 70,
            height: 24,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
                color: AppColors.lighterGrey),
          )),
          Positioned(
            top: 4,
            left: 7,
            child: Image.asset('assets/star_icon.png'),
            width: 16,
            height: 16,
          ),
          Positioned(
              top: 8,
              left: 25,
              child: Text(
                number,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
        ],
      ),
    );
  }
}
