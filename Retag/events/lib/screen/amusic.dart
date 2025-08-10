import 'package:events/core/api/const/color.dart';
import 'package:events/cubit/user_cubit.dart';
import 'package:events/cubit/user_sate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Amusic extends StatefulWidget {
  const Amusic({Key? key}) : super(key: key);

  @override
  State<Amusic> createState() => _AmusicState();
}

class _AmusicState extends State<Amusic> {
  Set<int> selectedIndexes = {};

  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getMusic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/mus.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 55,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          Positioned.fill(
            top: 100,
            left: 20,
            right: 20,
            bottom: 20,
            child: BlocConsumer<UserCubit, UserState>(
              listener: (context, state) {
                if (state is GetMusicFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                if (state is GetMusicLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetMusicSuccess) {
                  final arabicSongList = state.arabicSongs;

                  if (arabicSongList.isEmpty) {
                    return const Center(
                      child: Text("لا توجد أغانٍ عربية حالياً",
                          style: TextStyle(color: Colors.white)),
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "اختر الأغاني العربية",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemCount: arabicSongList.length,
                          itemBuilder: (context, i) {
                            final song = arabicSongList[i];
                            return CheckboxListTile(
                              checkColor: Colors.black,
                              activeColor: Colors.white,
                              title: Text(song.title),
                              subtitle: Text(song.artist),
                              value: selectedIndexes.contains(i),
                              onChanged: (val) {
                                setState(() {
                                  if (val == true) {
                                    selectedIndexes.add(i);
                                  } else {
                                    selectedIndexes.remove(i);
                                  }
                                });
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: AppColor.blue,
                        onPressed: () {
                          // تنفيذ إجراء التأكيد
                        },
                        child: const Text(
                          "تأكيد",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: AppColor.blue,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  width: 300,
                                  height: 400,
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        "أدخل معلومات الأغنية:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      const SizedBox(height: 20),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: "المغني",
                                          border: OutlineInputBorder(),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColor.pink, width: 2),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      TextField(
                                        decoration: InputDecoration(
                                          hintText: "اسم الأغنية",
                                          border: OutlineInputBorder(),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColor.pink, width: 2),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        color: Colors.black,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "موافق",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Text(
                          "أريد أغنية غير موجودة",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text(
                      "لم يتم تحميل البيانات بعد.",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
