import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feature_first/common/global/functions/global_functions.dart';
import 'package:feature_first/features/authentications/applications/authentication_state.dart';
import 'package:feature_first/features/authentications/domain/authentication_domain.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthenticationStateNotifier extends StateNotifier<AuthenticationState>{

  final AuthenticationDom authenticationDom;
  AuthenticationStateNotifier({required this.authenticationDom}):super(AuthenticationState.init());

  stateMaker(AuthenticationState newState) => state = newState;

  Future<bool> createAccount()async{
    stateMaker(state.copyWith(isLoading: true));
    bool success = false;
    await authenticationDom.createAccount(
      body: {
        "userId": GlobalFunctions.generateRandomUserId(),
        "fullName": state.nameController.text,
        "email": state.emailController.text,
        "password": state.passwordController.text,
        "createdAt": FieldValue.serverTimestamp(),
      }
    ).then((value){
      if(value != null){
        success = true;
        stateMaker(
          state.copyWith(
            isLoading: false,
            userModel: value
          )
        );
      }
    });
    stateMaker(state.copyWith(isLoading: false));
    return success;
  }


  Future<bool> logInAccount()async{
    stateMaker(state.copyWith(isLoading: true));
    bool success = false;
    await authenticationDom.logInAccount(
        email: state.emailController.text,
        password: state.passwordController.text
    ).then((value){
      if(value != null){
        success = true;
        stateMaker(
            state.copyWith(
                isLoading: false,
                userModel: value
            )
        );
      }
    });
    stateMaker(state.copyWith(isLoading: false));
    return success;
  }

}