import 'package:flutter/material.dart';
// ... نفس الاستيرادات السابقة
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/register_cubit.dart';
import 'bottomnavigation_bar.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool iscansee1 = false;
  // var email_controller = TextEditingController();
  // var password_controller = TextEditingController();
  // var key_email = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is Loginsuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Login successful!')));
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainScreen()),
            (Route<dynamic> route) => false,
          );
        } else if (state is Loginfailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
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
                  const SizedBox(height: 70),
                  Center(
                    child: Form(
                      key: context.read<RegisterCubit>().loginFromKey,

                      child: Column(
                        children: [
                          TextFormField(
                            controller: context.read<RegisterCubit>().loginEmail,
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.deepOrange, width: 3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 25),
                          TextFormField(
                            controller: context.read<RegisterCubit>().loginPassword,
                            validator: (value) {
                              if (value!.isEmpty) {
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.deepOrange, width: 3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            obscureText: !iscansee1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'If you don\'t have an account?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          color: Colors.indigo[900],
                        ),
                      ),
                      const SizedBox(width: 5),
                      TextButton(
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                            color: Colors.deepOrange,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Signup(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 90),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 130,
                      child: FloatingActionButton(
                        onPressed: () {
                          if (context.read().loginFromKey. currentState!.validate()) {
                            // RegisterCubit.get(context).login(
                            //   email: email_controller.text.trim(),
                            //   password: password_controller.text.trim(),
                            // );
                            context.read<RegisterCubit>().loginUser();
                          }
                        },
                        backgroundColor: Colors.deepOrange,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: state is Loginloading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
