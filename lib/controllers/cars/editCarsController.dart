import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentcar/models/car_model.dart';

class EditCarsController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late SingleValueDropDownController jenisC;
  late SingleValueDropDownController jumlahpintuC;
  late TextEditingController kecepatanC;
  late SingleValueDropDownController acC;
  late TextEditingController hargaC;
  late TextEditingController namaC;
  late SingleValueDropDownController wifiC;
  late SingleValueDropDownController seatC;
  late SingleValueDropDownController sensorC;
  late SingleValueDropDownController bluetoothC;
  String? imageUrl;

  Future<DocumentSnapshot<Object?>> getData(String docId) async {
    DocumentReference docRef = firestore.collection("cars").doc(docId);
    return docRef.get();
  }

  void editCars(
      String jenis,
      String jumlahpintu,
      String kecepatan,
      String ac,
      String harga,
      String nama,
      String wifi,
      String seat,
      String sensor,
      String bluetooth,
      String docId,
      String imageUrl) async {
    DocumentReference docCars = firestore.collection("cars").doc(docId);

    try {
      await docCars.update({
        "nama": nama,
        "jenis": jenis,
        "jumlahpintu": jumlahpintu,
        "kecepatan": kecepatan,
        "ac": ac,
        "harga": harga,
        "wifi": wifi,
        "seat": seat,
        "sensor": sensor,
        "bluetooth": bluetooth,
        "docId": docId,
        "imageUrl": imageUrl
      });

      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil Mengubah Data",
          onConfirm: () {
            Get.back();
            jenisC.clearDropDown();
            jumlahpintuC.clearDropDown();
            kecepatanC.clear();
            acC.clearDropDown();
            hargaC.clear();
            wifiC.clearDropDown();
            seatC.clearDropDown();
            sensorC.clearDropDown();
            bluetoothC.clearDropDown();
            Get.back();
            Get.back();
          },
          textConfirm: "okay");
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Mengubah Data",
      );
    }
  }

  void deleteCars(String docId) {
    DocumentReference docRef = firestore.collection("cars").doc(docId);
    try {
      Get.defaultDialog(
          title: "Delete Data",
          middleText: "Apakah Yakin Ingin Menghapus Data?",
          onConfirm: () async {
            await docRef.delete();
            Get.back();
            Get.back();
          },
          textConfirm: "Yes",
          textCancel: "No");
    } catch (e) {
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menghapus Data",
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    jenisC = SingleValueDropDownController();
    jumlahpintuC = SingleValueDropDownController();
    kecepatanC = TextEditingController();
    acC = SingleValueDropDownController();
    hargaC = TextEditingController();
    namaC = TextEditingController();
    wifiC = SingleValueDropDownController();
    seatC = SingleValueDropDownController();
    sensorC = SingleValueDropDownController();
    bluetoothC = SingleValueDropDownController();

    @override
    void onClose() {
      jenisC.dispose();
      jumlahpintuC.dispose();
      kecepatanC.dispose();
      acC.dispose();
      hargaC.dispose();
      namaC.dispose();
      super.onClose();
      wifiC.dispose();
      seatC.dispose();
      sensorC.dispose();
      bluetoothC.dispose();
    }
  }
}
