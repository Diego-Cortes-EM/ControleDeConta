import 'package:isar/isar.dart';

part 'categoria.g.dart';

@collection
class Categoria {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  int? icone;

  String? nome;
}
