import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 243, 75, 33)),
        useMaterial3: true,
      ),
      home: const PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Etec Adolpho Berezim - PAM1'),
        backgroundColor: Colors.redAccent,
      ),
      drawer: const Drawer(
        child: Center(child: Text('Menu lateral')),
      ),
      endDrawer: const Drawer(
        child: Center(
          child: Text('end drawer'),
        )
      ),
      body: SingleChildScrollView(
         padding: const EdgeInsets.all(20.0),
         child: Column(

          crossAxisAlignment:CrossAxisAlignment.center,
          children: [

            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.redAccent,
              child: CircleAvatar(
                radius: 56,
                backgroundImage: NetworkImage(url),
              )
            )
          ],
         )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Casa'),
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket), label: 'Favoritos'),
        ],
      ),
    );
  }
}