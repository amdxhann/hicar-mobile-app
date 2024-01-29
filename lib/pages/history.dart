import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/Transaksi/historyController.dart';
import '../controllers/users/auth.dart';
import '../models/user_model.dart';

class history extends StatefulWidget {
  static const nameroute = '/history';

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  final HistoryC = Get.put(HistoryController());
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final authC = Get.find<AuthController>();

  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final HistoryC = Get.find<HistoryController>();
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Object?>>(
          stream: HistoryC.streamdataCars(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              var listUsers = snapshot.data!.docs;
              return StreamBuilder<QuerySnapshot<Object?>>(
                  stream: HistoryC.streamdataCars(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      var listCars = snapshot.data!.docs;
                      return StreamBuilder<QuerySnapshot<Object?>>(
                          stream: HistoryC.streamdataTransaksi(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.active) {
                              var listHistory = snapshot.data!.docs;
                              return CustomScrollView(
                                slivers: [
                                  SliverAppBar(
                                    pinned: true,
                                    toolbarHeight: 90,
                                    automaticallyImplyLeading: false,
                                    centerTitle: true,
                                    title: Text(
                                      "Recent History",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SliverList(
                                      delegate: SliverChildListDelegate([
                                    ListView.builder(
                                        controller: ScrollController(
                                            keepScrollOffset: true),
                                        shrinkWrap: true,
                                        itemCount: listHistory.length,
                                        itemBuilder: (context, index) {
                                          if ((listHistory[index].data() as Map<
                                                  String, dynamic>)["userId"] ==
                                              loggedInUser.uid) {
                                            return Container(
                                              margin: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.black26,
                                                    width: 1),
                                                color: Colors.white,
                                              ),
                                              child: ListTile(
                                                style: ListTileStyle.list,
                                                leading: Container(
                                                    padding: EdgeInsets.all(5),
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color: Colors.black26,
                                                          width: 1),
                                                      color: Colors.white,
                                                    ),
                                                    child: Image(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            "${(listCars[index].data() as Map<String, dynamic>)["imageUrl"]}"))),
                                                title: Text(
                                                  "${(listCars[index].data() as Map<String, dynamic>)["nama"]}",
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                  "${(listHistory[index].data() as Map<String, dynamic>)["tanggalSewa"]}",
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black38),
                                                ),
                                                trailing: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Rp ${(listCars[index].data() as Map<String, dynamic>)["harga"]}",
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    // Text("1 Day",
                                                    //     style: TextStyle(
                                                    //         fontFamily:
                                                    //             'Poppins',
                                                    //         fontSize: 15,
                                                    //         fontWeight:
                                                    //             FontWeight.bold,
                                                    //         color:
                                                    //             Colors.black38))
                                                  ],
                                                ),
                                              ),
                                            );
                                          } else {
                                            Center(
                                                child: Text(
                                              "TIDAK ADA DATA",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ));
                                          }
                                        })
                                  ]))
                                ],
                              );
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          });
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
