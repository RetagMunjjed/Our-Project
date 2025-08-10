import 'package:dio/dio.dart';
import 'package:events/cach/cach_helper.dart';
import 'package:events/core/api/dio_consumer.dart';
import 'package:events/cubit/user_cubit.dart';
import 'package:events/screen/detailsdorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper().init();
  runApp(
    BlocProvider(
      create: (context) => UserCubit(DioConsumer(dio: Dio())),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Detailsdorder());
  }
}
