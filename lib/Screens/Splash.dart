import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_pay_project/Screens/LogIn.dart';
import 'package:home_pay_project/Screens/SignUp.dart';
import 'package:get/get.dart';
class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      color: const Color(0x79255D49),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              Image.asset('assets/images/alphwizz_logo.png'),
              const SizedBox(
                height: 250,
              ),
              MaterialButton(
                  onPressed: (){
                    Get.to(const LogIn());
                  },
                child: const Text('Next'),
                color: Colors.lightGreenAccent,

                  ),
             ],
          ),
        ),
      ),
    );
  }
}
