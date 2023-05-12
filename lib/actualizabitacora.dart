import 'package:flutter/material.dart';
import 'models/bitacora.dart';
import 'services/firebase_service.dart';

class ActualizaBitacora extends StatefulWidget {
  const ActualizaBitacora({Key? key}) : super(key: key);

  @override
  State<ActualizaBitacora> createState() => _ActualizaBitacoraState();
}

class _ActualizaBitacoraState extends State<ActualizaBitacora> {
  final fechaSalidaController = TextEditingController();
  final eventoController = TextEditingController();
  final recursosController = TextEditingController();
  final verificoController = TextEditingController();
  final fechaVerificacionController = TextEditingController();
  final placaController = TextEditingController();
  final idController = TextEditingController();
  String _selectedDateVerificacion = "Fecha Verificacion";

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    fechaSalidaController.text = arguments['fecha'];
    eventoController.text = arguments['evento'];
    recursosController.text = arguments['recursos'];
    verificoController.text = arguments['verifico'];
    fechaVerificacionController.text = arguments['fechaverificacion'];
    placaController.text = arguments['placa'];
    idController.text = arguments['id'];
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        title: Text("Editar Bitacora"),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
        children: [

          TextField(
            controller: fechaSalidaController,
            enabled: false,
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.date_range),
              hintText: 'Evento:',
            ),
          ),

          TextField(
            controller: eventoController,
            enabled: false,
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.event_available_outlined),
              hintText: 'Evento:',
            ),
          ),

          TextField(
            controller: recursosController,
            enabled: false,
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.real_estate_agent),
              hintText: 'Recurso:',
            ),
          ),


          TextField(
            controller: verificoController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.supervised_user_circle),
              hintText: 'Verificó:',
            ),
          ),

          SizedBox(height: 20,),

          TextField(
              controller: fechaVerificacionController, //editing controller of this TextField
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.edit_calendar_rounded), //icon of text field
                  labelText: "Introduce Fecha de Verificacion" //label text of field
              ),
              /*readOnly: true,  // when true user cannot edit text
              onTap: () async {
                await _selectDateVerificacion(context);
              }*/
          ),

          TextField(
            controller: placaController,
            enabled: false,
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.car_rental),
              hintText: 'Placa:',
            ),
          ),


          ElevatedButton(onPressed: () async {
            Bitacora b = Bitacora(
                fecha: fechaSalidaController.text,
                evento: eventoController.text,
                recursos: recursosController.text,
                verifico: verificoController.text,
                fechaverificacion: fechaVerificacionController.text,
                placa: placaController.text,
            );

            await updateBitacora(arguments['id'], b).then((value){
              Navigator.pop(context);
              Navigator.pop(context);
            });
          }, child: Text("Actualizar"))
        ],
      )),
    );
 }

}
