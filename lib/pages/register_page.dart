// ignore: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    Key? key,
    required this.showLoginPage,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _cityController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      //create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      //add user details
      addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _emailController.text.trim(),
        int.parse(_ageController.text.trim()),
        _cityController.text.trim(),
      );
    }
  }

  Future addUserDetails(String firstName, String lastName, String email,
      int age, String city) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'age': age,
      'city': city,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Colors.grey,
=======
      backgroundColor: Colors.blueGrey[50], // Light grey background color
>>>>>>> fa570f4 (first_commit)
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Hello again?
                Text(
                  'Hello There',
<<<<<<< HEAD
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
=======
                  style: TextStyle(
                    fontSize: 36, // Reduced font size
                    fontWeight: FontWeight.bold, // Bold font weight
                    color: Colors.blueGrey[900], // Dark grey text color
>>>>>>> fa570f4 (first_commit)
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Register Below with your details",
                  style: TextStyle(
                    fontSize: 20,
<<<<<<< HEAD
=======
                    color: Colors.blueGrey[900], // Dark grey text color
>>>>>>> fa570f4 (first_commit)
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                //first name textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
<<<<<<< HEAD
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'First Name',
                        fillColor: Colors.grey[200],
                        filled: true),
=======
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(
                                255, 38, 50, 56)), // Dark grey border color
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .deepPurple), // Deep purple border color when focused
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'First Name',
                      hintStyle: TextStyle(
                          color: Colors
                              .blueGrey[900]), // Dark grey hint text color
                      fillColor: Colors.white, // White fill color
                      filled: true,
                    ),
>>>>>>> fa570f4 (first_commit)
                  ),
                ),
                SizedBox(height: 10),

                //last name textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
<<<<<<< HEAD
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Last Name',
                        fillColor: Colors.grey[200],
                        filled: true),
=======
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(
                                255, 38, 50, 56)), // Dark grey border color
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .deepPurple), // Deep purple border color when focused
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Last Name',
                      hintStyle: TextStyle(
                          color: Colors
                              .blueGrey[900]), // Dark grey hint text color
                      fillColor: Colors.white, // White fill color
                      filled: true,
                    ),
>>>>>>> fa570f4 (first_commit)
                  ),
                ),
                SizedBox(height: 10),

                //Age textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _ageController,
                    decoration: InputDecoration(
<<<<<<< HEAD
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Age',
                        fillColor: Colors.grey[200],
                        filled: true),
=======
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(
                                255, 38, 50, 56)), // Dark grey border color
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .deepPurple), // Deep purple border color when focused
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Age',
                      hintStyle: TextStyle(
                          color: Colors
                              .blueGrey[900]), // Dark grey hint text color
                      fillColor: Colors.white, // White fill color
                      filled: true,
                    ),
>>>>>>> fa570f4 (first_commit)
                  ),
                ),
                SizedBox(height: 10),

                //City textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _cityController,
                    decoration: InputDecoration(
<<<<<<< HEAD
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'City',
                        fillColor: Colors.grey[200],
                        filled: true),
=======
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(
                                255, 38, 50, 56)), // Dark grey border color
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .deepPurple), // Deep purple border color when focused
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'City',
                      hintStyle: TextStyle(
                          color: Colors
                              .blueGrey[900]), // Dark grey hint text color
                      fillColor: Colors.white, // White fill color
                      filled: true,
                    ),
>>>>>>> fa570f4 (first_commit)
                  ),
                ),
                SizedBox(height: 10),

                //email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
<<<<<<< HEAD
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Email',
                        fillColor: Colors.grey[200],
                        filled: true),
=======
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(
                                255, 38, 50, 56)), // Dark grey border color
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .deepPurple), // Deep purple border color when focused
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          color: Colors
                              .blueGrey[900]), // Dark grey hint text color
                      fillColor: Colors.white, // White fill color
                      filled: true,
                    ),
>>>>>>> fa570f4 (first_commit)
                  ),
                ),
                SizedBox(height: 10),

                // password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
<<<<<<< HEAD
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Password',
                        fillColor: Colors.grey[200],
                        filled: true),
=======
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(
                                255, 38, 50, 56)), // Dark grey border color
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .deepPurple), // Deep purple border color when focused
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          color: Colors
                              .blueGrey[900]), // Dark grey hint text color
                      fillColor: Colors.white, // White fill color
                      filled: true,
                    ),
>>>>>>> fa570f4 (first_commit)
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                // confirm password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    obscureText: true,
                    controller: _confirmpasswordController,
                    decoration: InputDecoration(
<<<<<<< HEAD
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Confirm Password',
                        fillColor: Colors.grey[200],
                        filled: true),
=======
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromARGB(
                                255, 38, 50, 56)), // Dark grey border color
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .deepPurple), // Deep purple border color when focused
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                          color: Colors
                              .blueGrey[900]), // Dark grey hint text color
                      fillColor: Colors.white, // White fill color
                      filled: true,
                    ),
>>>>>>> fa570f4 (first_commit)
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //sign up button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
<<<<<<< HEAD
                        color: Colors.deepPurpleAccent,
=======
                        color: Color.fromARGB(255, 31, 138, 191),
>>>>>>> fa570f4 (first_commit)
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

                //register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I am a Member! ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        'Login Now',
                        style: TextStyle(
<<<<<<< HEAD
                          color: Colors.blue,
=======
                          color: Color.fromARGB(
                              255, 31, 138, 191), // Dark grey text color
>>>>>>> fa570f4 (first_commit)
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
