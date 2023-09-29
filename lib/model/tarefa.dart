class Tarefa {
  String descricao;
  String dataConclusao;
  String tipo;
  bool concluida = false;

  Tarefa(this.descricao, this.dataConclusao, this.tipo);

  @override
  String toString() {
    return "$descricao $dataConclusao $tipo";
  }
}
