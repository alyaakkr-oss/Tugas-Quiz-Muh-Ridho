import 'package:flutter/material.dart';
import 'halamanUtama.dart';

class tampilbiodata extends StatelessWidget {
  final String name, nim, jk, status;
  final List hobi;

  const tampilbiodata({
    super.key,
    required this.name,
    required this.status,
    required this.jk,
    required this.nim,
    required this.hobi,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: lamantampilbiodata(
        nama: name,
        nim: nim,
        jk: jk,
        hobi: hobi,
        status: status,
      ),
    );
  }
}

class lamantampilbiodata extends StatefulWidget {
  final String nama, nim, jk, status;
  final List hobi;

  const lamantampilbiodata({
    super.key,
    required this.nama,
    required this.status,
    required this.nim,
    required this.jk,
    required this.hobi,
  });

  @override
  State<lamantampilbiodata> createState() => _lamantampilbiodataState();
}

class _lamantampilbiodataState extends State<lamantampilbiodata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Tampil Biodata"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Halamanutama()),
              );
            },
            icon: const Icon(Icons.close_sharp),
          )
        ],
      ),
      body: Center(
        child: SizedBox(
          width: 380,
          height: 400,
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 150, child: Text("Nim")),
                  const SizedBox(width: 10, child: Text(":")),
                  Text(widget.nim),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 150, child: Text("Nama")),
                  const SizedBox(width: 10, child: Text(":")),
                  Text(widget.nama),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 150, child: Text("Jenis Kelamin")),
                  const SizedBox(width: 10, child: Text(":")),
                  Text(widget.jk),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 150, child: Text("Status")),
                  const SizedBox(width: 10, child: Text(":")),
                  Text(widget.status),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 150, child: Text("Hobi")),
                  const SizedBox(width: 10, child: Text(":")),
                  Text(widget.hobi.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}