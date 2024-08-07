import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:src/Isar/categoria.dart';
import 'package:src/isarCollection/userCollection.dart';
import 'package:src/model/categoriaModel.dart';
import 'package:src/model/icon.dart';

class CategoriaListScreen extends StatefulWidget {
  const CategoriaListScreen({super.key});

  @override
  _CategoriaListScreenState createState() => _CategoriaListScreenState();
}

class _CategoriaListScreenState extends State<CategoriaListScreen> {
  // Método para atualizar a lista de categorias
  void _refreshCategorias() {
    setState(() {});
  }

  void _editCategoria(Categoria categoria) {
    showDialog(
      context: context,
      builder: (context) {
        final nomeController = TextEditingController(text: categoria.nome);
        IconData _selectedIcon = obterIcon(categoria.icone);

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
                      Icon(_selectedIcon),
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
                  onPressed: () async {
                    Navigator.of(context).pop();
                    categoria.icone = obterCodigo(_selectedIcon);
                    categoria.nome = nomeController.text;
                    await IsarCategotia().updateCategoria(categoria);
                    _refreshCategorias(); // Atualize a lista de categorias
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

  void _deleteConta(int id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmar Exclusão'),
          content: Text('Você tem certeza que deseja excluir esta conta?'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await IsarCategotia().deleteCategoria(id);
                _refreshCategorias(); // Atualize a lista de categorias
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
        IconData _selectedIcon = Icons.star;

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Adicionar Categoria'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nomeController,
                    decoration: InputDecoration(labelText: 'Nome'),
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
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await IsarCategotia().addCategoria(Categoria(
                        icone: obterCodigo(_selectedIcon),
                        nome: nomeController.text));
                    _refreshCategorias(); // Atualize a lista de categorias
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

  void _selectIcon(BuildContext context, Function(IconData) onIconSelected) {
    showDialog(
      context: context,
      builder: (context) {
        final iconList = [
          obterIcon(1),
          obterIcon(2),
          obterIcon(3),
          obterIcon(4),
          obterIcon(5),
          obterIcon(6),
          obterIcon(7),
          obterIcon(8),
          obterIcon(9),
          obterIcon(10),
          obterIcon(11),
          obterIcon(12),
          obterIcon(13),
          obterIcon(14),
        ];

        return AlertDialog(
          title: Text('Selecionar Ícone'),
          content: Container(
            width: double.maxFinite,
            height: 300,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                    Navigator.of(context).pop();
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
        title: const Text('Categorias'),
      ),
      body: FutureBuilder<List<Categoria>>(
        future: IsarCategotia().getCategorias(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhuma categoria encontrada'));
          }

          final categories = snapshot.data!;

          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return ListTile(
                leading: Icon(obterIcon(category.icone)),
                title: Text(category.nome),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _editCategoria(category),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteConta(category.id),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addConta,
        child: Icon(Icons.add),
        tooltip: 'Adicionar Categoria',
      ),
    );
  }
}
