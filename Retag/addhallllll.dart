import 'package:events/cubit/user_cubit.dart';
import 'package:events/cubit/user_sate.dart';
import 'package:events/screen/widget/pick_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Addhallllll extends StatefulWidget {
  const Addhallllll({super.key});

  @override
  State<Addhallllll> createState() => _AddhallllllState();
}

class _AddhallllllState extends State<Addhallllll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Row(
            children: [
              // IconButton(
              //     onPressed: () {
              //       Navigator.of(context).push(MaterialPageRoute(
              //           builder: (context) => Halllllllllllll()));
              //     },
              //     icon: Icon(Icons.arrow_back)),
              Text(
                "Add Hall",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        body: BlocConsumer<UserCubit, UserState>(listener: (context, state) {
          if (state is addHallFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is addHallSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("تمت العملية بنجاح")),
            );
          }
        }, builder: (context, state) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text("Add Hall Name (English)",
                      style: TextStyle(color: Colors.purple)),
                  SizedBox(height: 8),
                  TextField(
                    controller: context.read<UserCubit>().name_en,
                    decoration: _inputDecoration(),
                  ),
                  SizedBox(height: 20),
                  Text("Add Hall Name (Arabic)",
                      style: TextStyle(color: Colors.purple)),
                  SizedBox(height: 8),
                  TextField(
                    controller: context.read<UserCubit>().name_ar,
                    decoration: _inputDecoration(),
                  ),
                  SizedBox(height: 20),
                  Text("Add The Main image of the hall",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  PickImageWidget(),
                  SizedBox(height: 20),
                  Text("Add side Photos of the hall",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      PickImageWidget(),
                      PickImageWidget(),
                      PickImageWidget(),
                      PickImageWidget(),
                    ]),
                  ),
                  SizedBox(height: 20),
                  Text("Add Hall Location (English)",
                      style: TextStyle(color: Colors.purple)),
                  SizedBox(height: 8),
                  TextField(
                    controller: context.read<UserCubit>().location_en,
                    decoration: _inputDecoration(),
                  ),
                  SizedBox(height: 20),
                  Text("Add Hall Location (Arabic)",
                      style: TextStyle(color: Colors.purple)),
                  SizedBox(height: 8),
                  TextField(
                    controller: context.read<UserCubit>().location_ar,
                    decoration: _inputDecoration(),
                  ),
                  SizedBox(height: 20),
                  Text("Add How Many people widen the hall",
                      style: TextStyle(color: Colors.purple)),
                  SizedBox(height: 8),
                  TextField(
                    controller: context.read<UserCubit>().capacity,
                    decoration: _inputDecoration(),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  Text("Add Price of the hall",
                      style: TextStyle(color: Colors.purple)),
                  SizedBox(height: 8),
                  TextField(
                    controller: context.read<UserCubit>().price,
                    decoration: _inputDecoration(),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  Text("Add Event Type ID",
                      style: TextStyle(color: Colors.purple)),
                  SizedBox(height: 8),
                  TextField(
                    controller: context.read<UserCubit>().event_type_id,
                    decoration: _inputDecoration(),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  Text("Add Place Type ID",
                      style: TextStyle(color: Colors.purple)),
                  SizedBox(height: 8),
                  TextField(
                    controller: context.read<UserCubit>().place_type_id,
                    decoration: _inputDecoration(),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  Text("Add the services you provide",
                      style: TextStyle(color: Colors.purple)),
                  SizedBox(height: 8),
                  TextField(decoration: _inputDecoration()),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      child: state is addHallLoading
                          ? const CircularProgressIndicator()
                          : MaterialButton(
                              color: Colors.purple,
                              child: Text("ok"),
                              onPressed: () {
                                context.read<UserCubit>().addhall();
                              },
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey, width: 2),
      ),
    );
  }
}
