import 'package:flutter/material.dart';
import 'package:forcard/main.dart';
import 'package:forcard/util/job_card.dart';
import 'package:forcard/util/recent_job_card.dart';

import '../profile/profile_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List jobsForYou = [
    // [ companyName, jobTitle, logoImagePath, hourlyRate ]
    ['Carro', 'Carro elétrico', 'assets/carro.png', 15],
    ['Bicileta', 'Bicicletário', 'assets/bicicleta.png', 5],
    ['Trem', 'Metrô', 'assets/trem.png', 4],
    ['Onibus', 'Ônibus', 'assets/onibus.png', 3],
  ];

  final List recentJobs = [
    // [ companyName, jobTitle, logoImagePath, hourlyRate ]
    ['11/09/22', 'Ônibus', 'assets/onibus.png', '7:30'],
    ['08/09/22', 'Bicicleta', 'assets/bicicleta.png', '15:22'],
    ['08/09/22', 'Trem', 'assets/trem.png', '13:41'],
    ['05/09/22', 'Carro', 'assets/carro.png', '7:00'],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('4Card'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 253, 168, 41),
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              children: [
                const DrawerHeader(
                  child: Center(
                    child: Text(
                      '4Card',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Perfil',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                ),
                ListTile(
                  title: const Text(
                    'Recarga',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    'Extrato',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text(
                    'Cartão Virtual',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.grey[100],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: 20,
            ),

            //discover a new path
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                'Procurar modalidades',
                style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 217, 160)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              height: 25,
                              child: Image.asset('assets/lupa.png',
                                  color:
                                      const Color.fromARGB(255, 255, 217, 160)),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Procurar...'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 253, 168, 41),
                          borderRadius: BorderRadius.circular(12)),
                      child: Image.asset('assets/preferencias.png',
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // for you -> job cards

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                'Transportes',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),

            SizedBox(
              height: 25,
            ),

            Container(
              height: 160,
              child: ListView.builder(
                itemCount: jobsForYou.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return JobCard(
                    companyName: jobsForYou[index][0],
                    jobTitle: jobsForYou[index][1],
                    logoImagePath: jobsForYou[index][2],
                    hourlyRate: jobsForYou[index][3],
                  );
                },
              ),
            ),

            SizedBox(height: 50),

            //recently add -> job titles
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                'Extrato',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ListView.builder(
                  itemCount: recentJobs.length,
                  itemBuilder: (context, index) {
                    return RecentJobCard(
                      companyName: recentJobs[index][0],
                      jobTitle: recentJobs[index][1],
                      logoImagePath: recentJobs[index][2],
                      hourlyRate: recentJobs[index][3],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
