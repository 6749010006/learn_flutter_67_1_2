//step 2: Install looding app screen
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

//step:3
import 'package:connectivity_plus/connectivity_plus.dart';
//Step 4:
import 'package:fluttertoast/fluttertoast.dart';

class FirtScreen extends StatefulWidget {
  const FirtScreen({super.key});
  @override
  State<FirtScreen> createState() => _FirtScreenState();
}

class _FirtScreenState extends State<FirtScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (contest) => const SecondScreen()),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.blue],
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.5, 0.6),
          tileMode: TileMode.mirror,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              'android/assets/images/app_screen.png',
              width: 200,
            ),
          ),
          const SizedBox(height: 20),
          const SpinKitSpinningCircle(color: Colors.pinkAccent),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: const Center(
        child: Text(
          'This is the scond screen',
          style: TextStyle(
            fontSize: 24,
            color: Colors.amberAccent,
            fontWeight: FontWeight.w500,
            fontFamily: "Alike",
          ),
        ),
      ),
    );
  }
}
