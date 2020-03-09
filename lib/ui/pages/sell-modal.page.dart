import 'dart:ui';

import 'package:flutter/material.dart';

import 'home.page.dart';

class SellModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.01),
      body: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                    pageBuilder: (context, _, __) => Home(), opaque: false),
              );
            },
            child: SizedBox(
              height: 2000,
              width: 2000,
              child: Text(""),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 550, left: 200),
            child: Stack(
              children: <Widget>[
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2.0,
                      sigmaY: 2.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white70.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.white, width: 3)),
                      alignment: Alignment.center,
                      width: 200.0,
                      height: 200.0,
                      child: Text('Sell'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}