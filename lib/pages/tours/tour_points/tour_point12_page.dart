import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'tour_point13_page.dart';
import 'tour_map_page.dart';

class TourPoint12Page extends StatefulWidget {
  const TourPoint12Page({super.key});

  @override
  State<TourPoint12Page> createState() => _TourPoint12PageState();
}

class _TourPoint12PageState extends State<TourPoint12Page> {

  final AudioPlayer player = AudioPlayer();

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  bool isPlaying = false;

  bool showMaterials = false;
  int photoIndex = 0;

  final photos = [
    "assets/images/IMG_20260424_104549.jpg",
    "assets/images/Georg_Lurich.jpg"
  ];

  @override
  void initState() {
    super.initState();

    player.onDurationChanged.listen((d) {
      setState(() {
        duration = d;
      });
    });

    player.onPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });

    player.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        position = Duration.zero;
      });
    });
  }

  Future playAudio() async {
    await player.play(AssetSource('audio/Georg_Lurich.mp3'));
    setState(() {
      isPlaying = true;
    });
  }

  Future pauseAudio() async {
    await player.pause();
    setState(() {
      isPlaying = false;
    });
  }

  Future seekAudio(double value) async {
    await player.seek(Duration(seconds: value.toInt()));
  }

  Future rewind10() async {
    final newPosition = position - const Duration(seconds: 10);
    player.seek(newPosition);
  }

  Future forward10() async {
    final newPosition = position + const Duration(seconds: 10);
    player.seek(newPosition);
  }

  void nextPhoto() {
    setState(() {
      if (photoIndex < photos.length - 1) {
        photoIndex++;
      }
    });
  }

  void previousPhoto() {
    setState(() {
      if (photoIndex > 0) {
        photoIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    /// экран материалов
    if (showMaterials) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [

            Center(
              child: Image.asset(
                photos[photoIndex],
                fit: BoxFit.contain,
              ),
            ),

            Positioned(
              top: 50,
              left: 20,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  setState(() {
                    showMaterials = false;
                  });
                },
              ),
            ),

            Positioned(
              bottom: 40,
              left: 40,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: previousPhoto,
              ),
            ),

            Positioned(
              bottom: 40,
              right: 40,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                onPressed: nextPhoto,
              ),
            ),

          ],
        ),
      );
    }

    /// основная страница
    return Scaffold(
      appBar: AppBar(
        title: const Text("Георг Люрих - Точка 12"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/images/IMG_20260424_104549.jpg",
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Георг Люрих",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "А теперь познакомимся с человеком, чьё имя связано с силой, выносливостью и спортивной славой. \n\n"

              "Георг Лурих, родившийся в 1876 и ушедший из жизни в 1920 году, был "
              "выдающимся тяжелоатлетом, борцом и атлетом. Интерес к физическим упражнениям у него появился ещё в школьные годы. \n\n"

              "После окончания Таллиннского реального училища в 1894 году он переехал в Россию, где продолжил "
              "тренировки под руководством известного тяжелоатлета, доктора Владислава Краевского. Со временем Лурих стал популярным и широко "
              "известным спортсменом, завоевав признание публики. \n\n"

              "За свою карьеру он установил около 40 мировых рекордов и получил вдохновляющее прозвище Калевипоэг — в честь героя эстонского "
              "фольклора, символа силы и мужества. \n\n"

              "Помимо впечатляющих спортивных достижений, Лурих отличался разносторонними способностями: он владел 12 языками. \n\n"

              "Продолжим экскурсию и узнаем о следующей выдающейся личности.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            /// slider
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble() > 0
                  ? duration.inSeconds.toDouble()
                  : 1,
              value: position.inSeconds.toDouble().clamp(
                  0,
                  duration.inSeconds.toDouble() > 0
                      ? duration.inSeconds.toDouble()
                      : 1),
              onChanged: (value) {
                seekAudio(value);
              },
            ),

            const SizedBox(height: 10),

            /// кнопки плеера
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                IconButton(
                  icon: const Icon(Icons.replay_10),
                  onPressed: rewind10,
                ),

                IconButton(
                  icon: Icon(
                    isPlaying
                        ? Icons.pause_circle
                        : Icons.play_circle,
                    size: 40,
                  ),
                  onPressed: () {
                    if (isPlaying) {
                      pauseAudio();
                    } else {
                      playAudio();
                    }
                  },
                ),

                IconButton(
                  icon: const Icon(Icons.forward_10),
                  onPressed: forward10,
                ),

              ],
            ),

            const SizedBox(height: 20),

            /// стоп и далее
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ElevatedButton.icon(
                  onPressed: () {
                    player.stop();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.stop),
                  label: const Text("Стоп"),
                ),

                const SizedBox(width: 12),

                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TourPoint13Page(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.skip_next),
                  label: const Text("Далее"),
                ),

              ],
            ),

            const SizedBox(height: 30),

            /// карта / материалы
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TourMapPage(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.map),
                        SizedBox(height: 4),
                        Text("Карта"),
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      showMaterials = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      children: [
                        Icon(Icons.photo),
                        SizedBox(height: 4),
                        Text("Материалы")
                      ],
                    ),
                  ),
                ),

              ],
            )

          ],
        ),
      ),
    );
  }
}