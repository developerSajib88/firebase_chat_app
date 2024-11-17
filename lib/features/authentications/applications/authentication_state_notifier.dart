import 'package:feature_first/features/authentications/applications/authentication_state.dart';
import 'package:feature_first/features/authentications/domain/authentication_domain.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthenticationStateNotifier extends StateNotifier<AuthenticationState>{

  final AuthenticationDom authenticationDom;
  AuthenticationStateNotifier(this.authenticationDom):super(AuthenticationState.init());

  stateMaker(AuthenticationState newState) => state = newState;

  Future<void> createAccount()async{
    stateMaker(state.copyWith(isLoading: true));
    await authenticationDom.createAccount(
        fullName: state.nameController.text,
        email: state.emailController.text,
        password: state.passwordController.text
    ).then((value){
      if(value != null){
        stateMaker(
          state.copyWith(
            isLoading: false,
            userModel: value
          )
        );
      }
    });
    stateMaker(state.copyWith(isLoading: false));
  }


  Future<void> logInAccount()async{
    stateMaker(state.copyWith(isLoading: true));
    await authenticationDom.logInAccount(
        email: state.emailController.text,
        password: state.passwordController.text
    ).then((value){
      if(value != null){
        stateMaker(
            state.copyWith(
                isLoading: false,
                userModel: value
            )
        );
      }
    });
    stateMaker(state.copyWith(isLoading: false));
  }

}