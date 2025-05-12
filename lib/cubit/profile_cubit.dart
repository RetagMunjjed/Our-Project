import 'package:bloc/bloc.dart';
import 'package:event/repositries/profile_repository.dart';
import 'package:meta/meta.dart';
import 'dart:io';
import '../models/userProfile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;

  ProfileCubit(this.repository) : super(ProfileInitial());

  UserProfileModel? user;

  Future<void> fetchProfile() async {
    emit(ProfileLoading());
    final result = await repository.getUserProfile();
    result.fold(
      (error) => emit(ProfileError(error)),
      (data) {
        user = data;
        emit(ProfileLoaded(data));
      },
    );
  }

  Future<void> updateUserProfile({
    required String name,
    required String email,
    String? phone,
    
    File? image_url,
    String? oldPassword,
    String? newPassword,
  }) async {
    emit(ProfileUpdating());
    final result = await repository.updateProfile(
      name: name,
      email: email,
      phone: phone,
      image: image_url,
      oldPassword: oldPassword, // أضف هذا
      newPassword: newPassword,
    );

    result.fold(
      (error) => emit(ProfileError(error)),
      (data) async {
        user = data.user;
        emit(ProfileLoaded(data.user)); // إرسال الحالة الجديدة
        emit(ProfileUpdatedSuccessfully(data.message));
      // انتظر قليلاً لإتاحة الوقت للسيرفر لتحديث البيانات
      await Future.delayed(Duration(milliseconds: 500));
      await fetchProfile();
        // إعادة تحميل البيانات بعد التحديث
        await fetchProfile();
      },
    );
  }

  Future<void> uploadProfileImage(File image) async {
    emit(ProfileUpdating());
    final result = await repository.uploadImage(image);
    result.fold(
      (error) => emit(ProfileError(error)),
      (imageUrl) {
        user!.imageUrl = imageUrl;
        emit(ProfileImageUpdated(imageUrl));
      },
    );
  }
}
