import 'package:flutter/material.dart';
import 'package:flutter_app2/candidato.dart';
import 'package:flutter_app2/card.dart';

import 'package:get/get.dart';

class ListadoVotacionesController extends GetxController {
  List<Candidato> list = [
    Candidato(
        edad: 40,
        nombre: "Angel Ernesto",
        apellidos: "Hernandez Bandera",
        municipio: "Matanzas",
        genero: "Masculino",
        nivelEscolar: "Universitario",
        ocupacion: "Maestro",
        descripcion: "",
        provincia: "La Lisa"),
    Candidato(
        edad: 30,
        nombre: "Miguel Angel",
        apellidos: "Napoles Molina",
        municipio: "Camaguey",
        genero: "Masculino",
        nivelEscolar: "Universitario",
        ocupacion: "Gato",
        descripcion: "",
        provincia: "Camaguey"),
  ];
  List<Widget> listW = [];
  int? current;

  ListadoVotacionesController();

  @override
  onInit() {
    super.onInit();
  }

  loadData() {
    print("object");
    listW = [];
    int i = 0;
    list.forEach((e) {
      listW.add(Cardd(
        candidato: e,
        number: i,
      ));
      i++;
    });
    update(["votacion"]);
  }

  setCurrent(int i) {
    current = i;
    update(["votacion"]);
  }
}
