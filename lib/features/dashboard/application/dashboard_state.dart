import 'package:equatable/equatable.dart';
import 'package:feature_first/data/model/user/user.dart';

class DashboardState extends Equatable{
  final bool isLoading;
  final List<UserModel>? users;
  
  const DashboardState({
    required this.isLoading,
    required this.users
  });
  
  @override
  List<Object?> get props => [
    isLoading,
    users
  ];
  
  factory DashboardState.init()=> const DashboardState(
      isLoading: false,
      users: null
  );

  DashboardState copyWith({
    bool? isLoading,
    List<UserModel>? users
  })=> DashboardState(
    isLoading: isLoading ?? this.isLoading,
    users: users ?? this.users
  );

}