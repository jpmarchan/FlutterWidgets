import 'package:flutter/material.dart';
import 'package:widgets/src/providers/menu_provider.dart';
import 'package:widgets/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Componentes'),
        ),
        body: _list());
  }

  Widget _list() {
    //menuProvider.cargarData()
    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 60),
            children: _listItems(snapshot.data, context),
          );
        });
  }

  List<Widget> _listItems(data, BuildContext context) {
    final List<Widget> opciones = [];

    for (var item in data) {
      final widgeTem = Stack(
        fit: StackFit.loose,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Card(
            elevation: 30,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: Stack(
              children: [
                Image.asset(item['image'], colorBlendMode: BlendMode.darken)
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                item['text'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, item['ruta']);
                  },
                  child: Text(
                    'Continuar',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
            ],
          ),
        ],
      );
      opciones..add(widgeTem)..add(Divider());
    }
    return opciones;
  }
}
