import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),

    );
  }
}

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pestañas'),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: 'Opcion 1'),
            Tab(text: 'Opcion 2'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: Text('Una aplicación móvil, también llamada app móvil, es un tipo de aplicación diseñada para ejecutarse en un dispositivo móvil'),
          ),
          Center(
            child: Text('A diferencia de las aplicaciones diseñadas para computadoras de escritorio, las aplicaciones móviles se alejan de los sistemas de software integrados.'),
          ),
        ],
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Aplicación Android '),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Inicio'),
              onTap: () {
              
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Acerca de'),
              onTap: () {
                
                Navigator.pop(context);
                
              },
            ),
            ListTile(
              title: Text('Configuración'),
              onTap: () {
            
                Navigator.pop(context);
           
              },
            ),

            ListTile(
  title: Text('Pestañas'),
  onTap: () {
  
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => TabsPage()));
  },
),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
              
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Botón tocado'),
                  ),
                );
              },
              child: Text('Botón Tocar'),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
            ),
            GestureDetector(
              onDoubleTap: () {
               
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Botón doble tocado'),
                  ),
                );
              },
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Botón Doble Tocar'),
                style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 111, 101, 187)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
              
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Botón desplazado'),
                  ),
                );
              },
              child: Text('Botón Desplazar'),
              style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 0, 137, 41)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
       
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Acción realizada con éxito'),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
