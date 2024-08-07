import 'package:isar/isar.dart';
import 'package:src/Isar/categoria.dart';
import 'isar_conexao.dart';

class IsarCategotia extends IsarConexao {
  late Future<Isar> db;

  IsarCategotia() {
    db = openBD();
  }

  Future<void> addCategoria(Categoria categoria) async {
    final isar = await db;
    await isar.writeTxn(() => isar.categorias.put(categoria));
  }

  Future<List<Categoria>> getCategorias() async {
    final isar = await db;
    return await isar.categorias.where().findAll();
  }

  Future<void> updateCategoria(Categoria categoria) async {
    final isar = await db;
    await isar.writeTxn(() => isar.categorias.put(categoria));
  }

  Future<void> deleteCategoria(int id) async {
    final isar = await db;
    await isar.writeTxn(() => isar.categorias.delete(id));
  }
}
