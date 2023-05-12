import 'package:flutter/material.dart';
import 'models/vehiculo.dart';
import 'services/firebase_service.dart';

class ActualizaVehiculo extends StatefulWidget {
  const ActualizaVehiculo({Key? key}) : super(key: key);

  @override
  State<ActualizaVehiculo> createState() => _ActualizaVehiculoState();
}

class _ActualizaVehiculoState extends State<ActualizaVehiculo> {
  final placaController = TextEditingController();
  final tipoController = TextEditingController();
  final numeroSerieController = TextEditingController();
  final combustibleController = TextEditingController();
  final tanqueController = TextEditingController();
  final trabajadorController = TextEditingController();
  final deptoController = TextEditingController();
  final resguardadoPorController = TextEditingController();
  final idController = TextEditingController();

  final List<String> _combustible = ['Diesel', 'Regular', 'Premium', 'Hidrocarburo', 'Queroseno', 'Biomasa'];
  String? selectedValueCombustible;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    placaController.text = arguments['placa'];
    tipoController.text = arguments['tipo'];
    numeroSerieController.text = arguments['numeroserie'];
    combustibleController.text = arguments['combustible'];
    tanqueController.text = arguments['tanque'].toString();
    trabajadorController.text = arguments['trabajador'];
    deptoController.text = arguments['depto'];
    resguardadoPorController.text = arguments['resguardadopor'];
    idController.text = arguments['id'];
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        title: Text("Editar Vehiculo"),
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
                resguardadopor: resguardadoPorController.text
            );

            await updateVehiculo(arguments['id'], v).then((value){
              Navigator.pop(context);
              Navigator.pop(context);
            });
          }, child: Text("Actualizar"))
        ],
      )),
    );
  }
}
