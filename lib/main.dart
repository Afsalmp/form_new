import 'package:flutter/material.dart';
import 'package:form_new/secon.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const HomeFace(),
    );
  }
}

class HomeFace extends StatefulWidget {
  const HomeFace({super.key});

  @override
  State<HomeFace> createState() => _HomeFaceState();
}

class _HomeFaceState extends State<HomeFace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://www.fcbarcelona.com/photo/2018/11/21/224bc6a0-9ea3-4a78-9316-0693a5ace17c/Camp-Nou_mobile.jpg"),
                fit: BoxFit.cover),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 170,
            ),
            const SizedBox(
              height: 70,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Secon()));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 50,
                    decoration: const BoxDecoration(color: Color.fromARGB(255, 218, 212, 212)),
                    child: Center(
                        child: Text(
                      "REGISTER NOW",
                      style: GoogleFonts.radley(fontSize: 20,fontWeight: FontWeight.normal),
                    )),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
