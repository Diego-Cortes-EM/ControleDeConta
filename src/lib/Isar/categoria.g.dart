// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCategoriaCollection on Isar {
  IsarCollection<Categoria> get categorias => this.collection();
}

const CategoriaSchema = CollectionSchema(
  name: r'Categoria',
  id: 8566002696729659875,
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
    )
  },
  estimateSize: _categoriaEstimateSize,
  serialize: _categoriaSerialize,
  deserialize: _categoriaDeserialize,
  deserializeProp: _categoriaDeserializeProp,
  idName: r'id',
  indexes: {
    r'icone': IndexSchema(
      id: 7580738525658849903,
      name: r'icone',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'icone',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'nome': IndexSchema(
      id: -3554607249464315131,
      name: r'nome',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'nome',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _categoriaGetId,
  getLinks: _categoriaGetLinks,
  attach: _categoriaAttach,
  version: '3.1.0+1',
);

int _categoriaEstimateSize(
  Categoria object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.nome.length * 3;
  return bytesCount;
}

void _categoriaSerialize(
  Categoria object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.icone);
  writer.writeString(offsets[1], object.nome);
}

Categoria _categoriaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Categoria(
    icone: reader.readLong(offsets[0]),
    nome: reader.readString(offsets[1]),
  );
  object.id = id;
  return object;
}

P _categoriaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _categoriaGetId(Categoria object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _categoriaGetLinks(Categoria object) {
  return [];
}

void _categoriaAttach(IsarCollection<dynamic> col, Id id, Categoria object) {
  object.id = id;
}

extension CategoriaByIndex on IsarCollection<Categoria> {
  Future<Categoria?> getByNome(String nome) {
    return getByIndex(r'nome', [nome]);
  }

  Categoria? getByNomeSync(String nome) {
    return getByIndexSync(r'nome', [nome]);
  }

  Future<bool> deleteByNome(String nome) {
    return deleteByIndex(r'nome', [nome]);
  }

  bool deleteByNomeSync(String nome) {
    return deleteByIndexSync(r'nome', [nome]);
  }

  Future<List<Categoria?>> getAllByNome(List<String> nomeValues) {
    final values = nomeValues.map((e) => [e]).toList();
    return getAllByIndex(r'nome', values);
  }

  List<Categoria?> getAllByNomeSync(List<String> nomeValues) {
    final values = nomeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'nome', values);
  }

  Future<int> deleteAllByNome(List<String> nomeValues) {
    final values = nomeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'nome', values);
  }

  int deleteAllByNomeSync(List<String> nomeValues) {
    final values = nomeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'nome', values);
  }

  Future<Id> putByNome(Categoria object) {
    return putByIndex(r'nome', object);
  }

  Id putByNomeSync(Categoria object, {bool saveLinks = true}) {
    return putByIndexSync(r'nome', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByNome(List<Categoria> objects) {
    return putAllByIndex(r'nome', objects);
  }

  List<Id> putAllByNomeSync(List<Categoria> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'nome', objects, saveLinks: saveLinks);
  }
}

extension CategoriaQueryWhereSort
    on QueryBuilder<Categoria, Categoria, QWhere> {
  QueryBuilder<Categoria, Categoria, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterWhere> anyIcone() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'icone'),
      );
    });
  }
}

extension CategoriaQueryWhere
    on QueryBuilder<Categoria, Categoria, QWhereClause> {
  QueryBuilder<Categoria, Categoria, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Categoria, Categoria, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterWhereClause> idBetween(
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

  QueryBuilder<Categoria, Categoria, QAfterWhereClause> iconeEqualTo(
      int icone) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'icone',
        value: [icone],
      ));
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterWhereClause> iconeNotEqualTo(
      int icone) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'icone',
              lower: [],
              upper: [icone],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'icone',
              lower: [icone],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'icone',
              lower: [icone],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'icone',
              lower: [],
              upper: [icone],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterWhereClause> iconeGreaterThan(
    int icone, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'icone',
        lower: [icone],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterWhereClause> iconeLessThan(
    int icone, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'icone',
        lower: [],
        upper: [icone],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterWhereClause> iconeBetween(
    int lowerIcone,
    int upperIcone, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'icone',
        lower: [lowerIcone],
        includeLower: includeLower,
        upper: [upperIcone],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterWhereClause> nomeEqualTo(
      String nome) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'nome',
        value: [nome],
      ));
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterWhereClause> nomeNotEqualTo(
      String nome) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nome',
              lower: [],
              upper: [nome],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nome',
              lower: [nome],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nome',
              lower: [nome],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'nome',
              lower: [],
              upper: [nome],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CategoriaQueryFilter
    on QueryBuilder<Categoria, Categoria, QFilterCondition> {
  QueryBuilder<Categoria, Categoria, QAfterFilterCondition> iconeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'icone',
        value: value,
      ));
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterFilterCondition> iconeGreaterThan(
    int value, {
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

  QueryBuilder<Categoria, Categoria, QAfterFilterCondition> iconeLessThan(
    int value, {
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

  QueryBuilder<Categoria, Categoria, QAfterFilterCondition> iconeBetween(
    int lower,
    int upper, {
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

  QueryBuilder<Categoria, Categoria, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Categoria, Categoria, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Categoria, Categoria, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Categoria, Categoria, QAfterFilterCondition> nomeEqualTo(
    String value, {
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

  QueryBuilder<Categoria, Categoria, QAfterFilterCondition> nomeGreaterThan(
    String value, {
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

  QueryBuilder<Categoria, Categoria, QAfterFilterCondition> nomeLessThan(
    String value, {
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

  QueryBuilder<Categoria, Categoria, QAfterFilterCondition> nomeBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Categoria, Categoria, QAfterFilterCondition> nomeStartsWith(
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

  QueryBuilder<Categoria, Categoria, QAfterFilterCondition> nomeEndsWith(
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

  QueryBuilder<Categoria, Categoria, QAfterFilterCondition> nomeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nome',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterFilterCondition> nomeMatches(
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

  QueryBuilder<Categoria, Categoria, QAfterFilterCondition> nomeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nome',
        value: '',
      ));
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterFilterCondition> nomeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nome',
        value: '',
      ));
    });
  }
}

extension CategoriaQueryObject
    on QueryBuilder<Categoria, Categoria, QFilterCondition> {}

extension CategoriaQueryLinks
    on QueryBuilder<Categoria, Categoria, QFilterCondition> {}

extension CategoriaQuerySortBy on QueryBuilder<Categoria, Categoria, QSortBy> {
  QueryBuilder<Categoria, Categoria, QAfterSortBy> sortByIcone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icone', Sort.asc);
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterSortBy> sortByIconeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icone', Sort.desc);
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterSortBy> sortByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterSortBy> sortByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }
}

extension CategoriaQuerySortThenBy
    on QueryBuilder<Categoria, Categoria, QSortThenBy> {
  QueryBuilder<Categoria, Categoria, QAfterSortBy> thenByIcone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icone', Sort.asc);
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterSortBy> thenByIconeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icone', Sort.desc);
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterSortBy> thenByNome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.asc);
    });
  }

  QueryBuilder<Categoria, Categoria, QAfterSortBy> thenByNomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome', Sort.desc);
    });
  }
}

extension CategoriaQueryWhereDistinct
    on QueryBuilder<Categoria, Categoria, QDistinct> {
  QueryBuilder<Categoria, Categoria, QDistinct> distinctByIcone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'icone');
    });
  }

  QueryBuilder<Categoria, Categoria, QDistinct> distinctByNome(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nome', caseSensitive: caseSensitive);
    });
  }
}

extension CategoriaQueryProperty
    on QueryBuilder<Categoria, Categoria, QQueryProperty> {
  QueryBuilder<Categoria, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Categoria, int, QQueryOperations> iconeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'icone');
    });
  }

  QueryBuilder<Categoria, String, QQueryOperations> nomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nome');
    });
  }
}
