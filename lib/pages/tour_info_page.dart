import 'package:flutter/material.dart';
import 'tour_map_page.dart';

class TourInfoPage extends StatelessWidget {
  const TourInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Кадриорг и Пирита"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Карта маршрута
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/images/tour_map.jpg",
                height: 170,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            /// Минуты + километры + кнопка
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Минут"),
                    SizedBox(height: 4),
                    Text(
                      "120",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Километр"),
                    SizedBox(height: 4),
                    Text(
                      "3.5",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    foregroundColor: Colors.deepPurple,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TourMapPage(),
                      ),
                    );
                  },
                  child: const Text("Начать"),
                )

              ],
            ),

            const SizedBox(height: 24),

            /// Описание
            const Text(
              "Описание",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Отправьтесь в путешествие по узким мощёным улочкам "
                  "средневекового Таллинского города. Мы поднимемся на "
                  "Вышгород, узнаем, почему Таллин назывался храмом, и "
                  "увидим красные черепичные крыши и солёный бриз Балтики.",
            ),

            const SizedBox(height: 24),

            /// Маршрут
            const Text(
              "Маршрут",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "1. Ратушная площадь — сердце города и место встреч.\n"
                  "2. Ратушная аптека — действующая аптека по рецепту 1422 года.\n"
                  "3. Сад Датского короля — место, где по легенде спустился флаг Дании.\n"
                  "4. Собор Александра Невского — величественный купольный храм на холме.\n"
                  "5. Смотровая Кохтуотса — тот самый вид с надписью «The Times we had».\n"
                  "6. Улица Короткая нога — спуск обратно в Нижний город.",
            ),

            const SizedBox(height: 40),

          ],
        ),
      ),
    );
  }
}