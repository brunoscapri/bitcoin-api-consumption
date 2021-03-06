import 'dart:ui';

import 'package:ezfine/blocs/home.bloc.dart';
import 'package:ezfine/models/bitcoin.model.dart';
import 'package:ezfine/ui/widgets/loader.widget%20copy.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../wheel_spinner.dart';
import 'home.page.dart';

class SellModal extends StatefulWidget {
  @override
  _SellModalState createState() => _SellModalState();
}

class _SellModalState extends State<SellModal> {
  final price = NumberFormat("#,##0.00", "pt_BR");
  double _counter = 0.0;
  HomeBloc bloc;
  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<HomeBloc>(context);
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
            padding: const EdgeInsets.only(top: 560, left: 180),
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
                      height: 250.0,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        _counter.toStringAsFixed(2),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("BTC"),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        height: 1,
                                        width: 60,
                                        child: Text(""),
                                        color: Colors.black,
                                      ),
                                      Loader(
                                        object: bloc.bitcoin,
                                        callback: bitcoinToUSD,
                                      ),
                                      Text("USD"),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 2, top: 5),
                                          child: WheelSpinner(
                                            value: _counter.toDouble(),
                                            min: 0,
                                            max: 20,
                                            onSlideUpdate: (val) => setState(
                                              () {
                                                _counter = val;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 150,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Color(0xFF7ab5fe),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: FlatButton(
                                onPressed: () {},
                                child: Text("Confirm",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
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

  Widget bitcoinToUSD() {
    return Text(
      "${price.format(_counter * bloc.bitcoin.price)}",
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
