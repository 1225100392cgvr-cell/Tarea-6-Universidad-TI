import 'package:flutter/material.dart';
import '../models/carrera.dart';
import '../screens/pantalla_contenido.dart';

// Tarjeta reutilizable: una sola definición sirve para las cinco carreras.
// Ya no lleva guion bajo (_) porque ahora se usa desde otro archivo.
class TarjetaCarrera extends StatelessWidget {
  final Carrera carrera;

  const TarjetaCarrera({super.key, required this.carrera});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext contexto) =>
                  PantallaContenido(carrera: carrera),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: carrera.color,
                child: Icon(carrera.icono, color: Colors.white, size: 30),
              ),
              const SizedBox(height: 12),
              Text(
                carrera.nombre,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}