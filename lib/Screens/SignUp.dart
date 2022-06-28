import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_pay_project/Screens/Home.dart';
import 'package:home_pay_project/Screens/LogIn.dart';
import 'package:http/http.dart';

import 'OTPVerification.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController =TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();

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

  void signup(String name , String mobile , String gender , String age) async{
    try{
         var response =await post(
          Uri.parse('https://alphawizztest.tk/Atticadigitamarketing/app/v1/api/register'),
          body:{
            'name': name,
            'mobile':mobile,
            'gender': gender,
            'age':age,
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
      log(e.toString());
      // Get.to(const Home());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff255D49),
        title: const Text(' Sign Up'),
      ),
      body: Container(
        color: const Color(0xff255D49),
        padding: const EdgeInsets.all(50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              const Text('Your name',style: TextStyle(fontSize: 18,color: Colors.white54),),
              const SizedBox(height: 10,),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Enter name",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
              ),
              const SizedBox(height: 20,),
              const Text('Your mobile number',style: TextStyle(fontSize: 18,color: Colors.white54)),
              const SizedBox(height: 10,),
              TextFormField(
                controller: mobileController,
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
              const SizedBox(height: 20,),
              const Text('Your gender',style: TextStyle(fontSize: 18,color: Colors.white54)),
              const SizedBox(height: 10,),
              TextFormField(
                controller: genderController,
                decoration: InputDecoration(
                  labelText: "male / female",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
              ),
              const SizedBox(height: 20,),
              const Text('Your age',style: TextStyle(fontSize: 18,color: Colors.white54)),
              const SizedBox(height: 10,),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(
                  labelText: "Enter age",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                  height: 50,

                  child: ElevatedButton(

                      onPressed: (){
                        if( nameController.text.toString().length !=0 &&
                            mobileController.text.toString().length ==10 &&
                            genderController.text.toString().length!=0 &&
                            ageController.text.toString().length>0){
                          signup(nameController.text.toString(),mobileController.text.toString(),genderController.text.toString(),ageController.text.toString());
                        }
                        },
                      child: const Text('Sign Up',style: TextStyle(fontSize: 18,color: Colors.black)),
                     style: ElevatedButton.styleFrom(
                      primary: Colors.yellowAccent, // background
                      onPrimary: Colors.black, // foreground
                    ),
                  )),
              Row(
                children: [
                  const Text('Do you have an account?'),
                  TextButton(onPressed: (){   Get.to(const LogIn());}, child: const Text('LogIn'))
                ],
              ),
              const SizedBox(height: 160,),
            ],
          ),
        ),
      ),
    );
  }
}
