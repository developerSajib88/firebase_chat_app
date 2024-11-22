import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'package:feature_first/data/api/firebase_collections/firebase_collections.dart';
import 'package:feature_first/data/model/user/user.dart';

class FirebaseServices {

  static Future<UserModel?> createAccount({
    required Map<String,dynamic> body
  }) async {
    try {
      // Hash the password for security
      String hashedPassword = sha256.convert(utf8.encode(body["password"])).toString();

      // Check if an account with the email already exists
      final querySnapshot = await FirebaseCollections.users
          .where('email', isEqualTo: body["email"])
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        throw Exception('Account with this email already exists.');
      }

      // Store user data in Firestore and get the document ID
      final userRef = await FirebaseCollections.users.add(body);

      // Fetch the newly created user data
      final userDoc = await userRef.get();
      UserModel userModel = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);

      print("Account created successfully!");
      return userModel; // Return user data
    } catch (e) {
      print("Error creating account: $e");
      return null; // Return null if there was an error
    }
  }

  static Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      // Hash the entered password
      String hashedPassword = sha256.convert(utf8.encode(password)).toString();

      // Query Firestore for the user with the matching email and hashed password
      final querySnapshot = await FirebaseCollections.users
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: hashedPassword)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Retrieve the user's data from the first matched document
        final userDoc = querySnapshot.docs.first;

        UserModel userModel = UserModel.fromJson(userDoc.data() as Map<String,dynamic>);
        print("Login successful!");
        return userModel; // Return the user's data
      } else {
        print("Invalid email or password.");
        return null; // Invalid credentials
      }
    } catch (e) {
      print("Error during login: $e");
      return null; // Return null in case of an error
    }
  }


  static Future<List<UserModel>?> getAllUsers() async {
    try {
      // Reference to the 'users' collection
      final querySnapshot = await FirebaseCollections.users.get();

      // Convert the documents into a list of maps
      List<UserModel>? users = querySnapshot.docs.map((doc) {
        return UserModel.fromJson(doc.data() as Map<String,dynamic>);
      }).toList();

      return users; // Return the list of users
    } catch (e) {
      print("Error fetching users: $e");
      return []; // Return an empty list on error
    }
  }



}