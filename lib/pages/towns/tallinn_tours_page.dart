import 'package:flutter/material.dart';
import '../tours/ulemiste_city_tour.dart';

class TallinnToursPage extends StatelessWidget {
  const TallinnToursPage({super.key});

  /// Карточка тура с картинкой
  Widget tourCard(BuildContext context, String title, String subtitle, String image, Widget page) {
    return Card(
      color: Theme.of(context).colorScheme.secondaryContainer,
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: SizedBox(
          height: 90,
          child: Row(
            children: [

              /// Текст слева
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),

              /// Картинка справа во всю высоту
              Image.asset(
                image,
                width: 110,
                height: 90,
                fit: BoxFit.cover,
              ),

            ],
          ),
        ),
      ),
    );
  }

  /// Карточка тура без картинки
  Widget emptyCard(BuildContext context, String title, String subtitle) {
    return Card(
      color: Theme.of(context).colorScheme.secondaryContainer,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.image_not_supported_outlined,
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// AppBar
      appBar: AppBar(
        title: const Text("Гиды Таллинна"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            /// Тур Юлемисте Сити
            tourCard(
              context,
              "Юлемисте Сити",
              "Технологический город",
              "assets/images/Ulemiste_City.jpg",
              const TourInfoPage(),
            ),

            /// Пустые карточки

          ],
        ),
      ),
    );
  }
}