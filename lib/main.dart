import 'package:app6/consulta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController clave = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController costo = TextEditingController();
  TextEditingController marca = TextEditingController();

  create() async {
    try {
      await FirebaseFirestore.instance
          .collection("datos")
          .doc(clave.text)
          .set({"clave": clave.text, 
          "nombre": nombre.text,
          "costo": costo.text,
          "marca": marca.text});
      // ignore: avoid_print
      print("Dato Registrado");
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  update() async {
    try {
      await FirebaseFirestore.instance
          .collection("datos")
          .doc(clave.text)
          .update({"clave": clave.text, 
          "nombre": nombre.text,
          "costo": costo.text,
          "marca": marca.text});
      // ignore: avoid_print
      print("Dato Actualizado");
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  delete() async {
    try {
      await FirebaseFirestore.instance
          .collection("datos")
          .doc(clave.text)
          .delete();
      // ignore: avoid_print
      print("Dato Eliminado");
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Productos"),
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              TextField(
                controller: nombre,
                decoration: InputDecoration(
                    labelText: "Nombre",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 22.0,
              ),
              TextField(
                controller: clave,
                decoration: InputDecoration(
                    labelText: "Clave",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 22.0,
              ),
               TextField(
                controller: costo,
                decoration: InputDecoration(
                    labelText: "Costo",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
               const SizedBox(
                height: 22.0,
               ),
               TextField(
                controller: marca,
                decoration: InputDecoration(
                    labelText: "Marca",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
               const SizedBox(
                height: 22.0,
               ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        create();
                        clave.clear();
                        nombre.clear();
                        costo.clear();
                        marca.clear();
                      },
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.green),
                      child: const Text("Create")),
                  ElevatedButton(
                      onPressed: () {
                        update();
                        clave.clear();
                        nombre.clear();
                        costo.clear();
                        marca.clear();
                      },
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.yellow),
                      child: const Text("Update")),
                  ElevatedButton(
                      onPressed: () {
                        delete();
                        clave.clear();
                        nombre.clear();
                        costo.clear();
                        marca.clear();
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text("Delete")),
                ],
              ),
              const Consulta(),
            ],
          ),
        ));
  }
}
