import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:src/Isar/categoria.dart';

abstract class IsarConexao {
  Future<Isar> openBD() async {
    var instance = Isar.getInstance();
    if (instance == null) {
      final diretorio = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [
          CategoriaSchema,
        ],
        directory: diretorio.path,
      );
    }

    return instance;
  }

  static Future<void> encerreIsar() async {
    Isar? isar = Isar.getInstance();

    if (isar != null) {
      await isar.writeTxn(() async {
        await isar.clear();
      });
    }
  }
}
