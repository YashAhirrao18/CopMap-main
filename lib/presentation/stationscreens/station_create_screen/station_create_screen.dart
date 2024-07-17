import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMarker {
  final String markerId;
  final double latitude;
  final double longitude;
  final String placeName;
  List<String>? assignedOfficers;

  CustomMarker({
    required this.markerId,
    required this.latitude,
    required this.longitude,
    required this.placeName,
    this.assignedOfficers,
  });
}

class OfficerList extends StatefulWidget {
  final List<DocumentSnapshot> officers;
  final Function(String) onOfficerTap;

  OfficerList({required this.officers, required this.onOfficerTap});

  @override
  _OfficerListState createState() => _OfficerListState();
}

class _OfficerListState extends State<OfficerList> {
  List<bool> officerSelection = [];

  @override
  void initState() {
    super.initState();
    officerSelection = List.generate(widget.officers.length, (index) => false);
  }

  @override
  void didUpdateWidget(covariant OfficerList oldWidget) {
    super.didUpdateWidget(oldWidget);
    officerSelection = List.generate(widget.officers.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.officers.length,
      itemBuilder: (context, index) {
        final officerData =
            widget.officers[index].data() as Map<String, dynamic>;

        final name = officerData['name'] ?? 'Unknown';
        final rank = officerData['rank'] ?? 'Unknown';
        final dgp = officerData['dgp'] ?? 'Unknown';
        final station = officerData['station'] ?? 'Unknown';

        return ListTile(
          title: Text(name),
          subtitle: Text(
            'Rank: $rank\nDGP: $dgp\nStation: $station',
          ),
          tileColor: officerSelection[index] ? Colors.grey : null,
          onTap: () {
            setState(() {
              officerSelection[index] = !officerSelection[index];
              widget.onOfficerTap(officerData['dgp']);
            });
          },
        );
      },
    );
  }
}

class StationCreateScreen extends StatefulWidget {
  @override
  _StationCreateScreenState createState() => _StationCreateScreenState();
}

class _StationCreateScreenState extends State<StationCreateScreen> {
  late Future<List<DocumentSnapshot>> officers;
  Map<String, CustomMarker> markers = {};
  CustomMarker? selectedMarker;
  List<String> selectedOfficers = [];
  GoogleMapController? _mapController;

  @override
  void initState() {
    super.initState();
    officers = fetchOfficers();
  }

  Future<void> _onMapTap(LatLng latLng) async {
    String? placeName = await _showPlaceNameDialog();

    if (placeName != null && placeName.isNotEmpty) {
      String markerId = latLng.toString();
      print('Marker created: $markerId, Place Name: $placeName');

      setState(() {
        markers[markerId] = CustomMarker(
          markerId: markerId,
          latitude: latLng.latitude,
          longitude: latLng.longitude,
          placeName: placeName,
        );
      });
    }
  }

  Future<String?> _showPlaceNameDialog() async {
    TextEditingController controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Place Name'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Place Name',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(controller.text);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDateTimePickerDialog() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (selectedDate != null) {
      TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        String dateTimeString =
            '${selectedDate.toLocal()} ${selectedTime.format(context)}';
        print('Selected Date and Time: $dateTimeString');
        _confirmBandobast(dateTimeString);
        _processSelectedDateTime(dateTimeString);
      }
    }
  }

  void _processSelectedDateTime(String dateTimeString) {
    print('Processing Date and Time: $dateTimeString');
  }

  void _onOfficerTap(String officerId) {
    setState(() {
      if (selectedOfficers.contains(officerId)) {
        selectedOfficers.remove(officerId);
      } else {
        selectedOfficers.add(officerId);
      }
    });
  }

  Future<void> _confirmBandobast(String dateTimeString) async {
    if (markers.isNotEmpty) {
      // Create a new document in the 'bandobast' collection
      DocumentReference bandobastReference =
          await FirebaseFirestore.instance.collection('bandobast').add({
        'dateTime': dateTimeString,
        'markers': markers.values
            .map((marker) => {
                  'latitude': marker.latitude,
                  'longitude': marker.longitude,
                  'placeName': marker.placeName,
                  'assignedOfficers': marker.assignedOfficers ?? [],
                })
            .toList(),
        'assignedOfficers': selectedOfficers,
      });

      print('Bandobast confirmed! Document ID: ${bandobastReference.id}');

      // Clear the local markers after confirming the bandobast
      setState(() {
        markers.clear();
        selectedMarker = null;
        selectedOfficers.clear();
      });
    } else {
      print('No markers to confirm in the bandobast.');
    }
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
          Expanded(
            flex: 1,
            child: GoogleMap(
              onMapCreated: (controller) {
                _mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(20.9025, 74.7749),
                zoom: 10.0,
              ),
              onTap: _onMapTap,
              markers: markers.values.map((marker) {
                return Marker(
                  markerId: MarkerId(marker.markerId),
                  position: LatLng(marker.latitude, marker.longitude),
                  onTap: () {
                    setState(() {
                      selectedMarker = marker;
                      print('Selected Marker: ${selectedMarker?.markerId}');
                    });
                  },
                );
              }).toSet(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'User Information',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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

                              final name = officerData['name'] ?? 'Unknown';
                              final rank = officerData['rank'] ?? 'Unknown';
                              final dgp = officerData['dgp'] ?? 'Unknown';
                              final station =
                                  officerData['station'] ?? 'Unknown';

                              return ListTile(
                                title: Text(name),
                                subtitle: Text(
                                  'Rank: $rank\nDGP: $dgp\nStation: $station',
                                ),
                                tileColor: selectedOfficers.contains(dgp)
                                    ? Colors.grey
                                    : null,
                                onTap: () {
                                  _onOfficerTap(officerData['dgp']);
                                },
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (selectedMarker != null &&
                          selectedOfficers.isNotEmpty) {
                        setState(() {
                          markers[selectedMarker!.markerId]
                              ?.assignedOfficers ??= [];
                          markers[selectedMarker!.markerId]
                              ?.assignedOfficers
                              ?.addAll(selectedOfficers);
                          print(
                              'Officers linked to marker: ${selectedMarker!.markerId}');
                        });
                      }
                    },
                    child: Text('Link Officer to Marker'),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (selectedMarker != null &&
                          selectedOfficers.isNotEmpty) {
                        _showDateTimePickerDialog();
                      }
                    },
                    child: Text('Confirm Bandobast'),
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

Future<List<DocumentSnapshot>> fetchOfficers() async {
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Officers').get();
    return querySnapshot.docs;
  } catch (error) {
    print('Error fetching officers: $error');
    return [];
  }
}
