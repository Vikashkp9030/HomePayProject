import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff255D49),
        title: const Text('Home',style: TextStyle(fontSize: 25),),
      ),
      body: Container(
        color: const Color(0xff255D49),
        padding: const EdgeInsets.all(50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center
            ,
            children:const [
              Text('Welcome',style: TextStyle(fontSize: 40,color: Colors.orangeAccent),),
              Text('To',style: TextStyle(fontSize: 40,color: Colors.white)),
              Text('Home',style: TextStyle(fontSize: 40,color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }
}
