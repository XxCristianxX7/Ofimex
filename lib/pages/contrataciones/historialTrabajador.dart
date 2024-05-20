import 'package:flutter/material.dart';
import 'package:ofimex/models/usuario/trabajo.dart';
import 'package:ofimex/provider/globales.dart';
import 'package:ofimex/services/services.dart';
import 'package:ofimex/widgets/cardHistorialTrabajador.dart';
import 'package:provider/provider.dart';

class HistorialTrabajador extends StatefulWidget {
  const HistorialTrabajador({super.key});

  @override
  State<HistorialTrabajador> createState() => _HistorialTrabajadorState();
}

class _HistorialTrabajadorState extends State<HistorialTrabajador> {
  late Future<List<Trabajo>> _futureTrabajos;

  @override
  void initState() {
    super.initState();
    _loadTrabajos();
  }

  void _loadTrabajos() {
    final globales = context.read<Globales>();
    setState(() {
      _futureTrabajos = getTrabajosTrabajador(
          globales.usuario.oficio![0].idOficio,
          globales.usuario.trabajador!.id!);
    });
  }
  @override
  Widget build(BuildContext context) {
    // final globales = context.watch<Globales>();

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: MenuStatus(text: "En espera", callback: () {}),
          // ),
          const SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height - 90,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FutureBuilder<List<Trabajo>>(
                  future: _futureTrabajos,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Trabajo>> snapshot) {
                    // print('Error: ${snapshot.hasData}');
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final trabajo = snapshot.data!;
                      return ListView.builder(
                          itemCount: trabajo.length,
                          itemBuilder: (BuildContext context, int index) {
                            // print(trabajo[index]);
                            return Column(
                              children: [
                                WorkerServiceCard(trabajo: trabajo[index], onRefresh: _loadTrabajos, ),
                                const SizedBox(height: 10,)
                              ],
                            );
                          });
                    }
                  }),
            ),
          ),
          // MenuStatus(text: "En proceso", callback: () {}),
          // MenuStatus(text: "Realizado", callback: () {}),
          // MenuStatus(text: "Cancelado", callback: () {}),
        ],
      ),
    );
  }
}
