import 'package:flutter/material.dart';
import 'package:ridho_intent/halamanutama.dart';
import 'package:ridho_intent/tampilpesanan.dart';

class Inputpesanan extends StatelessWidget {
  const Inputpesanan({super.key});

  @override
  Widget build(BuildContext context)
   {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const lamanpesanan(),
    );
  }
}

class lamanpesanan extends StatefulWidget {
  const lamanpesanan({super.key});

  @override
  State<lamanpesanan> createState() => _lamanpesananState();
}

class _lamanpesananState extends State<lamanpesanan> {

  TextEditingController noPesanan = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController noTelp = TextEditingController();

  int? payment;
  String? pay;

  var kartu = ["Gold", "Silver", "Perunggu"];
  String setSelecteditem = "Gold";

  bool jusjeruk = false;
  bool alpukat = false;
  bool mierebus = false;
  bool gado2 = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Pesanan"),
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
        child: ListView(
          children: [

            TextField(
              controller: noPesanan,
              decoration: const InputDecoration(
                labelText: "No. Pesanan",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: nama,
              decoration: const InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: noTelp,
              decoration: const InputDecoration(
                labelText: "No. telp",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),
             Row(
                children: <Widget>[
                  const Text('Kartu Anggota'),
                  const SizedBox(width: 25),
                  DropdownButton<String>(
                    value: setSelecteditem,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: kartu.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );}).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        setSelecteditem = newValue!;
                      });
                    },),
                ],), 
                
                const Text("Jenis Pembayaran"),

            Row(
              children: [

                Radio(
                  value: 1,
                  groupValue: payment,
                  onChanged: (value) {
                    setState(() {
                      payment = value as int;
                      pay = "Tunai";
                    });
                  },
                ),

                const Text("Tunai"),

                Radio(
                  value: 2,
                  groupValue: payment,
                  onChanged: (value) {
                    setState(() {
                      payment = value as int;
                      pay = "Transfer";
                    });
                  },
                ),

                const Text("Transfer"),
              ],
            ),

            const SizedBox(height: 10),

            const Text(
              "Pesanan :",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            CheckboxListTile(
              title: const Text("Jus Jeruk"),
              value: jusjeruk,
              onChanged: (value) {
                setState(() {
                  jusjeruk = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("Alpukat"),
              value: alpukat,
              onChanged: (value) {
                setState(() {
                  alpukat = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("Mie Rebus"),
              value: mierebus,
              onChanged: (value) {
                setState(() {
                  mierebus = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("Gado-gado"),
              value: gado2,
              onChanged: (value) {
                setState(() {
                  gado2 = value!;
                });
              },
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => tampilpesanan(
                      noPesanan: noPesanan.text,
                      nama: nama.text,
                      noTelp: noTelp.text,
                      payment: pay.toString(),
                      jusjeruk: jusjeruk,
                      alpukat: alpukat,
                      mierebus: mierebus,
                      gado2: gado2,
                      kartu: setSelecteditem,
                    ),),
                  );},

              child: const Text("Pesan"),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
    }
  }