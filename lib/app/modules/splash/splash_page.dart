import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forcard/screens/home.dart';
import 'package:forcard/screens/login_screen.dart';
import 'package:forcard/screens/telas_screens/tela_screen1.dart';
import 'package:forcard/screens/telas_screens/tela_screen2.dart';
import 'package:forcard/screens/telas_screens/tela_screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: [
              screen1(),
              screen2(),
              screen3(),
            ],
          ),
          // dot indicators
          Container(
              padding: const EdgeInsets.only(right: 230),
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const ExpandingDotsEffect(
                          spacing: 12,
                          dotColor: Colors.white,
                          activeDotColor: Color.fromARGB(255, 255, 213, 0))),
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Modular.to.navigate("/auth");
                          },
                          child: Icon(Icons.close,
                              color: Colors.yellow[200], size: 30),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Icon(
                            Icons.navigate_next,
                            color: Colors.yellow[200],
                            size: 30,
                          ),
                        )
                ],
              )),
        ],
      ),
    );
  }
}
