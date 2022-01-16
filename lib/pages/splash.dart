import 'package:flutter/material.dart';

// global variables
import 'package:bts_wall/globals.dart' as globals;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplasPageState();
}

class _SplasPageState extends State<SplashPage> {
  final spinkit = SpinKitThreeBounce(
    color: Colors.white,
    size: 25.0,
  );

  // methods
  @override
  void initState() {
    // initAdsTimer();
    super.initState();
  }

  // init ADS TIMER
  // initAdsTimer() async {
  //   globals.adsTimer = await MyUtils.getAdsTimer();
  //   if (globals.adsTimer == null) globals.adsTimer = 0;
  //   print('TIMERRRRRRRRRRRRRR');
  //   print(globals.adsTimer);
  // }

  @override
  Widget build(BuildContext context) {
    // init screen variables
    _initScreeen(context);

    return Material(
      color: Colors.black,
      child: splashLoadingBar(),
    );
  }

  // initalize the Screen
  _initScreeen(BuildContext context) {
    globals.screenWidth = MediaQuery.of(context).size.width;
    globals.screenHeight = MediaQuery.of(context).size.height;
    print(globals.screenHeight);
  }

  // splash loadin bar
  Widget splashLoadingBar() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: <Color>[Colors.white, Colors.white],
          )),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  'assets/img/logo.jpg',
                  height: globals.screenHeight * 0.2,
                  // width: globals.screenWidth / 2,
                ),
              ],
            ),
          ),
        ),
        // Loading animations
        Positioned(bottom: globals.screenHeight * 0.2, child: spinkit),
      ],
    );
  }
}
