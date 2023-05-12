import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/bitacora.dart';
import '../models/vehiculo.dart';

FirebaseFirestore db = FirebaseFirestore.instance;


Future<List> getVehiculo() async{
  List vehiculos = [];
  CollectionReference coleccionVehiculos = db.collection('vehiculo');

  QuerySnapshot queryVehiculo = await coleccionVehiculos.get();

  for(var doc in queryVehiculo.docs){
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final vehiculo = {
      "placa": data['placa'],
      "tipo": data['tipo'],
      "numeroserie": data['numeroserie'],
      "combustible": data['combustible'],
      "tanque": data['tanque'],
      "trabajador": data['trabajador'],
      "depto": data['depto'],
      "resguardadopor": data['resguardadopor'],
      "id": doc.id,
    };
    vehiculos.add(vehiculo);
  }
  return vehiculos;
}

Future<void> addVehiculo(Vehiculo v) async{
  await db.collection('vehiculo').add(v.toMap());
}

Future<void> updateVehiculo(String id, Vehiculo v) async{
  await db.collection('vehiculo').doc(id).set(v.toMap());
}

Future<void> deleteVehiculo(String id) async{
  await db.collection('vehiculo').doc(id).delete();
}


////////////////////////////////////////////////////////////////////////////////////////////////
Future<List> getBitacora() async{
  List bitacora = [];
  CollectionReference coleccionBitacora = db.collection('bitacora');

  QuerySnapshot queryBitacora = await coleccionBitacora.get();

  for(var doc in queryBitacora.docs){
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final Bitacora = {
      "fecha": data['fecha'],
      "evento": data['evento'],
      "recursos": data['recursos'],
      "verifico": data['verifico'],
      "fechaverificacion": data['fechaverificacion'],
      "placa": data['placa'],
      "id": doc.id,
    };
    bitacora.add(Bitacora);
  }
  return bitacora;
}

Future<void> addBitacora(Bitacora b) async{
  await db.collection('bitacora').add(b.toMap());
}

Future<void> updateBitacora(String id, Bitacora b) async{
  await db.collection('bitacora').doc(id).set(b.toMap());
}


////////////////Consultas/////////////////////////////////////////////////////////////////////////
Future<List> getBitacoraConsultaPlaca(String Busqueda) async{
  List bitacora = [];
  CollectionReference coleccionBitacora = db.collection('bitacora');

  QuerySnapshot queryBitacora = await coleccionBitacora.orderBy('placa')
      .startAt([Busqueda])
      .endAt([Busqueda + '\uf8ff'])
      .where('placa', isGreaterThanOrEqualTo: Busqueda)
      .where('placa', isLessThan: Busqueda + 'z')
      .get();

  for(var doc in queryBitacora.docs){
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final Bitacora = {
      "fecha": data['fecha'],
      "evento": data['evento'],
      "recursos": data['recursos'],
      "verifico": data['verifico'],
      "fechaverificacion": data['fechaverificacion'],
      "placa": data['placa'],
      "id": doc.id,
    };
    bitacora.add(Bitacora);
  }
  return bitacora;
}

Future<List> getBitacoraConsultaFecha(String Busqueda) async{
  List bitacora = [];
  CollectionReference coleccionBitacora = db.collection('bitacora');

  QuerySnapshot queryBitacora = await coleccionBitacora.orderBy('fecha')
      .startAt([Busqueda])
      .endAt([Busqueda + '\uf8ff'])
      .where('fecha', isGreaterThanOrEqualTo: Busqueda)
      .where('fecha', isLessThan: Busqueda + 'z')
      .get();

  for(var doc in queryBitacora.docs){
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final Bitacora = {
      "fecha": data['fecha'],
      "evento": data['evento'],
      "recursos": data['recursos'],
      "verifico": data['verifico'],
      "fechaverificacion": data['fechaverificacion'],
      "placa": data['placa'],
      "id": doc.id,
    };
    bitacora.add(Bitacora);
  }
  return bitacora;
}

Future<List> getBitacoraConsultaFuera() async{
  List bitacora = [];
  CollectionReference coleccionBitacora = db.collection('bitacora');

  QuerySnapshot queryBitacora = await coleccionBitacora.where('fechaverificacion', isEqualTo: "").get();

  for(var doc in queryBitacora.docs){
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final Bitacora = {
      "fecha": data['fecha'],
      "evento": data['evento'],
      "recursos": data['recursos'],
      "verifico": data['verifico'],
      "fechaverificacion": data['fechaverificacion'],
      "placa": data['placa'],
      "id": doc.id,
    };
    bitacora.add(Bitacora);
  }
  return bitacora;
}

Future<List> getBitacoraConsultaDepartamento(String Busqueda) async{
  List vehiculo = [];
  CollectionReference coleccionVehiculo = db.collection('vehiculo');

  QuerySnapshot queryVehiculo = await coleccionVehiculo.orderBy('depto')
      .startAt([Busqueda])
      .endAt([Busqueda + '\uf8ff'])
      .where('depto', isGreaterThanOrEqualTo: Busqueda)
      .where('depto', isLessThan: Busqueda + 'z')
      .get();

  for(var doc in queryVehiculo.docs){
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final Vehiculo = {
      "placa": data['placa'],
      "tipo": data['tipo'],
      "numeroserie": data['numeroserie'],
      "combustible": data['combustible'],
      "tanque": data['tanque'],
      "trabajador": data['trabajador'],
      "depto": data['depto'],
      "resguardadopor": data['resguardadopor'],
      "id": doc.id,
    };
    vehiculo.add(Vehiculo);
  }
  return vehiculo;
}


