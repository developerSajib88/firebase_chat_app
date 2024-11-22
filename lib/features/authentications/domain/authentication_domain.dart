import 'package:feature_first/data/model/user/user.dart';

abstract class AuthenticationDom {
  Future<UserModel?> createAccount({required Map<String,dynamic> body});
  Future<UserModel?> logInAccount({required email, required password});
}