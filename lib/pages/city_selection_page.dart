import 'package:flutter/material.dart';
import 'towns/tallinn_tours_page.dart';

class CitySelectionPage extends StatelessWidget {
  const CitySelectionPage({super.key});

  Widget cityCard(String title, String tours, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade200,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),

                  const SizedBox(height: 4),

                  Text(tours, style: const TextStyle(color: Colors.grey)),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Гиды Эстонии")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TallinnToursPage(),
                  ),
                );
              },
              child: cityCard(
                "Таллинн",
                "1 тур",
                "assets/images/tallinn.jpg",
              ),
            ),

            cityCard("Тарту", "0 туров", "assets/images/tartu.jpg"),
            cityCard("Пярну", "0 туров", "assets/images/parnu.jpg"),
            cityCard("Нарва", "0 туров", "assets/images/narva.jpg"),
            cityCard("Хаапсалу", "0 туров", "assets/images/haapsalu.jpg"),

          ],
        ),
      ),
    );
  }
}