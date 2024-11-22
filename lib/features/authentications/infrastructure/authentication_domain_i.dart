import 'package:feature_first/data/api/firebase_services/firebase_services.dart';
import 'package:feature_first/data/model/user/user.dart';
import 'package:feature_first/features/authentications/domain/authentication_domain.dart';

class AuthenticationDomI implements AuthenticationDom{

  @override
  Future<UserModel?> createAccount({required Map<String,dynamic> body}) async =>
      await FirebaseServices.createAccount(body: body);

  @override
  Future<UserModel?> logInAccount({required email, required password}) async =>
      await FirebaseServices.login(email: email, password: password);

  @override
  Future<UserModel?> updateProfile({required String userId, required Map<String, dynamic> body}) async =>
      await FirebaseServices.updateUserProfile(userId: userId, body: body);

}