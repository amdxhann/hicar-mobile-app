import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rentcar/routes/routes_name.dart';
import '../../models/user_model.dart';

class ProfileController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  String? errorMessage;
  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  UserModel userModel = UserModel();
//
  //get data current user

  // final user = FirebaseAuth.instance.currentUser!.uid;
  final tes = FirebaseFirestore.instance.collection('users').get();
  // print(tes);
}
