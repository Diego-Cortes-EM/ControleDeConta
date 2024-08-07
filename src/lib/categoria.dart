import 'package:flutter/material.dart';
import 'package:src/model/categoriaModel.dart';

class CategoriaListScreen extends StatefulWidget {
  @override
  _CategoriaListScreenState createState() => _CategoriaListScreenState();
}

class _CategoriaListScreenState extends State<CategoriaListScreen> {
  List<CategoriaModel> categorias = [
    CategoriaModel(
      id: 0,
      icone: Icons.star,
      nome: 'Conta de Exemplo 1',
    ),
    CategoriaModel(
      id: 1,
      icone: Icons.favorite,
      nome: 'Conta de Exemplo 2',
    ),
  ];

  IconData _selectedIcon = Icons.star;

  void _editCategoria(int index, void Function() alterarValor) {
    final categoria = categorias[index];
    showDialog(
      context: context,
      builder: (context) {
        final nomeController = TextEditingController(text: categoria.nome);
        IconData _selectedIcon =
            categoria.icone; // Inicialize com o ícone atual da categoria

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Editar Conta'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nomeController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                  ),
                  Row(
                    children: [
                      Icon(categoria.icone),
                      const SizedBox(width: 10),
                      const Text('Ícone:'),
                      const SizedBox(width: 10),
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
                      categorias[index] = CategoriaModel(
                        id: categorias[index].id,
                        icone: _selectedIcon,
                        nome: nomeController.text,
                      );
                      alterarValor;
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
      },
    );
  }

  void _deleteConta(int index, void Function() alterarValor) {
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
                  categorias.removeAt(index);
                });
                alterarValor;
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

  void _addConta(void Function() alterarValor) {
    showDialog(
      context: context,
      builder: (context) {
        final nomeController = TextEditingController();
        final valorController = TextEditingController();
        IconData _selectedIcon =
            Icons.star; // Defina um ícone padrão ou inicial

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
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
                    Navigator.of(context).pop();
                    setState(() {
                      categorias.add(CategoriaModel(
                        id: categorias.length +
                            1, // Atualize o ID conforme necessário
                        icone: _selectedIcon,
                        nome: nomeController.text,
                      ));
                      alterarValor;
                    });
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
    bool variavel = false;

    void alterarValor() {
      setState(() {
        variavel = !variavel;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: ListView.builder(
        itemCount: categorias.length,
        itemBuilder: (context, index) {
          final conta = categorias[index];
          return ListTile(
            leading: Icon(conta.icone),
            title: Text(conta.nome),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editCategoria(index, alterarValor),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteConta(index, alterarValor),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addConta(alterarValor),
        child: Icon(Icons.add),
        tooltip: 'Adicionar Conta',
      ),
    );
  }
}
