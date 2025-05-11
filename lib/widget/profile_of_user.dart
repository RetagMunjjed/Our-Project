import 'package:event/widget/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/profile_cubit.dart';
import 'edit_profile.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().fetchProfile(); // تحميل بيانات المستخدم
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        title: Text("Profile", style: TextStyle(color: Colors.white)),
      ),
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdatedSuccessfully) {
            context.read<ProfileCubit>().fetchProfile(); // إعادة تحميل عند تلقي إشعار التحديث
          }
        },
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProfileLoaded) {
              final user = state.user;

              return ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey[400],
                      child: Icon(Icons.person, size: 80, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 30),

                  // Full Name
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.person, color: AppColor.blue),
                      title: Text("Full Name"),
                      subtitle: Text(user.name),
                    ),
                  ),

                  // Email
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.email, color: AppColor.blue),
                      title: Text("Email"),
                      subtitle: Text(user.email),
                    ),
                  ),

                  // Password (عرض ثابت غير حقيقي)
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.lock, color: AppColor.blue),
                      title: Text("Password"),
                      subtitle: Text("********"),
                    ),
                  ),

                  // زر التعديل
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: AppColor.blue,
                      onPressed: () async {
                        final shouldRefresh = await Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Edit()),
                        );
                        
                        if (shouldRefresh == true) {
                          context.read<ProfileCubit>().fetchProfile();
                        }
                      },
                      child: Text("Edit", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              );
            } else if (state is ProfileError) {
              return Center(child: Text("Error: ${state.error}"));
            } else {
              return Center(child: Text("No data available."));
            }
          },
        ),
      ),
    );
  }
}