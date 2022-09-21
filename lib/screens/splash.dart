import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
  PageController _controller = PageController();

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
              alignment: Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text('skip', style: TextStyle(color: Colors.yellow)),
                  ),
                  SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: ExpandingDotsEffect(
                          dotColor: Colors.white,
                          activeDotColor: Color.fromARGB(255, 255, 213, 0))),
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }));
                          },
                          child: Text(
                            'done',
                            style: TextStyle(color: Colors.yellow),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Text('next',
                              style: TextStyle(color: Colors.yellow)),
                        )
                ],
              )),
        ],
      ),
    );
  }
}
