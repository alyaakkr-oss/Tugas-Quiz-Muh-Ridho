import 'package:flutter/material.dart';
import 'package:ridho_intent/halamanUtama.dart';

class tampilpesanan extends StatefulWidget {
  final String noPesanan, nama, noTelp, payment, kartu;
  final bool jusjeruk, alpukat, mierebus, gado2;

  const tampilpesanan({
    super.key,
    required this.noPesanan,
    required this.nama,
    required this.noTelp,
    required this.payment,
    required this.jusjeruk,
    required this.alpukat,
    required this.mierebus,
    required this.gado2,
    required this.kartu
  });

  @override
  State<tampilpesanan> createState() => _tampilpesananState();
}

class _tampilpesananState extends State<tampilpesanan> {
  double total = 0;
  double diskon = 0;
  double PPN = 0;
  double totalBayarsetelahdiskon = 0;
  double totalbayarsetelahppn = 0;

  void hitung() {
    total = 0;

    if (widget.jusjeruk) {
      total += 15000;
    }
    if (widget.alpukat) {
      total += 20000;
    }
    if (widget.mierebus) {
      total += 10000;
    }
    if (widget.gado2) {
      total += 17500;
    }

    if (widget.kartu == "Gold") {
      diskon = total * 0.1;
    } else if (widget.kartu == "Silver") {
      diskon = total * 0.05;
    } else {
      diskon = total * 0.025;
    }

   totalBayarsetelahdiskon = total - diskon;

  if (widget.payment == "Tunai") {
    PPN = totalBayarsetelahdiskon * 0.03;
  } else if (widget.payment == "Transfer") {
    PPN = totalBayarsetelahdiskon * 0.02;
  }

  totalbayarsetelahppn = totalBayarsetelahdiskon + PPN;
}

  @override
  Widget build(BuildContext context) {
    hitung();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Tampil Data"),
        actions: [
          IconButton(
            onPressed: () {
               Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const Halamanutama()),
              );
            },
            icon: const Icon(Icons.close),
          )],),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("No. Pesanan : ${widget.noPesanan}"),
            const SizedBox(height: 8),
            Text("Nama : ${widget.nama}"),
            const SizedBox(height: 8),
            Text("No. Telp : ${widget.noTelp}"),
            const SizedBox(height: 8),
            Text("Kartu Anggota : ${widget.kartu}"),
            const SizedBox(height: 8),
            Text("Jenis Pembayaran : ${widget.payment}"),
            const SizedBox(height: 8),
            const Text("Pesanan :"),
            const SizedBox(height: 8),

            if (widget.jusjeruk) ...[
              const Text(" - Jus Jeruk"),
              const SizedBox(height: 8),
            ],

            if (widget.alpukat) ...[
              const Text(" - Alpukat"),
              const SizedBox(height: 8),
            ],

            if (widget.mierebus) ...[
              const Text(" - Mie Rebus"),
              const SizedBox(height: 8),
            ],

            if (widget.gado2) ...[
              const Text(" - Gado-gado"),
              const SizedBox(height: 8),
            ],

            Text("Diskon : Rp${diskon.toStringAsFixed(0)}"),
            const SizedBox(height: 8),
            Text("PPN : Rp${PPN.toStringAsFixed(0)}"),
            const SizedBox(height: 8),
            Text("Total Bayar : Rp${totalbayarsetelahppn.toStringAsFixed(0)}"),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}