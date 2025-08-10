import 'package:events/models/dj_model.dart';
import 'package:events/models/halls_model.dart';
import 'package:events/models/music_model.dart';
import 'package:events/models/photo_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class SignInLoading extends UserState {}

class UploadProfilePic extends UserState {}

class SignInSuccess extends UserState {}

class SignInFailure extends UserState {
  final String errMessage;
  SignInFailure({required this.errMessage});
}

class SignUpLoading extends UserState {}

class SignUpSuccess extends UserState {
  final String message;
  SignUpSuccess({required this.message});
}

class SignUpFailure extends UserState {
  final String errMessage;
  SignUpFailure({required this.errMessage});
}

// class GetUserLoading extends UserState {}

// class GetUserSuccess extends UserState {
//   final UserModel user;
//   GetUserSuccess({required this.user});
// }

// class GetUserFaliure extends UserState {
//   final String errMessage;
//   GetUserFaliure({required this.errMessage});
// }

class GetHallsLoading extends UserState {}

class GetHallsSuccess extends UserState {
  final List<HallsModel> halls;
  GetHallsSuccess({required this.halls});
}

class GetHallsFaliure extends UserState {
  final String message;
  GetHallsFaliure({required this.message});
}

class GetMusicLoading extends UserState {}

class GetMusicSuccess extends UserState {
  final List<MusicModel> arabicSongs;
  final List<MusicModel> englishSongs;
  final List<DjModel> dj;

  GetMusicSuccess({
    required this.arabicSongs,
    required this.englishSongs,
    required this.dj,
  });
}

class GetMusicFailure extends UserState {
  final String message;

  GetMusicFailure({required this.message});
}

class GetPhotoLoading extends UserState {}

class GetPhotoSuccess extends UserState {
  final List<PhotoModel> photos;
  GetPhotoSuccess({required this.photos});
}

class GetPhotoFaliure extends UserState {
  final String message;
  GetPhotoFaliure({required this.message});
}

class PostTaskLoading extends UserState {}

class PostTaskSuccess extends UserState {}

class PostTaskFailure extends UserState {
  final String errMessage;
  PostTaskFailure({required this.errMessage});
}
