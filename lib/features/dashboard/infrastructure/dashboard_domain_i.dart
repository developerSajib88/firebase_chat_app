import 'package:feature_first/data/api/firebase_services/firebase_services.dart';
import 'package:feature_first/data/model/user/user.dart';
import 'package:feature_first/features/dashboard/domain/dashboard_domain.dart';

class DashboardDomainI implements DashboardDomain{

  @override
  Future<List<UserModel>?> getUsers() async =>
      await FirebaseServices.getAllUsers();

}