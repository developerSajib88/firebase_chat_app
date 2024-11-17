import 'package:feature_first/data/model/user/user.dart';

abstract class AuthenticationDom {
  Future<UserModel?> createAccount({ required String fullName, required String email, required String password});
  Future<UserModel?> logInAccount({required email, required password});
}