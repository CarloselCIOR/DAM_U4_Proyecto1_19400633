import 'package:flutter/material.dart';
import 'programa1.dart';
import 'programa2.dart';
import 'programa3.dart';

class Pantalla extends StatefulWidget {
  const Pantalla({Key? key}) : super(key: key);

  @override
  State<Pantalla> createState() => _PantallaState();
}

class _PantallaState extends State<Pantalla> {
  int _indice = 0;

  void _cambiarIndice(int indice) {
    setState(() {
      _indice = indice;
    });
  }
  final List<Widget> _paginas = [
    Programa1(),
    Programa2(),
    Programa3()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas[_indice],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.car_crash_outlined), label: "Vehiculo"),
          BottomNavigationBarItem(icon: Icon(Icons.folder_copy_outlined), label:"Bitacora"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label:"Consultas"),

        ],
        showUnselectedLabels: false,
        iconSize: 30,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        currentIndex: _indice,
        onTap: _cambiarIndice,
      ),
    );
  }
}
