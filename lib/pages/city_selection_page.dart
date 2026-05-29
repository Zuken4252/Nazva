import 'package:flutter/material.dart';
import 'towns/tallinn_tours_page.dart';

class CitySelectionPage extends StatelessWidget {
  const CitySelectionPage({super.key});

  Widget cityCard(BuildContext context, String title, String tours, String image, {Widget? page}) {
    return Card(
      color: Theme.of(context).colorScheme.secondaryContainer,
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: page != null ? () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        } : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Картинка
            Image.asset(
              image,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            /// Название и количество туров
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    tours,
                    style: const TextStyle(color: Colors.grey),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [

          /// Растягивающийся AppBar
          SliverAppBar.large(
            title: const Text("Гиды Эстонии"),
          ),

          /// Список городов
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([

                cityCard(
                  context,
                  "Таллинн",
                  "1 тур",
                  "assets/images/tallinn.jpg",
                  page: const TallinnToursPage(),
                ),

                cityCard(context, "Тарту", "0 туров", "assets/images/tartu.jpg"),
                cityCard(context, "Пярну", "0 туров", "assets/images/parnu.jpg"),
                cityCard(context, "Нарва", "0 туров", "assets/images/narva.jpg"),
                cityCard(context, "Хаапсалу", "0 туров", "assets/images/haapsalu.jpg"),

              ]),
            ),
          ),

        ],
      ),
    );
  }
}