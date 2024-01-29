import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentcar/routes/routes_name.dart';
import '../../../../controllers/users/usersController.dart';

class Users extends StatelessWidget {
  final userC = Get.put(userController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    final userC = Get.find<userController>();
    return StreamBuilder<QuerySnapshot<Object?>>(
        stream: userC.streamdata(),
        builder: (context, snapshot) {
          // if (snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllUser = snapshot.data!.docs;
            return ListView.builder(
                itemCount: listAllUser.length,
                itemBuilder: (BuildContext context, index) => Container(
                      margin: EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(
                          "${(listAllUser[index].data() as Map<String, dynamic>)["firstName"]} ${(listAllUser[index].data() as Map<String, dynamic>)["secondName"]}",
                        ),
                        subtitle: Text(
                            "${(listAllUser[index].data() as Map<String, dynamic>)["email"]}"),
                        // "${(listAllUser[index].data() as Map<String, dynamic>)["firstName"]}}"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        contentPadding: EdgeInsets.all(10),
                        tileColor: Colors.amber,
                        leading: CircleAvatar(),
                        trailing: Wrap(
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                // Get.toNamed(RouteName.editUser,
                                //     arguments: listAllUser[index].id);
                              },
                              icon: Icon(Icons.edit),
                            ), // icon-1
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete),
                            ), // icon-2
                          ],
                        ),
                      ),
                    ));
            // }
          }
          return Center(
            child: Text("tidak ada data"),
          );
        });
  }
}
