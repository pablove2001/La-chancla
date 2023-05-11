import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:lachancla/screens/events_page.dart';
import 'package:lachancla/screens/sign_up_page.dart';
import 'package:lachancla/services/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachancla/services/bloc/user_auth_repository.dart';

class LogInPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserAuthRepository auth = UserAuthRepository();

  bool logged = false;

  LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EventsPage()),
          );
        } else if (state is InvalidCredentialsState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  'Las credenciales son invalidas. Favor de llenar todos los campos')));
        } else if (state is UserNotFoundState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
                  Text('No se encontro algun usuario con esas credenciales')));
        } else if (state is WrongPasswordState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Credenciales Invalidas')));
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: ListView(
              children: [
                SizedBox(height: 100),
                Container(
                  child: Image.asset(
                    "assets/images/ruleta.png",
                    width: 130,
                    height: 130,
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Log in',
                    style: TextStyle(fontSize: 24),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        //forgot password screen
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue,
                  ),
                  child: TextButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(UserPassAuthEvent(
                          email: emailController.text,
                          password: passwordController.text));
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Text('Does not have account?'),
                    TextButton(
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SingUpPage()),
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
                  text: "Log in with Google",
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(GoogleAuthEvent());
                    BlocProvider.of<AuthBloc>(context).add(VerifyAuthEvent());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
