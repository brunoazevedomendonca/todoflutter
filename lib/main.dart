import 'package:flutter/material.dart';
import 'package:todo_app/model/tarefa.dart';
import 'package:todo_app/screen/form_tarefa_screen.dart';
import 'package:todo_app/widget/tarefa_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Tarefa> tarefas = [];
  int bottomBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Tarefas"),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: "Concluidas"),
        ],
        onTap: (index) {
          setState(() {
            bottomBarIndex = index;
          });
        },
        currentIndex: bottomBarIndex,
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Lista de tarefas"),
      ),
      body: bottomBarIndex == 1 ? Placeholder() : Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: tarefas.length,
          itemBuilder: (context, index) => TarefaItem(
            tarefa: tarefas[index],
            onItemClick: (checked) {
              setState(() {
                tarefas[index].concluida = checked;
              });
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Tarefa? novaTarefa = await Navigator.of(context).push<Tarefa>(
            MaterialPageRoute(
              builder: (context) => FormTarefaScreen(),
            ),
          );
          if (novaTarefa != null) {
            setState(() {
              tarefas.add(novaTarefa);
            });
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
