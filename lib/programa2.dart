import 'package:flutter/material.dart';
import 'capturabitacora.dart';
import 'services/firebase_service.dart';

class Programa2 extends StatefulWidget {
  const Programa2({Key? key}) : super(key: key);

  @override
  State<Programa2> createState() => _Programa2State();
}

class _Programa2State extends State<Programa2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bitacoras")),
      body: FutureBuilder(
          future: getBitacora(),
          builder: ((context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      showDialog(context: context, builder: (builder){
                        return AlertDialog(
                          title: Text("ATENCIÓN"),
                          content: Text("¿QUE DESEA HACER CON ESTA BITACORA?"),
                          actions: [
                            TextButton(onPressed: () async{
                              await Navigator.pushNamed(context, '/editBitacora', arguments: {
                                "fecha": snapshot.data?[index]['fecha'],
                                "evento": snapshot.data?[index]['evento'],
                                "recursos": snapshot.data?[index]['recursos'],
                                "verifico": snapshot.data?[index]['verifico'],
                                "fechaverificacion": snapshot.data?[index]['fechaverificacion'],
                                "placa": snapshot.data?[index]['placa'],
                                "id": snapshot.data?[index]['id'],
                              });
                              setState(() { });
                            }, child: const Text("ACTUALIZAR")),
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: const Text("NADA")),
                          ],
                        );
                      });
                    },
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (builder)=>CapturaBitacora()));
          setState(() {});
        },
        child: Icon(Icons.add),
      )
    );
  }
}
