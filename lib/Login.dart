import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key, required String title});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController inputNama = TextEditingController();
  TextEditingController inputEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Taxis"),
        backgroundColor: Color(0xFFE9DD55),
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(16)),

          // --- LOGO TAKSI ---
          Center(
            child: Image(
              image: AssetImage('Assets/Images/Taxi.png'),
              height: 180,
              width: 180,
            ),
          ),

          const Padding(padding: EdgeInsets.all(16)),

          // 1. Input Nama
          Center(
            child: Container(
              width: 430,
              child: TextFormField(
                validator: (value) => value?.trim().isNotEmpty == true
                    ? null
                    : 'Nama wajib diisi',
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Masukan Nama Kamu',
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                ),
                controller: inputNama,
              ),
            ),
          ),

          // Padding antar input
          const Padding(padding: EdgeInsets.all(16)),

          // 2. Input Email
          Center(
            child: Container(
              width: 430,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value?.trim().isNotEmpty == true
                    ? null
                    : 'Email wajib diisi',
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Masukan Email Kamu',
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                ),
                controller: inputEmail,
              ),
            ),
          ),

          // Padding sebelum tombol
          const Padding(padding: EdgeInsets.all(16)),

          // 3. Tombol
          ElevatedButton(
            child: const Text('Continue'),
            onPressed: () {
              print('Nama: ${inputNama.text}');
              print('Email: ${inputEmail.text}');

              Navigator.pushReplacementNamed(context, '/driverList');
            },
          ),
        ],
      ),
    );
  }
}
