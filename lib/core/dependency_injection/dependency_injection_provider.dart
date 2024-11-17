part of 'package:feature_first/core/dependency_injection/dependency_injection.dart';


final authenticationProvider = StateNotifierProvider<AuthenticationStateNotifier,AuthenticationState>(
        (ref)=> AuthenticationStateNotifier(getIt()));