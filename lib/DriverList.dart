import 'package:flutter/material.dart';

class DriverList extends StatelessWidget {
  const DriverList({super.key});

  @override
  Widget build(BuildContext context) {
    final drivers = [
      {'name': 'Andre', 'plate': 'B 1234 ABC', 'status': 'Tersedia'},
      {'name': 'Raka', 'plate': 'B 2222 DEF', 'status': 'Tersedia'},
      {'name': 'Sari', 'plate': 'B 3333 GHI', 'status': 'Sedang di perjalanan'},
      {'name': 'Bima', 'plate': 'B 4444 JKL', 'status': 'Tersedia'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Driver'),
        backgroundColor: const Color(0xFFE9DD55),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: drivers.length,
        itemBuilder: (context, index) {
          final driver = drivers[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFE9DD55),
                child: Icon(Icons.drive_eta, color: Colors.black),
              ),
              title: Text(driver['name'] ?? ''),
              subtitle: Text('${driver['plate']} • ${driver['status']}'),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        },
      ),
    );
  }
}
