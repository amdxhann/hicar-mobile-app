import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/users/editUser.dart';
import '../../../../widgets/textfield.dart';

class editUser extends StatelessWidget {
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  final editUserC = Get.put(editUserController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    final editUserC = Get.find<editUserController>();

    final firstNameField =
        firstname(firstNameEditingController: firstNameEditingController);
    final secondNameField =
        secondName(secondNameEditingController: secondNameEditingController);
    final emailField = email(
      emailEditingController: emailEditingController,
    );
    final passwordField = password(
      passwordEditingController: passwordEditingController,
    );
    final confirmPasswordField = confirmPassword(
        confirmPasswordEditingController: confirmPasswordEditingController,
        passwordEditingController: passwordEditingController);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // leadingWidth: 20,
          toolbarHeight: 90,
          backgroundColor: Color.fromARGB(255, 4, 28, 50),
          title: Text(
            "Edit User",
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: FutureBuilder<DocumentSnapshot<Object?>>(
          future: editUserC.getData(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!.data() as Map<String, dynamic>;
              editUserC.firstnameC.text = data["firstName"];
              editUserC.secondnameC.text = data["secondName"];
              editUserC.emailC.text = data["email"];
              return Container(
                color: Color.fromARGB(135, 63, 62, 62),
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Form(
                    // key: _formKey,
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
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
                            Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(30),
                              color: Color.fromARGB(255, 4, 28, 50),
                              child: MaterialButton(
                                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                                  minWidth: MediaQuery.of(context).size.width,
                                  onPressed: () {},
                                  child: Text(
                                    "Update",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )

                            // SizedBox(height: 5),
                            // SpaceVH(height: 5.0),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
