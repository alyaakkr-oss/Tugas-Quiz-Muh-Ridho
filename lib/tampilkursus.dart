import 'package:flutter/material.dart';
import 'halamanutama.dart';

class tampilkursus extends StatelessWidget {

  final String noPesan;
  final String nama;
  final String noHp;
  final String st;

  final bool bahasaInggris;
  final bool python;
  final bool mobileFlutter;
  final bool web;

  final int total;

  const tampilkursus({
    super.key,
    required this.noPesan,
    required this.nama,
    required this.noHp,
    required this.st,
    required this.bahasaInggris,
    required this.python,
    required this.mobileFlutter,
    required this.web,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 112, 114, 247),
        title: const Text("Tampil"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Halamanutama(),
                ),
              );
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text("No. Pesanan : $noPesan"),

            const SizedBox(height: 10),

            Text("Nama : $nama"),

            const SizedBox(height: 10),

            Text("No. Telp : $noHp"),

            const SizedBox(height: 10),

            Text("Status : $st"),

            const SizedBox(height: 10),

            const Text("Pesanan :"),

            if (bahasaInggris)
              const Text("- Bahasa inggris"),

            if (python)
              const Text("-  Python"),

            if (mobileFlutter)
              const Text("- Mobil Flutter"),

            if (web)
              const Text("- Web"),

            const SizedBox(height: 20),

            Text(
              "Total Bayar : Rp$total",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}