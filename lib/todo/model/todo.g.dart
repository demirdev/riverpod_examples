// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetTodoCollection on Isar {
  IsarCollection<Todo> get todos => getCollection();
}

const TodoSchema = CollectionSchema(
  name: 'Todo',
  schema:
      '{"name":"Todo","idName":"id","properties":[{"name":"completedTime","type":"Long"},{"name":"createdTime","type":"Long"},{"name":"isCompleted","type":"Bool"},{"name":"text","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'completedTime': 0,
    'createdTime': 1,
    'isCompleted': 2,
    'text': 3
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _todoGetId,
  setId: _todoSetId,
  getLinks: _todoGetLinks,
  attachLinks: _todoAttachLinks,
  serializeNative: _todoSerializeNative,
  deserializeNative: _todoDeserializeNative,
  deserializePropNative: _todoDeserializePropNative,
  serializeWeb: _todoSerializeWeb,
  deserializeWeb: _todoDeserializeWeb,
  deserializePropWeb: _todoDeserializePropWeb,
  version: 3,
);

int? _todoGetId(Todo object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _todoSetId(Todo object, int id) {
  object.id = id;
}

List<IsarLinkBase> _todoGetLinks(Todo object) {
  return [];
}

void _todoSerializeNative(IsarCollection<Todo> collection, IsarRawObject rawObj,
    Todo object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.completedTime;
  final _completedTime = value0;
  final value1 = object.createdTime;
  final _createdTime = value1;
  final value2 = object.isCompleted;
  final _isCompleted = value2;
  final value3 = object.text;
  final _text = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_text.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDateTime(offsets[0], _completedTime);
  writer.writeDateTime(offsets[1], _createdTime);
  writer.writeBool(offsets[2], _isCompleted);
  writer.writeBytes(offsets[3], _text);
}

Todo _todoDeserializeNative(IsarCollection<Todo> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Todo(
    reader.readString(offsets[3]),
    completedTime: reader.readDateTimeOrNull(offsets[0]),
    createdTime: reader.readDateTimeOrNull(offsets[1]),
    id: id,
    isCompleted: reader.readBool(offsets[2]),
  );
  return object;
}

P _todoDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _todoSerializeWeb(IsarCollection<Todo> collection, Todo object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'completedTime',
      object.completedTime?.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(
      jsObj, 'createdTime', object.createdTime?.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'isCompleted', object.isCompleted);
  IsarNative.jsObjectSet(jsObj, 'text', object.text);
  return jsObj;
}

Todo _todoDeserializeWeb(IsarCollection<Todo> collection, dynamic jsObj) {
  final object = Todo(
    IsarNative.jsObjectGet(jsObj, 'text') ?? '',
    completedTime: IsarNative.jsObjectGet(jsObj, 'completedTime') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'completedTime'),
                isUtc: true)
            .toLocal()
        : null,
    createdTime: IsarNative.jsObjectGet(jsObj, 'createdTime') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'createdTime'),
                isUtc: true)
            .toLocal()
        : null,
    id: IsarNative.jsObjectGet(jsObj, 'id'),
    isCompleted: IsarNative.jsObjectGet(jsObj, 'isCompleted') ?? false,
  );
  return object;
}

P _todoDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'completedTime':
      return (IsarNative.jsObjectGet(jsObj, 'completedTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'completedTime'),
                  isUtc: true)
              .toLocal()
          : null) as P;
    case 'createdTime':
      return (IsarNative.jsObjectGet(jsObj, 'createdTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'createdTime'),
                  isUtc: true)
              .toLocal()
          : null) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'isCompleted':
      return (IsarNative.jsObjectGet(jsObj, 'isCompleted') ?? false) as P;
    case 'text':
      return (IsarNative.jsObjectGet(jsObj, 'text') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _todoAttachLinks(IsarCollection col, int id, Todo object) {}

extension TodoQueryWhereSort on QueryBuilder<Todo, Todo, QWhere> {
  QueryBuilder<Todo, Todo, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension TodoQueryWhere on QueryBuilder<Todo, Todo, QWhereClause> {
  QueryBuilder<Todo, Todo, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Todo, Todo, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Todo, Todo, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Todo, Todo, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension TodoQueryFilter on QueryBuilder<Todo, Todo, QFilterCondition> {
  QueryBuilder<Todo, Todo, QAfterFilterCondition> completedTimeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'completedTime',
      value: null,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> completedTimeEqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'completedTime',
      value: value,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> completedTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'completedTime',
      value: value,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> completedTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'completedTime',
      value: value,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> completedTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'completedTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> createdTimeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'createdTime',
      value: null,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> createdTimeEqualTo(
      DateTime? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'createdTime',
      value: value,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> createdTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'createdTime',
      value: value,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> createdTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'createdTime',
      value: value,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> createdTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'createdTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> idLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> isCompletedEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isCompleted',
      value: value,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> textEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'text',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> textGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'text',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> textLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'text',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> textBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'text',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'text',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'text',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> textContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'text',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Todo, Todo, QAfterFilterCondition> textMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'text',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension TodoQueryLinks on QueryBuilder<Todo, Todo, QFilterCondition> {}

extension TodoQueryWhereSortBy on QueryBuilder<Todo, Todo, QSortBy> {
  QueryBuilder<Todo, Todo, QAfterSortBy> sortByCompletedTime() {
    return addSortByInternal('completedTime', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByCompletedTimeDesc() {
    return addSortByInternal('completedTime', Sort.desc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByCreatedTime() {
    return addSortByInternal('createdTime', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByCreatedTimeDesc() {
    return addSortByInternal('createdTime', Sort.desc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByIsCompleted() {
    return addSortByInternal('isCompleted', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByIsCompletedDesc() {
    return addSortByInternal('isCompleted', Sort.desc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByText() {
    return addSortByInternal('text', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> sortByTextDesc() {
    return addSortByInternal('text', Sort.desc);
  }
}

extension TodoQueryWhereSortThenBy on QueryBuilder<Todo, Todo, QSortThenBy> {
  QueryBuilder<Todo, Todo, QAfterSortBy> thenByCompletedTime() {
    return addSortByInternal('completedTime', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByCompletedTimeDesc() {
    return addSortByInternal('completedTime', Sort.desc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByCreatedTime() {
    return addSortByInternal('createdTime', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByCreatedTimeDesc() {
    return addSortByInternal('createdTime', Sort.desc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByIsCompleted() {
    return addSortByInternal('isCompleted', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByIsCompletedDesc() {
    return addSortByInternal('isCompleted', Sort.desc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByText() {
    return addSortByInternal('text', Sort.asc);
  }

  QueryBuilder<Todo, Todo, QAfterSortBy> thenByTextDesc() {
    return addSortByInternal('text', Sort.desc);
  }
}

extension TodoQueryWhereDistinct on QueryBuilder<Todo, Todo, QDistinct> {
  QueryBuilder<Todo, Todo, QDistinct> distinctByCompletedTime() {
    return addDistinctByInternal('completedTime');
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByCreatedTime() {
    return addDistinctByInternal('createdTime');
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByIsCompleted() {
    return addDistinctByInternal('isCompleted');
  }

  QueryBuilder<Todo, Todo, QDistinct> distinctByText(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('text', caseSensitive: caseSensitive);
  }
}

extension TodoQueryProperty on QueryBuilder<Todo, Todo, QQueryProperty> {
  QueryBuilder<Todo, DateTime?, QQueryOperations> completedTimeProperty() {
    return addPropertyNameInternal('completedTime');
  }

  QueryBuilder<Todo, DateTime?, QQueryOperations> createdTimeProperty() {
    return addPropertyNameInternal('createdTime');
  }

  QueryBuilder<Todo, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Todo, bool, QQueryOperations> isCompletedProperty() {
    return addPropertyNameInternal('isCompleted');
  }

  QueryBuilder<Todo, String, QQueryOperations> textProperty() {
    return addPropertyNameInternal('text');
  }
}
