import 'package:flutter/material.dart';
import 'package:project/screens/HomePage.dart';
import 'package:project/screens/registerScreen.dart';

TextEditingController textEditingController = TextEditingController();
TextEditingController textEditingController2 = TextEditingController();
String? x;
String? y;
bool obscureText = true;
GlobalKey<FormState> formState = GlobalKey();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formState,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const SizedBox(
                height: 60,
              ),
              const Image(image: AssetImage('assets/friendship.png')),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0xffE1E2E3),
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextF(
                      keyboardType: TextInputType.emailAddress,
                      ob_text: false,
                      pre_icon: const Icon(Icons.mail),
                      txtedit: textEditingController,
                      label: 'E-mail',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Filed is empty!';
                        }
                        return null;
                      },
                      obscureText: obscureText,
                      controller: textEditingController2,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: obscureText? const Icon(Icons.remove_red_eye) : const Icon(Icons.remove_red_eye_outlined),
                        ),
                        label: const Text('Password',
                            style: TextStyle(fontSize: 20)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: MaterialButton(
                  height: 50,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: const BorderSide(color: Color(0xff039DF6))),
                  onPressed: () {
                    if (formState.currentState!.validate()) {
                      x = textEditingController.text;
                      y = textEditingController2.text;

                      if (x == 'mohamedelsayed@gmail.com' && y == '12345') {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Wrong Data')));
                      }
                    }
                  },
                  color: const Color(0xff039DF6),
                  child: const Text('Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Don't have an account?",
                      style: TextStyle(fontSize: 18)),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const registerScreen()));
                      textEditingController.text = '';
                      textEditingController2.text = '';
                    },
                    child: const Text(
                      "Register Now",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextF extends StatelessWidget {
  const TextF(
      {super.key,
      required this.txtedit,
      required this.label,
      required this.pre_icon,
      required this.ob_text,required this.keyboardType});

  final txtedit;
  final label;
  final pre_icon;
  final bool ob_text;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Filed is empty!';
        }
        return null;
      },
      obscureText: ob_text,
      controller: txtedit,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: pre_icon,
        label: Text(label, style: const TextStyle(fontSize: 20)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
