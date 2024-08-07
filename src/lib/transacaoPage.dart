import 'package:flutter/material.dart';
import 'package:src/model/categoriaModel.dart';
import 'package:src/Entidade/conta.dart';
import 'package:src/Enumerador/tiposDeTrasacao.dart';
import 'package:src/model/transacaoModel.dart';

EnumTransacao _selectedTransacao = EnumTransacao.entrada;

class Transacaopage extends StatefulWidget {
  @override
  _TransacaoListPageState createState() => _TransacaoListPageState();
}

class _TransacaoListPageState extends State<Transacaopage> {
  List<CategoriaModel> categorias = [
    CategoriaModel(id: 0, icone: Icons.abc, nome: "Categoria 0"),
    CategoriaModel(
        id: 1, icone: Icons.accessible_forward_outlined, nome: "Categoria 1"),
    CategoriaModel(id: 2, icone: Icons.account_box, nome: "Categoria 2"),
    CategoriaModel(id: 3, icone: Icons.ac_unit_outlined, nome: "Categoria 3"),
    CategoriaModel(id: 4, icone: Icons.ad_units, nome: "Categoria 4"),
    CategoriaModel(
        id: 5, icone: Icons.accessible_forward_outlined, nome: "Categoria 5"),
  ];
  List<TransacaoModel> transacoes = [];

  void _editarTransacao(
      TransacaoModel transacao, void Function() alterarValor) {
    showDialog(
      context: context,
      builder: (context) {
        final nomeController = TextEditingController(text: transacao.nome);
        final valorController =
            TextEditingController(text: transacao.valorTranzacao.toString());
        EnumTransacao selectedTransacao = transacao.enumTransacao!;
        CategoriaModel selectedCategoria = transacao.categoria;
        IconData selectedIcon = transacao.icone;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Editar Transação'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nomeController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                  ),
                  TextField(
                    controller: valorController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Valor'),
                  ),
                  Row(
                    children: [
                      const Text("Tipo: "),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButton<EnumTransacao>(
                          value: selectedTransacao,
                          onChanged: (EnumTransacao? newValue) {
                            setState(() {
                              selectedTransacao = newValue!;
                            });
                          },
                          isExpanded: true,
                          items: EnumTransacao.values
                              .map<DropdownMenuItem<EnumTransacao>>(
                                  (EnumTransacao value) {
                            return DropdownMenuItem<EnumTransacao>(
                              value: value,
                              child: Text(value.toString().split('.').last),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Categoria: "),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButton<CategoriaModel>(
                          value: selectedCategoria,
                          onChanged: (CategoriaModel? newValue) {
                            setState(() {
                              selectedCategoria = newValue!;
                            });
                          },
                          isExpanded: true,
                          items: categorias
                              .map<DropdownMenuItem<CategoriaModel>>(
                                  (CategoriaModel value) {
                            return DropdownMenuItem<CategoriaModel>(
                              value: value,
                              child: Text(value.nome),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      transacao.nome = nomeController.text;
                      transacao.valorTranzacao =
                          double.tryParse(valorController.text) ?? 0.0;
                      transacao.enumTransacao = selectedTransacao;
                      transacao.categoria = selectedCategoria;
                      transacao.icone = selectedIcon;
                    });
                    alterarValor(); // Atualizar a tela
                    Navigator.of(context).pop();
                  },
                  child: const Text('Salvar'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancelar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _deleteTransacao(int index, void Function() alterarValor) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmar Exclusão'),
          content: Text('Você tem certeza que deseja excluir esta transação?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  transacoes.removeAt(index);
                });
                alterarValor(); // Atualizar a tela
                Navigator.of(context).pop();
              },
              child: Text('Excluir'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void _addTransacao(void Function() alterarValor) {
    showDialog(
      context: context,
      builder: (context) {
        final nomeController = TextEditingController();
        final valorController = TextEditingController();
        EnumTransacao selectedTransacao = EnumTransacao.entrada;
        CategoriaModel selectedCategoria = categorias.first;
        IconData selectedIcon = Icons.star;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Adicionar Transação'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nomeController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                  ),
                  TextField(
                    controller: valorController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Valor'),
                  ),
                  Row(
                    children: [
                      const Text("Tipo: "),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButton<EnumTransacao>(
                          value: selectedTransacao,
                          onChanged: (EnumTransacao? newValue) {
                            setState(() {
                              selectedTransacao = newValue!;
                            });
                          },
                          isExpanded: true,
                          items: EnumTransacao.values
                              .map<DropdownMenuItem<EnumTransacao>>(
                                  (EnumTransacao value) {
                            return DropdownMenuItem<EnumTransacao>(
                              value: value,
                              child: Text(value.toString().split('.').last),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("Categoria: "),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DropdownButton<CategoriaModel>(
                          value: selectedCategoria,
                          onChanged: (CategoriaModel? newValue) {
                            setState(() {
                              selectedCategoria = newValue!;
                            });
                          },
                          isExpanded: true,
                          items: categorias
                              .map<DropdownMenuItem<CategoriaModel>>(
                                  (CategoriaModel value) {
                            return DropdownMenuItem<CategoriaModel>(
                              value: value,
                              child: Text(value.nome),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      transacoes.add(TransacaoModel(
                        nome: nomeController.text,
                        valorTranzacao:
                            double.tryParse(valorController.text) ?? 0.0,
                        enumTransacao: selectedTransacao,
                        datatransacao: DateTime.now(),
                        categoria: selectedCategoria,
                        contaSaida: Conta(id: 2, nome: 'teste'),
                        contaEntrada: Conta(id: 2, nome: 'teste'),
                      ));
                    });
                    alterarValor(); // Atualizar a tela
                    Navigator.of(context).pop();
                  },
                  child: const Text('Adicionar'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancelar'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool variavel = false;

    void alterarValor() {
      setState(() {
        variavel = !variavel;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Transações'),
      ),
      body: ListView.builder(
        itemCount: transacoes.length,
        itemBuilder: (context, index) {
          final transacao = transacoes[index];
          return ListTile(
            leading: Icon(transacao.icone),
            title: Text(transacao.nome),
            subtitle: Text('\$${transacao.valorTranzacao.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editarTransacao(transacao, alterarValor),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteTransacao(index, alterarValor),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTransacao(alterarValor),
        child: Icon(Icons.add),
        tooltip: 'Adicionar Transação',
      ),
    );
  }
}
