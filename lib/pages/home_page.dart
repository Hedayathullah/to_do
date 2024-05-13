import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'User Profile',
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(
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
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      body: ToDoListScreen(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade700,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: Colors.green.shade700,
            color: Theme.of(context).colorScheme.primary,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.green.shade900,
            gap: 5,
            onTabChange: (index) {
              print(index);
            },
            padding: const EdgeInsets.all(16),
            tabs: const [
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
}

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  List<String> _tasks = [];
  List<bool> _taskCompleted = [];

  void _addTask(String task) {
    setState(() {
      _tasks.add(task);
      _taskCompleted.add(false); // Initialize task completion status
    });
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
      _taskCompleted.removeAt(index);
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      _taskCompleted[index] = !_taskCompleted[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    '${index + 1}. ${_tasks[index]}',
                    style: _taskCompleted[index]
                        ? TextStyle(
                            decoration: TextDecoration.lineThrough,
                          )
                        : null,
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _removeTask(index);
                    },
                  ),
                  onTap: () {
                    _toggleTaskCompletion(index);
                  },
                );
              },
            ),
          ),
          FloatingActionButton(
            onPressed: () async {
              final newTask = await showDialog<String>(
                context: context,
                builder: (context) {
                  String taskText = '';

                  return AlertDialog(
                    title: Text('Add Task'),
                    content: TextField(
                      onChanged: (value) {
                        taskText = value;
                      },
                    ),
                    actions: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors
                              .transparent, // Set background color to green
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(taskText);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black38,
                            elevation: 30,
                          ),
                          child: Text(
                            'Add',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.surface),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );

              if (newTask != null && newTask.isNotEmpty) {
                _addTask(newTask);
              }
            },
            tooltip: 'Add Task',
            child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ],
      ),
    );
  }
}
