import 'package:flutter/material.dart';
import 'package:passing_param/WelcomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      title: 'Input Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Input Your Details'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _sekolahController = TextEditingController();

  void _navigateToWelcomePage() {
    if (_nameController.text.isNotEmpty &&
        _roleController.text.isNotEmpty &&
        _sekolahController.text.isNotEmpty &&
        _deskripsiController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomePage(
            name: _nameController.text,
            role: _roleController.text,
            deskripsi: _deskripsiController.text,
            sekolah: _sekolahController.text,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nama',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _roleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Role',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _deskripsiController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Deskripsi',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _sekolahController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Sekolah',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _navigateToWelcomePage,
              child: const Text('Submit'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
