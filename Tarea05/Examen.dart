enum MyGenero { Masculino, Femenino, Otro }
enum MySangre { AP, AN, BP, BN, ABP, ABN, OP, ON }
enum MyTipo { Frecuente, Ocasional, Nuevo, Esporadico, Visita }

abstract class PersonBase {
  int id;
  bool estatus;
  DateTime fechaRegistro;
  DateTime fechaActualizacion;

  PersonBase({
    required this.id,
    required this.estatus,
    required this.fechaRegistro,
    required this.fechaActualizacion,
  });

  String getFullName();
  String getStatus();
  void cancelaSuscripcion();
}

class Persona extends PersonBase {
  String tituloCortesia;
  String nombre;
  String primerApellido;
  String segundoApellido;
  DateTime fechaNacimiento;
  String fotografia;
  MyGenero genero;
  MySangre tipoSangre;

  Persona({
    required int id,
    required this.tituloCortesia,
    required this.nombre,
    required this.primerApellido,
    required this.segundoApellido,
    required this.fechaNacimiento,
    required this.fotografia,
    required this.genero,
    required this.tipoSangre,
    required bool estatus,
    required DateTime fechaRegistro,
    required DateTime fechaActualizacion,
  }) : super(
          id: id,
          estatus: estatus,
          fechaRegistro: fechaRegistro,
          fechaActualizacion: fechaActualizacion,
        );

  @override
  String getFullName() {
    return "$tituloCortesia $nombre $primerApellido $segundoApellido";
  }

  @override
  String getStatus() {
    return "Persona ${estatus ? 'Activa' : 'Inactiva'}";
  }

  @override
  void cancelaSuscripcion() {
    estatus = false;
    print("Suscripción cancelada para la persona: ${getFullName()}");
  }
}

class Miembro extends PersonBase {
  int membresiaId;
  int usuarioId;
  MyTipo tipo;
  String antiguedad;

  Miembro({
    required int id,
    required this.membresiaId,
    required this.usuarioId,
    required this.tipo,
    required this.antiguedad,
    required bool estatus,
    required DateTime fechaRegistro,
    required DateTime fechaActualizacion,
  }) : super(
          id: id,
          estatus: estatus,
          fechaRegistro: fechaRegistro,
          fechaActualizacion: fechaActualizacion,
        );

  @override
  String getFullName() {
    return "Miembro ID: $id";
  }

  @override
  String getStatus() {
    return "Miembro ${estatus ? 'Activo' : 'Inactivo'}, Tipo: ${tipo.name}, Antigüedad: $antiguedad";
  }

  @override
  void cancelaSuscripcion() {
    estatus = false;
    print("Suscripción cancelada para el miembro ID: $id");
  }

  void crearMiembro() {
    print("Miembro creado con ID: $id");
  }

  void leerMiembro() {
    print("Leyendo datos del miembro ID: $id");
  }

  void actualizarMiembro() {
    print("Miembro ID: $id actualizado");
  }

  void eliminarMiembro() {
    print("Miembro ID: $id eliminado");
  }
}

void main() {
  Persona persona = Persona(
    id: 1,
    tituloCortesia: 'Sr.',
    nombre: 'Juan',
    primerApellido: 'Pérez',
    segundoApellido: 'García',
    fechaNacimiento: DateTime(1985, 5, 15),
    fotografia: 'url/to/photo.jpg',
    genero: MyGenero.Masculino,
    tipoSangre: MySangre.AP,
    estatus: true,
    fechaRegistro: DateTime.now(),
    fechaActualizacion: DateTime.now(),
  );

  print(persona.getFullName());
  print(persona.getStatus());
  persona.cancelaSuscripcion();

  Miembro miembro = Miembro(
    id: 2,
    membresiaId: 101,
    usuarioId: 5001,
    tipo: MyTipo.Frecuente,
    antiguedad: '2 años',
    estatus: true,
    fechaRegistro: DateTime.now(),
    fechaActualizacion: DateTime.now(),
  );

  print(miembro.getFullName());
  print(miembro.getStatus());
  miembro.cancelaSuscripcion();
}