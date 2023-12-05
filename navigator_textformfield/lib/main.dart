import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("First Page"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextFormField(
            controller: _textFieldController,
            decoration: InputDecoration(
              labelText: "User Name: ",
              prefixIcon: Icon(Icons.email),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(
                    name: _textFieldController.text,
                  ),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_forward),
                SizedBox(width: 8),
                Text("Go To The Second Page"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  final String? name;

  SecondPage({this.name});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Second Page"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isTapped = !isTapped;
              });
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isTapped) // Display user icon only when tapped
                    Icon(Icons.person, size: 24),
                  SizedBox(width: 8),
                  Text(
                    "Welcome ${widget.name} to the Second Page",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back),
                SizedBox(width: 8),
                const Text("Go Back To The First Page"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
