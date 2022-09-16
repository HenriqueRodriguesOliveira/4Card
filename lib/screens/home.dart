import 'package:flutter/material.dart';
import 'package:forcard/main.dart';
import 'package:forcard/util/job_card.dart';

void main() {
  runApp(const MyApp());
}

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: 75,
          ),
          // app bar
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Container(
              height: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              child: Image.asset('assets/menu.png', color: Colors.grey[800]),
            ),
          ),

          SizedBox(height: 25),

          //discover a new path
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Procurar modalidades',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),

          SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            height: 25,
                            child: Image.asset('assets/lupa.png',
                                color: Colors.grey[600]),
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
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(12)),
                    child: Image.asset('assets/preferencias.png',
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 50),

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
          )

          //recently add -> job titles
        ],
      ),
    );
  }
}
