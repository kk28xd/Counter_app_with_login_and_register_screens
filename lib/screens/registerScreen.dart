import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'loginScreen.dart';

String? a, b, c, d;
bool ob = true;
TextEditingController textEditingController3 = TextEditingController();
TextEditingController textEditingController4 = TextEditingController();
TextEditingController textEditingController5 = TextEditingController();
TextEditingController textEditingController6 = TextEditingController();
GlobalKey<FormState> form = GlobalKey();

class registerScreen extends StatefulWidget {
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: form,
        child: Padding(
          padding: const EdgeInsetsDirectional.all(10),
          child: ListView(
            children: [
              const Image(image: AssetImage('assets/talking.png')),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0xffE1E2E3),
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextF(
                      keyboardType: TextInputType.name,
                      ob_text: false,
                      pre_icon: const Icon(Icons.person),
                      txtedit: textEditingController3,
                      label: 'Username',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextF(
                      keyboardType: TextInputType.phone,
                      ob_text: false,
                      pre_icon: const Icon(Icons.phone_android),
                      txtedit: textEditingController4,
                      label: 'Phone Number',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextF(
                      keyboardType: TextInputType.emailAddress,
                      ob_text: false,
                      pre_icon: const Icon(Icons.mail),
                      txtedit: textEditingController5,
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
                      obscureText: ob,
                      controller: textEditingController6,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.key),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              ob = !ob;
                            });
                          },
                          icon: ob? const Icon(Icons.remove_red_eye) : const Icon(Icons.remove_red_eye_outlined),
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
                    if (form.currentState!.validate()) {
                      a = textEditingController3.text;
                      b = textEditingController4.text;
                      c = textEditingController5.text;
                      d = textEditingController6.text;
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    }
                  },
                  color: const Color(0xff039DF6),
                  child: const Text('Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Already have an account?",
                      style: TextStyle(fontSize: 18)),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Login()));
                      textEditingController3.text = '';
                      textEditingController4.text = '';
                      textEditingController5.text = '';
                      textEditingController6.text = '';
                    },
                    child: const Text(
                      "Sign In",
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
