import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rentcar/routes/routes_name.dart';
import '../../models/user_model.dart';

class AuthController extends GetxController {
  late TextEditingController firstnameC;
  late TextEditingController secondnameC;
  late TextEditingController emailC;
  late TextEditingController passwordC;
  late TextEditingController confirmPasswordC;
  late TextEditingController teleponC;
  late TextEditingController alamatC;
  late TextEditingController noKTPC;
  late TextEditingController noSIMC;

  FirebaseAuth auth = FirebaseAuth.instance;
  String? errorMessage;
  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  UserModel userModel = UserModel();
  // login
  void login(String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                if (email == "admin@gmail.com")
                  {
                    Get.toNamed(
                      RouteName.adminControl,
                    )
                  }
                else
                  {
                    Get.toNamed(
                      RouteName.navigasi,
                    )
                  }
              });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";

          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
    }
  }

  // signup
  void signUp(
    String email,
    String password,
    String firstname,
    String secondname,
    String telepon,
    String alamat,
    String noHP,
    String noSIM,
    String profilImage,
  ) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailsToFirestore(
                  firstname,
                  secondname,
                  telepon,
                  alamat,
                  noHP,
                  noSIM,
                  profilImage,
                ),
                Get.toNamed(RouteName.loginScreen)
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage!);
    }
  }

  // post data ke firestore
  postDetailsToFirestore(String firstname, String secondname, String telepon,
      String alamat, String noKTP, String noSIM, String profilImage) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    UserModel userModel = UserModel();
    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstname;
    userModel.secondName = secondname;
    userModel.telepon = telepon;
    userModel.alamat = alamat;
    userModel.noKTP = noKTP;
    userModel.noSIM = noSIM;
    userModel.profilImage = profilImage;

    firebaseFirestore.collection("users").doc(user.uid);
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");
  }

// logout
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void onInit() {
    super.onInit();
    firstnameC = TextEditingController();
    secondnameC = TextEditingController();
    passwordC = TextEditingController();
    confirmPasswordC = TextEditingController();
    emailC = TextEditingController();
    teleponC = TextEditingController();
    alamatC = TextEditingController();
    noSIMC = TextEditingController();
    noKTPC = TextEditingController();
  }

  @override
  void onClose() {
    firstnameC.dispose();
    secondnameC.dispose();
    passwordC.dispose();
    confirmPasswordC.dispose();
    emailC.dispose();
    teleponC.dispose();
    alamatC.dispose();
    noSIMC.dispose();
    noKTPC.dispose();
    super.onClose();
  }
}
