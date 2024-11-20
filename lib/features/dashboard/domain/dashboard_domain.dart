import 'package:feature_first/data/model/user/user.dart';

abstract class DashboardDomain {
  Future<List<UserModel>?> getUsers();
}