import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();

  Future<void> addUserData(
      {required String username, required String job}) async {
    var url = "https://reqres.in/api/users";
    final response =
        await http.post(Uri.parse(url), body: {"name": username, "job": job});

    // menampilkan data diconsole, data-response dari server
    log(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Tambah Pengguna",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Pengguna",
                    hintText: "Masukkan Nama Pengguna"),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: _jobController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Pekerjaan",
                    hintText: "Masukkan Nama Pekerjaan"),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      await addUserData(
                          username: _nameController.text,
                          job: _jobController.text);
                    },
                    child: const Text("Kirim")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
