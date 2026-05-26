import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'tour_point12_page.dart';
import 'tour_map_page.dart';

class TourPoint11Page extends StatefulWidget {
  const TourPoint11Page({super.key});

  @override
  State<TourPoint11Page> createState() => _TourPoint11PageState();
}

class _TourPoint11PageState extends State<TourPoint11Page> {

  final AudioPlayer player = AudioPlayer();

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  bool isPlaying = false;

  bool showMaterials = false;
  int photoIndex = 0;

  final photos = [
    "assets/images/IMG_20260526_121902.jpg",
    "assets/images/Ernst_Opik.jpg"
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
    await player.play(AssetSource('audio/Ernst_Opik.mp3'));
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
        title: const Text("Эрнст Эпик - Точка 11"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/images/IMG_20260526_121902.jpg",
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Эрнст Эпик",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Продолжая нашу экскурсию, обратим внимание на ещё одного выдающегося учёного. \n\n"

              "Эрнст Эпик, родившийся в 1893 и проживший долгую жизнь до 1985 года, был всемирно известным астрономом и одним из основателей эстонской астрономической школы. Его научные работы заложили "
              "основу для понимания движения комет и астероидов, а также их возможного влияния на Землю. \n\n"

              "В период с 1918 по 1922 год он разработал метод определения расстояний "
              "до галактик. Позднее, в 1932 году, Эпик выдвинул гипотезу о существовании обширного облака комет "
              "на окраинах Солнечной системы — впоследствии оно получило название облака Эпика—Оорта. \n\n"

              "Одним из его важнейших достижений стало исследование эволюции звёзд, опубликованное в 1938 году. "
              "Спустя 10 лет результаты его работы были подтверждены компьютерными расчётами других учёных, что ещё раз подчеркнуло точность "
              "и значимость его научных идей. \n\n"

              "Давайте продолжим экскурсию и узнаем о следующей личности, чьё имя связано с этим местом.",
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
                        builder: (context) => const TourPoint12Page(),
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