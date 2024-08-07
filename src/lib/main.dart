import 'package:flutter/material.dart';
import 'package:src/isarCollection/userCollection.dart';
import 'package:src/mais.dart';
import 'package:src/model/icon.dart';
import 'package:src/transacaoPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isarService = IsarCategotia();

  runApp(MyApp(isarService: isarService));
}

class MyApp extends StatelessWidget {
  final IsarCategotia isarService;

  MyApp({super.key, required this.isarService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [HomePage(), Transacaopage(), Mais()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(ObterIconFixo(0)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(ObterIconFixo(1)),
            label: 'Tranferencias',
          ),
          BottomNavigationBarItem(
            icon: Icon(ObterIconFixo(2)),
            label: 'Mais',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu App'),
      ),
      body: const Center(child: Text('Home Page')),
    );
  }
}
