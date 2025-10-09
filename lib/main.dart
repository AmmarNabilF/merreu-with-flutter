import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyProfile());
}

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool _isSwitching = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: _isSwitching ? const Color(0xFF1C1C1E) : const Color.fromARGB(255, 240, 240, 240),
        appBar: AppBar(
          backgroundColor: const Color(0xFF2196F3),
          elevation: 0,
          title: Text(
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
              CircleAvatar(radius: 50, backgroundImage: AssetImage("assets/images/Ash-baby.jpg")),
              const SizedBox(height: 10),
              Text(
                "Ammar Nabil Fauzan",
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold, 
                  color: _isSwitching ? Colors.white : Colors.black),
              ),
              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                margin: EdgeInsetsDirectional.symmetric(horizontal: 25, vertical: 5),
                padding: EdgeInsets.symmetric(horizontal : 20, vertical : 15),
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
