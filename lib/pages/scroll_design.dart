import 'package:flutter/material.dart';

class ScrollScreem extends StatelessWidget {
  const ScrollScreem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: const [Page1Widget(), Pag2()],
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xff3AAAFE),
        height: double.infinity,
        alignment: Alignment.center,
        child: const Image(image: AssetImage('assets/mydoggy.png')));
  }
}

class MainContentWidget extends StatelessWidget {
  const MainContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white);

    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          const Text(
            "My Doggy",
            style: textStyle,
          ),
          Expanded(child: Container()),
          const Icon(Icons.keyboard_arrow_down, size: 100, color: Colors.white)
        ],
      ),
    );
  }
}

class Page1Widget extends StatelessWidget {
  const Page1Widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [BackgroundWidget(), MainContentWidget()],
    );
  }
}

class Pag2 extends StatelessWidget {
  const Pag2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: TextButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Bienvenido",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            style: TextButton.styleFrom(
                backgroundColor: const Color(0xff3AAAFE),
                shape: const StadiumBorder()),
          ),
        ));
  }
}
