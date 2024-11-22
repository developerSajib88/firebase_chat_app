import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feature_first/common/global/functions/global_functions.dart';
import 'package:feature_first/data/api/firebase_services/firebase_services.dart';
import 'package:feature_first/data/model/user/user.dart';
import 'package:feature_first/features/authentications/applications/authentication_state.dart';
import 'package:feature_first/features/authentications/domain/authentication_domain.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:crypto/crypto.dart';

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
        "password": sha256.convert(utf8.encode(state.passwordController.text)).toString(),
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


  Future updateProfilePicture({required File imageFile})async{

    stateMaker(state.copyWith(isLoading: true));
    await FirebaseServices.uploadProfilePicture(
        imageFile,
        state.userModel?.userId ?? ""
    ).then((image)async{

      if(image != null){
        Map<String,dynamic> body = {"profileImage" : image};
        await authenticationDom.updateProfile(
            userId: state.userModel?.userId ?? "",
            body: body
        ).then((user){
          if(user != null){
            stateMaker(state.copyWith(userModel: user));
          }
        });
      }
    });
    stateMaker(state.copyWith(isLoading: false));

  }



}