
import 'package:feature_first/features/authentications/applications/authentication_state.dart';
import 'package:feature_first/features/authentications/applications/authentication_state_notifier.dart';
import 'package:feature_first/features/authentications/domain/authentication_domain.dart';
import 'package:feature_first/features/authentications/infrastructure/authentication_domain_i.dart';
import 'package:feature_first/features/dashboard/application/dashboard_state.dart';
import 'package:feature_first/features/dashboard/application/dashboard_state_notifier.dart';
import 'package:feature_first/features/dashboard/domain/dashboard_domain.dart';
import 'package:feature_first/features/dashboard/infrastructure/dashboard_domain_i.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'package:feature_first/core/dependency_injection/dependency_injection_provider.dart';

final getIt = GetIt.instance;

void init(){
  getIt.registerLazySingleton<AuthenticationDom>(()=> AuthenticationDomI());
  getIt.registerLazySingleton<DashboardDomain>(()=> DashboardDomainI());
}