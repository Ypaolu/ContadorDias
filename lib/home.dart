import 'package:flutter/material.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';

class ContadorDias extends StatefulWidget {
  @override
  _ContadorDiasState createState() => _ContadorDiasState();
}

List<Image> images = [
  Image.asset("assets/foto1.png"),
  Image.asset("assets/foto2.png"),
  Image.asset("assets/foto3.png"),
  Image.asset("assets/foto4.png"),
  Image.asset("assets/foto5.png"),
  Image.asset("assets/foto6.png"),
  Image.asset("assets/foto7.png"),
  Image.asset("assets/foto8.png"),
  Image.asset("assets/foto9.png"),
  Image.asset("assets/foto10.png"),
  Image.asset("assets/foto11.png"),
  Image.asset("assets/foto12.png"),
  Image.asset("assets/foto13.png"),
  Image.asset("assets/foto14.png"),
  Image.asset("assets/foto15.png"),
  Image.asset("assets/foto16.png"),
];

List<String> frases = [
  "Amo você minha princesa",
  "Você é o amor da minha vida",
  "Você é incrível, maravilhosa e perfeita",
  "Ansioso para te ver de novo",
  "O dia pode estar difícil, mas eu sempre vou estar com você!",
  "Todos os dias acordo pensando em você",
  "Sempre que estou triste, penso em você e logo tudo se resolve",
  "Enquanto você quiser, serei todo seu",
  "Queria poder te dar o mundo, mas como tem muita gente nele, vou te dar apenas a minha pessoa",
  "'Se um dia duvidar do meu amor por você, lembre-se: nem sempre o sol brilha, mas ele existe'\nJiam Carlos",
  "With you I’d dance in a storm in my best dress ",
  "And baby, for you, I would fall from grace just to touch your face",
  "I realize your laugh is the best sound I have ever heard",
  "I hear the words but all I can think is we should be together",
  "Tão estranho, nós estamos vivos nesses mesmos dias, nesses mesmos anos. Mesmo plano, hora exata, você me ama, eu te amo. Alinhamento milenar, você não acha?",
  "E em todas novas vidas que eu ainda for viver, eu vou te escolher",
  "Luta por mim, desiste não. E lembra do que eu disse, então: amar é muito melhor que ter razão",
  "Se for com você, eu vou",
  "Eu vou te amar como um idiota ama, vou te pendurar num quadro bem do lado da minha cama",
  "Meu Deus, quando eu te encontrar de novo eu vou te dar um beijo solto, desses intercontinentais",
  "Promise me you'll never leave my side",
  "You've got me on my knees, I'm your one man cult",
  "Cause I'm telling you, you're all I need"
];

String fraseDoDia() {
  final hoje = DateTime.now();
  final diasDesdeEpoch = hoje.difference(DateTime(2024, 1, 1)).inDays;
  final index = diasDesdeEpoch % frases.length;
  return frases[index];
}

class _ContadorDiasState extends State<ContadorDias> {
  final DateTime dataInicial = DateTime(2024, 7, 6);

  int anos = 0;
  int meses = 0;
  int dias = 0;

  @override
  void initState() {
    super.initState();
    calcularDiferenca();

    Timer.periodic(Duration(hours: 24), (timer) {
      calcularDiferenca();
    });
  }

  void calcularDiferenca() {
    DateTime hoje = DateTime.now();

    int anosTemp = hoje.year - dataInicial.year;
    int mesesTemp = hoje.month - dataInicial.month;
    int diasTemp = hoje.day - dataInicial.day;

    if (diasTemp < 0) {
      mesesTemp--;
      final ultimoDiaMesAnterior = DateTime(hoje.year, hoje.month, 0).day;
      diasTemp += ultimoDiaMesAnterior;
    }

    if (mesesTemp < 0) {
      anosTemp--;
      mesesTemp += 12;
    }

    setState(() {
      anos = anosTemp;
      meses = mesesTemp;
      dias = diasTemp;
    });
  }

  String plural(int valor, String singular, String plural) {
    return '$valor ${valor == 1 ? singular : plural}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/wallpaper.png'),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 150),
                        Text(
                          'Estamos juntos a\n'
                          '${plural(anos, "ano", "anos")} '
                              '${plural(meses, "mês", "meses")} '
                              '${plural(dias, "dia", "dias")}',
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Breathing',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 25),
                        SizedBox(
                          height: 200,
                          child: CarouselSlider(
                            items: images.map((img) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: img,
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: 500,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 0.7,
                              aspectRatio: 16 / 9,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration: Duration(milliseconds: 800),
                              pauseAutoPlayOnTouch: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Text(
                          fraseDoDia(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.purple,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Breathing',
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}