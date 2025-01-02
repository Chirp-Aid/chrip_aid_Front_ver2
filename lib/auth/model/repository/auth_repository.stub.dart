import 'package:chrip_aid/auth/dto/login_request_dto.dart';
import 'package:chrip_aid/auth/dto/signup_request_dto.dart';
import 'package:chrip_aid/auth/model/repository/auth_repository.dart';

class AuthRepositoryStub implements AuthRepository {
  @override
  Future login(LoginRequestDto loginRequestDto) async {
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Future saveToken(String fcmToken) async {
    throw Exception();
  }

  @override
  Future signup(SignupRequestDto signupRequestDto) async {}
}
