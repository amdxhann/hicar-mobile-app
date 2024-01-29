import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentcar/models/car_model.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class AddCarsController extends GetxController {
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
  File? _image;

  final picker = ImagePicker();

  void addCars(
      String? jenis,
      String? jumlahpintu,
      String? kecepatan,
      String? ac,
      String? harga,
      String? nama,
      String? wifi,
      String? seat,
      String? sensor,
      String? bluetooth,
      String? imageUrl) async {
    CollectionReference cars = firestore.collection("cars");

    try {
      await cars.add({
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
        "imageUrl": imageUrl
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil Menambahkan Produk",
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
        middleText: "Gagal Menambahkan Produk",
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
      
      wifiC.dispose();
      seatC.dispose();
      sensorC.dispose();
      bluetoothC.dispose();
      super.onClose();
    }
  }
}
