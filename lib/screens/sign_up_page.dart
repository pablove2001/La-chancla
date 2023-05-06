import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:lachancla/screens/log_in_page.dart';
import 'package:lachancla/screens/starting_page.dart';
import 'package:lachancla/services/authFunctions.dart';

class SingUpPage extends StatelessWidget {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool logged = false;

  SingUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                child: Image.asset(
                  "assets/images/ruleta.png",
                  width: 130,
                  height: 130,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: fullNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: confirmPasswordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                ),
                child: TextButton(
                  onPressed: () async {
                    print(emailController.text);
                    print(passwordController.text);
                    print(confirmPasswordController.text);
                    print(fullNameController.text);

                    if (emailController.text == '' ||
                        passwordController.text == '' ||
                        confirmPasswordController.text == '' ||
                        fullNameController.text == '') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Faltan campos por llenar'),
                        ),
                      );
                      return;
                    }

                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Las contraseñas no son iguales'),
                        ),
                      );
                      return;
                    }

                    if (passwordController.text.length < 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Contraseña debe ser mayor a 6 caracteres'),
                        ),
                      );
                      return;
                    }

                    logged = await AuthServices.signupUser(
                        emailController.text,
                        passwordController.text,
                        fullNameController.text,
                        context);

                    if (logged) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StartingPage()),
                      );
                    }
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  const Text('Do you already have an account?'),
                  TextButton(
                    child: const Text(
                      'Log in',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogInPage()),
                      );
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 1,
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Text(
                      'Or connect with',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 1,
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              SignInButton(
                Buttons.Google,
                text: "Sign up with Google",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
