import 'package:events/cubit/user_cubit.dart';
import 'package:events/cubit/user_sate.dart';
import 'package:events/screen/halldaetails.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Halls extends StatelessWidget {
  Halls({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getHalls();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffdb1a1),
        title: const Text("Halls"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                border: InputBorder.none,
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
          ),
          Expanded(
            child: BlocConsumer<UserCubit, UserState>(
              listener: (context, state) {
                if (state is GetHallsFaliure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                if (state is GetHallsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetHallsSuccess) {
                  final hallsList = state.halls;

                  if (hallsList.isEmpty) {
                    return const Center(
                        child: Text("لا توجد قاعات متاحة حالياً"));
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: hallsList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, i) {
                      final hall = hallsList[i];

                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => Halldaetails()),
                          );
                        },
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                child: hall.imageUrl != null
                                    ? Image.network(
                                        "http://192.168.1.109:8000${hall.imageUrl}",
                                        fit: BoxFit.cover,
                                      )
                                    : const Icon(Icons.image_not_supported),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  hall.nameEn,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(Icons.place),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    hall.locationEn,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                      child: Text("لم يتم تحميل البيانات بعد."));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
