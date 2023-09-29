import 'package:flutter/material.dart';
import 'package:todo_app/model/tarefa.dart';

class TarefaItem extends StatelessWidget {
  Tarefa tarefa;
  void Function(bool) onItemClick;

  TarefaItem({super.key, required this.tarefa, required this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: tarefa.concluida,
            onChanged: (checked) {
              onItemClick(checked ?? false);
            }),
        Text(tarefa.descricao),
      ],
    );
  }

}