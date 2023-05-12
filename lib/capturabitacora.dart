import 'package:flutter/material.dart';
import 'models/bitacora.dart';
import 'services/firebase_service.dart';

class CapturaBitacora extends StatefulWidget {
  const CapturaBitacora({Key? key}) : super(key: key);

  @override
  State<CapturaBitacora> createState() => _CapturaBitacoraState();
}

class _CapturaBitacoraState extends State<CapturaBitacora> {
  final fechaSalidaController = TextEditingController();
  final eventoController = TextEditingController();
  final recursosController = TextEditingController();
  final verificoController = TextEditingController();
  final fechaVerificacionController = TextEditingController();
  final placaController = TextEditingController();

  String _selectedDateSalida = "Fecha Salida";
  String _selectedDateVerificacion = "Fecha Verificacion";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Captura Bitacora"),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
        children: [

          SizedBox(height: 20,),

          TextField(
              controller: fechaSalidaController, //editing controller of this TextField
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "Introduce Fecha de Salida" //label text of field
              ),
              readOnly: true,  // when true user cannot edit text
              onTap: () async {
                _selectDateSalida(context);
              }
          ),

          SizedBox(height: 20,),

          TextField(
            controller: eventoController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.task_alt_rounded),
              hintText: 'Evento:',
            ),
          ),

          TextField(
            controller: recursosController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.interests_outlined),
              hintText: 'Recursos:',
            ),
          ),

          TextField(
            controller: verificoController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.remove_red_eye),
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
              readOnly: true,  // when true user cannot edit text
              onTap: () async {
                _selectDateVerificacion(context);
              }
          ),

          SizedBox(height: 20,),

          TextField(
            controller: placaController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.car_rental_outlined),
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
                placa: placaController.text);

                await addBitacora(b).then((_){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Se insertó!"))
                  );
                  Navigator.pop(context);
                });
          }, child: Text("Guardar"))
        ],
      )),
    );
  }

  Future<void> _selectDateSalida(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), //get today's date
      firstDate:DateTime(2000), //DateTime.now()
      lastDate: DateTime(2101),
    );
    if (pickedDate != null)
      setState(() {
        _selectedDateSalida = pickedDate.toString();
      });
    fechaSalidaController.text = _selectedDateSalida;
  }


  Future<void> _selectDateVerificacion(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), //get today's date
      firstDate:DateTime(2000), //DateTime.now()
      lastDate: DateTime(2101),
    );
    if (pickedDate != null)
      setState(() {
        _selectedDateVerificacion = pickedDate.toString();
      });
    fechaVerificacionController.text = _selectedDateVerificacion;
  }

}
