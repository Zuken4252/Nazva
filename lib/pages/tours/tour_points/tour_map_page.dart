import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../widgets/tour_marker.dart';

import 'tour_point1_page.dart';
import 'tour_point2_page.dart';
import 'tour_point3_page.dart';
import 'tour_point4_page.dart';
import 'tour_point5_page.dart';
import 'tour_point6_page.dart';
import 'tour_point7_page.dart';
import 'tour_point8_page.dart';
import 'tour_point9_page.dart';
import 'tour_point10_page.dart';
import 'tour_point11_page.dart';
import 'tour_point12_page.dart';
import 'tour_point13_page.dart';
import 'tour_point14_page.dart';
import 'tour_point15_page.dart';
import 'tour_point16_page.dart';
import 'tour_point17_page.dart';
import 'tour_point18_page.dart';
import 'tour_point19_page.dart';

class TourMapPage extends StatelessWidget {
  const TourMapPage({super.key});

  @override
  Widget build(BuildContext context) {

    final routePoints = [
      LatLng(59.42200072097774, 24.80008943512462), // Точка 1
      LatLng(59.422103334448316, 24.7995751614158),
      LatLng(59.42234313465689, 24.79955035135778),
      LatLng(59.42233051363563, 24.799354126353464), // Точка 2
      LatLng(59.42236608195624, 24.79951877492031),
      LatLng(59.42236608195624, 24.79951877492031),
      LatLng(59.42294893815343, 24.799534563136394),
      LatLng(59.42295352753244, 24.800245032979625), // Точка 3
      LatLng(59.422950037124586, 24.80119046231999),
      LatLng(59.42285251267722, 24.801291958011877), // Точка 4
      LatLng(59.422491994376976, 24.801710166567005),
      LatLng(59.42250164248735, 24.802043969588592),
      LatLng(59.42233472979068, 24.802047762804744), // Точка 5
      LatLng(59.421005689293246, 24.80202451223183),
      LatLng(59.42102069888835, 24.800948946476858), // Точка 6
      LatLng(59.42090820907791, 24.799665955491264), // Точка 7
      LatLng(59.42042325467736, 24.799641138127132),
      LatLng(59.420410973883335, 24.800810581192398), // Точка 8
      LatLng(59.42038606578145, 24.80187090687667),
      LatLng(59.420215680440826, 24.8020256074172),      
      LatLng(59.419459796693694, 24.80196218217001), // Точка 9
      LatLng(59.41945849365551, 24.802215517261605),
      LatLng(59.42026251818933, 24.802219733728336),
      LatLng(59.42022384942164, 24.805491611717283),
      LatLng(59.419152293956685, 24.805382673083518), // Точка 10
      LatLng(59.419887551532234, 24.80540413263277), // Точка 11
      LatLng(59.42022427673712, 24.805695780620688),
      LatLng(59.42022524161292, 24.80648856279696), // Точка 12
      LatLng(59.42024997687779, 24.80871795652367),
      LatLng(59.420435232383724, 24.808666748105587), // Точка 13
      LatLng(59.4204320828653, 24.806847659192655), // Точка 14
      LatLng(59.42106281495026, 24.806890413215754), // Точка 15
      LatLng(59.420862793157404, 24.80242410633144),
      LatLng(59.42076526269727, 24.80275340346513), // Точка 16
      LatLng(59.42091146616386, 24.802283116905553),
      LatLng(59.42108663841512, 24.8024665609238), // Точка 17
      LatLng(59.42148134445301, 24.802455283602935),
      LatLng(59.42156376485144, 24.80221448026125),
      LatLng(59.42203225092204, 24.802255364944937),
      LatLng(59.42241781386759, 24.80252624619198), // Точка 18
      LatLng(59.42228435102875, 24.803156828034616), // Точка 19

    ];

    final markers = [

      /// Точка 1
      Marker(
        point: const LatLng(59.42200072097774, 24.80008943512462),
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
            color: Colors.red,
          ),
        ),
      ),

      /// Точка 2
      Marker(
        point: const LatLng(59.42233051363563, 24.799354126353464),
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

            /// Точка 3
      Marker(
        point: const LatLng(59.42295352753244, 24.800245032979625),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPoint3Page(),
              ),
            );
          },
          child: const TourMarker(
            number: "3",
            color: Colors.red,
          ),
        ),
      ),

                  /// Точка 4
      Marker(
        point: const LatLng(59.42285251267722, 24.801291958011877),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPoint4Page(),
              ),
            );
          },
          child: const TourMarker(
            number: "4",
            color: Colors.red,
          ),
        ),
      ),

                  /// Точка 5
      Marker(
        point: const LatLng(59.42233472979068, 24.802047762804744),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPoint5Page(),
              ),
            );
          },
          child: const TourMarker(
            number: "5",
            color: Colors.red,
          ),
        ),
      ),

                  /// Точка 6
      Marker(
        point: const LatLng(59.42102069888835, 24.800948946476858),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPoint6Page(),
              ),
            );
          },
          child: const TourMarker(
            number: "6",
            color: Colors.red,
          ),
        ),
      ),

                  /// Точка 7
      Marker(
        point: const LatLng(59.42090820907791, 24.799665955491264),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPoint7Page(),
              ),
            );
          },
          child: const TourMarker(
            number: "7",
            color: Colors.red,
          ),
        ),
      ),

                  /// Точка 8
      Marker(
        point: const LatLng(59.420410973883335, 24.800810581192398),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPoint8Page(),
              ),
            );
          },
          child: const TourMarker(
            number: "8",
            color: Colors.red,
          ),
        ),
      ),

                  /// Точка 9
      Marker(
        point: const LatLng(59.419459796693694, 24.80196218217001),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPoint9Page(),
              ),
            );
          },
          child: const TourMarker(
            number: "9",
            color: Colors.red,
          ),
        ),
      ),

                  /// Точка 10
      Marker(
        point: const LatLng(59.419152293956685, 24.805382673083518),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPoint10Page(),              
              ),
            );
          },
          child: const TourMarker(
            number: "10",
            color: Colors.red,
          ),
        ),
      ),

                  /// Точка 11
      Marker(
        point: const LatLng(59.419887551532234, 24.80540413263277),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPoint11Page(),
              ),
            );
          },
          child: const TourMarker(
            number: "11",
            color: Colors.red,
          ),
        ),
      ),

                  /// Точка 12
      Marker(
        point: const LatLng(59.42022524161292, 24.80648856279696),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPoint12Page(),
              ),
            );
          },
          child: const TourMarker(
            number: "12",
            color: Colors.red,
          ),
        ),
      ),

                  /// Точка 13
      Marker(
        point: const LatLng(59.420435232383724, 24.808666748105587),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPoint13Page(),
              ),
            );
          },
          child: const TourMarker(
            number: "13",
            color: Colors.red,
          ),
        ),
      ),

                  /// Точка 14
      Marker(
        point: const LatLng(59.4204320828653, 24.806847659192655),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPoint14Page(),
              ),
            );
          },
          child: const TourMarker(
            number: "14",
            color: Colors.red,
          ),
        ),
      ),

                  /// Точка 15
      Marker(
        point: const LatLng(59.42106281495026, 24.806890413215754),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPoint15Page(),
              ),
            );
          },
          child: const TourMarker(
            number: "15",
            color: Colors.red,
          ),
        ),
      ),

                  /// Точка 16
      Marker(
        point: const LatLng(59.42076526269727, 24.80275340346513),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPoint16Page(),
              ),
            );
          },
          child: const TourMarker(
            number: "16",
            color: Colors.red,
          ),
        ),
      ),

                  /// Точка 17
      Marker(
        point: const LatLng(59.42108663841512, 24.8024665609238),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPoint17Page(),
              ),
            );
          },
          child: const TourMarker(
            number: "17",
            color: Colors.red,
          ),
        ),
      ),

                  /// Точка 18
      Marker(
        point: const LatLng(59.42241781386759, 24.80252624619198),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPoint18Page(),
              ),
            );
          },
          child: const TourMarker(
            number: "18",
            color: Colors.red,
          ),
        ),
      ),

                  /// Точка 19
      Marker(
        point: const LatLng(59.42228435102875, 24.803156828034616),
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TourPoint19Page(),
              ),
            );
          },
          child: const TourMarker(
            number: "19",
            color: Colors.red,
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