part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserProfileModel user;

  ProfileLoaded(this.user);
}

class ProfileError extends ProfileState {
  final String error;

  ProfileError(this.error);
}
class ProfileUpdatedSuccessfully extends ProfileState {
  final String message;
  
  ProfileUpdatedSuccessfully(this.message);
}
class ProfileUpdating extends ProfileState {}
class ProfileImageUpdated extends ProfileState {
  final String imageUrl;
  
  ProfileImageUpdated(this.imageUrl);
}