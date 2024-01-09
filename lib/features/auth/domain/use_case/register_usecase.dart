import 'package:dartz/dartz.dart';
import 'package:student_management_hive_api/core/failure/failure.dart';
import 'package:student_management_hive_api/features/auth/domain/entity/auth_entity.dart';
import 'package:student_management_hive_api/features/auth/domain/repository/auth_repository.dart';

class RegisterUserUseCase {
  final IAuthRepository _registerUseCase;

  RegisterUserUseCase(this._registerUseCase);

  Future<Either<Failure, bool>> registerStudent(AuthEntity student) async {
    return await _registerUseCase.registerStudent(student);
  }
}
