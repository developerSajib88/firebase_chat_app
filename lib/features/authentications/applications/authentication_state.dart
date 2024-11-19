import 'package:equatable/equatable.dart';
import 'package:feature_first/data/model/user/user.dart';
import 'package:flutter/cupertino.dart';

class AuthenticationState extends Equatable{
  final bool? isLoading;
  final UserModel? userModel;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const AuthenticationState({
    required this.isLoading,
    required this.userModel,
    required this.nameController,
    required this.emailController,
    required this.passwordController
  });

  factory AuthenticationState.init()=> AuthenticationState(
    isLoading: false,
    userModel: null,
    nameController: TextEditingController(),
    emailController: TextEditingController(),
    passwordController: TextEditingController()
  );

  @override
  List<Object?> get props => [
    isLoading,
    userModel,
    nameController,
    emailController,
    passwordController
  ];

  AuthenticationState copyWith({
    bool? isLoading,
    UserModel? userModel,
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? passwordController
  })=> AuthenticationState(
    isLoading: isLoading ?? this.isLoading,
    userModel: userModel ?? this.userModel,
    nameController: nameController ?? this.nameController,
    emailController: emailController ?? this.emailController,
    passwordController: passwordController ?? this.passwordController
  );

}