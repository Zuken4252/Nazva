import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'tour_point7_page.dart';
import 'tour_map_page.dart';

class TourPoint6Page extends StatefulWidget {
  const TourPoint6Page({super.key});

  @override
  State<TourPoint6Page> createState() => _TourPoint6PageState();
}

class _TourPoint6PageState extends State<TourPoint6Page> {

  final AudioPlayer player = AudioPlayer();

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  bool isPlaying = false;
  bool showMaterials = false;
  int photoIndex = 0;

  final photos = [
    "assets/images/IMG_20260526_121508.jpg",
    "assets/images/Walter_Zapp.jpg",
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
    await player.play(AssetSource('audio/Walter_Zapp.mp3'));
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
            title: const Text("Вальтер Запп"),
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
                              builder: (context) => const TourPoint7Page(),
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
                        "assets/images/IMG_20260526_121508.jpg",
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
                      "Давайте познакомимся с ещё одним человеком, чьё изобретение стало известным во всём мире.\n\n"
                          "Вальтер Запп, родившийся в 1905 году и ушедший из жизни в 2003 году, был "
                          "балтийско-немецким изобретателем и инженером-конструктором. В 1935 году ему "
                          "удалось создать миниатюрную камеру Minox — по его словам, идея этого устройства пришла к нему во сне.\n\n"
                          "Изобретение Заппа получило мировую известность, в том числе благодаря популярной культуре: камера Minox "
                          "появилась в 1969 году в фильме о Джеймсе Бонде.\n\n"
                          "Продолжим экскурсию и узнаем, кто ещё оставил свой след в истории.",
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