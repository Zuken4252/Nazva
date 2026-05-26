import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

//import 'tour_point19_page.dart';
import 'tour_map_page.dart';

class TourPoint19Page extends StatefulWidget {
  const TourPoint19Page({super.key});

  @override
  State<TourPoint19Page> createState() => _TourPoint19PageState();
}

class _TourPoint19PageState extends State<TourPoint19Page> {

  final AudioPlayer player = AudioPlayer();

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  bool isPlaying = false;

  bool showMaterials = false;
  int photoIndex = 0;

  final photos = [
    "assets/images/IMG_20260424_111424.jpg"
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
    await player.play(AssetSource('audio/Zakluchenie.mp3'));
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
        title: const Text("Заключение - Точка 19"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/images/IMG_20260424_111424.jpg",
              ),
            ),

            const SizedBox(height: 20),

            // const Text(
            //   "Виктор Пальм",
            //   style: TextStyle(
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),

            const SizedBox(height: 10),

            const Text(
              "На этом наша экскурсия подходит к завершению — но история этого места продолжает развиваться. \n\n"

              "Юлемисте Сити — это живой и постоянно растущий технологический городок. В ближайшие годы здесь появятся новые здания, "
              "а вместе с ними — новые истории и новые имена, связанные с выдающимися деятелями Эстонии. По мере расширения территории "
              "будет обновляться и наша экскурсия, чтобы вы могли открывать для себя всё больше интересных фактов и людей. \n\n"

              "Уже сейчас известно, что здание, которое строится прямо рядом с площадью, где вы находитесь, получит имя эколога Виктора Мазинга. "
              "Завершение строительства запланировано на 2027 год. \n\n"

              "Спасибо, что были с нами. Надеемся, эта прогулка помогла вам по-новому взглянуть на это пространство — место, где история, наука и "
              "будущее соединяются в единое целое.",
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

                    player.stop();

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              const Icon(
                                Icons.sentiment_satisfied_alt,
                                size: 40,
                              ),

                              const SizedBox(height: 10),

                              const Text(
                                "Поздравляем!",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 10),

                              const Text(
                                "Вы прошли экскурсию!\nВы узнали об Эстонии что-то новое.",
                                textAlign: TextAlign.center,
                              ),

                              const SizedBox(height: 20),

                              const Text("Оцените экскурсию"),

                              const SizedBox(height: 10),

                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                ],
                              ),

                              const SizedBox(height: 20),

                              ElevatedButton(
                                onPressed: () {

                                  Navigator.pop(context);

                                  Navigator.popUntil(
                                    context,
                                    (route) => route.isFirst,
                                  );
                                },
                                child: const Text("В главное меню"),
                              ),

                            ],
                          ),
                        );
                      },
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