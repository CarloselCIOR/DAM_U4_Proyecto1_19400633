import 'package:dam_u4_proyecto1_19400633/actualizavehiculo.dart';
import 'package:dam_u4_proyecto1_19400633/services/firebase_service.dart';
import 'package:flutter/material.dart';

import 'capturavehiculo.dart';

class Programa1 extends StatefulWidget {
  const Programa1({Key? key}) : super(key: key);

  @override
  State<Programa1> createState() => _Programa1State();
}

class _Programa1State extends State<Programa1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vehiculos")),
      body: FutureBuilder(
        future: getVehiculo(),
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
                        content: Text("¿QUE DESEA HACER CON ESTE VEHICULO?"),
                        actions: [
                          TextButton(onPressed: () async{
                            await Navigator.pushNamed(context, '/editVehiculo', arguments: {
                              "placa": snapshot.data?[index]['placa'],
                              "tipo": snapshot.data?[index]['tipo'],
                              "numeroserie": snapshot.data?[index]['numeroserie'],
                              "combustible": snapshot.data?[index]['combustible'],
                              "tanque": snapshot.data?[index]['tanque'],
                              "trabajador": snapshot.data?[index]['trabajador'],
                              "depto": snapshot.data?[index]['depto'],
                              "resguardadopor": snapshot.data?[index]['resguardadopor'],
                              "id": snapshot.data?[index]['id'],
                            });
                            setState(() { });
                          }, child: const Text("ACTUALIZAR")),
                          TextButton(onPressed: () async{
                            await deleteVehiculo(snapshot.data?[index]['id']).then((value){
                              setState(() {
                                Navigator.pop(context);
                                Programa1();
                              });
                            });
                          }, child: const Text("ELIMINAR")),
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: const Text("NADA")),
                        ],
                      );
                    });

                  },
                  child: ListTile(
                    //leading: ,
                    title: Text("${snapshot.data?[index]['tipo']}: ${snapshot.data?[index]['placa']} \nNS: ${snapshot.data?[index]['numeroserie']}"),
                    subtitle: Text("De: ${snapshot.data?[index]['trabajador']} - Combustible: ${snapshot.data?[index]['combustible']} - ${snapshot.data?[index]['tanque']} lt(s) \n"
                        "${snapshot.data?[index]['depto']} - Resguardador: ${snapshot.data?[index]['resguardadopor']}"),
                    trailing:Icon(Icons.library_books_outlined),
                  ),
                );
                  //Text(snapshot.data?[index]['placa']);
              },
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (builder)=>CapturaVehiculo()));
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );

  }
}
