import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(myProfile());
}

class myProfile extends StatelessWidget {
  const myProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF1C1C1E),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1C1C1E),
          elevation: 0,
          title: Text("Profil Aq"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(radius: 50, backgroundImage: AssetImage("assets/images/Ash-baby.jpg")),
              const SizedBox(height: 10),
              const Text(
                "Ammar Nabil Fauzan",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                color: const Color(0xFF2C2C2E),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Informasi",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("08125381xxx", style: TextStyle(color: Colors.white, fontSize: 15)),
                    SizedBox(height: 5),
                    Text("Nomor HP gweh", style: TextStyle(color: Colors.grey, fontSize: 13)),
                    SizedBox(height: 5),
                    Text("2309106006", style: TextStyle(color: Colors.white, fontSize: 15)),
                    SizedBox(height: 5),
                    Text("NIM", style: TextStyle(color: Colors.grey, fontSize: 13)),
                    Text(
                      "Belajar, Bermain, Masak",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    SizedBox(height: 5),
                    Text("Hobi gweh", style: TextStyle(color: Colors.grey, fontSize: 13)),
                    Text("@marrrnf_", style: TextStyle(color: Colors.white, fontSize: 15)),
                    SizedBox(height: 5),
                    Text("Instagram", style: TextStyle(color: Colors.grey, fontSize: 13)),
                    Text("AmmarNabilF", style: TextStyle(color: Colors.white, fontSize: 15)),
                    SizedBox(height: 5),
                    Text("GitHub", style: TextStyle(color: Colors.grey, fontSize: 13)),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: const [
                    Text("Tidak ada postingan", style: TextStyle(color: Colors.grey, fontSize: 16)),
                    Text(
                      "Ini bukan keahlian saya, mohon maaf jika tidak bagus xixi",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Posting foto dan video untuk ditampilkan",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.camera_alt, color: Colors.white),
                  label: const Text(
                    "Tambah postingan",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
