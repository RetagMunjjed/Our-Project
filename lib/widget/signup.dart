import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/register_cubit.dart';
import 'bottomnavigation_bar.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool iscansee = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is Signupsuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Signup successful!')),
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainScreen()),
            (route) => false,
          );
        } else if (state is Signupfailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 30,
            elevation: 5,
            shadowColor: Colors.indigo[900],
            backgroundColor: Colors.deepOrange,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_outlined,
                  size: 30, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '\nREGISTER',
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
                      key: cubit.signupFromKey,
                      child: Column(
                        children: [
                          _buildField(
                            label: "Full Name",
                            icon: Icons.person,
                            controller: cubit.signUpName,
                            validator: (value) {
                              if (value!.isEmpty)
                                return 'Please enter your name';
                              return null;
                            },
                          ),
                          const SizedBox(height: 25),
                          _buildField(
                            label: "Phone Number",
                            icon: Icons.phone,
                            controller: cubit.signupPhonNumber,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty || value == null)
                                return 'Please enter your phone number';
                              if (!value.startsWith('09')) {
                                return 'Phone number must start with 09';
                              }

                              if (value.length != 10) {
                                return 'Phone number must be exactly 10 digits';
                              }
                              if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                                return 'Phone number must contain only digits';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 25),
                          _buildField(
                            label: "Email Address",
                            icon: Icons.email,
                            controller: cubit.signupEmail,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty)
                                return 'Please enter your email';

                              if (value.contains(' ')) {
                                return 'Spaces are not allowed';
                              }
                              if (!RegExp(
                                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 25),
                          _buildField(
                              label: "Password",
                              icon: Icons.password,
                              controller: cubit.signupPassword,
                              obscureText: !iscansee,
                              isPassword: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 8) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              }),
                          const SizedBox(height: 25),
                          _buildField(
                            label: "Confirm Password",
                            icon: Icons.password_outlined,
                            controller: cubit.confirmPassword,
                            obscureText: !iscansee,
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != cubit.signupPassword.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 130,
                      child: FloatingActionButton(
                        onPressed: () {
                          if (cubit.signupFromKey.currentState!.validate()) {
                            cubit.signup();
                          }
                        },
                        backgroundColor: Colors.deepOrange,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: state is Signuploading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : Text(
                                'Register',
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
          ),
        );
      },
    );
  }

  Widget _buildField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    required String? Function(String?) validator,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.indigo[900],
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: Icon(icon),
        suffixIcon: isPassword
            ? IconButton(
                icon: iscansee
                    ? const Icon(Icons.visibility_off_sharp)
                    : const Icon(Icons.visibility_sharp),
                onPressed: () {
                  setState(() {
                    iscansee = !iscansee;
                  });
                },
              )
            : null,
        suffixIconColor: Colors.indigo[800],
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepOrange, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
