import 'package:flutter/material.dart';
import 'package:src/model/contasModel.dart';

class ContasListScreen extends StatefulWidget {
  @override
  _ContasListScreenState createState() => _ContasListScreenState();
}

class _ContasListScreenState extends State<ContasListScreen> {
  List<ContasModel> contas = [
    ContasModel(
      icone: Icons.star,
      nome: 'Conta de Exemplo 1',
      valorAtual: 100.0,
    ),
    ContasModel(
      icone: Icons.favorite,
      nome: 'Conta de Exemplo 2',
      valorAtual: 200.0,
    ),
  ];

  IconData _selectedIcon = Icons.star;

  void _editConta(int index) {
    final conta = contas[index];
    showDialog(
      context: context,
      builder: (context) {
        final nomeController = TextEditingController(text: conta.nome);
        final valorController =
            TextEditingController(text: conta.valorAtual.toStringAsFixed(2));

        return AlertDialog(
          title: Text('Editar Conta'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: valorController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Valor Atual'),
              ),
              Row(
                children: [
                  Icon(_selectedIcon),
                  SizedBox(width: 10),
                  Text('Ícone:'),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(_selectedIcon),
                    onPressed: () => _selectIcon(context, (icon) {
                      setState(() {
                        _selectedIcon = icon;
                      });
                    }),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  contas[index] = ContasModel(
                    icone: _selectedIcon,
                    nome: nomeController.text,
                    valorAtual: double.tryParse(valorController.text) ??
                        conta.valorAtual,
                  );
                });
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
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

  void _deleteConta(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmar Exclusão'),
          content: Text('Você tem certeza que deseja excluir esta conta?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  contas.removeAt(index);
                });
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

  void _addConta() {
    showDialog(
      context: context,
      builder: (context) {
        final nomeController = TextEditingController();
        final valorController = TextEditingController();

        return AlertDialog(
          title: Text('Adicionar Conta'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: valorController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Valor Atual'),
              ),
              Row(
                children: [
                  Icon(_selectedIcon),
                  SizedBox(width: 10),
                  Text('Ícone:'),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(_selectedIcon),
                    onPressed: () => _selectIcon(context, (icon) {
                      setState(() {
                        _selectedIcon = icon;
                      });
                    }),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  contas.add(ContasModel(
                    icone: _selectedIcon,
                    nome: nomeController.text,
                    valorAtual: double.tryParse(valorController.text) ?? 0.0,
                  ));
                });
                Navigator.of(context).pop();
              },
              child: Text('Adicionar'),
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

  void _selectIcon(BuildContext context, Function(IconData) onIconSelected) {
    showDialog(
      context: context,
      builder: (context) {
        final iconList = [
          Icons.star,
          Icons.favorite,
          Icons.thumb_up,
          Icons.thumb_down,
          Icons.home,
          Icons.settings,
          Icons.person,
          Icons.shopping_cart,
          Icons.star_border,
          Icons.ac_unit,
          Icons.access_alarm,
          Icons.airplanemode_active,
          Icons.cake,
          Icons.camera_alt,
        ];

        return AlertDialog(
          title: Text('Selecionar Ícone'),
          content: Container(
            width: double.maxFinite,
            height: 300, // Ajuste a altura conforme necessário
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.0,
              ),
              itemCount: iconList.length,
              itemBuilder: (context, index) {
                final iconData = iconList[index];
                return IconButton(
                  icon: Icon(iconData),
                  onPressed: () {
                    onIconSelected(iconData);
                    Navigator.of(context)
                        .pop(); // Fecha o diálogo após selecionar o ícone
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contas'),
      ),
      body: ListView.builder(
        itemCount: contas.length,
        itemBuilder: (context, index) {
          final conta = contas[index];
          return ListTile(
            leading: Icon(conta.icone),
            title: Text(conta.nome),
            subtitle: Text('R\$ ${conta.valorAtual.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editConta(index),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteConta(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addConta,
        child: Icon(Icons.add),
        tooltip: 'Adicionar Conta',
      ),
    );
  }
}
