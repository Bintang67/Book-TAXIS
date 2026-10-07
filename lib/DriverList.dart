import 'package:flutter/material.dart';

// 1. Model data hanya menyimpan nama, rating, dan status keaktifan
class Driver {
  final String name;
  final double rating;
  final bool isActive;

  const Driver({
    required this.name,
    required this.rating,
    required this.isActive,
  });
}

class DriverList extends StatelessWidget {
  const DriverList({super.key, required this.title});

  final String title;

  // Data dummy daftar driver
  final List<Driver> drivers = const [
    Driver(name: 'Andre', rating: 5.0, isActive: true),
    Driver(name: 'Daplun', rating: 4.8, isActive: true),
    Driver(name: 'Warto', rating: 4.0, isActive: false),
    Driver(name: 'Ahong', rating: 3.7, isActive: true),
    Driver(name: 'Tenxi', rating: 3.0, isActive: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: drivers.isEmpty
          ? const Center(child: Text('Tidak ada driver tersedia'))
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: drivers.length,
              itemBuilder: (context, index) {
                final driver = drivers[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 6.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.person,
                        color: driver.isActive ? Colors.green : Colors.grey,
                      ),
                    ),
                    // Nama Driver
                    title: Text(
                      driver.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // Status Active / Inactive
                    subtitle: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: driver.isActive ? Colors.green : Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          driver.isActive ? 'Active' : 'Inactive',
                          style: TextStyle(
                            color: driver.isActive ? Colors.green : Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    // Rating Driver
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        const SizedBox(width: 4),
                        Text(
                          driver.rating.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
