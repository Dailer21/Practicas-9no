import 'package:flutter/material.dart';
import 'package:numerus/numerus.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int valorEstado = 0;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: (){
                  setState(() {
                    valorEstado--;  
                  });
                },
                child: const Icon(Icons.remove),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: (){
                  setState(() {
                    valorEstado++;  
                  });
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
        body: Center(
          child: Text('$valorEstado', style: const TextStyle(fontSize: 50)),
        ),
      ),
    );
  }
}