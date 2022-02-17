import 'package:flutter/material.dart';
import 'package:flutter_app2/candidato.dart';
import 'package:flutter_app2/detalles.dart';
import 'package:flutter_app2/listadoVotaciones.dart';
import 'package:get/get.dart';

class Cardd extends StatefulWidget {
  final Candidato? candidato;

  final int number;
  const Cardd({Key? key, this.candidato, required this.number});

  @override
  State<Cardd> createState() => CarddState();
}

class CarddState extends State<Cardd> {
  bool check = false;
  late ListadoVotacionesController _listadoVotacionesController;
  CarddState() {
    _listadoVotacionesController = Get.find<ListadoVotacionesController>();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute<void>(builder: (BuildContext context) {
            return Scaffold(
              body: Container(
                // The blue background emphasizes that it's a new route.
                child: PhotoHero(
                  photo: 'images/flippers-alpha.png',
                  candidato: widget.candidato,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            );
          }));
        },
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            width: Get.width * 0.9,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: [
                Center(
                  child: Container(
                    height: 70,
                    width: 70,
                    child: Center(
                        child: Icon(Icons.image, size: 70, color: Colors.grey)),
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text("${widget.candidato!.nombre}"),
                  Text("${widget.candidato!.provincia}"),
                  Text("${widget.candidato!.municipio}"),
                  Text("${widget.candidato!.edad}"),
                ]),
                SizedBox(
                  width: 60,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      check = !check;
                      _listadoVotacionesController.setCurrent(widget.number);
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child:
                        (_listadoVotacionesController.current == widget.number)
                            ? Center(
                                child: Icon(
                                Icons.check,
                                size: 30,
                              ))
                            : Container(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
