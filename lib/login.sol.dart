import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectnew/utils.dart';
import 'package:projectnew/drawer.dart';


class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool loading = false;
  final _formKey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final _auth= FirebaseAuth.instance;
  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/image1.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.amber, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          Form(
                              key:_formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: emailController,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: "Email",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator:(value){
                                      if(value!.isEmpty){
                                        return "enter your name";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller: passwordController,
                                    style: TextStyle(),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        fillColor: Colors.grey.shade100,
                                        filled: false,
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.black),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        )
                                    ),
                                    validator:(value){
                                       if(value!.isEmpty){
                                         return "enter password";
                                       }
                                       return null;
                                    },
                                  ),

                                ],
                              )
                          ),

                          SizedBox(
                            height: 40,
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700,color: Colors.amber),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.amber,
                                child: IconButton(
                                    color: Colors.white,

                                    onPressed: () async {
                                      setState(() {
                                        loading = true;
                                      });

                                      if (_formKey.currentState!.validate()) {
                                        try {
                                          await _auth.signInWithEmailAndPassword(
                                            email: emailController.text.trim(),
                                            password: passwordController.text.trim(),
                                          ).then((value){
                                            User? user = value.user;
                                            String userName = user!.displayName ?? 'Default Name';
                                            String userEmail = user.email ?? 'example@example.com';
                                            String profileImageUrl = 'assets/sule.jpg'; // Replace with actual URL

                                            // Navigate to home screen with user profile information
                                          /*  Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => MyHeaderDrawer(
                                                  userName: userName,
                                                  userEmail: userEmail,
                                                  profileImageUrl: profileImageUrl,
                                                ),
                                              ),
                                            );*/

                                            Navigator.pushNamed(context, 'home');

                                          });

                                          // Successful registration
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('login successful!'),
                                              duration: Duration(seconds: 3),
                                            ),
                                          );
                                        } catch (e) {

                                          print("Error during registration: $e");


                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Error during registration: $e'),
                                              duration: Duration(seconds: 3),
                                            ),
                                          );
                                        }
                                      }

                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {

                                  Navigator.pushNamed(context, 'register');
                                },
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
