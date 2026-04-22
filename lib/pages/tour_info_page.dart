import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

class TourInfoPage extends StatefulWidget {
  final String personName;
  final String imagePath;

  const TourInfoPage({
    super.key,
    required this.personName,
    required this.imagePath,
  });

  @override
  State<TourInfoPage> createState() => _TourInfoPageState();
}

class _TourInfoPageState extends State<TourInfoPage> {
  final AudioPlayer player = AudioPlayer();

  bool isPlaying = false;
  String biography = "Loading...";

  String get fileNumber {
    switch (widget.personName) {
      case "Boris Tamm":
        return "02";
      case "Paul Kogerman":
        return "03";
      case "Ludvig Puusepp":
        return "04";
      case "Johannes Kais":
        return "05";
      case "Walter Zapp":
        return "06";
      case "Ustus Agur":
        return "07";
      case "Ragnar Nurkse":
        return "08";
      case "Alexandre Liwentaal":
        return "09";
      case "Alma Tomingas":
        return "10";
      case "Ernst Opik":
        return "11";
      case "Georg Lurich":
        return "12";
      case "Hilda Taba":
        return "13";
      case "Karl Papello":
        return "14";
      case "Karl Ernst von Baer":
        return "15";
      case "Artur Lind":
        return "16";
      case "Bernhard Schmidt":
        return "17";
      case "Viktor Palm":
        return "18";
      default:
        return "01";
    }
  }

 String get audioFile {
  if (widget.personName == "Alexandre Liwentaal") {
    return "09_Alexandre_Liwentaal.mp3";
  }

  return "${fileNumber}_${widget.personName.replaceAll(" ", "_")}.mp3";
}

String get textFile {
  if (widget.personName == "Alexandre Liwentaal") {
    return "09_Alexandre_Liwentaal.txt";
  }

  return "${fileNumber}_${widget.personName.replaceAll(" ", "_")}.txt";
}

  @override
  void initState() {
    super.initState();
    loadText();
  }

  Future<void> loadText() async {
    try {
      final text = await rootBundle.loadString("assets/texts/$textFile");

      setState(() {
        biography = text;
      });
    } catch (e) {
      setState(() {
        biography = "Text not found.";
      });
    }
  }

  Future<void> playAudio() async {
    await player.play(AssetSource("audio/$audioFile"));

    setState(() {
      isPlaying = true;
    });
  }

  Future<void> pauseAudio() async {
    await player.pause();

    setState(() {
      isPlaying = false;
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1FA),

      appBar: AppBar(
        title: Text(widget.personName),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.imagePath,
                height: 280,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              widget.personName,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            IconButton(
              onPressed: () {
                if (isPlaying) {
                  pauseAudio();
                } else {
                  playAudio();
                }
              },
              icon: Icon(
                isPlaying
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_fill,
                size: 90,
                color: const Color(0xFF7E57C2),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              biography,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}