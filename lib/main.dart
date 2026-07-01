import 'package:flutter/material.dart';

void main() {
  // Inicializa a execução do aplicativo chamando o widget principal
  runApp(const MyApp());
}

// ==========================================
// CONFIGURAÇÃO INICIAL DO APLICATIVO (THEME)
// ==========================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Configurações globais do aplicativo
      debugShowCheckedModeBanner: false, // Oculta a tarja vermelha de "Debug" no canto da tela
      home: const PaginaInicial(), // Define qual será a tela de abertura do app
    );
  }
}

// ==========================================
// TELA PRINCIPAL: ESTRUTURA DO CURRÍCULO
// ==========================================
class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    // O Scaffold funciona como a "carcaça" ou esqueleto padrão do Material Design
    return Scaffold(
      
      // ----------------------------------------
      // BARRA SUPERIOR (APPBAR)
      // ----------------------------------------
      appBar: AppBar(
        title: const Text('ETEC Mongaguá - PAM I'), // Texto central da barra
        backgroundColor: Colors.redAccent, // Cor de fundo principal do tema
        centerTitle: true, // Garante a centralização do título em iOS e Android
        elevation: 10, // Define a intensidade da sombra abaixo da barra
        // Shape customiza as bordas da AppBar (neste caso, arredondando os cantos inferiores)
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),

      // ----------------------------------------
      // MENU LATERAL ESQUERDO (DRAWER)
      // ----------------------------------------
      drawer: const Drawer(
        // Menu focado na navegação estrutural do sistema
        child: Center(child: Text('Texto do Drawer (Menu)')),
      ),

      // ----------------------------------------
      // MENU LATERAL DIREITO (ENDDRAWER)
      // ----------------------------------------
      endDrawer: const Drawer(
        // Menu focado em configurações, preferências e dados do usuário
        child: Center(child: Text('Texto do EndDrawer (Configurações)')),
      ),

      // ----------------------------------------
      // CORPO PRINCIPAL (BODY)
      // ----------------------------------------
      // Utiliza SingleChildScrollView para permitir a rolagem da tela caso o conteúdo ultrapasse a altura do dispositivo
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
              backgroundColor: Colors.redAccent, // Cor da moldura
              child: CircleAvatar(
                radius: 56, // Tamanho do círculo interno (imagem)
                // Busca a imagem de perfil diretamente de uma URL externa
                backgroundImage: NetworkImage('https://github.com/diogenesllpereira.png'), 
              ),
            ),
            
            // SizedBox cria um espaço vazio vertical de 15 pixels para separar a foto do nome
            const SizedBox(height: 15),

            // 2. Nome e Idade: Widgets de texto com estilização diferenciada
            const Text(
              'Diógenes Leandro Leite Pereira',
              textAlign: TextAlign.center, // Centraliza o texto
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold), // Fonte maior e negrito
            ),
            const Text(
              '49 anos - Itanhaém, SP',
              style: TextStyle(fontSize: 16, color: Colors.blueGrey), // Fonte menor com cor suave
            ),
            const SizedBox(height: 20),

            // 3. Contatos: Seção delimitada por linhas divisórias (Divider)
            const Divider(), // Linha horizontal separadora
            // Chamadas ao método auxiliar para construir cada linha de contato de forma limpa
            _buildContactItem(Icons.email, 'professor@etec.sp.gov.br'),
            _buildContactItem(Icons.phone, '(13) 99999-9999'),
            _buildContactItem(Icons.web, '@diogenesllpereira'),
            const Divider(),
            const SizedBox(height: 20),

            // 4. Resumo Profissional: Usa Align para garantir que o título fique alinhado à esquerda
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Resumo Profissional',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.redAccent),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Professor de ensino técnico e superior com mais de 18 anos de experiência. Especialista em desenvolvimento Full-Stack e entusiasta de metodologias Clean Code.',
              textAlign: TextAlign.justify, // Distribui o texto uniformemente nas laterais (justificado)
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 25),

            // 5. Objetivo: Segue o mesmo padrão visual do resumo para manter a consistência do design
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Objetivo',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.redAccent),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Atuar como Web Presence Provider e Instrutor de tecnologias modernas (Flutter, React Native, Laravel), ajudando alunos e empresas a alcançarem maturidade digital.',
              textAlign: TextAlign.justify,
              // Estilo em Itálico para destacar o objetivo profissional do restante do texto
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),

      // ----------------------------------------
      // BARRA DE NAVEGAÇÃO INFERIOR (BOTTOMBAR)
      // ----------------------------------------
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Sobre'),
        ],
      ),

      // ----------------------------------------
      // BOTÃO FLUTUANTE (FLOATINGACTIONBUTTON)
      // ----------------------------------------
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Evento de clique disparado no console
          print('Botão Flutuante Pressionado!');
        },
        backgroundColor: Colors.redAccent, // Combina com a cor da identidade da AppBar
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // ==========================================
  // METODOS E FUNÇÕES AUXILIARES
  // ==========================================
  // Define uma função privada (_) que retorna um widget customizado.
  // Serve para encapsular e padronizar as linhas de contato sem repetir código (Clean Code).
  Widget _buildContactItem(IconData icone, String texto) {
    return Padding(
      // Adiciona um pequeno espaçamento (respiro) de 5 pixels acima e abaixo de cada linha
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        // Organiza o Ícone e o Texto horizontalmente (lado a lado)
        children: [
          // Exibe o ícone passado por parâmetro
          Icon(icone, color: Colors.redAccent, size: 20),
          
          // Cria um bloco invisível com largura fixa de 15 pixels para afastar o texto do ícone
          const SizedBox(width: 15),
          
          // Exibe a string de texto recebida por parâmetro
          Text(texto, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );