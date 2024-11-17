import 'package:feature_first/data/api/firebase_services/firebase_services.dart';
import 'package:feature_first/data/model/user/user.dart';
import 'package:feature_first/features/authentications/domain/authentication_domain.dart';

class AuthenticationDomI implements AuthenticationDom{

  @override
  Future<UserModel?> createAccount({required String fullName, required String email, required String password}) async =>
      await FirebaseServices.createAccount(fullName: fullName, email: email, password: password);

  @override
  Future<UserModel?> logInAccount({required email, required password}) async =>
      await FirebaseServices.login(email: email, password: password);

}