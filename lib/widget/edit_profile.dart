import 'dart:io';

import 'package:event/cubit/profile_cubit.dart';
import 'package:event/widget/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  File? _image;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _bioController;
  late TextEditingController _oldPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    final profile = context.read<ProfileCubit>().user;
    _nameController = TextEditingController(text: profile?.name);
    _emailController = TextEditingController(text: profile?.email);
    _phoneController = TextEditingController(text: profile?.phone);
    _bioController = TextEditingController(text: profile?.bio);
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      await context.read<ProfileCubit>().uploadProfileImage(_image!);
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_newPasswordController.text.isNotEmpty &&
          _newPasswordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('كلمة المرور الجديدة غير متطابقة')),
        );
        return;
      }

      context.read<ProfileCubit>().updateUserProfile(
            name: _nameController.text,
            email: _emailController.text,
            phone: _phoneController.text,
            bio: _bioController.text,
            image: _image,
            oldPassword: _oldPasswordController.text.isNotEmpty
                ? _oldPasswordController.text
                : null,
            newPassword: _newPasswordController.text.isNotEmpty
                ? _newPasswordController.text
                : null,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.pink,
        title: const Text("Edit", style: TextStyle(color: Colors.white)),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdatedSuccessfully) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            Navigator.pop(context, true);
          } else if (state is ProfileImageUpdated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('تم تحديث الصورة بنجاح')),
            );
          } else if (state is ProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Profile Picture
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: _image != null
                            ? FileImage(_image!)
                            : (context.read<ProfileCubit>().user?.image != null
                                ? NetworkImage(
                                    context.read<ProfileCubit>().user!.image!)
                                : null),
                        child: _image == null &&
                                context.read<ProfileCubit>().user?.image == null
                            ? const Icon(Icons.person,
                                size: 60, color: Colors.white)
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.camera_alt, color: AppColor.pink),
                          onPressed: _pickImage,
                        ),
                      ),
                      if (state is ProfileUpdating)
                        const Positioned.fill(
                          child: CircularProgressIndicator(),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Personal Info Fields
                _buildTextField(_nameController, "Full Name"),
                const SizedBox(height: 16),
                _buildTextField(_emailController, "Email"),
                const SizedBox(height: 16),
                _buildTextField(_phoneController, "Phone", optional: true),
                const SizedBox(height: 16),
                _buildTextField(_bioController, "Bio", optional: true, maxLines: 3),
                const SizedBox(height: 30),

                // Password Fields
                _buildPasswordField(
                    _oldPasswordController, "Old Password", isPassword: true),
                const SizedBox(height: 16),
                _buildPasswordField(
                    _newPasswordController, "New Password", isPassword: true),
                const SizedBox(height: 16),
                _buildPasswordField(_confirmPasswordController,
                    "Confirm Password", isPassword: true),
                const SizedBox(height: 30),

                // Save Button
                if (state is ProfileUpdating)
                  const Center(child: CircularProgressIndicator())
                else
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.pink,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: _submitForm,
                    child: const Text("Save Changes",
                        style: TextStyle(color: Colors.white)),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {bool optional = false, int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.pink),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.pink),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.pink),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      maxLines: maxLines,
      validator: (value) {
        if (!optional && (value == null || value.isEmpty)) {
          return 'This field is required';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField(
      TextEditingController controller, String label,
      {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.pink),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.pink),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.pink),
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: isPassword ? const Icon(Icons.lock) : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}