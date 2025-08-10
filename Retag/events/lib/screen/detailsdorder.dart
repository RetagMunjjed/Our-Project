import 'package:events/core/api/const/color.dart';
import 'package:events/cubit/user_cubit.dart';
import 'package:events/cubit/user_sate.dart';
import 'package:events/screen/listdevice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class Detailsdorder extends StatelessWidget {
  Detailsdorder({super.key});

  List dev = [
    {"image": "images/rest.jpg", "name": "food"},
    {"image": "images/rest.jpg", "name": "photographer"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Devices",
                style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: dev.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 40.0,
                    crossAxisSpacing: 20.0,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, i) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Listdevice()));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        elevation: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(100),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 90,
                                color: Colors.grey[200],
                                child: Image.asset(
                                  dev[i]['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                dev[i]['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              /*--------------------------------------------------------------------------------------------------------------------- */
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocConsumer<UserCubit, UserState>(
                  listener: (context, state) {
                    if (state is PostTaskSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("تم توزيع المهام بنجاح")),
                      );
                    } else if (state is PostTaskFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errMessage)),
                      );
                    }
                  },
                  builder: (context, state) {
                    final cubit = context.read<UserCubit>();

                    return Container(
                      width: 100,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: AppColor.pink,
                        onPressed: state is PostTaskLoading
                            ? null
                            : () {
                                cubit.assignTasksToCoordinators(10);
                              },
                        child: state is PostTaskLoading
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                "Send Task",
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
