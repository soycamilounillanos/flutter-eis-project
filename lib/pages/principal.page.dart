import 'package:flutter/material.dart';

class PrincipalPage extends StatelessWidget {
  const PrincipalPage({Key? key}) : super(key: key);

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