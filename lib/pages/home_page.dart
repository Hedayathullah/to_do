import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
<<<<<<< HEAD
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
=======
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FactHunter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
>>>>>>> fa570f4 (first_commit)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        backgroundColor: Color.fromARGB(235, 60, 97, 222),
=======
        backgroundColor:
            Colors.blueGrey[900], // Dark grey background for app bar
>>>>>>> fa570f4 (first_commit)
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'User Profile',
<<<<<<< HEAD
              style: TextStyle(fontSize: 30),
=======
              style: TextStyle(
                  fontSize: 30, color: Colors.white), // White text color
>>>>>>> fa570f4 (first_commit)
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
<<<<<<< HEAD
=======
              color: Colors.white, // White icon color
>>>>>>> fa570f4 (first_commit)
            ),
          ),
        ],
      ),
<<<<<<< HEAD
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
=======
      body: FactCheckingScreen(),
      bottomNavigationBar: Container(
        color: Colors
            .blueGrey[900], // Dark grey background for bottom navigation bar
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: const Color.fromARGB(
                255, 38, 50, 56), // Dark grey background for navigation bar
            color: Colors.white, // White icon color
            activeColor: Colors.blueAccent, // Blue accent color for active icon
            tabBackgroundColor: const Color.fromARGB(
                255, 66, 66, 66), // Darker grey for tab background
>>>>>>> fa570f4 (first_commit)
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
<<<<<<< HEAD

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfCartesianChart(),
    ));
=======
}

class FactCheckingScreen extends StatefulWidget {
  @override
  _FactCheckingScreenState createState() => _FactCheckingScreenState();
}

class _FactCheckingScreenState extends State<FactCheckingScreen> {
  TextEditingController _textController = TextEditingController();
  bool _isChecking = false;
  String _result = '';

  // API keys - Replace with your own secure storage method
  final String googleFactCheckApiKey =
      'AIzaSyATsHomCLk72tKFv2vchIXYr_7vrh6bQGo';
  final String newsApiKey = '34793c6af102414bbcc457e537562723';
  final String triviaApiKey =
      '61e47b5173msh8eb7c34384cbe8bp1f4a20jsn920864f6ac52';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter text to fact-check',
                labelStyle: TextStyle(
                    color: Colors.blueGrey[900],
                    fontSize: 18), // Dark grey label color
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 38, 50,
                          56)), // Dark grey border color when enabled
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blue), // Blue border color when focused
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isChecking
                  ? null
                  : () {
                      _checkFact(_textController.text);
                    },
              style: ElevatedButton.styleFrom(
                primary: Colors
                    .blueAccent, // Blue accent color for button background
              ),
              child: _isChecking
                  ? CircularProgressIndicator()
                  : Text(
                      'Check Fact',
                      style: TextStyle(color: Colors.black),
                    ),
            ),
            SizedBox(height: 20),
            Text(
              'Result: $_result',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey[900]), // Dark grey result text color
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _checkFact(String userInput) async {
    setState(() {
      _isChecking = true;
      _result = ''; // Clear previous result
    });

    // API calls
    String googleFactCheckUrl =
        'https://factchecktools.googleapis.com/v1alpha1/claims:search?query=$userInput&key=$googleFactCheckApiKey';
    String triviaApiUrl =
        'https://trivia-by-api-ninjas.p.rapidapi.com/v1/trivia=easy&type=multiple&apiKey=$triviaApiKey';

    try {
      // Search in Google Fact Check Tools API
      var googleFactCheckResponse =
          await http.get(Uri.parse(googleFactCheckUrl));
      if (googleFactCheckResponse.statusCode == 200) {
        var googleFactCheckData = jsonDecode(googleFactCheckResponse.body);
        if (googleFactCheckData['claims'] != null &&
            googleFactCheckData['claims'].isNotEmpty) {
          setState(() {
            _result += '\n${googleFactCheckData['claims'][0]['text']}\n\n';
          });
        }
      }

      // Search in Trivia API
      var triviaApiResponse = await http.get(Uri.parse(triviaApiUrl));
      if (triviaApiResponse.statusCode == 200) {
        var triviaApiData = jsonDecode(triviaApiResponse.body);
        if (triviaApiData['results'] != null &&
            triviaApiData['results'].isNotEmpty) {
          setState(() {
            _result +=
                'Trivia API Result:\n${triviaApiData['results'][0]['question']}\n\n';
          });
        }
      }

      if (_result.isEmpty) {
        setState(() {
          _result = 'No relevant information found';
        });
      }

      setState(() {
        _isChecking = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isChecking = false;
        _result = 'Error';
      });
    }
  }

  Future<void> _passToChatGPT(String userInput, String dataFromAPI) async {
    setState(() {
      _isChecking = true;
    });

    try {
      final apiKey = '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';
      final endpoint = 'https://api.openai.com/v1/chat/completions';

      final response = await http.post(
        Uri.parse(endpoint),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'messages': [
            {'role': 'system', 'content': 'Prompt: $userInput'},
            {
              'role': 'user',
              'content': ''
            }, // Empty user message to generate completion
            {'role': 'system', 'content': 'Data: $dataFromAPI'}
          ],
          'model': 'gpt-3.5-turbo-1106', // Use the latest chat model
          'max_tokens':
              100, // Increase the max tokens for more extensive responses
          'temperature': 0.7, // Adjust temperature for response randomness
          'top_p': 1,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _result =
              '${data['choices'][0]['message']['content']}'; // Update result
          _isChecking = false;
        });
      } else {
        // Log the response status code and body for debugging
        print(
            'Failed to interact with ChatGPT API. Status code: ${response.statusCode}, Body: ${response.body}');
        throw Exception('Failed to interact with ChatGPT API');
      }
    } catch (e) {
      // Log any exceptions that occur during the API call
      print('Error interacting with ChatGPT API: $e');
      setState(() {
        _isChecking = false;
        _result = 'Error';
      });
    }
>>>>>>> fa570f4 (first_commit)
  }
}
