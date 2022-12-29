import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screens/homeScreen.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateHome();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image(
            image: AssetImage(
              'assets/images/logo.png'
            ),
          ),
        ),
      ),
    );
  }
  void navigateHome()async{
    await Future.delayed(Duration(seconds: 3), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeLayout()!));
  }
}



