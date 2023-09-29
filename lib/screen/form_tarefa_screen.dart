import 'package:flutter/material.dart';
import 'package:todo_app/model/tarefa.dart';

class FormTarefaScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  Tarefa novaTarefa = Tarefa("", "", "");
  List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(child: Text("Teste"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Adicionar tarefa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Descrição"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Este campo é obrigatório";
                  }
                  novaTarefa.descricao = value;
                  return null;
                },
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration:
                          InputDecoration(labelText: "Data de conclusão"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Este campo é obrigatório";
                        }
                        novaTarefa.dataConclusao = value;
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Tipo"),
                      validator: (value) {
                        novaTarefa.tipo = value ?? "";
                      },
                    ),
                  ),
                ],
              ),
              DropdownButtonFormField(
                items: items,
                onChanged: (item) {},
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    Navigator.of(context).pop(novaTarefa);
                  }
                },
                child: Text("Adicionar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
