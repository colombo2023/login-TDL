import 'package:flutter/material.dart';
import 'package:grupotdl/widgets/task_card.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _tarefas = [
    {
      'title': 'Enviar relatório para o Frank',
      'subtitle': 'Fourth Coffee',
      'categoryIcon': Icons.coffee,
      'done': false,
      'dateTime': '23 de Outubro, 10:00',
    },
    {
      'title': 'Revisar assinaturas',
      'subtitle': 'Home',
      'categoryIcon': Icons.home_outlined,
      'done': false,
      'dateTime': 'Hoje, 14:30',
    },
    {
      'title': 'Comprar leite',
      'subtitle': 'Groceries',
      'categoryIcon': Icons.shopping_cart,
      'done': false,
      'dateTime': 'Amanhã, 08:00',
    },
    {
      'title': 'Re: Alpine Ski House',
      'subtitle': 'Mensagem',
      'categoryIcon': Icons.message_outlined,
      'done': true,
      'dateTime': 'Ontem, 17:00',
    },
  ];

  String _filtro = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _filtro = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final tarefasFiltradas = _tarefas.where((tarefa) {
      return tarefa['title'].toLowerCase().contains(_filtro) ||
          tarefa['subtitle'].toLowerCase().contains(_filtro);
    }).toList();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 40, 12, 12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar tarefas...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: tarefasFiltradas.length,
              itemBuilder: (context, index) {
                final tarefa = tarefasFiltradas[index];
                return TaskCard(
                  title: tarefa['title'],
                  subtitle: tarefa['subtitle'],
                  icon: tarefa['categoryIcon'],
                  done: tarefa['done'],
                  dateTime: tarefa['dateTime'],
                  onChanged: () {
                    setState(() {
                      tarefa['done'] = !tarefa['done'];
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
