import 'package:flutter/material.dart';
import 'models/vehiculo.dart';
import 'services/firebase_service.dart';
class CapturaVehiculo extends StatefulWidget {
  const CapturaVehiculo({Key? key}) : super(key: key);

  @override
  State<CapturaVehiculo> createState() => _CapturaVehiculoState();
}

class _CapturaVehiculoState extends State<CapturaVehiculo> {
  final placaController = TextEditingController();
  final tipoController = TextEditingController();
  final numeroSerieController = TextEditingController();
  final combustibleController = TextEditingController();
  final tanqueController = TextEditingController();
  final trabajadorController = TextEditingController();
  final deptoController = TextEditingController();
  final resguardadoPorController = TextEditingController();

  final List<String> _combustible = ['Diesel', 'Regular', 'Premium', 'Hidrocarburo', 'Queroseno', 'Biomasa'];
  String? selectedValueCombustible;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Captura Vehiculo"),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
        children: [

          TextField(
            controller: placaController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.car_rental_outlined),
              hintText: 'Placa:',
            ),
          ),

          TextField(
            controller: tipoController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.car_repair_rounded),
              hintText: 'Tipo:',
            ),
          ),

          TextField(
            controller: numeroSerieController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.confirmation_number_outlined),
              hintText: 'Numero de Serie:',
            ),
          ),

          DropdownButtonHideUnderline(
            child: DropdownButton(
              hint: Text('Combustible'),
              items: _combustible.map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              )).toList(),
              value: selectedValueCombustible,
              onChanged: (value) {
                setState(() {
                  selectedValueCombustible = value as String;
                  combustibleController.text = selectedValueCombustible!;
                });
              },
            ),
          ),

          TextField(
            keyboardType: TextInputType.number,
            controller: tanqueController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.water_drop),
              hintText: 'Capacidad del Tanque (lt):',
            ),
          ),

          TextField(
            controller: trabajadorController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: 'Trabajador:',
            ),
          ),

          TextField(
            controller: deptoController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.house_siding_rounded),
              hintText: 'Departamento:',
            ),
          ),

          TextField(
            controller: resguardadoPorController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.man_sharp),
              hintText: 'Resguardado por:',
            ),
          ),


          ElevatedButton(onPressed: () async {
            Vehiculo v = Vehiculo(
                placa: placaController.text,
                tipo: tipoController.text,
                numeroserie: numeroSerieController.text,
                combustible: combustibleController.text,
                tanque: int.parse(tanqueController.text),
                trabajador: trabajadorController.text,
                depto: deptoController.text,
                resguardadopor: resguardadoPorController.text);

                await addVehiculo(v).then((_){
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
}
