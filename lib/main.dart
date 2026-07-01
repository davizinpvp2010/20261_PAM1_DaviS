import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      home: const PaginaInicial(),
    );
  }
}

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Barra Superior
      appBar: AppBar(
        title: const Text('ETEC Mongaguá - PAM I'),
        backgroundColor: const Color.fromARGB(255, 180, 45, 192),
        centerTitle: true,
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),

      // Menu Lateral Esquerdo (Navegação)
      drawer: const Drawer(
        child: Center(child: Text('Sou Estudando')),
      ),

      // Menu Lateral Direito (Configurações/Usuário)
      endDrawer: const Drawer(
        child: Center(child: Text('Muita coisa a Melhorar')),
      ),

      // 2. Corpo do App
// O body utiliza SingleChildScrollView para permitir a rolagem da tela caso o conteúdo ultrapasse a altura do dispositivo
      body: SingleChildScrollView( 
        // Adiciona um espaçamento interno de 20 pixels em todos os lados da tela
        padding: const EdgeInsets.all(20.0),
        
        // A Column organiza os elementos de cima para baixo (verticalmente)
        child: Column(
          // Centraliza todos os widgets filhos horizontalmente dentro da coluna
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            // 1. Foto de Perfil: Usa dois CircleAvatar sobrepostos para criar uma moldura circular
            const CircleAvatar(
              radius: 60, // Tamanho do círculo externo (moldura)
              backgroundColor: Color.fromARGB(255, 180, 45, 192), // Cor da moldura
              child: CircleAvatar(
                radius: 56, // Tamanho do círculo interno (imagem)
                // Busca a imagem de perfil diretamente de uma URL externa
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd7VJthnsbi_22hKVF_yp0uSOdMp7zbUEjukZOtfNzLBgBJhyYFyv4KL0YXbYzGQGDandYrUI6Pa-tPayf6fgWBHlq4DhmIoz3eRcAk1uZ1A&s=10'), 
              ),
            ),
            
            // SizedBox cria um espaço vazio vertical de 15 pixels para separar a foto do nome
            const SizedBox(height: 15),

            // 2. Nome e Idade: Widgets de texto com estilização diferenciada
            const Text(
              'Davi Silva de Albuquerque',
              textAlign: TextAlign.center, // Centraliza o texto
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold), // Fonte maior e negrito
            ),
            const Text(
              '16 anos - Praia Grande, SP',
              style: TextStyle(fontSize: 16, color: Colors.blueGrey), // Fonte menor com cor suave
            ),
            const SizedBox(height: 20),

            // 3. Contatos: Seção delimitada por linhas divisórias (Divider)
            const Divider(), // Linha horizontal separadora
            // Chamadas ao método auxiliar para construir cada linha de contato
            _buildContactItem(Icons.email, 'ds351045@gmail.com'),
            _buildContactItem(Icons.phone, '(13) 97427-4026'),
            _buildContactItem(Icons.web, '@davi_albxz'),
            const Divider(),
            const SizedBox(height: 20),

            // 4. Resumo Profissional: Usa Align para garantir que o título fique à esquerda
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Resumo Profissional',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 180, 45, 192)),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tenho formação tecnica em Desenvolvimento de Sistemas na Etec Adolpho Berezin, não tenho experiencia, tenho curso em desenho na casa da musica de itanhaem, sou responsável o eficiente',
              textAlign: TextAlign.justify, // Distribui o texto uniformemente nas laterais
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 25),

            // 5. Objetivo: Segue o mesmo padrão visual do resumo para manter a consistência
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Objetivo',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 180, 45, 192)),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Ser alguem',
              textAlign: TextAlign.justify,
              // Itálico para dar ênfase ao objetivo profissional
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),

      // 3. Barra Inferior
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Sobre'),
        ],
      ),

      // 4. Botão Flutuante (Ação Principal)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ação executada ao clicar
          print('Botão Flutuante Pressionado!');
        },
        backgroundColor: Color.fromARGB(255, 180, 45, 192),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
// Define uma função (método) que retorna um widget, usada para criar linhas de contato padronizadas
  Widget _buildContactItem(IconData icone, String texto) {
    return Padding(
      // Adiciona um espaçamento (respiro) apenas na parte superior e inferior de cada linha
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        // Organiza os elementos (ícone e texto) horizontalmente
        children: [
          // Exibe o ícone definido no parâmetro, usando a cor principal do nosso tema
          Icon(icone, color: Color.fromARGB(255, 180, 45, 192), size: 20),
          
          // Cria um espaço fixo de 15 pixels entre o ícone e o texto para não ficarem colados
          const SizedBox(width: 15),
          
          // Exibe o conteúdo textual passado por parâmetro com um tamanho de fonte legível
          Text(texto, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}