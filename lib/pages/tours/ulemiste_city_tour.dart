import 'package:flutter/material.dart';
import 'tour_points/tour_map_page.dart';

class TourInfoPage extends StatelessWidget {
  const TourInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Юлемисте Сити"),
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
                "assets/images/map.jpg",
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
                      "40",
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
                      "2.3",
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
              "Узнайте истории тех, чьими именами названы самые здания в «Кремниевой долине Эстонии»"
                  "Юлемисте Сити - это не просто офисные кварталы и стекло."
                  "Это «интеллектуальны  пантеон» Эстонии под открытым небом."
                  "Знаете ли вы, почему здания здесь носят фамилии учёных,"
                  "врачей и экономистов, а не просто порядковые номера?",
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
              "1. Вступление — технологический городок Юлемисте Сити.\n"
              "2. Здание Бориса Тамма — первое «умное» офисное здание Юлемисте Сити.\n"
              "3. Здание Пауля Когермана — развитие химии горючих сланцев.\n"
              "4. Здание Людвига Пуусеппа — основатель нейрохирургии.\n"
              "5. Здание Йоханнеса Кяйса — идеи природосообразного и индивидуального подхода в образовании.\n"
              "6. Здание Вальтера Заппа — изобретатель миниатюрной камеры Minox.\n"
              "7. Здание Устуса Агура — формирование эстонского информационного общества.\n"
              "8. Здание Рагнара Нурксе — экономисту, внёсший вклад в международную финансовую систему.\n"
              "9. Здание Александра Ливенталя — изобретатель в сфере воздухоплавания.\n"
              "10. Здание Альмы Томингас — первая женщина-профессор в Эстонии.\n"
              "11. Здание Эрнста Эпика — исследователь космоса, звёзд и структуры Вселенной.\n"
              "12. Здание Георга Луриха — легендарный спортсмен и символ физической силы Эстонии.\n"
              "13. Здание Хильды Табы — развитие педагогики и международной теории образования.\n"
              "14. Здание Карла Папелло — разработчик в области оптики и механики.\n"
              "15. Здание Карла Эрнста фон Бэра — основатель эмбриологии.\n"
              "16. Здание Артура Линда — развитие молекулярной биологии и биохимии.\n"
              "17. Здание Бернхарда Шмидта — изобретатель оптики для телескопов.\n"
              "18. Здание Виктора Пальма — химик и общественный деятель.\n"
              "19. Финальная точка — будущего развития Юлемисте Сити, здание в честь эколога Виктора Мазинга.\n"
            ),

            const SizedBox(height: 40),

          ],
        ),
      ),
    );
  }
}