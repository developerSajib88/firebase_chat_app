import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? userId;
  final String? profileImage;
  final String? fullName;
  final String? email;
  final String? password;
  final DateTime? createdAt;

  UserModel({
    this.userId,
    this.profileImage,
    this.fullName,
    this.email,
    this.password,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      profileImage: json['profileImage'],
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      createdAt: (json['createdAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId' : userId,
      'profileImage' : profileImage,
      'fullName': fullName,
      'email': email,
      'password': password,
      'createdAt': createdAt,
    };
  }
}
