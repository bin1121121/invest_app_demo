// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserModelTable extends UserModel
    with TableInfo<$UserModelTable, UserModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userNameMeta =
      const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [userName, email, password];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_model';
  @override
  VerificationContext validateIntegrity(Insertable<UserModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserModelData(
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
    );
  }

  @override
  $UserModelTable createAlias(String alias) {
    return $UserModelTable(attachedDatabase, alias);
  }
}

class UserModelData extends DataClass implements Insertable<UserModelData> {
  final String userName;
  final String email;
  final String password;
  const UserModelData(
      {required this.userName, required this.email, required this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_name'] = Variable<String>(userName);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    return map;
  }

  UserModelCompanion toCompanion(bool nullToAbsent) {
    return UserModelCompanion(
      userName: Value(userName),
      email: Value(email),
      password: Value(password),
    );
  }

  factory UserModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserModelData(
      userName: serializer.fromJson<String>(json['userName']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userName': serializer.toJson<String>(userName),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
    };
  }

  UserModelData copyWith({String? userName, String? email, String? password}) =>
      UserModelData(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
      );
  UserModelData copyWithCompanion(UserModelCompanion data) {
    return UserModelData(
      userName: data.userName.present ? data.userName.value : this.userName,
      email: data.email.present ? data.email.value : this.email,
      password: data.password.present ? data.password.value : this.password,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserModelData(')
          ..write('userName: $userName, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userName, email, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModelData &&
          other.userName == this.userName &&
          other.email == this.email &&
          other.password == this.password);
}

class UserModelCompanion extends UpdateCompanion<UserModelData> {
  final Value<String> userName;
  final Value<String> email;
  final Value<String> password;
  final Value<int> rowid;
  const UserModelCompanion({
    this.userName = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserModelCompanion.insert({
    required String userName,
    required String email,
    required String password,
    this.rowid = const Value.absent(),
  })  : userName = Value(userName),
        email = Value(email),
        password = Value(password);
  static Insertable<UserModelData> custom({
    Expression<String>? userName,
    Expression<String>? email,
    Expression<String>? password,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userName != null) 'user_name': userName,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserModelCompanion copyWith(
      {Value<String>? userName,
      Value<String>? email,
      Value<String>? password,
      Value<int>? rowid}) {
    return UserModelCompanion(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserModelCompanion(')
          ..write('userName: $userName, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NotificationLocalTable extends NotificationLocal
    with TableInfo<$NotificationLocalTable, NotificationLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _thumbnailMeta =
      const VerificationMeta('thumbnail');
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
      'thumbnail', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, thumbnail, description, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notification_local';
  @override
  VerificationContext validateIntegrity(
      Insertable<NotificationLocalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    } else if (isInserting) {
      context.missing(_thumbnailMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  NotificationLocalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationLocalData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      thumbnail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $NotificationLocalTable createAlias(String alias) {
    return $NotificationLocalTable(attachedDatabase, alias);
  }
}

class NotificationLocalData extends DataClass
    implements Insertable<NotificationLocalData> {
  final String id;
  final String thumbnail;
  final String description;
  final DateTime createdAt;
  const NotificationLocalData(
      {required this.id,
      required this.thumbnail,
      required this.description,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['thumbnail'] = Variable<String>(thumbnail);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  NotificationLocalCompanion toCompanion(bool nullToAbsent) {
    return NotificationLocalCompanion(
      id: Value(id),
      thumbnail: Value(thumbnail),
      description: Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory NotificationLocalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationLocalData(
      id: serializer.fromJson<String>(json['id']),
      thumbnail: serializer.fromJson<String>(json['thumbnail']),
      description: serializer.fromJson<String>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'thumbnail': serializer.toJson<String>(thumbnail),
      'description': serializer.toJson<String>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  NotificationLocalData copyWith(
          {String? id,
          String? thumbnail,
          String? description,
          DateTime? createdAt}) =>
      NotificationLocalData(
        id: id ?? this.id,
        thumbnail: thumbnail ?? this.thumbnail,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
      );
  NotificationLocalData copyWithCompanion(NotificationLocalCompanion data) {
    return NotificationLocalData(
      id: data.id.present ? data.id.value : this.id,
      thumbnail: data.thumbnail.present ? data.thumbnail.value : this.thumbnail,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationLocalData(')
          ..write('id: $id, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, thumbnail, description, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationLocalData &&
          other.id == this.id &&
          other.thumbnail == this.thumbnail &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class NotificationLocalCompanion
    extends UpdateCompanion<NotificationLocalData> {
  final Value<String> id;
  final Value<String> thumbnail;
  final Value<String> description;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const NotificationLocalCompanion({
    this.id = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotificationLocalCompanion.insert({
    required String id,
    required String thumbnail,
    required String description,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        thumbnail = Value(thumbnail),
        description = Value(description),
        createdAt = Value(createdAt);
  static Insertable<NotificationLocalData> custom({
    Expression<String>? id,
    Expression<String>? thumbnail,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotificationLocalCompanion copyWith(
      {Value<String>? id,
      Value<String>? thumbnail,
      Value<String>? description,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return NotificationLocalCompanion(
      id: id ?? this.id,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationLocalCompanion(')
          ..write('id: $id, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserModelTable userModel = $UserModelTable(this);
  late final $NotificationLocalTable notificationLocal =
      $NotificationLocalTable(this);
  late final UserModelDao userModelDao = UserModelDao(this as AppDatabase);
  late final NotificationLocalDao notificationLocalDao =
      NotificationLocalDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userModel, notificationLocal];
}

typedef $$UserModelTableCreateCompanionBuilder = UserModelCompanion Function({
  required String userName,
  required String email,
  required String password,
  Value<int> rowid,
});
typedef $$UserModelTableUpdateCompanionBuilder = UserModelCompanion Function({
  Value<String> userName,
  Value<String> email,
  Value<String> password,
  Value<int> rowid,
});

class $$UserModelTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserModelTable,
    UserModelData,
    $$UserModelTableFilterComposer,
    $$UserModelTableOrderingComposer,
    $$UserModelTableCreateCompanionBuilder,
    $$UserModelTableUpdateCompanionBuilder> {
  $$UserModelTableTableManager(_$AppDatabase db, $UserModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserModelTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserModelTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> userName = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> password = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserModelCompanion(
            userName: userName,
            email: email,
            password: password,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String userName,
            required String email,
            required String password,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserModelCompanion.insert(
            userName: userName,
            email: email,
            password: password,
            rowid: rowid,
          ),
        ));
}

class $$UserModelTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UserModelTable> {
  $$UserModelTableFilterComposer(super.$state);
  ColumnFilters<String> get userName => $state.composableBuilder(
      column: $state.table.userName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get password => $state.composableBuilder(
      column: $state.table.password,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UserModelTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UserModelTable> {
  $$UserModelTableOrderingComposer(super.$state);
  ColumnOrderings<String> get userName => $state.composableBuilder(
      column: $state.table.userName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get password => $state.composableBuilder(
      column: $state.table.password,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$NotificationLocalTableCreateCompanionBuilder
    = NotificationLocalCompanion Function({
  required String id,
  required String thumbnail,
  required String description,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$NotificationLocalTableUpdateCompanionBuilder
    = NotificationLocalCompanion Function({
  Value<String> id,
  Value<String> thumbnail,
  Value<String> description,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$NotificationLocalTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NotificationLocalTable,
    NotificationLocalData,
    $$NotificationLocalTableFilterComposer,
    $$NotificationLocalTableOrderingComposer,
    $$NotificationLocalTableCreateCompanionBuilder,
    $$NotificationLocalTableUpdateCompanionBuilder> {
  $$NotificationLocalTableTableManager(
      _$AppDatabase db, $NotificationLocalTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$NotificationLocalTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$NotificationLocalTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> thumbnail = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NotificationLocalCompanion(
            id: id,
            thumbnail: thumbnail,
            description: description,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String thumbnail,
            required String description,
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              NotificationLocalCompanion.insert(
            id: id,
            thumbnail: thumbnail,
            description: description,
            createdAt: createdAt,
            rowid: rowid,
          ),
        ));
}

class $$NotificationLocalTableFilterComposer
    extends FilterComposer<_$AppDatabase, $NotificationLocalTable> {
  $$NotificationLocalTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get thumbnail => $state.composableBuilder(
      column: $state.table.thumbnail,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$NotificationLocalTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $NotificationLocalTable> {
  $$NotificationLocalTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get thumbnail => $state.composableBuilder(
      column: $state.table.thumbnail,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserModelTableTableManager get userModel =>
      $$UserModelTableTableManager(_db, _db.userModel);
  $$NotificationLocalTableTableManager get notificationLocal =>
      $$NotificationLocalTableTableManager(_db, _db.notificationLocal);
}