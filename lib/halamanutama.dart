import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ridho_intent/inputkursus.dart';
import 'package:ridho_intent/inputpesanan.dart';
import 'package:ridho_intent/tampilkursus.dart';
import 'package:ridho_intent/tampilpesanan.dart';
import 'biodata.dart';

class Halamanutama extends StatefulWidget {
  const Halamanutama({super.key});

  @override
  State<Halamanutama> createState() => _HalamanutamaState();
}

class _HalamanutamaState extends State<Halamanutama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Menu Drawer'),),
        backgroundColor: Colors.white,
      body: Center(child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children:[Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(image: const DecorationImage(
            image: AssetImage('image/piu.jpg'),),
            borderRadius: BorderRadius.circular(20)),width: 300,height: 300,),
        Container(child: const Text( 'Selamat Datang Pada Aplikasi Biodata',
        textAlign: TextAlign.center)),
        Container(child: const Text('Input Biodata digunakan untuk menginput NIM, Nama, Alamat, Jenis Kelamin, Agama dan Hobi', 
        textAlign: TextAlign.center)),
        Container(child: Text('Tampil Biodata digunakan untuk menampilkan data NIM, Nama, Alamat, Jenis Kelamin, Agama dan Hobi', 
        textAlign: TextAlign.center)),
        Container(child: const Text('Terima Kasih',textAlign: TextAlign.center))
      ],),),),
      drawer: Drawer(
        child: ListView(children: [
          DrawerHeader( decoration: const BoxDecoration(
            image: DecorationImage( image: AssetImage('image/re.jpg'),
            fit: BoxFit.cover)),
             child: Center(
              child: Container(width: 100, height: 100, decoration: const BoxDecoration( 
                shape: BoxShape.circle, image: DecorationImage(
                  image: AssetImage('image/ya.jpg'), fit: BoxFit.contain,))))),
        ListTile(
          leading: Icon(Icons.person), 
          title: Text('Input Biodata'),
          trailing: IconButton(onPressed: (){
            setState(() {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>inputbiodata()),);
            });
          }, icon: Icon(Icons.search)),
          ),
        ListTile(
          leading: Icon(Icons.person), 
          title: Text('Input Kursus'),
          trailing: IconButton(onPressed: (){
            setState(() {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>inputkursus()),);
            });
          }, icon: Icon(Icons.search)),
          ),
        ListTile(
          leading: Icon(Icons.shopping_bag), 
          title: Text('Input Pesanan'),
          trailing: IconButton(onPressed: (){
            setState(() {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Inputpesanan()),);
            });
          }, icon: Icon(Icons.search)),
          ),
        ListTile(
          leading: Icon(Icons.settings), 
          title: Text('Tampil Biodata'),
          trailing: IconButton(onPressed: (){
            setState(() {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>tampilkursus(noPesan: '',
              nama: '',
              noHp: '',
              st: '', bahasaInggris: false,
              python: false, 
              mobileFlutter: false,
              web: false, 
              total: 0,
                )),);
            });
          }, icon: Icon(Icons.settings)),
          ),
        ListTile(
          leading: Icon(Icons.person), 
          title: Text('Tampil Kursus'),
          trailing: IconButton(onPressed: (){
            setState(() {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>tampilkursus(
              noPesan: '',
              nama: '',
              noHp: '',
              st: '',
              bahasaInggris: false,
              python: false,
              mobileFlutter: false,
              web: false,
              total: 0,)),);
            });
          }, icon: Icon(Icons.search)),
          ),
        ListTile(
          leading: Icon(Icons.person), 
          title: Text('Tampil Pesanan'),
          trailing: IconButton(onPressed: (){
            setState(() {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>tampilpesanan(
              noPesanan: '',
              nama: '',
              noTelp: '',
              payment: '',
              jusjeruk: false,
              alpukat: false,
              mierebus: false,
              gado2: false,
              kartu: '',)),);
            });
          }, icon: Icon(Icons.search)),
          ),
        ListTile(
          leading: Icon(Icons.close), 
          title: Text('Keluar'),
          trailing: IconButton(onPressed: (){exit(0);}, icon: Icon(Icons.exit_to_app)),
          ),
      ],),) ,
    );
  }
}