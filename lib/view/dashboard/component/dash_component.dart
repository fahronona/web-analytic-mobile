import 'package:flutter/material.dart';

import '../../../Style/font_style.dart';

Widget cardComp({
  required String assetsR,
  required String labelR,
  required String totalR,
  required String dateR,
  required String assetsL,
  required String labelL,
  required String totalL,
  required String dateL,
}) {
  return Padding(
    padding: EdgeInsets.only(right: 18, left: 18, top: 21),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  assetsL,
                  width: 33,
                  height: 33,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      labelL,
                      style: FontsStyle.fontMedium500.copyWith(fontSize: 14),
                    ),
                    Text(
                      totalL,
                      style: FontsStyle.fontSwmiBild700
                          .copyWith(fontSize: 35, color: Color(0xff338DF5)),
                    ),
                    Text(
                      dateL,
                      style: FontsStyle.fontMedium500
                          .copyWith(fontSize: 12, color: Color(0xffB9B9B9)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
        SizedBox(
          width: 21,
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  assetsR,
                  width: 33,
                  height: 33,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      labelR,
                      style: FontsStyle.fontMedium500.copyWith(fontSize: 14),
                    ),
                    Text(
                      totalR,
                      style: FontsStyle.fontSwmiBild700
                          .copyWith(fontSize: 35, color: Color(0xff338DF5)),
                    ),
                    Text(
                      dateR,
                      style: FontsStyle.fontMedium500
                          .copyWith(fontSize: 12, color: Color(0xffB9B9B9)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ))
      ],
    ),
  );
}
