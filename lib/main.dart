import 'package:dam_u4_proyecto1_19400633/actualizavehiculo.dart';
import 'package:dam_u4_proyecto1_19400633/pantalla.dart';
import 'package:flutter/material.dart';
import 'actualizabitacora.dart';
import 'firebase_options.dart';

//IMPORTACIONES DE FIREBASE
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Pantalla(),
        '/editVehiculo': (context) => const ActualizaVehiculo(),
        '/editBitacora': (context) => const ActualizaBitacora(),
      },


    );
  }
}
