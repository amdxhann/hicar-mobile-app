import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_faq/flutter_faq.dart';

class Faq extends StatelessWidget {
  List pertanyaan = [
    "Apa saja persyaratan untuk menyewa mobil melalui aplikasi ini?",
    "Bagaimana cara memesan mobil melalui aplikasi ini?",
    "Apakah harga sewa mobil sudah termasuk asuransi?",
    "Apakah bisa membatalkan reservasi?",
    "Apakah ada biaya tambahan yang perlu diperhatikan?",
    "Bagaimana jika saya mengalami kendala atau masalah dengan mobil yang disewa?"
  ];
  List jawaban = [
    "Untuk menyewa mobil melalui aplikasi kami, Anda perlu memiliki SIM yang masih berlaku, usia minimal 21 tahun, kartu kredit yang valid, dan dokumen identifikasi diri seperti KTP atau paspor.",
    "Proses pemesanan mobil melalui aplikasi kami sangat mudah. Anda cukup membuka aplikasi, pilih lokasi dan tanggal pengambilan serta pengembalian mobil, lalu pilih mobil yang Anda inginkan dari daftar yang tersedia. Setelah itu, lengkapi data diri dan metode pembayaran, dan konfirmasi pemesanan Anda.",
    "Ya, harga sewa mobil melalui aplikasi kami sudah termasuk asuransi standar. Namun, ada pilihan untuk meningkatkan cakupan asuransi dengan biaya tambahan jika Anda menginginkannya.",
    "Pembayaran dilakukan secara online melalui aplikasi kami menggunakan kartu kredit atau debit. Anda dapat memasukkan rincian kartu Anda dengan aman dan pembayaran akan diproses setelah Anda mengonfirmasi pemesanan.",
    "Ya, Anda dapat membatalkan reservasi melalui aplikasi kami. Namun, perlu dicatat bahwa kebijakan pembatalan berbeda-beda tergantung pada waktu pembatalan. Pastikan untuk membaca kebijakan pembatalan kami sebelum melanjutkan dengan pembatalan.",
    "Selain biaya sewa mobil, Anda mungkin akan dikenakan biaya tambahan seperti biaya bahan bakar yang tidak terisi penuh saat pengembalian mobil, biaya tambahan untuk pengemudi tambahan, atau biaya tambahan jika mobil mengalami kerusakan selama masa sewa karena kelalaian pengemudi.",
    "ika Anda mengalami kendala atau masalah dengan mobil yang disewa, Anda dapat menghubungi layanan pelanggan kami yang tersedia 24/7 melalui aplikasi atau nomor telepon yang tercantum di aplikasi. Tim kami akan siap membantu Anda menyelesaikan masalah tersebut.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 40,
          ),
        ),
        toolbarHeight: 90,
        centerTitle: true,
        title: Text(
          "FAQ",
          style: TextStyle(
              fontSize: 35, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => FAQ(
            question: pertanyaan[index],
            answer: jawaban[index],
            expandedIcon: const Icon(Icons.minimize),
            collapsedIcon: const Icon(Icons.add),
            showDivider: false,
            queStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Poppins',
            ),
            ansStyle: const TextStyle(
                color: Colors.black, fontSize: 20, fontFamily: 'Poppins'),
            ansPadding: const EdgeInsets.all(10),
          ),
        ),
      ),
    );
  }
}
