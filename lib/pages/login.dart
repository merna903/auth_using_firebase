import 'package:auth_using_firebase/components/components.dart';
import 'package:auth_using_firebase/pages/home_page.dart';
import 'package:auth_using_firebase/pages/register_page.dart';
import 'package:auth_using_firebase/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.lock, size: 100, color: Colors.grey[700],),
                  const SizedBox(height: 30,),
                  const Center(child: Text('Welcom back, you\'ve been missed!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                  const SizedBox(height: 25,),
                  DefualtTextFormFeild(
                    controller: _emailController,
                    type: TextInputType.emailAddress,
                    label: 'Email Address',
                    prefix: Icons.email,
                  ),
                  const SizedBox(height: 20,),
                  DefualtTextFormFeild(
                    controller: _passwordController,
                    type: TextInputType.visiblePassword,
                    label: 'Password',
                    prefix: Icons.lock,
                  ),
                  const SizedBox(height: 10,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forget Password?', style: TextStyle(fontSize: 16, color: Colors.grey),)
                    ],
                  ),
                  const SizedBox(height: 25,),
                  DefualtButton(text:'Sing In', onTapped:singIn),
                  const SizedBox(height: 13,),
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey[800],thickness: 0.7,)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:10.0),
                        child: Text('Or Continue with', style: TextStyle(fontSize: 17,color: Colors.grey[800]),),
                      ),
                      Expanded(child: Divider(color: Colors.grey[800],thickness: 0.7)),
                    ],
                  ),
                  const SizedBox(height: 13,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefualtImage(path: 'assets/pngegg.png',onTapped: (){}),
                      const SizedBox(width: 20,),
                      DefualtImage(path: 'assets/pngwing.com.png',onTapped:(){AuthService().signInWithGoogle(context);}),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?', style: TextStyle(fontSize: 16, color: Colors.grey[700]),),
                      const SizedBox(width: 5,),
                      GestureDetector(
                        onTap: ()=> {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterPage()),
                          )
                        },
                        child: Text('Sign Up', style: TextStyle(fontSize: 16, color: Colors.grey[700], fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void singIn() async {

    showDialog(context: context, builder: (context) => const Center(child: CircularProgressIndicator(),));

    try
    {await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
    undisplayed();
    navigationToHome();
    } on FirebaseAuthException catch(e){
      undisplayed();
      // ignore: use_build_context_synchronously
      showDialog(context: context, builder: (context){
        return AlertDialog(
          clipBehavior: Clip.antiAlias,
          backgroundColor: const Color.fromARGB(255, 207, 108, 225),
          content: Text(e.code),
          actions: [
            TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Ok'))
          ],
        );
      });
    }
  }

  void undisplayed(){
        Navigator.pop(context);
  }

  void navigationToHome(){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
}