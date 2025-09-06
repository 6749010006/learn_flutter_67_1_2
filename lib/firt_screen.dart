//step 2: Install loading app screen
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
//step:3 Check internet connection
import 'package:connectivity_plus/connectivity_plus.dart';
//Step 4: Show toast message
import 'package:fluttertoast/fluttertoast.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkInternetConnection();
    });
  }

  void checkInternetConnection() async {
    await Connectivity().checkConnectivity();

    // ฟัง event เวลาเน็ตเปลี่ยน
    Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      if (result.contains(ConnectivityResult.mobile)) {
        _showToast("Mobile network available.");
      } else if (result.contains(ConnectivityResult.wifi)) {
        _showToast("Wi-Fi available.");
      } else if (result.contains(ConnectivityResult.ethernet)) {
        _showToast("Ethernet connection available.");
      } else if (result.contains(ConnectivityResult.vpn)) {
        _showToast("VPN connection active.");
      } else if (result.contains(ConnectivityResult.bluetooth)) {
        _showToast("Bluetooth connection available.");
      } else if (result.contains(ConnectivityResult.other)) {
        _showToast("Other network is available.");
      } else if (result.contains(ConnectivityResult.none)) {
        _showAlertDialog(
          "No internet connection",
          "Please check your internet connection and try again.",
        );
      }
    });

    // ✅ หลังเช็คเสร็จให้เริ่มนับเวลาเสมอ
    _timer();
  }

  void _timer() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SecondScreen()),
      ),
    );
  }

  //Step4: Show toast message
  void _showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  // Step 4: Show alert dialog
  void _showAlertDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.amberAccent,
              fontWeight: FontWeight.w500,
              fontFamily: "Alike",
            ),
          ),
          content: Text(msg),
          actions: <Widget>[
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.black54),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "OK",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.amberAccent,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Alike",
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
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
            child: Image.asset('android/assets/images/LOGO2.png', height: 100),
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
          'This is the second screen',
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
