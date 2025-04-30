import 'package:flutter/material.dart';
import 'profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(leading: Icon(Icons.volume_off), title: Text('Mute')),
            ListTile(leading: Icon(Icons.delete), title: Text('Delete')),
            ListTile(leading: Icon(Icons.block), title: Text('Block')),
          ],
        );
      },
    );
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ProfileScreen(),

    );
  }

  Widget gestureDetector(BuildContext context){
    return GestureDetector(
      onLongPress: () {
        // Show a bottom sheet with options
        print("Show options: Mute / Delete / Block");
        _showOptions(context);
      },
      child: InkWell(
        onTap: () {
          print("Opening chat with Fenil...");
          // Navigate to chat screen
        },
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://dummyimage.com/100x100/09f/fff&text=F',
                  ),
                  radius: 30,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fenil Vavaiya',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Hey there! Let’s catch up later.',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inkWellExample(){
    return SizedBox(
      width: 600,
      height: 100,
      child: InkWell(
        onTap: () {
          print("Opening chat with Fenil...");
          // Navigator.push(...); // You can navigate to chat screen here
        },
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://dummyimage.com/100x100/09f/fff&text=F',
                  ),
                  radius: 30,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fenil Vavaiya',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Hey there! Let’s catch up later.',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget containerExample1() {
    return Container(
      padding: EdgeInsets.all(36),
      margin: EdgeInsets.all(6),
      color: Colors.lightBlue[100],
      child: Text(
        'Hello, Flutter!',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }

  Widget containerExample() {
    return Center(
      child: Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(color: Colors.amber, width: 21),
        ),
        child: Center(
          child: Text(
            'Decorated Box',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget singleChildScrollViewExample() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Welcome!"),
          Image.network("https://dummyimage.com/300"),
          SizedBox(height: 500), // simulate long content
          Text("Bottom text"),
        ],
      ),
    );
  }

  Widget listViewExample() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item #$index'),
          leading: Icon(Icons.label),
        );
      },
    );
  }

  Widget buildProfileLayout() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(Icons.person, size: 40, color: Colors.blue),
              SizedBox(width: 10),
              Text(
                'Fenil Vavaiya',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          Image.network(
            'https://dummyimage.com/300.png/09f/fff&text=Ash+Allen',
            width: 300,
          ),
          SizedBox(height: 10),
          Text(
            'Welcome to Flutter layout basics!',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
