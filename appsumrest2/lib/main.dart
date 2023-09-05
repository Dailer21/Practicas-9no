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
enum Posibilidades {occidental, romano, arabe}

class Selecciones extends StatefulWidget {
  const Selecciones({ super.key });

  @override
  State<Selecciones> createState() => _SeleccionesState();
}

class _SeleccionesState extends State<Selecciones> {
  Posibilidades posibilidadActual = Posibilidades.occidental;
  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      showSelectedIcon: false,
    segments: [
    const ButtonSegment(value: Posibilidades.occidental, icon: Icon(Icons.cloud_outlined), label: Text( "Occidental")),
    ButtonSegment(value: Posibilidades.romano, icon: const Icon(Icons.star_border_rounded), label: Text(10.toRomanNumeralString() ?? 'Romano')),
    const ButtonSegment(value: Posibilidades.arabe, icon: Icon(Icons.favorite_border_rounded), label: Text( "Arabe")),
  ],
   selected: {posibilidadActual},
   onSelectionChanged: (posibilidad){
    setState(() {
    posibilidadActual = posibilidad.first;
    });
   },
  );
  }
}

class _MainAppState extends State<MainApp> {


  int valorEstado = 0;
  late String valorEstado2 = valorEstado.toString();
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
          child: Text('$valorEstado'.toRomanNumeralValue() ?? 'Romano', style: const TextStyle(fontSize: 50)),
        ),
        
      ),
    );
  }
}

