import 'package:flutter/material.dart';
import 'tour_info_page.dart';

class TallinnToursPage extends StatelessWidget {
  const TallinnToursPage({super.key});

  Widget tourCard(String title, String tours, String image) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(image,
                height: 100, width: double.infinity, fit: BoxFit.cover),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),

                const SizedBox(height: 4),

                Text(tours, style: const TextStyle(color: Colors.grey)),

              ],
            ),
          )
        ],
      ),
    );
  }

  Widget emptyCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade200,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Гиды Таллина")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.9,
          children: [

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TourInfoPage()),
                );
              },
              child: tourCard(
                  "Кадриорг и Пирита",
                  "7 туров",
                  "assets/images/kadriorg.jpg"),
            ),

            emptyCard(),
            emptyCard(),
            emptyCard(),
            emptyCard(),
            emptyCard(),
            emptyCard(),

          ],
        ),
      ),
    );
  }
}