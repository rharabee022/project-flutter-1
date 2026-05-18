import 'package:flutter/material.dart';

class Halaman2 extends StatelessWidget {
  const Halaman2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 154, 212, 230),
        title: const Text(
          "Test tentang materi",
          style: TextStyle(
            color: Color.fromARGB(255, 63, 20, 71),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container( //box contaniner paling atas
          width: 700,
          height: 100,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 193, 231, 227),
            borderRadius: BorderRadius.circular(10),
          ),


          child: Row(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Container(
                      width: 200,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 228, 185, 235),
                        borderRadius: BorderRadius.circular(5),
                      ),
                        child: Center(
                          child: Text(
                            "Halo Selamat Datang Ya",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 230, 48, 48),
                            ),
                          ),
                        ),
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