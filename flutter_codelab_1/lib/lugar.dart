class Lugar {
  final String nombre;
  final String imagen;
  final String descripcion;

  Lugar({this.nombre, this.imagen, this.descripcion});

  factory Lugar.fromJSON(Map<String, dynamic> json) {
    return Lugar(
      nombre: json["name"],
      imagen: json["image"],
      descripcion: json["description"],
    );
  }
}
