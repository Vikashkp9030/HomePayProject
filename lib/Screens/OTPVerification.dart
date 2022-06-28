import 'package:flutter/material.dart';
import 'package:home_pay_project/Screens/Home.dart';
import 'package:get/get.dart';
class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {

  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff255D49),
        title: const Text('OTP',style: TextStyle(fontSize: 25),),
      ),
      body: Container(
        color: const Color(0xff255D49),
        padding: const EdgeInsets.all(50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              const SizedBox(height: 70,),
              const Text('Enter your 6 Digit code',style: TextStyle(fontSize: 18,color: Colors.white),),
              const Text('Don\'t share it with any other',style: TextStyle(fontSize: 14,color: Colors.white54)),
              const SizedBox(height: 40,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter OTP",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
              ),
              const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Didn\'t Got Code?',style: TextStyle(color: Colors.redAccent),),
                  TextButton(onPressed: (){
                  }, child: const Text('Resend',style: TextStyle(color: Colors.redAccent),))
                ],
              ),
              const SizedBox(height: 40,),
              SizedBox(
                  height: 50,
                  width: 300,

                  child: ElevatedButton(

                    onPressed: (){},
                    child: const Text('VERIFY',style: TextStyle(fontSize: 18,color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellowAccent, // background
                      onPrimary: Colors.black, // foreground
                    ),
                  )),
              const SizedBox(height: 20,),
              SizedBox(
                  height: 50,
                  width: 300,

                  child: ElevatedButton(

                    onPressed: (){
                      Get.to(Home());
                    },
                    child: const Text('Go TO HOME WITHOUT VERIFICATION',style: TextStyle(fontSize: 14,color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange, // background
                      onPrimary: Colors.black, // foreground
                    ),
                  )),
              const SizedBox(height: 300,),

            ],
          ),
        ),
      ),
    );
  }
}
