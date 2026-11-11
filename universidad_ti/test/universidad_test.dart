import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:universidad_ti/data/carreras.dart';
import 'package:universidad_ti/main.dart';

void main() {
  testWidgets('La pantalla principal muestra el título «Universidad TI»', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Universidad TI'), findsOneWidget);
  });

  test('El arreglo contiene las cinco carreras', () {
    expect(carreras.length, 5);
    expect(carreras.map((c) => c.nombre), contains('Ingeniería en Ciberseguridad'));
  });

  testWidgets('La rejilla muestra las tarjetas de las carreras', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(GridView), findsOneWidget);
    expect(find.text(carreras.first.nombre), findsOneWidget);
    expect(find.byType(Card), findsWidgets);
  });

  testWidgets('Al tocar una carrera se abre su pantalla de contenido', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text(carreras.first.nombre));
    await tester.pumpAndSettle();
    expect(find.text('Contenido'), findsOneWidget);
    expect(find.text(carreras.first.nombre), findsOneWidget);
    expect(find.text(carreras.first.descripcion), findsOneWidget);
    expect(find.text('Regresar'), findsOneWidget);
  });

  testWidgets('El botón Regresar vuelve a la pantalla principal', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text(carreras.first.nombre));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Regresar'));
    await tester.pumpAndSettle();
    expect(find.text('Contenido'), findsNothing);
    expect(find.text('Universidad TI'), findsOneWidget);
  });
}
