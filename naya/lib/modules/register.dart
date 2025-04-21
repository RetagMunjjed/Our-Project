import 'package:flutter/material.dart';
import 'package:untitled10/modules/bottomnavigation_bar.dart';
import 'package:untitled10/modules/login.dart';

class Register extends StatefulWidget {
  const  Register ({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool  iscansee= false;
  var name_controller = TextEditingController();
  var phone_controller = TextEditingController();
  var password_controller = TextEditingController();
  var password_Confirm_controller = TextEditingController();
  var key_form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          titleSpacing: 30,
          elevation: 5,
          shadowColor: Colors.indigo[900],
          backgroundColor: Colors.deepOrange,
        leading: IconButton(icon: const Icon(Icons.arrow_back_outlined,size: 30,color: Colors.black),onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()),);})),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '\nREGISTER', style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.deepOrange,
                ),),
                const SizedBox(
                  height: 70,
                ),
                Center(
                  child: Form(
                    key: key_form,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: name_controller,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please Enter Your Name';}
                            return null;
                          },

                          decoration: InputDecoration(
                              labelText: " Full Name",
                              labelStyle: TextStyle(
                                color: Colors.indigo[900],
                                fontWeight: FontWeight.bold,
                              ) ,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20
                              ),
                              prefixIcon: const Icon(Icons.email_outlined),

                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,width: 3,
                                ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,width: 3,
                                ),

                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black,width: 3
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:  Colors.deepOrange,width: 3
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          keyboardType: TextInputType.text,


                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          controller: phone_controller,
                          validator: (onvalue){
                            if(onvalue!.isEmpty){
                              return 'Please Enter Your Phone Number';}
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Phone Number",
                              labelStyle: TextStyle(
                                color: Colors.indigo[900],
                                fontWeight: FontWeight.bold,
                              ) ,

                              prefixIcon: const Icon(Icons.phone_iphone_outlined),

                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,width: 3,
                                ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,width: 3,

                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(

                                  borderSide: const BorderSide(
                                      color: Colors.black,width: 3
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:  Colors.deepOrange,width: 3
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          keyboardType: TextInputType.phone,


                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          controller: password_controller,
                          validator: (onvalue){
                            if(onvalue!.isEmpty){
                              return 'Please Enter Your Password';}
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                color: Colors.indigo[900],
                                fontWeight: FontWeight.bold,
                              ) ,

                              prefixIcon: const Icon(Icons.password_outlined),
                              suffixIcon: IconButton(
                                icon: iscansee ? const Icon(Icons.visibility_off_sharp) : const Icon(Icons.visibility_sharp),
                                onPressed: () {
                                  setState(() {
                                    iscansee = !iscansee;
                                  });
                                },
                              ),
                              suffixIconColor: Colors.indigo[800],
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,width: 3,
                                ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,width: 3,

                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(

                                  borderSide: const BorderSide(
                                      color: Colors.black,width: 3
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:  Colors.deepOrange,width: 3
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          keyboardType: TextInputType.emailAddress,
                          obscureText: iscansee,

                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          controller: password_Confirm_controller,
                          validator: (onvalue){
                            if(onvalue!.isEmpty){
                              return 'Please Enter Your Password';}
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: " Confirm Your Password",
                              labelStyle: TextStyle(
                                color: Colors.indigo[900],
                                fontWeight: FontWeight.bold,
                              ) ,

                              prefixIcon: const Icon(Icons.password_outlined),
                              suffixIcon: IconButton(
                                icon: iscansee ? const Icon(Icons.visibility_off_sharp) : const Icon(Icons.visibility_sharp),
                                onPressed: () {
                                  setState(() {
                                    iscansee = !iscansee;
                                  });
                                },
                              ),
                              suffixIconColor: Colors.indigo[800],
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,width: 3,

                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(

                                  borderSide: const BorderSide(
                                      color: Colors.black,width: 3
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:  Colors.deepOrange,width: 3
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          keyboardType: TextInputType.emailAddress,
                          obscureText: iscansee,

                        ),

                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 50,
                ),


                Center(
                  child: SizedBox(
                    height: 50,
                    width: 130,
                    child: FloatingActionButton(
                      onPressed: (){
                        if(key_form.currentState?.validate()??false){
                           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const MainScreen()),   (Route<dynamic> route)=> false);
                        }else {
                          print('not validate');
                        }
                      },
                      backgroundColor: Colors.deepOrange,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('Register',
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
        )
    );
  }
}
