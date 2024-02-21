import 'package:flutter/material.dart';
import 'package:plantdiseasedetections/chatbot/mains.dart';
import 'package:plantdiseasedetections/paddy/tomoto.dart';

import 'banana/banana.dart';
import 'disease1/disease.dart';
import 'tomotos/tomoto1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      color: Colors.lightGreenAccent,
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int inde = 0;
  void indes() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const chat()));
  }

  // List of image paths
  final List<String> imagePaths = [
    "assets/potato.jpeg",
    "assets/paddy1.jpeg",
    "assets/banana1.jpeg",
    "assets/plant.jpeg",
  ];

  // List of text for each grid item
  final List<String> itemTexts = [
    'Potato Leaf',
    'Paddy Leaf',
    'Banana Leaf',
    'Item 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 141, 255, 185),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 239, 116),
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        title: const Center(
          child: Text(
            " Plant Disease Detection",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: buildScrollableGridView(context),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: inde,
        onTap: (int Index) {
          inde = Index;
          setState(() {
            if (inde == 0) {
              indes();
            }
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_rounded), label: "ChatBot"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
        backgroundColor: const Color.fromARGB(255, 1, 239, 116),
        selectedFontSize: 20,
        selectedItemColor: Colors.black,
      ),
    );
  }

  Widget buildScrollableGridView(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 9.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            navigateToPage(context, index);
          },
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 35, 255, 141),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 31, 168, 0),
                      spreadRadius: 0,
                      blurRadius: 4),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      imagePaths[index],
                      width: 80.0,
                      height: 80.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(itemTexts[index]),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void navigateToPage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Disease(
                      itemText: '',
                    )));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const tomotos(
                      itemText: '',
                    )));
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Banana(
                      itemText: '',
                    )));
        break;
      case 3:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const tomotoss(
                      itemText: '',
                    )));
        break;
      default:
        break;
    }
  }
}
