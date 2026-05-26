import 'package:flutter/material.dart';
import 'tour_info_page.dart';

class TallinnToursPage extends StatelessWidget {
  const TallinnToursPage({super.key});

  Widget tourCard(
    BuildContext context,
    String title,
    String subtitle,
    List<Map<String, String>> people,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TourListPage(
              title: title,
              people: people,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              color: Colors.black12,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),

            const Spacer(),

            const Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.deepPurple,
              ),
            )

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final famousPeople = [
      {
        "name": "Boris Tamm",
        "image": "assets/images/02_Boris_Tamm.jpg",
      },
      {
        "name": "Paul Kogerman",
        "image": "assets/images/03_Paul_Kogerman.jpg",
      },
      {
        "name": "Ludvig Puusepp",
        "image": "assets/images/04_Ludvig_Puusepp.jpg",
      },
      {
        "name": "Walter Zapp",
        "image": "assets/images/06_Walter_Zapp.jpg",
      },
      {
        "name": "Ragnar Nurkse",
        "image": "assets/images/08_Ragnar_Nurkse.jpg",
      },
      {
        "name": "Alma Tomingas",
        "image": "assets/images/10_Alma_Tomingas.jpg",
      },
      {
        "name": "Georg Lurich",
        "image": "assets/images/12_Georg_Lurich.jpg",
      },
    ];

    final legends = [
      {
        "name": "Johannes Kais",
        "image": "assets/images/05_Johannes_Kais.jpg",
      },
      {
        "name": "Hilda Taba",
        "image": "assets/images/13_Hilda_Taba.jpg",
      },
      {
        "name": "Karl Papello",
        "image": "assets/images/14_Karl_Papello.jpg",
      },
      {
        "name": "Artur Lind",
        "image": "assets/images/16_Artur_Lind.jpg",
      },
      {
        "name": "Bernhard Schmidt",
        "image": "assets/images/17_Bernhard_Schmidt.jpg",
      },
      {
        "name": "Viktor Palm",
        "image": "assets/images/18_Viktor_Palm.jpg",
      },
    ];

    final history = [
      {
        "name": "Ustus Agur",
        "image": "assets/images/07_Ustus_Agur.jpg",
      },
      {
        "name": "Alexandre Liwentaal",
        "image": "assets/images/09_Alexandre_Liwentaal.jpg",
      },
      {
        "name": "Ernst Opik",
        "image": "assets/images/11_Ernst_Opik.jpg",
      },
      {
        "name": "Karl Ernst von Baer",
        "image": "assets/images/15_Karl_Baer.jpg",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F1FA),

      appBar: AppBar(
        title: const Text("Excursions"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Expanded(
              child: tourCard(
                context,
                "Famous People of Estonia",
                "Scientists, inventors and great minds",
                famousPeople,
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: tourCard(
                context,
                "Tallinn Legends",
                "Stories and remarkable people",
                legends,
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: tourCard(
                context,
                "Historic Estonia",
                "Important figures in history",
                history,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class TourListPage extends StatelessWidget {
  final String title;
  final List<Map<String, String>> people;

  const TourListPage({
    super.key,
    required this.title,
    required this.people,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1FA),

      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: people.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 0.78,
        ),
        itemBuilder: (context, index) {
          final person = people[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TourInfoPage(
                    personName: person["name"]!,
                    imagePath: person["image"]!,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black12,
                  )
                ],
              ),
              child: Column(
                children: [

                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(18),
                      ),
                      child: Image.asset(
                        person["image"]!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      person["name"]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}