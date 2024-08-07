import 'package:isar/isar.dart';

part 'contas.g.dart';

@collection
class Contas {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  int? icone;

  String? nome;

  double? valorAtual;
}
