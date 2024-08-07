import 'package:isar/isar.dart';

part 'categoria.g.dart';

@Collection()
class Categoria {
  Id id = Isar.autoIncrement;
  @Index()
  late int icone;
  @Index(unique: true)
  late String nome;

  Categoria({
    required this.icone,
    required this.nome,
  });

  Categoria.withId({
    required this.id,
    required this.icone,
    required this.nome,
  });
}
