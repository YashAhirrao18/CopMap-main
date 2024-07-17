import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackBandobastScreen extends StatefulWidget {
  final String bandobastId;

  TrackBandobastScreen({required this.bandobastId});

  @override
  _TrackBandobastScreenState createState() => _TrackBandobastScreenState();
}

class _TrackBandobastScreenState extends State<TrackBandobastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Bandobast Screen'),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance
            .collection('bandobast')
            .doc(widget.bandobastId)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Extract bandobast details
            final bandobastData = snapshot.data!.data() as Map<String, dynamic>;
            print('$bandobastData'); // Extract assigned officers
            final List<String> assignedOfficers =
                List<String>.from(bandobastData['assignedOfficers'] ?? []);

            // Fetch live location for each assigned officer
            // Display markers on the map
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(20.9025, 74.7749), // Set your initial position
                zoom: 10.0,
              ),
              markers: Set.from(
                assignedOfficers.map((officerId) {
                  // Fetch officer details from Officers collection
                  // Retrieve live location (latitude, longitude)
                  // Create Marker for each officer
                  // return Marker(...)
                }),
              ),
            );
          }
        },
      ),
    );
  }
}
