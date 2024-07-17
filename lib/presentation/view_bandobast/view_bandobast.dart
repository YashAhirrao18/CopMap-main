import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'bandobast_details_screen.dart'; // Import the new screen
import 'track_bandobast_screen.dart'; // Import the new screen

class ViewBandobastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Bandobast Screen'),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance.collection('bandobast').get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final bandobastDocuments = snapshot.data!.docs;
            return ListView.builder(
              itemCount: bandobastDocuments.length,
              itemBuilder: (context, index) {
                final bandobastData =
                    bandobastDocuments[index].data() as Map<String, dynamic>;

                final dynamic dateTime = bandobastData['dateTime'];
                final DateTime bandobastDateTime = dateTime is Timestamp
                    ? dateTime.toDate()
                    : dateTime != null
                        ? DateTime.tryParse(dateTime) ?? DateTime.now()
                        : DateTime.now();

                return Card(
                  margin: EdgeInsets.all(8.0),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bandobast Date: ${DateFormat('yyyy-MM-dd HH:mm').format(bandobastDateTime)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                // Navigate to BandobastDetailsScreen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BandobastDetailsScreen(
                                      bandobastData: bandobastData,
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(Icons.visibility),
                              label: Text('View Bandobast'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.teal,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () async {
                                try {
                                  // Navigate to TrackBandobastScreen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          TrackBandobastScreen(
                                        bandobastId:
                                            bandobastDocuments[index].id,
                                      ),
                                    ),
                                  );

                                  // Update bandobastId in Officers collection
                                  await updateOfficersBandobastId(
                                    bandobastDocuments[index].id,
                                  );
                                } catch (e) {
                                  // Handle errors
                                  print('Error updating officers: $e');
                                  // Show an error Snackbar or handle errors in a different way
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text("Error updating officers: $e"),
                                      duration: Duration(seconds: 5),
                                    ),
                                  );
                                }
                              },
                              icon: Icon(Icons.track_changes),
                              label: Text('Track Bandobast'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<void> updateOfficersBandobastId(String bandobastId) async {
    try {
      // Fetch bandobast document
      DocumentSnapshot<Map<String, dynamic>> bandobastSnapshot =
          await FirebaseFirestore.instance
              .collection('bandobast')
              .doc(bandobastId)
              .get();

      // Check if the bandobast document exists
      if (bandobastSnapshot.exists) {
        // Get assigned officers from the bandobast document
        List<String> assignedOfficers = List<String>.from(
            bandobastSnapshot.data()?['assignedOfficers'] ?? []);

        // Update bandobastId for each officer assigned to the specific bandobast
        for (String officerId in assignedOfficers) {
          // Fetch officer document
          DocumentSnapshot<Map<String, dynamic>> officerSnapshot =
              await FirebaseFirestore.instance
                  .collection('Officers')
                  .doc(officerId)
                  .get();

          // Check if the officer document exists
          if (officerSnapshot.exists) {
            // Update bandobastId for the officer
            await officerSnapshot.reference
                .update({'bandobastId': bandobastId});
          }
        }
      }
    } catch (e) {
      // Handle errors
      print('Error updating officers: $e');
    }
  }
}
