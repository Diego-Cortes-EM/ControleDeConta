// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contas.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetContasCollection on Isar {
  IsarCollection<Contas> get contas => this.collection();
}

const ContasSchema = CollectionSchema(
  name: r'Contas',
  id: -4885296410244420669,
  properties: {
    r'icone': PropertySchema(
      id: 0,
      name: r'icone',
      type: IsarType.long,
    ),
    r'nome': PropertySchema(
      id: 1,
      name: r'nome',
      type: IsarType.string,
    ),
    r'valorAtual': PropertySchema(
      id: 2,
      name: r'valorAtual',
      type: IsarType.double,
    )
  },
  estimateSize: _contasEstimateSize,
  serialize: _contasSerialize,
  deserialize: _contasDeserialize,
  deserializeProp: _contasDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _contasGetId,
  getLinks: _contasGetLinks,
  attach: _contasAttach,
  version: '3.1.0+1',
);

int _contasEstimateSize(
  Contas object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.nome;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _contasSerialize(
  Contas object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.icone);
  writer.writeString(offsets[1], object.nome);
  writer.writeDouble(offsets[2], object.valorAtual);
}

Contas _contasDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Contas();
  object.icone = reader.readLongOrNull(offsets[0]);
  object.id = id;
  object.nome = reader.readStringOrNull(offsets[1]);
  object.valorAtual = reader.readDoubleOrNull(offsets[2]);
  return object;
}

P _contasDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _contasGetId(Contas object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _contasGetLinks(Contas object) {
  return [];
}

void _contasAttach(IsarCollection<dynamic> col, Id id, Contas object) {
  object.id = id;
}

extension ContasQueryWhereSort on QueryBuilder<Contas, Contas, QWhere> {
  QueryBuilder<Contas, Contas, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ContasQueryWhere on QueryBuilder<Contas, Contas, QWhereClause> {
  QueryBuilder<Contas, Contas, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Contas, Contas, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Contas, Contas, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Contas, Contas, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ContasQueryFilter on QueryBuilder<Contas, Contas, QFilterCondition> {
  QueryBuilder<Contas, Contas, QAfterFilterCondition> iconeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'icone',
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> iconeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'icone',
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> iconeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'icone',
        value: value,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> iconeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'icone',
        value: value,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> iconeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'icone',
        value: value,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> iconeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'icone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> nomeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nome',
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> nomeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nome',
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> nomeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> nomeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> nomeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> nomeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nome',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> nomeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> nomeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> nomeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> nomeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nome',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> nomeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nome',
        value: '',
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> nomeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nome',
        value: '',
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> valorAtualIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'valorAtual',
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> valorAtualIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'valorAtual',
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> valorAtualEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valorAtual',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> valorAtualGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valorAtual',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> valorAtualLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valorAtual',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Contas, Contas, QAfterFilterCondition> valorAtualBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valorAtual',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ContasQueryObject on QueryBuilder<Contas, Contas, QFilterCondition> {}

extension ContasQueryLinks on QueryBuilder<Contas, Contas, QFilterCondition> {}

extension ContasQuerySortBy on QueryBuilder<Contas, Contas, QSortBy> {
  QueryBuilder<Contas, Contas, QAfterSortBy> sortByIcone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icone', Sort.asc);
    });
  }

  QueryBuilder<Contas, Contas, QAfterSortBy> sortByIconeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icone', Sort.desc);
    });
  }

  QueryBuilder<Contas, Contas, QAfterSortBy> sortByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<Contas, Contas, QAfterSortBy> sortByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }

  QueryBuilder<Contas, Contas, QAfterSortBy> sortByValorAtual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorAtual', Sort.asc);
    });
  }

  QueryBuilder<Contas, Contas, QAfterSortBy> sortByValorAtualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorAtual', Sort.desc);
    });
  }
}

extension ContasQuerySortThenBy on QueryBuilder<Contas, Contas, QSortThenBy> {
  QueryBuilder<Contas, Contas, QAfterSortBy> thenByIcone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icone', Sort.asc);
    });
  }

  QueryBuilder<Contas, Contas, QAfterSortBy> thenByIconeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icone', Sort.desc);
    });
  }

  QueryBuilder<Contas, Contas, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Contas, Contas, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Contas, Contas, QAfterSortBy> thenByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<Contas, Contas, QAfterSortBy> thenByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }

  QueryBuilder<Contas, Contas, QAfterSortBy> thenByValorAtual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorAtual', Sort.asc);
    });
  }

  QueryBuilder<Contas, Contas, QAfterSortBy> thenByValorAtualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valorAtual', Sort.desc);
    });
  }
}

extension ContasQueryWhereDistinct on QueryBuilder<Contas, Contas, QDistinct> {
  QueryBuilder<Contas, Contas, QDistinct> distinctByIcone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'icone');
    });
  }

  QueryBuilder<Contas, Contas, QDistinct> distinctByNome(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nome', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Contas, Contas, QDistinct> distinctByValorAtual() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valorAtual');
    });
  }
}

extension ContasQueryProperty on QueryBuilder<Contas, Contas, QQueryProperty> {
  QueryBuilder<Contas, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Contas, int?, QQueryOperations> iconeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'icone');
    });
  }

  QueryBuilder<Contas, String?, QQueryOperations> nomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nome');
    });
  }

  QueryBuilder<Contas, double?, QQueryOperations> valorAtualProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valorAtual');
    });
  }
}
