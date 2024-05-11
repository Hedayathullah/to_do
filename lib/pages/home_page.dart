import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:loginui/read%20data/get_user_name.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  // //document IDs
  // List<String> docIDs = [];

  // //get docIDs
  // Future getDocId() async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .orderBy('age', descending: false)
  //       .get()
  //       .then(
  //         (snapshot) => snapshot.docs.forEach(
  //           (document) {
  //             print(document.reference);
  //             docIDs.add(document.reference.id);
  //           },
  //         ),
  //       );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(235, 60, 97, 222),
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'User Profile',
              style: TextStyle(fontSize: 30),
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                //child:
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: Icon(
              Icons.logout,
              size: 28,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 142, 195, 222),
              Color.fromARGB(255, 98, 140, 213),
              Color.fromARGB(255, 26, 182, 255),
              Color.fromARGB(255, 71, 136, 167),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/walkathon.png',
              height: 500,
              width: 500,
            )
            // Expanded(
            //   child: FutureBuilder(
            //     future: getDocId(),
            //     builder: (context, snapshot) {
            //       return ListView.builder(
            //         itemCount: docIDs.length,
            //         itemBuilder: (context, index) {
            //           return ListTile(
            //             title: GetUserName(documentId: docIDs[index]),
            //             tileColor: Colors.grey[200],
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),

      //Navigation Bar
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Color.fromARGB(255, 255, 255, 255),
            activeColor: Color.fromARGB(255, 113, 207, 250),
            tabBackgroundColor: Colors.grey.shade600,
            gap: 5,
            onTabChange: (index) {
              print(index);
            },
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget builde(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfCartesianChart(),
    ));
  }
}
