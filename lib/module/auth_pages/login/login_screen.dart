import '../../../layout/doctor_layout.dart';
import 'package:doctor_app/module/auth_pages/login/my_button.dart';
import 'package:doctor_app/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Icon(Icons.lock,size: 100,color: Color(0xff30384c),),
                SizedBox(height: 50,),
                Text(
                    "Welcome Back Doctor You\'ve been missed!",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16
                  ),
                ),
                const SizedBox(height: 25,),
                myTextField(
                  controller: usernameController,
                  hintText: "Username",
                  obscureText: false,
                ),
                const SizedBox(height: 10,),
                myTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Forget password?",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: MyButton(
                    onTap: (){
                      CacheHelper.saveData(key: 'isLoggedIn', value: true);
                      navigateAndFinish(context, DoctorLayout());
                    },
                    text: "Sign In",
                  ),
                ),
                const SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Alrayee Hospital",
                          style: TextStyle(
                            color: Colors.grey[700]
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?",style: TextStyle(color: Colors.grey[700]),),
                    const SizedBox(width: 4,),
                    GestureDetector(
                      onTap: (){

                      },
                      child: const Text(
                          "Register Now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
