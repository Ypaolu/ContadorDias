import 'package:flutter/material.dart';
import 'dart:async';

class ContadorDias extends StatefulWidget {
  @override
  _ContadorDiasState createState() => _ContadorDiasState();
}

class _ContadorDiasState extends State<ContadorDias> {
  final DateTime dataInicial = DateTime(2024, 7, 6);
  int diferencaDias = 0;

  @override
  void initState() {
    super.initState();
    calcularDias();
  }

  void calcularDias() {
    DateTime hoje = DateTime.now();
    setState(() {
      diferencaDias = hoje.difference(dataInicial).inDays;
    });

    Timer.periodic(Duration(hours: 12), (timer) {
      setState(() {
        diferencaDias = DateTime.now().difference(dataInicial).inDays;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 350),
              Text(
                'Fazem $diferencaDias dias desde que começamos a namorar',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              Container(height: 25),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 30),
                    Container(
                      width: 350,
                      height: 161,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/foto3.jpeg',
                          fit: BoxFit.cover,
                        ),
                      )
                    ),
                    Container(width: 30),
                    Container(
                      width: 350,
                      height: 161,
                      child: 
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/foto1.jpeg',
                          fit: BoxFit.contain,
                        ),
                      )
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 189,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/foto2.jpeg',
                          fit: BoxFit.contain,
                        ),
                      )
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 189,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/foto5.jpeg',
                          fit: BoxFit.contain,
                        ),
                      )
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 250,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/foto6.jpeg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 115,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/foto7.jpeg',
                          fit: BoxFit.contain,
                        ),
                      )
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 250,
                      height: 141,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/foto4.jpeg',
                          fit: BoxFit.contain,
                        ),
                      )
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 250,
                      height: 110,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/foto8.jpeg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 249,
                      height: 112,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                        'assets/foto9.jpeg',
                        fit: BoxFit.contain,
                      ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 110,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/foto10.jpeg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 113,
                      height: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/foto11.jpeg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 249,
                      height: 112,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/foto12.jpeg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      width: 249,
                      height: 187,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/foto13.jpeg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 80),
                  ],
                ),
              ),
              Container(height: 50),
            ],
          )
      ),
    );
  }
}