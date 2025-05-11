import 'package:dio/dio.dart';
import 'package:event/Api/dio_consumer.dart';
import 'package:event/cache/cache_helper.dart';
import 'package:event/cubit/register_cubit.dart';
import 'package:event/repositries/user_ropository.dart';
import 'package:event/repositries/profile_repository.dart'; // تأكد من إنشائه
import 'package:event/widget/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/profile_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  final dio = Dio();
  final dioConsumer = DioConsumer(dio: dio);

  runApp(MyApp(
    userRepository: UserRepository(api: dioConsumer),
    profileRepository: ProfileRepository(api: dioConsumer),
  ));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  final ProfileRepository profileRepository;

  const MyApp({
    Key? key,
    required this.userRepository,
    required this.profileRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(userRepository),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(profileRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => Signup(),
        },
      ),
    );
  }
}
