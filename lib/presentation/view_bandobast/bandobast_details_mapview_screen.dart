import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BandobastDetailsMapViewScreen extends StatelessWidget {
  final Map<String, dynamic> bandobastData;

  BandobastDetailsMapViewScreen({required this.bandobastData});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> markers = bandobastData['markers'] ?? [];

    // Create a map to associate marker IDs with officer information
    final Map<String, List<Map<String, dynamic>>> markerOfficers = {};

    // Create a list of Marker objects for Google Maps
    final List<Marker> googleMapMarkers =
        markers.where((marker) => marker != null).map((marker) {
      // Associate the marker ID with officer information
      final placeName = marker['placeName'] ?? 'Unknown';
      final officerIds = (marker['assignedOfficers'] as List<dynamic>)
          .map((officerId) => officerId.toString())
          .toList();
      markerOfficers[placeName] = [];

      return Marker(
        markerId: MarkerId(placeName),
        position: LatLng(marker['latitude'], marker['longitude']),
        infoWindow: InfoWindow(
          title: placeName,
          snippet: 'Click for details',
        ),
        onTap: () async {
          // Fetch officer data from Firestore
          for (var officerId in officerIds) {
            final officerSnapshot = await FirebaseFirestore.instance
                .collection('Officers')
                .doc(officerId)
                .get();
            final officerData = officerSnapshot.data() as Map<String, dynamic>;

            markerOfficers[placeName]!.add({
              'name': officerData['name'] ?? 'Unknown',
              'rank': officerData['rank'] ?? 'Unknown',
            });
          }

          // Show dialog when marker is tapped
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(placeName),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Assigned Officers:'),
                    for (var officer in markerOfficers[placeName]!)
                      Text('${officer['rank']} ${officer['name']}'),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        },
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Bandobast Details'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(20.9025, 74.7749), // Set your initial position
                zoom: 10.0,
              ),
              markers: Set.from(googleMapMarkers),
              onTap: (position) {
                // Handle map tap, if needed
                print('Map tapped at: $position');
              },
            ),
          ),
        ],
      ),
    );
  }
}
