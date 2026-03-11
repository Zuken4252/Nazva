import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../widgets/tour_marker.dart';
import 'tour_point_page.dart';
import 'tour_point2_page.dart';

class TourMapPage extends StatelessWidget {
  const TourMapPage({super.key});

  @override
  Widget build(BuildContext context) {

    final routePoints = [
      LatLng(59.43696, 24.74761),
      LatLng(59.44000, 24.76000),
      LatLng(59.44150, 24.77500),
      LatLng(59.443426346787355, 24.79404812832795),
      LatLng(59.44237756253234, 24.799425887009956),
    ];

    final markers = [

      /// ТОЧКА 1
      Marker(
        point: const LatLng(59.43696, 24.74761),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPointPage(),
              ),
            );
          },
          child: const TourMarker(
            number: "1",
            color: Colors.green,
          ),
        ),
      ),

      /// ТОЧКА 2
      Marker(
        point: const LatLng(59.443426346787355, 24.79404812832795),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPoint2Page(),
              ),
            );
          },
          child: const TourMarker(
            number: "2",
            color: Colors.red,
          ),
        ),
      ),

      /// ТОЧКА 3
      Marker(
        point: const LatLng(59.44237756253234, 24.799425887009956),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {

            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      const Icon(Icons.sentiment_satisfied_alt, size: 40),

                      const SizedBox(height: 10),

                      const Text(
                        "Поздравляем!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "Вы прошли экскурсию!\nВы узнали об Эстонии что-то новое.",
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 20),

                      const Text("Оцените экскурсию"),

                      const SizedBox(height: 10),

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                        ],
                      ),

                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: const Text("В главное меню"),
                      ),

                    ],
                  ),
                );
              },
            );

          },
          child: const TourMarker(
            number: "3",
            color: Colors.deepPurple,
          ),
        ),
      ),

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Маршрут тура"),
      ),

      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(59.4410, 24.7700),
          initialZoom: 12,
          minZoom: 11,
          maxZoom: 18,
        ),

        children: [

          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: "com.example.nazva",
          ),

          PolylineLayer(
            polylines: [
              Polyline(
                points: routePoints,
                strokeWidth: 5,
                color: Colors.blue,
              ),
            ],
          ),

          MarkerLayer(
            markers: markers,
          ),

        ],
      ),
    );
  }
}