class Bitacora{
  String fecha;
  String evento;
  String recursos;
  String verifico;
  String? fechaverificacion;
  String? id;
  String placa;

  Bitacora({
    required this.fecha,
    required this.evento,
    required this.recursos,
    required this.verifico,
    this.fechaverificacion,
    required this.placa,
  });

  Map<String, dynamic> toMap(){
    return{
      'fecha': fecha,
      'evento': evento,
      'recursos': recursos,
      'verifico': verifico,
      'fechaverificacion': fechaverificacion,
      'placa': placa,
    };
  }

  @override
  String toString() {
    return 'Bitacora{fecha: $fecha, evento: $evento, recursos: $recursos, verifico: $verifico, fechaverificacion: $fechaverificacion, placa: $placa}';
  }
}