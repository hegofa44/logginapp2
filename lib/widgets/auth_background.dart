import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _ContenedorMorado(),
          SafeArea(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              child: Icon(
                Icons.person_pin,
                color: Colors.white,
                size: 100,
              ),
            ),
          ),
          this.child,
        ],
      ),
    );
  }
}

class _ContenedorMorado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      // color: Colors.indigo,
      decoration: _purpleBackground(),
      child: Stack(
        children: [
          Positioned(
            child: _IconosBoxPurple(),
            top: 90,
            left: 30,
          ),
          Positioned(
            child: _IconosBoxPurple(),
            top: -40,
            left: -30,
          ),
          Positioned(
            child: _IconosBoxPurple(),
            top: -50,
            right: -20,
          ),
          Positioned(
            child: _IconosBoxPurple(),
            bottom: -50,
            left: 10,
          ),
          Positioned(
            child: _IconosBoxPurple(),
            bottom: 120,
            right: 20,
          ),
          Positioned(
            child: _IconosBoxPurple(),
            bottom: 10,
            left: 140,
          ),
        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() => BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1),
      ]));
}

class _IconosBoxPurple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
