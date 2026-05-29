import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'tour_point16_page.dart';
import 'tour_map_page.dart';

class TourPoint15Page extends StatefulWidget {
  const TourPoint15Page({super.key});

  @override
  State<TourPoint15Page> createState() => _TourPoint15PageState();
}

class _TourPoint15PageState extends State<TourPoint15Page> {

  final AudioPlayer player = AudioPlayer();

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  bool isPlaying = false;
  bool showMaterials = false;
  int photoIndex = 0;

  final photos = [
    "assets/images/IMG_20260424_105455.jpg",
    "assets/images/Karl_Baer.jpg",
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
    await player.play(AssetSource('audio/Karl_Baer.mp3'));
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

    return Stack(
      children: [

        Scaffold(
          backgroundColor: const Color(0xFFF5F1FA),

          /// AppBar
          appBar: AppBar(
            title: const Text("Карл Бер"),
          ),

          /// Фиксированный плеер внизу
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(28),
              ),
              border: Border.all(width: 1),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                /// Прогресс слайдер
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

                /// Кнопки плеера
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    IconButton.filled(
                      style: IconButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                        foregroundColor: Colors.black87,
                      ),
                      icon: const Icon(Icons.replay_10),
                      onPressed: rewind10,
                    ),

                    const SizedBox(width: 16),

                    IconButton.filled(
                      style: IconButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                        foregroundColor: Colors.black87,
                        iconSize: 32,
                      ),
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                      onPressed: () {
                        if (isPlaying) {
                          pauseAudio();
                        } else {
                          playAudio();
                        }
                      },
                    ),

                    const SizedBox(width: 16),

                    IconButton.filled(
                      style: IconButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                        foregroundColor: Colors.black87,
                      ),
                      icon: const Icon(Icons.forward_10),
                      onPressed: forward10,
                    ),

                  ],
                ),

                const SizedBox(height: 8),

                /// Кнопки Назад и Далее
                Row(
                  children: [

                    Expanded(
                      child: FilledButton.icon(
                        style: FilledButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                          foregroundColor: Colors.black87,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          minimumSize: const Size(0, 56),
                        ),
                        onPressed: () {
                          player.stop();
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.fast_rewind),
                        label: const Text("Назад"),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: FilledButton.icon(
                        style: FilledButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                          foregroundColor: Colors.black87,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          minimumSize: const Size(0, 56),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TourPoint16Page(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.fast_forward),
                        label: const Text("Далее"),
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),

          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Фото с кнопкой материалов
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [

                      Image.asset(
                        "assets/images/IMG_20260424_105455.jpg",
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                      ),

                      const Positioned(
                        bottom: 16,
                        left: 16,
                        child: Text(
                          "Подборка фото",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 12,
                        right: 12,
                        child: IconButton.filled(
                          style: IconButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                            foregroundColor: Colors.black87,
                          ),
                          onPressed: () {
                            setState(() {
                              showMaterials = true;
                            });
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ),

                    ],
                  ),
                ),

                const SizedBox(height: 12),

                /// Описание в карточке
                Card(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Двигаясь дальше, познакомимся с одним из самых выдающихся учёных своего времени.\n\n"
                          "Карл Эрнст фон Бэр, родившийся в 1792 и ушедший из жизни в 1876 году, "
                          "был одним из крупнейших естествоиспытателей девятнадцатого века.\n\n"
                          "Он известен как основатель эмбриологии: именно Бэр открыл яйцеклетку млекопитающих и подробно описал развитие эмбриона.\n\n"
                          "Продолжим экскурсию и познакомимся с ещё одной выдающейся личностью.",
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

              ],
            ),
          ),
        ),

        /// Затемнение + просмотр фото поверх всего экрана
        if (showMaterials) ...[

          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [

                    Image.asset(
                      photos[photoIndex],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),

                    /// Кнопка закрыть
                    Positioned(
                      top: 12,
                      left: 12,
                      child: IconButton.filled(
                        style: IconButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                          foregroundColor: Colors.black87,
                        ),
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            showMaterials = false;
                          });
                        },
                      ),
                    ),

                    /// Кнопка назад
                    Positioned(
                      bottom: 12,
                      left: 12,
                      child: IconButton.filled(
                        style: IconButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                          foregroundColor: Colors.black87,
                        ),
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: previousPhoto,
                      ),
                    ),

                    /// Кнопка вперёд
                    Positioned(
                      bottom: 12,
                      right: 12,
                      child: IconButton.filled(
                        style: IconButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                          foregroundColor: Colors.black87,
                        ),
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: nextPhoto,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),

        ],

      ],
    );
  }
}