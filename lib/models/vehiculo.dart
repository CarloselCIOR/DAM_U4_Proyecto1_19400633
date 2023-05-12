//Clase Modelo

class Vehiculo{
  String? placa;
  String? tipo;
  String? numeroserie;
  String? combustible;
  int? tanque;
  String? trabajador;
  String? depto;
  String? resguardadopor;
  String? id;

  Vehiculo({
    this.placa,
    this.tipo,
    this.numeroserie,
    this.combustible,
    this.tanque,
    this.trabajador,
    this.depto,
    this.resguardadopor,
  });

  Map<String, dynamic> toMap(){
    return{
      'placa': placa,
      'tipo': tipo,
      'numeroserie': numeroserie,
      'combustible': combustible,
      'tanque': tanque,
      'trabajador': trabajador,
      'depto': depto,
      'resguardadopor': resguardadopor,
    };
  }

  @override
  String toString() {
    return 'Vehiculo{placa: $placa, tipo: $tipo, numeroserie: $numeroserie, combustible: $combustible, tanque: $tanque,'
        'trabajador: $trabajador, depto: $depto, resguardadopor: $resguardadopor,}';
  }
}