import 'package:flutter/material.dart';
import 'halamanutama.dart';

void main() {
  runApp(const intentprak());
}

class intentprak extends StatelessWidget {
  const intentprak({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: prakhalinten()
      );
  }
}

class prakhalinten extends StatefulWidget {
  const prakhalinten({super.key});

  @override
  State<prakhalinten> createState() => _prakhalintenstate();
}

class _prakhalintenstate extends State<prakhalinten> {
  @override
  initState(){
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Halamanutama(
        
      )));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 64, 169, 255),
      body: Center( child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children:[Image.asset('image/ridho.png', height: 240)],)
      ),
    );
  }
}