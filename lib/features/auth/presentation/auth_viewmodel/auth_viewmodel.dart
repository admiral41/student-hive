import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:student_management_hive_api/features/auth/presentation/state/auth_state.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(
    ref.read(uploadImageUseCaseProvider),
  ),
);

class AuthViewModel extends StateNotifier<AuthState> {
  final UploadImageUseCase _uploadImageUsecase;

  AuthViewModel(
    this._uploadImageUsecase,
  ) : super(AuthState.initial());

  Future<void> uploadImage(File? file) async {
    state = state.copyWith(isLoading: true);
    var data = await _uploadImageUsecase.uploadProfilePicture(file!);
    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
      },
      (imageName) {
        state = state.copyWith(
          isLoading: false,
          error: null,
          imageName: imageName,
        );
      },
    );
  }

  void reset() {
    state = state.copyWith(
      isLoading: false,
      error: null,
      imageName: null,
    );
  }

  void resetMessage(bool value) {
    state = state.copyWith(
      isLoading: false,
      error: null,
      imageName: null,
    );
  }
}
