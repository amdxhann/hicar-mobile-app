import 'package:flutter/material.dart';
import 'package:rentcar/core/core.dart';
import 'package:get/get.dart';
import '../controllers/users/auth.dart';
import 'package:rentcar/widgets/textfield.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final authC = Get.find<AuthController>();

  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  final teleponEditingController = TextEditingController();
  final alamatEditingController = TextEditingController();
  final noKTPEditingController = TextEditingController();
  final noSIMEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? profilImage;

  @override
  Widget build(BuildContext context) {
    final firstNameField =
        firstname(firstNameEditingController: authC.firstnameC);
    final secondNameField =
        secondName(secondNameEditingController: authC.secondnameC);
    final emailField = email(emailEditingController: authC.emailC);
    final passwordField = password(passwordEditingController: authC.passwordC);
    final confirmPasswordField = confirmPassword(
        confirmPasswordEditingController: authC.confirmPasswordC,
        passwordEditingController: authC.passwordC);

    //signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              authC.signUp(
                authC.emailC.text,
                authC.passwordC.text,
                authC.firstnameC.text,
                authC.secondnameC.text,
                authC.teleponC.text = "",
                authC.alamatC.text = "",
                authC.noKTPC.text = "",
                authC.noSIMC.text = "",
                profilImage = "",
              );
            }
          },
          child: Text(
            "SignUp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            children: [
              Container(
                child: Image.asset(
                  "images/bg1.jpeg",
                  fit: BoxFit.cover,
                ),
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage("images/bg1.jpeg"),
                //         fit: BoxFit.cover)),
              ),
              Container(
                color: Color.fromARGB(136, 42, 40, 40),
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            "REGISTER",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 20),
                        firstNameField,
                        SizedBox(height: 15),
                        secondNameField,
                        SizedBox(height: 15),
                        emailField,
                        SizedBox(height: 15),
                        passwordField,
                        SizedBox(height: 15),
                        confirmPasswordField,
                        SizedBox(height: 15),
                        signUpButton,
                        // SizedBox(height: 5),
                        // SpaceVH(height: 5.0),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: 'Have an account? ',
                              style: headline.copyWith(
                                fontSize: 14.0,
                              ),
                            ),
                            TextSpan(
                                text: ' Sign In',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                )),
                          ])),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
