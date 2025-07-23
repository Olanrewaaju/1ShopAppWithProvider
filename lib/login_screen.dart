import 'package:flutter/material.dart';
import 'package:sneaker_provider/homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ValueNotifier<bool> emailCondition = ValueNotifier(false);
  ValueNotifier<bool> passwordCondition = ValueNotifier(false);

  void emailVoid() {
    final email = emailController.text;
    final isValid = email.isEmpty || email.contains('@');

    if (emailCondition.value != isValid) {
      emailCondition.value = isValid;
    }
  }

  void changeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Homescreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Text(
                    'Sign up',
                    style: TextTheme.of(context).headlineLarge,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 50),

                  Text(
                    'Email Address',
                    style: TextTheme.of(context).headlineMedium,
                  ),
                  SizedBox(height: 16),
                  //email label
                  TextField(
                    onChanged: (value) => emailVoid(),
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black26,
                        size: 18,
                      ),
                      hintText: 'Enter email address',
                      hintStyle: TextTheme.of(context).headlineSmall,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: emailCondition,
                    builder: (context, value, child) {
                      return value
                          ? SizedBox()
                          : Text(
                              'You Have an Error Either you are missing @ or its empty ',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            );
                    },
                  ),

                  SizedBox(height: 50),

                  //passsword label
                  Text('Password', style: TextTheme.of(context).headlineMedium),
                  SizedBox(height: 16),
                  ValueListenableBuilder(
                    valueListenable: passwordCondition,
                    builder: (context, value, child) {
                      return TextField(
                        obscureText: passwordCondition.value,
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.password,
                            color: Colors.black26,
                            size: 18,
                          ),
                          suffixIcon: IconButton(
                            icon: value
                                ? Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.black54,
                                    size: 18,
                                  )
                                : Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.black54,
                                    size: 18,
                                  ),
                            onPressed: () {
                              passwordCondition.value =
                                  !passwordCondition.value;
                            },
                          ),

                          hintText: 'Enter Password',
                          hintStyle: TextTheme.of(context).headlineSmall,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 50),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: changeScreen,
                  child: Text('Proceed', style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    fixedSize: WidgetStatePropertyAll(
                      Size(double.infinity, 52),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 36, 108, 167),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
