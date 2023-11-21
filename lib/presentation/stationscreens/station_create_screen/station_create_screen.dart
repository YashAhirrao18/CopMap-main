import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yash_s_application3/features/firestore_services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StationCreateScreen extends StatefulWidget {
  @override
  _StationCreateScreenState createState() => _StationCreateScreenState();
}

class _StationCreateScreenState extends State<StationCreateScreen> {
  late Future<List<DocumentSnapshot>> officers;
  // Add a controller for the Google Map
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    officers = fetchOfficers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Bandobast'),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top portion: Google Maps API taking more than half of the screen
          Expanded(
            flex: 1,
            child: GoogleMap(
              onMapCreated: (controller) {
                // Set the controller when the map is created
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(20.9025,
                    74.7749), // Latitude and Longitude of Dhule, Maharashtra, India
                zoom: 10.0,
              ),
            ),
          ),
          // Bottom portion: Search bar and user information
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Search bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      // You can customize the search bar further as needed
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // User information
                  Text(
                    'User Information',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // FutureBuilder for displaying officers
                  Expanded(
                    child: FutureBuilder<List<DocumentSnapshot>>(
                      future: officers,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          final officerDocuments = snapshot.data!;
                          return ListView.builder(
                            itemCount: officerDocuments.length,
                            itemBuilder: (context, index) {
                              final officerData = officerDocuments[index].data()
                                  as Map<String, dynamic>;

                              // Null-checks for officer data
                              final name = officerData['name'] ?? 'Unknown';
                              final rank = officerData['rank'] ?? 'Unknown';
                              final dgp = officerData['dgp'] ?? 'Unknown';
                              final station =
                                  officerData['station'] ?? 'Unknown';

                              return ListTile(
                                title: Text(name),
                                subtitle: Text(
                                    'Rank: $rank\nDGP: $dgp\nStation: $station'),
                                onTap: () {
                                  // Handle officer selection here
                                  // You can use the selected officer's data as needed
                                },
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
