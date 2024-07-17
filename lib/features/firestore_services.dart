import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final CollectionReference officersCollection =
      FirebaseFirestore.instance.collection('Officers');
  final CollectionReference stationsCollection =
      FirebaseFirestore.instance.collection('Stations');

  Future<void> registerUser({
    required String dgpNumber,
    required String email,
    required String fullName,
    required String mobileNumber,
    required String password,
    required String rank,
    required String selectedPoliceStation,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await officersCollection.doc(dgpNumber).set({
        'dgp': dgpNumber,
        'email': email,
        'name': fullName,
        'number': mobileNumber,
        'password': password,
        'rank': rank,
        'station': selectedPoliceStation,
      });
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  Future<List<String>> getExistingDGPs() async {
    try {
      QuerySnapshot querySnapshot = await officersCollection.get();

      // Extract document IDs (DGP numbers) from the documents
      List<String> existingDGPs =
          querySnapshot.docs.map((doc) => doc.id).toList();

      return existingDGPs;
    } catch (e) {
      print('Error getting existing DGPs: $e');
      return [];
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      // Fetch documents based on email from Firestore
      var querySnapshot = await officersCollection
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      // Check if any document matches the entered email
      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data() as Map<String, dynamic>;

        // Check if the entered password matches the stored password
        if (userData.containsKey('password') &&
            userData['password'] == password) {
          print('Login Successful');

          // Successfully logged in
          return;
        } else {
          // Display an error message for incorrect password
          throw Exception('Invalid password. Please try again.');
        }
      } else {
        // Display an error message for incorrect email
        throw Exception('User not found. Please check your email.');
      }
    } catch (e) {
      print('Error logging in: $e');
      throw e; // Rethrow the exception for further handling
    }
  }

  Future<void> loginStation({
    required String stationId,
    required String password,
  }) async {
    try {
      // Fetch documents based on station ID from Firestore
      var querySnapshot = await stationsCollection
          .where('stationId', isEqualTo: stationId)
          .limit(1)
          .get();
      print('Query Snapshot: $querySnapshot');

      // Check if any document matches the entered station ID
      if (querySnapshot.docs.isNotEmpty) {
        var stationData =
            querySnapshot.docs.first.data() as Map<String, dynamic>;

        print('Station Data: $stationData');
        // Check if the entered password matches the stored password
        if (stationData.containsKey('password') &&
            stationData['password'] == password) {
          print('Login Successful');

          // Successfully logged in
          return;
        } else {
          // Display an error message for incorrect password
          throw Exception('Invalid password. Please try again.');
        }
      } else {
        // Display an error message for incorrect station ID
        throw Exception('Station not found. Please check your station ID.');
      }
    } catch (e) {
      print('Error logging in: $e');
      throw e; // Rethrow the exception for further handling
    }
  }
}

Future<List<DocumentSnapshot>> fetchOfficers() async {
  try {
    final QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Officers').get();
    return querySnapshot.docs;
  } catch (e) {
    print('Error fetching officers: $e');
    // You might want to handle the error or return an empty list
    return [];
  }
}
