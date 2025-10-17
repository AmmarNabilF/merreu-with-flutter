import 'dart:io'; // <— diperlukan untuk File
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main(List<String> args) {
  runApp(const MyProfile());
}

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool _isSwitching = true;

  // --- Tambahan: state avatar & file terpilih ---
  final List<String> _avatars = [
    "assets/images/Ash-baby.jpg",
    "assets/images/Ash-teen.jpg",
    "assets/images/Ash-master.jpg",
  ];
  int _avatarIndex = 0;
  File? _pickedFile;

  // void _nextAvatar() {
  //   setState(() {
  //     _avatarIndex = (_avatarIndex + 1) % _avatars.length;
  //     _pickedFile = null; // opsional: reset jika sebelumnya pilih dari galeri
  //   });
  // }

  Future<void> _pickFromGallery() async {
    final x = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (x != null) {
      setState(() => _pickedFile = File(x.path));
    }
  }
  // --- end tambahan ---

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: _isSwitching
            ? const Color(0xFF1C1C1E)
            : const Color.fromARGB(255, 240, 240, 240),
        appBar: AppBar(
          backgroundColor: const Color(0xFF2196F3),
          elevation: 0,
          title: const Text(
            "Profil Saya",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
                child: SizedBox(
                  height: 88,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        right: 12,
                        top: 20,
                        child: CupertinoSwitch(
                          value: _isSwitching,
                          activeColor: CupertinoColors.activeBlue,
                          onChanged: (bool v) {
                            setState(() => _isSwitching = v);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Avatar: prioritas file galeri, fallback ke asset list
              CircleAvatar(
                radius: 50,
                backgroundImage: _pickedFile != null
                    ? FileImage(_pickedFile!)
                    : AssetImage(_avatars[_avatarIndex]) as ImageProvider,
              ),

              const SizedBox(height: 10),
              Text(
                "Ammar Nabil Fauzan",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _isSwitching ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                margin: EdgeInsetsDirectional.symmetric(horizontal: 25, vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                color: _isSwitching ? const Color.fromARGB(255, 65, 65, 65) : const Color.fromARGB(255, 199, 199, 199),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Informasi",
                      style: TextStyle(
                        color: Color(0xFF2196F3),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text("08125381xxx", style: TextStyle(color: _isSwitching ? Colors.white : Colors.black, fontSize: 15)),
                    const SizedBox(height: 5),
                    Text("Nomor HP gweh", style: TextStyle(color:_isSwitching ? const Color.fromARGB(255, 160, 160, 160) : const Color.fromARGB(255, 59, 59, 59), fontSize: 13, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text("2309106006", style: TextStyle(color:_isSwitching ? Colors.white : Colors.black, fontSize: 15)),
                    const SizedBox(height: 5),
                    Text("NIM", style: TextStyle(color:_isSwitching ? const Color.fromARGB(255, 160, 160, 160) : const Color.fromARGB(255, 59, 59, 59), fontSize: 13, fontWeight: FontWeight.bold)),
                    Text(
                      "Belajar, Bermain, Masak",
                      style: TextStyle(color:_isSwitching ? Colors.white : Colors.black, fontSize: 15),
                    ),
                    const SizedBox(height: 5),
                    Text("Hobi gweh", style: TextStyle(color:_isSwitching ? const Color.fromARGB(255, 160, 160, 160) : const Color.fromARGB(255, 59, 59, 59), fontSize: 13, fontWeight: FontWeight.bold)),
                    Text("@marrrnf_", style: TextStyle(color:_isSwitching ? Colors.white : Colors.black, fontSize: 15)),
                    const SizedBox(height: 5),
                    Text("Instagram", style: TextStyle(color:_isSwitching ? const Color.fromARGB(255, 160, 160, 160) : const Color.fromARGB(255, 59, 59, 59), fontSize: 13, fontWeight: FontWeight.bold)),
                    Text("AmmarNabilF", style: TextStyle(color:_isSwitching ? Colors.white : Colors.black, fontSize: 15)),
                    const SizedBox(height: 5),
                    Text("GitHub", style: TextStyle(color:_isSwitching ?const Color.fromARGB(255, 160, 160, 160) : const Color.fromARGB(255, 59, 59, 59), fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Text("Tidak ada postingan", style: TextStyle(color: _isSwitching ? Colors.grey: Colors.black, fontSize: 16)),
                    Text(
                      "Ini bukan keahlian saya, mohon maaf jika tidak bagus xixi",
                      style: TextStyle(color: _isSwitching ? Colors.grey: Colors.black, fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Posting foto dan video untuk ditampilkan",
                      style: TextStyle(color: _isSwitching ? Colors.grey: Colors.black, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Tombol pilih dari galeri
                    CupertinoButton(
                      color: CupertinoColors.activeBlue,
                      child: const Text('Ubah Foto Profil', style: TextStyle(color: Colors.white)),
                      onPressed: _pickFromGallery,
                    ),
                    const SizedBox(width: 12),
                    // Tombol next asset (opsional)
                    // CupertinoButton(
                    //   child: const Text('Next Avatar'),
                    //   onPressed: _nextAvatar,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
