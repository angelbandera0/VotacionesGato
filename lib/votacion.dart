import 'package:flutter/material.dart';
import 'package:flutter_app2/input_custom.dart';
import 'package:flutter_app2/listadoVotaciones.dart';
import 'package:get/get.dart';

import 'card.dart';

class Votacion extends StatefulWidget {
  Votacion({Key? key}) : super(key: key);

  @override
  State<Votacion> createState() => _VotacionState();
}

class _VotacionState extends State<Votacion> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListadoVotacionesController>(
        id: "votacion",
        init: ListadoVotacionesController(),
        builder: (_) {
          _.loadData();
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(children: _.listW),
              ),
              bottomSheet: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomButton(
                    text: "Votar",
                    onPress: () {
                      Get.snackbar(
                          "Notificación:", "Ha votado satisfoactoriamente.",
                          //snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.indigo,
                          duration: Duration(seconds: 3),
                          colorText: Colors.white,
                          icon: Icon(
                            Icons.info,
                            size: 30,
                            color: Colors.white,
                          ));
                    },
                    color: Colors.indigo),
              ),
            ),
          );
        });
  }
}
