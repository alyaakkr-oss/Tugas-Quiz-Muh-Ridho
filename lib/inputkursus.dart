import 'package:flutter/material.dart';
import 'halamanutama.dart';
import 'tampilkursus.dart';

class inputkursus extends StatelessWidget {
  const inputkursus({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const lamankursus(),
    );
  }
}

class lamankursus extends StatefulWidget {
  const lamankursus({super.key});

  @override
  State<lamankursus> createState() => _lamankursusState();
}

class _lamankursusState extends State<lamankursus> {

  TextEditingController noPesan = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController noHp = TextEditingController();

  int? status;
  String? st;

  bool bahasaInggris = false;
  bool python = false;
  bool mobileFlutter = false;
  bool web = false;


  int total = 0;

  void hitungTotal() {
    total = 0;

    if (bahasaInggris) {
      total += 150000;
    }else if (python) {
      total += 175000;
    }else if (mobileFlutter) {
      total += 200000;
    }else if (web) {
      total += 225000;
    }else if (st == 'Mahasiswa');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Pesan Kursus"),
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
              controller: noPesan,
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
              controller: noHp,
              decoration: const InputDecoration(
                labelText: "No. telp",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            const Text("Status"),

            Row(
              children: [

                Radio(
                  value: 1,
                  groupValue: status,
                  onChanged: (value) {
                    setState(() {
                      status = value as int;
                      st = "Mahasiswa";
                    });
                  },
                ),

                const Text("Mahasiswa"),

                Radio(
                  value: 2,
                  groupValue: status,
                  onChanged: (value) {
                    setState(() {
                      status = value as int;
                      st = "Umum";
                    });
                  },
                ),

                const Text("Umum"),
              ],
            ),

            const SizedBox(height: 10),

            const Text(
              "Pilihan pesan",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            CheckboxListTile(
              title: const Text("Bahasa inggris"),
              value: bahasaInggris,
              onChanged: (value) {
                setState(() {
                  bahasaInggris = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("Python"),
              value: python,
              onChanged: (value) {
                setState(() {
                  python = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("Mobile flutter"),
              value: mobileFlutter,
              onChanged: (value) {
                setState(() {
                  mobileFlutter = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("Web"),
              value: web,
              onChanged: (value) {
                setState(() {
                  web = value!;
                });
              },
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {

                setState(() {
                  hitungTotal();
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => tampilkursus(
                      noPesan: noPesan.text,
                      nama: nama.text,
                      noHp: noHp.text,
                      st: st.toString(),
                      bahasaInggris: bahasaInggris,
                      python: python,
                      mobileFlutter: mobileFlutter,
                      web: web,
                      total: total,
                    ),
                  ),
                );
              },

              child: const Text("Pesan"),
            ),

            const SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}