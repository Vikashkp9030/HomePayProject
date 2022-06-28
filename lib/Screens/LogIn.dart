import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_pay_project/Screens/OTPVerification.dart';
import 'package:home_pay_project/Screens/SignUp.dart';
import 'package:http/http.dart';

import 'Home.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {

    TextEditingController mobileController = TextEditingController();
    Future<void> sendOTP(String mobile) async {
      try{
        final response =await post(
            Uri.parse('https://alphawizztest.tk/Atticadigitamarketing/app/v1/api/verify_user'),
            body:{
              'mobile':mobile,
            }
        );
        if(response.statusCode == 200){
          log('account created successful');
          Get.to(const OTPVerification());

        }else{
          log('failed');
          // Get.to(const Home());
        }

      }catch(e){
        // Get.to(const Home());
        log(e.toString());
      }

    }

    void login(String mobile) async{
      try{
          final response =await post(
          Uri.parse('https://alphawizztest.tk/Atticadigitamarketing/app/v1/api/login'),
          body:{
            'mobile':mobile,
          }
          );
          if(response.statusCode == 200){
            log('account created successful');

            sendOTP(mobile);

          }else{
            log('failed');
            // Get.to(const Home());
          }

      }catch(e){
        // Get.to(const Home());
        log(e.toString());
      }
    }

    return Scaffold(
      body: Container(
        color: const Color(0xff255D49),
        padding: const EdgeInsets.all(50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              const SizedBox(height: 100,),
              Image.asset('assets/images/alphwizz_logo.png'),
              const SizedBox(height: 60,),
              const Text('LogIn',style: TextStyle(fontSize: 18,color: Colors.white54)),
              const SizedBox(height: 10,),
              TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: "Enter mobile number",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
              ),
              const SizedBox(height: 60,),
              SizedBox(
                  height: 50,

                  child: ElevatedButton(

                    onPressed: (){

                        login(mobileController.text.toString());


                    },
                    child: const Text('Get OTP',style: TextStyle(fontSize: 18,color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellowAccent, // background
                      onPrimary: Colors.black, // foreground
                    ),
                  )),
              Row(
                children: [
                  const Text('Don\'t you have an account?'),
                  TextButton(onPressed: (){
                    Get.to(const SignUp());
                  }, child: const Text('SignUp'))
                ],
              ),
              const SizedBox(height: 200,),
            ],
          ),
        ),
      ),
    );
  }
}
