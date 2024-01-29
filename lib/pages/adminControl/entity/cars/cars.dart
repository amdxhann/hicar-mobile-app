import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentcar/controllers/cars/carsController.dart';
import '../../../../routes/routes_name.dart';

class Cars extends StatelessWidget {
  final CarsC = Get.put(CarsController());
  @override
  Widget build(BuildContext context) {
    final CarsC = Get.find<CarsController>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(RouteName.AddCars);
          },
          child: const Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 0, 0, 0)),
      body: StreamBuilder<QuerySnapshot<Object?>>(
          stream: CarsC.streamdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              var listAllCars = snapshot.data!.docs;
              return Container(
                child: ListView.builder(
                    itemCount: listAllCars.length,
                    itemBuilder: (BuildContext, index) {
                      return Column(
                        children: [
                          Container(
                            child: Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 20, left: 20, top: 14),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(RouteName.EditCars,
                                        arguments: listAllCars[index].id);
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    color: Color.fromARGB(255, 6, 70, 99),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    "${(listAllCars[index].data() as Map<String, dynamic>)["nama"]}"
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                            "${(listAllCars[index].data() as Map<String, dynamic>)["imageUrl"]}",
                                                          )),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    width: 160,
                                                    height: 100,
                                                  )
                                                ],
                                              ),
                                              Container(
                                                height: 130,
                                                width: 110,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                            height: 20,
                                                            child: Image.asset(
                                                                "images/transmission.png")),
                                                        Text(
                                                          "  ${(listAllCars[index].data() as Map<String, dynamic>)["jenis"]}",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color:
                                                                  Colors.white),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                            height: 20,
                                                            child: Image.asset(
                                                                "images/car-door.png")),
                                                        Text(
                                                          "  ${(listAllCars[index].data() as Map<String, dynamic>)["jumlahpintu"]} Doors",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color:
                                                                  Colors.white),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                            height: 20,
                                                            child: Image.asset(
                                                                "images/speedometer.png")),
                                                        Text(
                                                          "  ${(listAllCars[index].data() as Map<String, dynamic>)["kecepatan"]} km/h",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color:
                                                                  Colors.white),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                            height: 20,
                                                            child: Image.asset(
                                                              "images/air-conditioner.png",
                                                            )),
                                                        Text(
                                                          "  ${(listAllCars[index].data() as Map<String, dynamic>)["ac"]}",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color:
                                                                  Colors.white),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
