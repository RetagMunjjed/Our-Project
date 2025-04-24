import 'package:flutter/material.dart';
import 'bottomnavigation_bar.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool iscansee1 = false;
  var email_controller = TextEditingController();
  var password_controller = TextEditingController();
  var key_email = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          shadowColor: Colors.indigo[900],
          titleSpacing: 30,
          backgroundColor: Colors.deepOrange,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '\nLOGIN',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.deepOrange,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Center(
                  child: Form(
                    key: key_email,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: email_controller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Email Address';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Email Address",
                              labelStyle: TextStyle(
                                color: Colors.indigo[900],
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              prefixIcon: const Icon(Icons.email_outlined),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 3),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.deepOrange, width: 3),
                                  borderRadius: BorderRadius.circular(10))),
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          controller: password_controller,
                          validator: (onvalue) {
                            if (onvalue!.isEmpty) {
                              return 'Please Enter Your Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                color: Colors.indigo[900],
                                fontWeight: FontWeight.bold,
                              ),
                              prefixIcon: const Icon(Icons.password_outlined),
                              suffixIcon: IconButton(
                                icon: iscansee1
                                    ? const Icon(Icons.visibility_off_sharp)
                                    : const Icon(Icons.visibility_sharp),
                                onPressed: () {
                                  setState(() {
                                    iscansee1 = !iscansee1;
                                  });
                                },
                              ),
                              suffixIconColor: Colors.indigo[800],
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 3),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.deepOrange, width: 3),
                                  borderRadius: BorderRadius.circular(10))),
                          keyboardType: TextInputType.emailAddress,
                          obscureText: iscansee1,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'if you don\'t have account ?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          color: Colors.indigo[900]),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      child: const Text('register now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              color: Colors.deepOrange)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Register()));
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 90,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 130,
                    child: FloatingActionButton(
                      onPressed: () {
                        if (key_email.currentState!.validate()) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainScreen()),
                              (Route<dynamic> route) => false);
                        }
                      },
                      backgroundColor: Colors.deepOrange,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.indigo[800],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
