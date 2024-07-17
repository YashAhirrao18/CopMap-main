// bandobast_details_screen.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yash_s_application3/presentation/view_bandobast/bandobast_details_mapview_screen.dart';

class BandobastDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> bandobastData;

  BandobastDetailsScreen({required this.bandobastData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bandobast Details'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Bandobast Date: ${bandobastData['dateTime']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BandobastDetailsMapViewScreen(
                            bandobastData: bandobastData,
                          ),
                        ),
                      );
                    },
                    child: Text('Map View'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Markers:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              // Display the list of markers
              for (var marker in bandobastData['markers'] ?? [])
                if (marker != null)
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 3.0,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location: ${marker['placeName'] ?? 'Unknown'}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Assigned Officers:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          // Display the list of assigned officers
                          for (var officerId
                              in marker['assignedOfficers'] ?? [])
                            FutureBuilder<
                                DocumentSnapshot<Map<String, dynamic>>>(
                              future: FirebaseFirestore.instance
                                  .collection('Officers')
                                  .doc(officerId)
                                  .get(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  final officerData = snapshot.data!.data()
                                      as Map<String, dynamic>;
                                  return ListTile(
                                    title: Text(
                                      officerData['name'] ?? 'Unknown Officer',
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                    subtitle: Text(
                                      'Rank: ${officerData['rank'] ?? 'Unknown'}',
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  );
                                }
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
