import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:aplikasi_pertamaku/loading.dart';
import 'package:aplikasi_pertamaku/manga_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Colors.pink.shade400,
              centerTitle: true,
              title: Text('Home',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
            ),
            endDrawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: const Text(
                      'Chairil Ali',
                      style: TextStyle(color: Colors.black),
                    ),
                    accountEmail: const Text('chairilali@gmail.com',
                        style: TextStyle(color: Colors.black)),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset(
                          fit: BoxFit.cover,
                          'assets/logo.jpg',
                          width: 90,
                        ),
                      ),
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.cyan,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://img.freepik.com/premium-photo/11h-pink-aesthetic-wallpaper-lockscreen_1097265-93242.jpg'))),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                      leading: const Icon(Icons.movie),
                      title: const Text('Movie List'),
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const MangaScreen(),
                                type: PageTransitionType.scale,
                                duration: const Duration(milliseconds: 600),
                                reverseDuration:
                                    const Duration(milliseconds: 600),
                                alignment: Alignment.bottomCenter));
                      }),
                  ListTile(
                    leading: const Icon(FontAwesomeIcons.whatsapp),
                    title: const Text('WhatsApp'),
                    onTap: () async {
                      final Uri url =
                          Uri.parse('https://wa.me/6282238482847?text=Hello');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url,
                            mode: LaunchMode.externalApplication);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(FontAwesomeIcons.instagram),
                    title: const Text('Instagram'),
                    onTap: () async {
                      final Uri url = Uri.parse(
                          'https://www.instagram.com/chairilali_13?igsh=MTc3cTR0MG41bnZo');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url,
                            mode: LaunchMode.externalApplication);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading:
                        const Icon(FontAwesomeIcons.personWalkingArrowLoopLeft),
                    title: const Text('Logout'),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            title: const Text('Logout'),
                            content:
                                const Text('Apakah anda yakin ingin keluar?'),
                            actions: [
                              TextButton(
                                  child: const Text('Batal'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                              TextButton(
                                  child: const Text(
                                    'Keluar',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  onPressed: () {
                                    SystemNavigator.pop();
                                  }),
                            ]),
                      );
                    },
                  ),
                ],
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('assets/logo.jpg'),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text('Chairil Ali',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Mobile Application Engineer',
                    style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: AnimatedTextKit(animatedTexts: [
                      TyperAnimatedText(
                          'Flutter Developer that loves to learn new things.',
                          speed: const Duration(milliseconds: 60)),
                    ], totalRepeatCount: 1, displayFullTextOnTap: true),
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
