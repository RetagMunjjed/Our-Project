import 'package:events/cubit/user_cubit.dart';
import 'package:events/cubit/user_sate.dart';
import 'package:events/screen/hallowner/hallownerplace/addhallllll.dart';
import 'package:events/screen/hallowner/hallownerplace/hallsodetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Hallso extends StatefulWidget {
  const Hallso({Key? key}) : super(key: key);

  @override
  State<Hallso> createState() => _HallsoState();
}

class _HallsoState extends State<Hallso> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().gethallowner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is GetHallsOFaliure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is GetHallsOLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetHallsOSuccess) {
            final hallsownerList = state.hallso;

            if (hallsownerList.isEmpty) {
              return const Center(child: Text("لا توجد قاعات متاحة حالياً"));
            }

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: hallsownerList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12.0,
                        crossAxisSpacing: 12.0,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, i) {
                        final hall = hallsownerList[i];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => Hallsodetails(hall: hall),
                              ),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(10)),
                                  child: Container(
                                    height: 120,
                                    color: Colors.grey[200],
                                    // ignore: unnecessary_null_comparison
                                    child: hall.image_url != null
                                        ? Image.network(
                                            "http://192.168.1.106:8000${hall.image_url.image_1}",
                                            fit: BoxFit.cover,
                                          )
                                        : const Icon(Icons.image_not_supported),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          hall.name_en,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      MaterialButton(
                                        minWidth: 0,
                                        padding: EdgeInsets.zero,
                                        color: Colors.red,
                                        shape: const CircleBorder(),
                                        onPressed: () {
                                          context
                                              .read<UserCubit>()
                                              .deleteHall(hall.id);
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(
                        MaterialPageRoute(builder: (context) => Addhallllll()),
                      )
                          .then((_) {
                        context.read<UserCubit>().gethallowner();
                      });
                    },
                    child: Card(
                      color: Colors.grey[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 50,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is deletHallLoading ||
              state is deletHallSuccess ||
              state is deletHallFailure) {
            return Center(
                child: Text(
              "......يتم الحذف الآن",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ));
          } else {
            return const Center(child: Text("لم يتم تحميل البيانات بعد."));
          }
        },
      ),
    );
  }
}
