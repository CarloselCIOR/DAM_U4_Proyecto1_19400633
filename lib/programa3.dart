import 'package:flutter/material.dart';
import 'services/firebase_service.dart';

class Programa3 extends StatefulWidget {
  const Programa3({Key? key}) : super(key: key);

  @override
  State<Programa3> createState() => _Programa3State();
}

enum Option {
  ConsultaCero,
  ConsultaUno,
  ConsultaDos,
  ConsultaTres,
  ConsultaCuatro,
}

class _Programa3State extends State<Programa3> {
  Option _selectedOption = Option.ConsultaCero;
  final BusquedaController = TextEditingController();

  void _onOptionSelected(Option? option) {
    if (option != null) {
      setState(() {
        _selectedOption = option;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: BusquedaController,
                decoration: InputDecoration(
                  hintText: 'Busqueda...',
                ),
              ),
            ),
          ),
          DropdownButton(
            value: _selectedOption,
            onChanged: (Option? value) {
              _onOptionSelected(value);
            },
            items: [
              DropdownMenuItem(
                value: Option.ConsultaCero,
                  child: Text("Seleccione")
              ),
              DropdownMenuItem(
                value: Option.ConsultaUno,
                child: Text("1.B - Placa"),
              ),
              DropdownMenuItem(
                value: Option.ConsultaDos,
                child: Text("2.B - Fecha"),
              ),
              DropdownMenuItem(
                value: Option.ConsultaTres,
                child: Text("3.B - Fuera"),
              ),
              DropdownMenuItem(
                value: Option.ConsultaCuatro,
                child: Text("4.V - Depto"),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: _buildBody(),
      ),
    );
  }
  Widget _buildBody() {
    switch (_selectedOption) {
      case Option.ConsultaCero:
        return Text("Selecciona una consulta");
      case Option.ConsultaUno:
        return FutureBuilder(
            future: getBitacoraConsultaPlaca(BusquedaController.text),
            builder: ((context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      child: ListTile(
                        //leading: ,
                        title: Text("${snapshot.data?[index]['fecha']}: ${snapshot.data?[index]['evento']} \nPlaca: ${snapshot.data?[index]['placa']}"),
                        subtitle: Text("Verificó: ${snapshot.data?[index]['verifico']} - Fecha: ${snapshot.data?[index]['fechaverificacion']} \n"
                            "Recursos ${snapshot.data?[index]['recursos']} "),
                        trailing:Icon(Icons.note_alt_outlined),
                      ),
                    );
                  },);
              }else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
        );



        /////////////////////////////////////////////////////////////////////////////////////////////////
      case Option.ConsultaDos:
        return FutureBuilder(
            future: getBitacoraConsultaFecha(BusquedaController.text),
            builder: ((context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      child: ListTile(
                        //leading: ,
                        title: Text("${snapshot.data?[index]['fecha']}: ${snapshot.data?[index]['evento']} \nPlaca: ${snapshot.data?[index]['placa']}"),
                        subtitle: Text("Verificó: ${snapshot.data?[index]['verifico']} - Fecha: ${snapshot.data?[index]['fechaverificacion']} \n"
                            "Recursos ${snapshot.data?[index]['recursos']} "),
                        trailing:Icon(Icons.note_alt_outlined),
                      ),
                    );
                  },);
              }else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
        );
    /////////////////////////////////////////////////////////////////////////////////////////////////
      case Option.ConsultaTres:
        return FutureBuilder(
            future: getBitacoraConsultaFuera(),
            builder: ((context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      child: ListTile(
                        //leading: ,
                        title: Text("${snapshot.data?[index]['fecha']}: ${snapshot.data?[index]['evento']} \nPlaca: ${snapshot.data?[index]['placa']}"),
                        subtitle: Text("Verificó: ${snapshot.data?[index]['verifico']} - Fecha: ${snapshot.data?[index]['fechaverificacion']} \n"
                            "Recursos ${snapshot.data?[index]['recursos']} "),
                        trailing:Icon(Icons.note_alt_outlined),
                      ),
                    );
                  },);
              }else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
        );
    /////////////////////////////////////////////////////////////////////////////////////////////////
      case Option.ConsultaCuatro:
        return FutureBuilder(
            future: getBitacoraConsultaDepartamento(BusquedaController.text),
            builder: ((context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      child: ListTile(
                        //leading: ,
                        title: Text("${snapshot.data?[index]['tipo']}: ${snapshot.data?[index]['placa']} \nNS: ${snapshot.data?[index]['numeroserie']}"),
                        subtitle: Text("De: ${snapshot.data?[index]['trabajador']} - Combustible: ${snapshot.data?[index]['combustible']} - ${snapshot.data?[index]['tanque']} lt(s) \n"
                            "${snapshot.data?[index]['depto']} - Resguardador: ${snapshot.data?[index]['resguardadopor']}"),
                        trailing:Icon(Icons.library_books_outlined),
                      ),
                    );
                  },);
              }else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
        );
      default:
        return Container();
    }
  }
}

