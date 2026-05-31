import 'package:flutter/material.dart';
import 'tour_points/tour_map_page.dart';

import 'tour_points/tour_point1_page.dart';
import 'tour_points/tour_point2_page.dart';
import 'tour_points/tour_point3_page.dart';
import 'tour_points/tour_point4_page.dart';
import 'tour_points/tour_point5_page.dart';
import 'tour_points/tour_point6_page.dart';
import 'tour_points/tour_point7_page.dart';
import 'tour_points/tour_point8_page.dart';
import 'tour_points/tour_point9_page.dart';
import 'tour_points/tour_point10_page.dart';
import 'tour_points/tour_point11_page.dart';
import 'tour_points/tour_point12_page.dart';
import 'tour_points/tour_point13_page.dart';
import 'tour_points/tour_point14_page.dart';
import 'tour_points/tour_point15_page.dart';
import 'tour_points/tour_point16_page.dart';
import 'tour_points/tour_point17_page.dart';
import 'tour_points/tour_point18_page.dart';
import 'tour_points/tour_point19_page.dart';

class TourInfoPage extends StatelessWidget {
  const TourInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1FA),

      appBar: AppBar(
        title: const Text("Юлемисте Сити"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Карта маршрута
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/map.jpg",
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            // Кнопка начать тур
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD6CCEF),
                  foregroundColor: Colors.black87,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TourMapPage(),
                    ),
                  );
                },
                child: const Text(
                  "Начать",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Минуты и километры
            Row(
              children: [
                _infoChip(context, Icons.access_time, "40 Мин"),
                const SizedBox(width: 10),
                _infoChip(context, Icons.directions_walk, "2.3 км"),
              ],
            ),

            const SizedBox(height: 12),

            // Описание тура
            Card(
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Узнайте истории тех, чьими именами названы самые здания в «Кремниевой долине Эстонии». "
                      "Юлемисте Сити — это не просто офисные кварталы и стекло. "
                      "Это «интеллектуальный пантеон» Эстонии под открытым небом.",
                  style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.5),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Заголовок маршрута
            Card(
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: ListTile(
                leading: const Icon(Icons.location_on_outlined),
                title: const Text("Маршрут"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TourMapPage(),
                    ),
                  );
                },
              ),
            ),

            // Список точек маршрута
            _routeItem(
  context,
  "Вступление",
  "Технологический городок Юлемисте Сити",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPointPage()),
  ),
),

_routeItem(
  context,
  "Здание Бориса Тамма",
  "Первое «умное» офисное здание Юлемисте Сити",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPoint2Page()),
  ),
),

_routeItem(
  context,
  "Здание Пауля Когермана",
  "Развитие химии горючих сланцев",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPoint3Page()),
  ),
),

_routeItem(
  context,
  "Здание Людвига Пуусеппа",
  "Основатель нейрохирургии",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPoint4Page()),
  ),
),

_routeItem(
  context,
  "Здание Йоханнеса Кяйса",
  "Природосообразный подход в образовании",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPoint5Page()),
  ),
),

_routeItem(
  context,
  "Здание Вальтера Заппа",
  "Изобретатель миниатюрной камеры Minox",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPoint6Page()),
  ),
),

_routeItem(
  context,
  "Здание Устуса Агура",
  "Формирование эстонского информационного общества",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPoint7Page()),
  ),
),

_routeItem(
  context,
  "Здание Рагнара Нурксе",
  "Вклад в международную финансовую систему",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPoint8Page()),
  ),
),

_routeItem(
  context,
  "Здание Александра Ливенталя",
  "Изобретатель в сфере воздухоплавания",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPoint9Page()),
  ),
),

_routeItem(
  context,
  "Здание Альмы Томингас",
  "Первая женщина-профессор в Эстонии",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPoint10Page()),
  ),
),

_routeItem(
  context,
  "Здание Эрнста Эпика",
  "Исследователь космоса и структуры Вселенной",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPoint11Page()),
  ),
),

_routeItem(
  context,
  "Здание Георга Луриха",
  "Легендарный спортсмен Эстонии",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPoint12Page()),
  ),
),

_routeItem(
  context,
  "Здание Хильды Табы",
  "Международная теория образования",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPoint13Page()),
  ),
),

_routeItem(
  context,
  "Здание Карла Папелло",
  "Разработчик в области оптики и механики",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPoint14Page()),
  ),
),

_routeItem(
  context,
  "Здание Карла Эрнста фон Бэра",
  "Основатель эмбриологии",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPoint15Page()),
  ),
),

_routeItem(
  context,
  "Здание Артура Линда",
  "Молекулярная биология и биохимия",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPoint16Page()),
  ),
),

_routeItem(
  context,
  "Здание Бернхарда Шмидта",
  "Изобретатель оптики для телескопов",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPoint17Page()),
  ),
),

_routeItem(
  context,
  "Здание Виктора Пальма",
  "Химик и общественный деятель",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPoint18Page()),
  ),
),

_routeItem(
  context,
  "Финальная точка",
  "Здание в честь эколога Виктора Мазинга",
  () => Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const TourPoint19Page()),
  ),
),

            const SizedBox(height: 12),

          ],
        ),
      ),
    );
  }

  // Вспомогательный чип с иконкой
  Widget _infoChip(BuildContext context, IconData icon, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18),
            const SizedBox(width: 8),
            Text(label),
          ],
        ),
      ),
    );
  }

  // Карточка точки маршрута
  Widget _routeItem(
  BuildContext context,
  String title,
  String subtitle,
  VoidCallback onTap,
) {
  return Card(
    color: Theme.of(context).colorScheme.secondaryContainer,
    child: ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    ),
  );
}
}