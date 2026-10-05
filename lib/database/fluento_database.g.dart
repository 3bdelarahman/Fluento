// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fluento_database.dart';

// ignore_for_file: type=lint
class $ReadingSessionsTableTable extends ReadingSessionsTable
    with TableInfo<$ReadingSessionsTableTable, ReadingSessionsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReadingSessionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _articleIdMeta = const VerificationMeta(
    'articleId',
  );
  @override
  late final GeneratedColumn<String> articleId = GeneratedColumn<String>(
    'article_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _articleTitleMeta = const VerificationMeta(
    'articleTitle',
  );
  @override
  late final GeneratedColumn<String> articleTitle = GeneratedColumn<String>(
    'article_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _overallScoreMeta = const VerificationMeta(
    'overallScore',
  );
  @override
  late final GeneratedColumn<double> overallScore = GeneratedColumn<double>(
    'overall_score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _readingAccuracyMeta = const VerificationMeta(
    'readingAccuracy',
  );
  @override
  late final GeneratedColumn<double> readingAccuracy = GeneratedColumn<double>(
    'reading_accuracy',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pronunciationScoreMeta =
      const VerificationMeta('pronunciationScore');
  @override
  late final GeneratedColumn<double> pronunciationScore =
      GeneratedColumn<double>(
        'pronunciation_score',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _fluencyScoreMeta = const VerificationMeta(
    'fluencyScore',
  );
  @override
  late final GeneratedColumn<double> fluencyScore = GeneratedColumn<double>(
    'fluency_score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wpmMeta = const VerificationMeta('wpm');
  @override
  late final GeneratedColumn<int> wpm = GeneratedColumn<int>(
    'wpm',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wordsReadMeta = const VerificationMeta(
    'wordsRead',
  );
  @override
  late final GeneratedColumn<int> wordsRead = GeneratedColumn<int>(
    'words_read',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    articleId,
    articleTitle,
    overallScore,
    readingAccuracy,
    pronunciationScore,
    fluencyScore,
    wpm,
    wordsRead,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reading_sessions_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReadingSessionsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('article_id')) {
      context.handle(
        _articleIdMeta,
        articleId.isAcceptableOrUnknown(data['article_id']!, _articleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_articleIdMeta);
    }
    if (data.containsKey('article_title')) {
      context.handle(
        _articleTitleMeta,
        articleTitle.isAcceptableOrUnknown(
          data['article_title']!,
          _articleTitleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_articleTitleMeta);
    }
    if (data.containsKey('overall_score')) {
      context.handle(
        _overallScoreMeta,
        overallScore.isAcceptableOrUnknown(
          data['overall_score']!,
          _overallScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_overallScoreMeta);
    }
    if (data.containsKey('reading_accuracy')) {
      context.handle(
        _readingAccuracyMeta,
        readingAccuracy.isAcceptableOrUnknown(
          data['reading_accuracy']!,
          _readingAccuracyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_readingAccuracyMeta);
    }
    if (data.containsKey('pronunciation_score')) {
      context.handle(
        _pronunciationScoreMeta,
        pronunciationScore.isAcceptableOrUnknown(
          data['pronunciation_score']!,
          _pronunciationScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pronunciationScoreMeta);
    }
    if (data.containsKey('fluency_score')) {
      context.handle(
        _fluencyScoreMeta,
        fluencyScore.isAcceptableOrUnknown(
          data['fluency_score']!,
          _fluencyScoreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fluencyScoreMeta);
    }
    if (data.containsKey('wpm')) {
      context.handle(
        _wpmMeta,
        wpm.isAcceptableOrUnknown(data['wpm']!, _wpmMeta),
      );
    } else if (isInserting) {
      context.missing(_wpmMeta);
    }
    if (data.containsKey('words_read')) {
      context.handle(
        _wordsReadMeta,
        wordsRead.isAcceptableOrUnknown(data['words_read']!, _wordsReadMeta),
      );
    } else if (isInserting) {
      context.missing(_wordsReadMeta);
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReadingSessionsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReadingSessionsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      articleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}article_id'],
      )!,
      articleTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}article_title'],
      )!,
      overallScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}overall_score'],
      )!,
      readingAccuracy: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}reading_accuracy'],
      )!,
      pronunciationScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}pronunciation_score'],
      )!,
      fluencyScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fluency_score'],
      )!,
      wpm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wpm'],
      )!,
      wordsRead: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}words_read'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      )!,
    );
  }

  @override
  $ReadingSessionsTableTable createAlias(String alias) {
    return $ReadingSessionsTableTable(attachedDatabase, alias);
  }
}

class ReadingSessionsTableData extends DataClass
    implements Insertable<ReadingSessionsTableData> {
  final String id;
  final String articleId;
  final String articleTitle;
  final double overallScore;
  final double readingAccuracy;
  final double pronunciationScore;
  final double fluencyScore;
  final int wpm;
  final int wordsRead;
  final DateTime completedAt;
  const ReadingSessionsTableData({
    required this.id,
    required this.articleId,
    required this.articleTitle,
    required this.overallScore,
    required this.readingAccuracy,
    required this.pronunciationScore,
    required this.fluencyScore,
    required this.wpm,
    required this.wordsRead,
    required this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['article_id'] = Variable<String>(articleId);
    map['article_title'] = Variable<String>(articleTitle);
    map['overall_score'] = Variable<double>(overallScore);
    map['reading_accuracy'] = Variable<double>(readingAccuracy);
    map['pronunciation_score'] = Variable<double>(pronunciationScore);
    map['fluency_score'] = Variable<double>(fluencyScore);
    map['wpm'] = Variable<int>(wpm);
    map['words_read'] = Variable<int>(wordsRead);
    map['completed_at'] = Variable<DateTime>(completedAt);
    return map;
  }

  ReadingSessionsTableCompanion toCompanion(bool nullToAbsent) {
    return ReadingSessionsTableCompanion(
      id: Value(id),
      articleId: Value(articleId),
      articleTitle: Value(articleTitle),
      overallScore: Value(overallScore),
      readingAccuracy: Value(readingAccuracy),
      pronunciationScore: Value(pronunciationScore),
      fluencyScore: Value(fluencyScore),
      wpm: Value(wpm),
      wordsRead: Value(wordsRead),
      completedAt: Value(completedAt),
    );
  }

  factory ReadingSessionsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReadingSessionsTableData(
      id: serializer.fromJson<String>(json['id']),
      articleId: serializer.fromJson<String>(json['articleId']),
      articleTitle: serializer.fromJson<String>(json['articleTitle']),
      overallScore: serializer.fromJson<double>(json['overallScore']),
      readingAccuracy: serializer.fromJson<double>(json['readingAccuracy']),
      pronunciationScore: serializer.fromJson<double>(
        json['pronunciationScore'],
      ),
      fluencyScore: serializer.fromJson<double>(json['fluencyScore']),
      wpm: serializer.fromJson<int>(json['wpm']),
      wordsRead: serializer.fromJson<int>(json['wordsRead']),
      completedAt: serializer.fromJson<DateTime>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'articleId': serializer.toJson<String>(articleId),
      'articleTitle': serializer.toJson<String>(articleTitle),
      'overallScore': serializer.toJson<double>(overallScore),
      'readingAccuracy': serializer.toJson<double>(readingAccuracy),
      'pronunciationScore': serializer.toJson<double>(pronunciationScore),
      'fluencyScore': serializer.toJson<double>(fluencyScore),
      'wpm': serializer.toJson<int>(wpm),
      'wordsRead': serializer.toJson<int>(wordsRead),
      'completedAt': serializer.toJson<DateTime>(completedAt),
    };
  }

  ReadingSessionsTableData copyWith({
    String? id,
    String? articleId,
    String? articleTitle,
    double? overallScore,
    double? readingAccuracy,
    double? pronunciationScore,
    double? fluencyScore,
    int? wpm,
    int? wordsRead,
    DateTime? completedAt,
  }) => ReadingSessionsTableData(
    id: id ?? this.id,
    articleId: articleId ?? this.articleId,
    articleTitle: articleTitle ?? this.articleTitle,
    overallScore: overallScore ?? this.overallScore,
    readingAccuracy: readingAccuracy ?? this.readingAccuracy,
    pronunciationScore: pronunciationScore ?? this.pronunciationScore,
    fluencyScore: fluencyScore ?? this.fluencyScore,
    wpm: wpm ?? this.wpm,
    wordsRead: wordsRead ?? this.wordsRead,
    completedAt: completedAt ?? this.completedAt,
  );
  ReadingSessionsTableData copyWithCompanion(
    ReadingSessionsTableCompanion data,
  ) {
    return ReadingSessionsTableData(
      id: data.id.present ? data.id.value : this.id,
      articleId: data.articleId.present ? data.articleId.value : this.articleId,
      articleTitle: data.articleTitle.present
          ? data.articleTitle.value
          : this.articleTitle,
      overallScore: data.overallScore.present
          ? data.overallScore.value
          : this.overallScore,
      readingAccuracy: data.readingAccuracy.present
          ? data.readingAccuracy.value
          : this.readingAccuracy,
      pronunciationScore: data.pronunciationScore.present
          ? data.pronunciationScore.value
          : this.pronunciationScore,
      fluencyScore: data.fluencyScore.present
          ? data.fluencyScore.value
          : this.fluencyScore,
      wpm: data.wpm.present ? data.wpm.value : this.wpm,
      wordsRead: data.wordsRead.present ? data.wordsRead.value : this.wordsRead,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReadingSessionsTableData(')
          ..write('id: $id, ')
          ..write('articleId: $articleId, ')
          ..write('articleTitle: $articleTitle, ')
          ..write('overallScore: $overallScore, ')
          ..write('readingAccuracy: $readingAccuracy, ')
          ..write('pronunciationScore: $pronunciationScore, ')
          ..write('fluencyScore: $fluencyScore, ')
          ..write('wpm: $wpm, ')
          ..write('wordsRead: $wordsRead, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    articleId,
    articleTitle,
    overallScore,
    readingAccuracy,
    pronunciationScore,
    fluencyScore,
    wpm,
    wordsRead,
    completedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReadingSessionsTableData &&
          other.id == this.id &&
          other.articleId == this.articleId &&
          other.articleTitle == this.articleTitle &&
          other.overallScore == this.overallScore &&
          other.readingAccuracy == this.readingAccuracy &&
          other.pronunciationScore == this.pronunciationScore &&
          other.fluencyScore == this.fluencyScore &&
          other.wpm == this.wpm &&
          other.wordsRead == this.wordsRead &&
          other.completedAt == this.completedAt);
}

class ReadingSessionsTableCompanion
    extends UpdateCompanion<ReadingSessionsTableData> {
  final Value<String> id;
  final Value<String> articleId;
  final Value<String> articleTitle;
  final Value<double> overallScore;
  final Value<double> readingAccuracy;
  final Value<double> pronunciationScore;
  final Value<double> fluencyScore;
  final Value<int> wpm;
  final Value<int> wordsRead;
  final Value<DateTime> completedAt;
  final Value<int> rowid;
  const ReadingSessionsTableCompanion({
    this.id = const Value.absent(),
    this.articleId = const Value.absent(),
    this.articleTitle = const Value.absent(),
    this.overallScore = const Value.absent(),
    this.readingAccuracy = const Value.absent(),
    this.pronunciationScore = const Value.absent(),
    this.fluencyScore = const Value.absent(),
    this.wpm = const Value.absent(),
    this.wordsRead = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReadingSessionsTableCompanion.insert({
    required String id,
    required String articleId,
    required String articleTitle,
    required double overallScore,
    required double readingAccuracy,
    required double pronunciationScore,
    required double fluencyScore,
    required int wpm,
    required int wordsRead,
    required DateTime completedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       articleId = Value(articleId),
       articleTitle = Value(articleTitle),
       overallScore = Value(overallScore),
       readingAccuracy = Value(readingAccuracy),
       pronunciationScore = Value(pronunciationScore),
       fluencyScore = Value(fluencyScore),
       wpm = Value(wpm),
       wordsRead = Value(wordsRead),
       completedAt = Value(completedAt);
  static Insertable<ReadingSessionsTableData> custom({
    Expression<String>? id,
    Expression<String>? articleId,
    Expression<String>? articleTitle,
    Expression<double>? overallScore,
    Expression<double>? readingAccuracy,
    Expression<double>? pronunciationScore,
    Expression<double>? fluencyScore,
    Expression<int>? wpm,
    Expression<int>? wordsRead,
    Expression<DateTime>? completedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (articleId != null) 'article_id': articleId,
      if (articleTitle != null) 'article_title': articleTitle,
      if (overallScore != null) 'overall_score': overallScore,
      if (readingAccuracy != null) 'reading_accuracy': readingAccuracy,
      if (pronunciationScore != null) 'pronunciation_score': pronunciationScore,
      if (fluencyScore != null) 'fluency_score': fluencyScore,
      if (wpm != null) 'wpm': wpm,
      if (wordsRead != null) 'words_read': wordsRead,
      if (completedAt != null) 'completed_at': completedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReadingSessionsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? articleId,
    Value<String>? articleTitle,
    Value<double>? overallScore,
    Value<double>? readingAccuracy,
    Value<double>? pronunciationScore,
    Value<double>? fluencyScore,
    Value<int>? wpm,
    Value<int>? wordsRead,
    Value<DateTime>? completedAt,
    Value<int>? rowid,
  }) {
    return ReadingSessionsTableCompanion(
      id: id ?? this.id,
      articleId: articleId ?? this.articleId,
      articleTitle: articleTitle ?? this.articleTitle,
      overallScore: overallScore ?? this.overallScore,
      readingAccuracy: readingAccuracy ?? this.readingAccuracy,
      pronunciationScore: pronunciationScore ?? this.pronunciationScore,
      fluencyScore: fluencyScore ?? this.fluencyScore,
      wpm: wpm ?? this.wpm,
      wordsRead: wordsRead ?? this.wordsRead,
      completedAt: completedAt ?? this.completedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (articleId.present) {
      map['article_id'] = Variable<String>(articleId.value);
    }
    if (articleTitle.present) {
      map['article_title'] = Variable<String>(articleTitle.value);
    }
    if (overallScore.present) {
      map['overall_score'] = Variable<double>(overallScore.value);
    }
    if (readingAccuracy.present) {
      map['reading_accuracy'] = Variable<double>(readingAccuracy.value);
    }
    if (pronunciationScore.present) {
      map['pronunciation_score'] = Variable<double>(pronunciationScore.value);
    }
    if (fluencyScore.present) {
      map['fluency_score'] = Variable<double>(fluencyScore.value);
    }
    if (wpm.present) {
      map['wpm'] = Variable<int>(wpm.value);
    }
    if (wordsRead.present) {
      map['words_read'] = Variable<int>(wordsRead.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReadingSessionsTableCompanion(')
          ..write('id: $id, ')
          ..write('articleId: $articleId, ')
          ..write('articleTitle: $articleTitle, ')
          ..write('overallScore: $overallScore, ')
          ..write('readingAccuracy: $readingAccuracy, ')
          ..write('pronunciationScore: $pronunciationScore, ')
          ..write('fluencyScore: $fluencyScore, ')
          ..write('wpm: $wpm, ')
          ..write('wordsRead: $wordsRead, ')
          ..write('completedAt: $completedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ArticleProgressTableTable extends ArticleProgressTable
    with TableInfo<$ArticleProgressTableTable, ArticleProgressTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticleProgressTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _articleIdMeta = const VerificationMeta(
    'articleId',
  );
  @override
  late final GeneratedColumn<String> articleId = GeneratedColumn<String>(
    'article_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _readCountMeta = const VerificationMeta(
    'readCount',
  );
  @override
  late final GeneratedColumn<int> readCount = GeneratedColumn<int>(
    'read_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _highestScoreMeta = const VerificationMeta(
    'highestScore',
  );
  @override
  late final GeneratedColumn<double> highestScore = GeneratedColumn<double>(
    'highest_score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _lastReadAtMeta = const VerificationMeta(
    'lastReadAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastReadAt = GeneratedColumn<DateTime>(
    'last_read_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    articleId,
    isCompleted,
    readCount,
    highestScore,
    lastReadAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'article_progress_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ArticleProgressTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('article_id')) {
      context.handle(
        _articleIdMeta,
        articleId.isAcceptableOrUnknown(data['article_id']!, _articleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_articleIdMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('read_count')) {
      context.handle(
        _readCountMeta,
        readCount.isAcceptableOrUnknown(data['read_count']!, _readCountMeta),
      );
    }
    if (data.containsKey('highest_score')) {
      context.handle(
        _highestScoreMeta,
        highestScore.isAcceptableOrUnknown(
          data['highest_score']!,
          _highestScoreMeta,
        ),
      );
    }
    if (data.containsKey('last_read_at')) {
      context.handle(
        _lastReadAtMeta,
        lastReadAt.isAcceptableOrUnknown(
          data['last_read_at']!,
          _lastReadAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastReadAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {articleId};
  @override
  ArticleProgressTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArticleProgressTableData(
      articleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}article_id'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      readCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}read_count'],
      )!,
      highestScore: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}highest_score'],
      )!,
      lastReadAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_read_at'],
      )!,
    );
  }

  @override
  $ArticleProgressTableTable createAlias(String alias) {
    return $ArticleProgressTableTable(attachedDatabase, alias);
  }
}

class ArticleProgressTableData extends DataClass
    implements Insertable<ArticleProgressTableData> {
  final String articleId;
  final bool isCompleted;
  final int readCount;
  final double highestScore;
  final DateTime lastReadAt;
  const ArticleProgressTableData({
    required this.articleId,
    required this.isCompleted,
    required this.readCount,
    required this.highestScore,
    required this.lastReadAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['article_id'] = Variable<String>(articleId);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['read_count'] = Variable<int>(readCount);
    map['highest_score'] = Variable<double>(highestScore);
    map['last_read_at'] = Variable<DateTime>(lastReadAt);
    return map;
  }

  ArticleProgressTableCompanion toCompanion(bool nullToAbsent) {
    return ArticleProgressTableCompanion(
      articleId: Value(articleId),
      isCompleted: Value(isCompleted),
      readCount: Value(readCount),
      highestScore: Value(highestScore),
      lastReadAt: Value(lastReadAt),
    );
  }

  factory ArticleProgressTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArticleProgressTableData(
      articleId: serializer.fromJson<String>(json['articleId']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      readCount: serializer.fromJson<int>(json['readCount']),
      highestScore: serializer.fromJson<double>(json['highestScore']),
      lastReadAt: serializer.fromJson<DateTime>(json['lastReadAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'articleId': serializer.toJson<String>(articleId),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'readCount': serializer.toJson<int>(readCount),
      'highestScore': serializer.toJson<double>(highestScore),
      'lastReadAt': serializer.toJson<DateTime>(lastReadAt),
    };
  }

  ArticleProgressTableData copyWith({
    String? articleId,
    bool? isCompleted,
    int? readCount,
    double? highestScore,
    DateTime? lastReadAt,
  }) => ArticleProgressTableData(
    articleId: articleId ?? this.articleId,
    isCompleted: isCompleted ?? this.isCompleted,
    readCount: readCount ?? this.readCount,
    highestScore: highestScore ?? this.highestScore,
    lastReadAt: lastReadAt ?? this.lastReadAt,
  );
  ArticleProgressTableData copyWithCompanion(
    ArticleProgressTableCompanion data,
  ) {
    return ArticleProgressTableData(
      articleId: data.articleId.present ? data.articleId.value : this.articleId,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      readCount: data.readCount.present ? data.readCount.value : this.readCount,
      highestScore: data.highestScore.present
          ? data.highestScore.value
          : this.highestScore,
      lastReadAt: data.lastReadAt.present
          ? data.lastReadAt.value
          : this.lastReadAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ArticleProgressTableData(')
          ..write('articleId: $articleId, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('readCount: $readCount, ')
          ..write('highestScore: $highestScore, ')
          ..write('lastReadAt: $lastReadAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(articleId, isCompleted, readCount, highestScore, lastReadAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticleProgressTableData &&
          other.articleId == this.articleId &&
          other.isCompleted == this.isCompleted &&
          other.readCount == this.readCount &&
          other.highestScore == this.highestScore &&
          other.lastReadAt == this.lastReadAt);
}

class ArticleProgressTableCompanion
    extends UpdateCompanion<ArticleProgressTableData> {
  final Value<String> articleId;
  final Value<bool> isCompleted;
  final Value<int> readCount;
  final Value<double> highestScore;
  final Value<DateTime> lastReadAt;
  final Value<int> rowid;
  const ArticleProgressTableCompanion({
    this.articleId = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.readCount = const Value.absent(),
    this.highestScore = const Value.absent(),
    this.lastReadAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArticleProgressTableCompanion.insert({
    required String articleId,
    this.isCompleted = const Value.absent(),
    this.readCount = const Value.absent(),
    this.highestScore = const Value.absent(),
    required DateTime lastReadAt,
    this.rowid = const Value.absent(),
  }) : articleId = Value(articleId),
       lastReadAt = Value(lastReadAt);
  static Insertable<ArticleProgressTableData> custom({
    Expression<String>? articleId,
    Expression<bool>? isCompleted,
    Expression<int>? readCount,
    Expression<double>? highestScore,
    Expression<DateTime>? lastReadAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (articleId != null) 'article_id': articleId,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (readCount != null) 'read_count': readCount,
      if (highestScore != null) 'highest_score': highestScore,
      if (lastReadAt != null) 'last_read_at': lastReadAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArticleProgressTableCompanion copyWith({
    Value<String>? articleId,
    Value<bool>? isCompleted,
    Value<int>? readCount,
    Value<double>? highestScore,
    Value<DateTime>? lastReadAt,
    Value<int>? rowid,
  }) {
    return ArticleProgressTableCompanion(
      articleId: articleId ?? this.articleId,
      isCompleted: isCompleted ?? this.isCompleted,
      readCount: readCount ?? this.readCount,
      highestScore: highestScore ?? this.highestScore,
      lastReadAt: lastReadAt ?? this.lastReadAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (articleId.present) {
      map['article_id'] = Variable<String>(articleId.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (readCount.present) {
      map['read_count'] = Variable<int>(readCount.value);
    }
    if (highestScore.present) {
      map['highest_score'] = Variable<double>(highestScore.value);
    }
    if (lastReadAt.present) {
      map['last_read_at'] = Variable<DateTime>(lastReadAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticleProgressTableCompanion(')
          ..write('articleId: $articleId, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('readCount: $readCount, ')
          ..write('highestScore: $highestScore, ')
          ..write('lastReadAt: $lastReadAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReadingResultsTableTable extends ReadingResultsTable
    with TableInfo<$ReadingResultsTableTable, ReadingResultsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReadingResultsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _encouragementMeta = const VerificationMeta(
    'encouragement',
  );
  @override
  late final GeneratedColumn<String> encouragement = GeneratedColumn<String>(
    'encouragement',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, sessionId, encouragement];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reading_results_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReadingResultsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('encouragement')) {
      context.handle(
        _encouragementMeta,
        encouragement.isAcceptableOrUnknown(
          data['encouragement']!,
          _encouragementMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_encouragementMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReadingResultsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReadingResultsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      encouragement: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}encouragement'],
      )!,
    );
  }

  @override
  $ReadingResultsTableTable createAlias(String alias) {
    return $ReadingResultsTableTable(attachedDatabase, alias);
  }
}

class ReadingResultsTableData extends DataClass
    implements Insertable<ReadingResultsTableData> {
  final String id;
  final String sessionId;
  final String encouragement;
  const ReadingResultsTableData({
    required this.id,
    required this.sessionId,
    required this.encouragement,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    map['encouragement'] = Variable<String>(encouragement);
    return map;
  }

  ReadingResultsTableCompanion toCompanion(bool nullToAbsent) {
    return ReadingResultsTableCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      encouragement: Value(encouragement),
    );
  }

  factory ReadingResultsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReadingResultsTableData(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      encouragement: serializer.fromJson<String>(json['encouragement']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'encouragement': serializer.toJson<String>(encouragement),
    };
  }

  ReadingResultsTableData copyWith({
    String? id,
    String? sessionId,
    String? encouragement,
  }) => ReadingResultsTableData(
    id: id ?? this.id,
    sessionId: sessionId ?? this.sessionId,
    encouragement: encouragement ?? this.encouragement,
  );
  ReadingResultsTableData copyWithCompanion(ReadingResultsTableCompanion data) {
    return ReadingResultsTableData(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      encouragement: data.encouragement.present
          ? data.encouragement.value
          : this.encouragement,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReadingResultsTableData(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('encouragement: $encouragement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sessionId, encouragement);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReadingResultsTableData &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.encouragement == this.encouragement);
}

class ReadingResultsTableCompanion
    extends UpdateCompanion<ReadingResultsTableData> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<String> encouragement;
  final Value<int> rowid;
  const ReadingResultsTableCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.encouragement = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReadingResultsTableCompanion.insert({
    required String id,
    required String sessionId,
    required String encouragement,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sessionId = Value(sessionId),
       encouragement = Value(encouragement);
  static Insertable<ReadingResultsTableData> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<String>? encouragement,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (encouragement != null) 'encouragement': encouragement,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReadingResultsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? sessionId,
    Value<String>? encouragement,
    Value<int>? rowid,
  }) {
    return ReadingResultsTableCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      encouragement: encouragement ?? this.encouragement,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (encouragement.present) {
      map['encouragement'] = Variable<String>(encouragement.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReadingResultsTableCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('encouragement: $encouragement, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WeakPointsTableTable extends WeakPointsTable
    with TableInfo<$WeakPointsTableTable, WeakPointsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeakPointsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pointIdMeta = const VerificationMeta(
    'pointId',
  );
  @override
  late final GeneratedColumn<String> pointId = GeneratedColumn<String>(
    'point_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _articleIdMeta = const VerificationMeta(
    'articleId',
  );
  @override
  late final GeneratedColumn<String> articleId = GeneratedColumn<String>(
    'article_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _focusWordMeta = const VerificationMeta(
    'focusWord',
  );
  @override
  late final GeneratedColumn<String> focusWord = GeneratedColumn<String>(
    'focus_word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sentenceMeta = const VerificationMeta(
    'sentence',
  );
  @override
  late final GeneratedColumn<String> sentence = GeneratedColumn<String>(
    'sentence',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sentenceTranslationMeta =
      const VerificationMeta('sentenceTranslation');
  @override
  late final GeneratedColumn<String> sentenceTranslation =
      GeneratedColumn<String>(
        'sentence_translation',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _explanationMeta = const VerificationMeta(
    'explanation',
  );
  @override
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
    'explanation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minLevelMeta = const VerificationMeta(
    'minLevel',
  );
  @override
  late final GeneratedColumn<String> minLevel = GeneratedColumn<String>(
    'min_level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('b1'),
  );
  static const VerificationMeta _isFixedMeta = const VerificationMeta(
    'isFixed',
  );
  @override
  late final GeneratedColumn<bool> isFixed = GeneratedColumn<bool>(
    'is_fixed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_fixed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _attemptCountMeta = const VerificationMeta(
    'attemptCount',
  );
  @override
  late final GeneratedColumn<int> attemptCount = GeneratedColumn<int>(
    'attempt_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pointId,
    articleId,
    type,
    title,
    description,
    focusWord,
    sentence,
    sentenceTranslation,
    explanation,
    minLevel,
    isFixed,
    attemptCount,
    recordedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weak_points_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeakPointsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('point_id')) {
      context.handle(
        _pointIdMeta,
        pointId.isAcceptableOrUnknown(data['point_id']!, _pointIdMeta),
      );
    } else if (isInserting) {
      context.missing(_pointIdMeta);
    }
    if (data.containsKey('article_id')) {
      context.handle(
        _articleIdMeta,
        articleId.isAcceptableOrUnknown(data['article_id']!, _articleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_articleIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('focus_word')) {
      context.handle(
        _focusWordMeta,
        focusWord.isAcceptableOrUnknown(data['focus_word']!, _focusWordMeta),
      );
    } else if (isInserting) {
      context.missing(_focusWordMeta);
    }
    if (data.containsKey('sentence')) {
      context.handle(
        _sentenceMeta,
        sentence.isAcceptableOrUnknown(data['sentence']!, _sentenceMeta),
      );
    } else if (isInserting) {
      context.missing(_sentenceMeta);
    }
    if (data.containsKey('sentence_translation')) {
      context.handle(
        _sentenceTranslationMeta,
        sentenceTranslation.isAcceptableOrUnknown(
          data['sentence_translation']!,
          _sentenceTranslationMeta,
        ),
      );
    }
    if (data.containsKey('explanation')) {
      context.handle(
        _explanationMeta,
        explanation.isAcceptableOrUnknown(
          data['explanation']!,
          _explanationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_explanationMeta);
    }
    if (data.containsKey('min_level')) {
      context.handle(
        _minLevelMeta,
        minLevel.isAcceptableOrUnknown(data['min_level']!, _minLevelMeta),
      );
    }
    if (data.containsKey('is_fixed')) {
      context.handle(
        _isFixedMeta,
        isFixed.isAcceptableOrUnknown(data['is_fixed']!, _isFixedMeta),
      );
    }
    if (data.containsKey('attempt_count')) {
      context.handle(
        _attemptCountMeta,
        attemptCount.isAcceptableOrUnknown(
          data['attempt_count']!,
          _attemptCountMeta,
        ),
      );
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeakPointsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeakPointsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      pointId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}point_id'],
      )!,
      articleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}article_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      focusWord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}focus_word'],
      )!,
      sentence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sentence'],
      )!,
      sentenceTranslation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sentence_translation'],
      )!,
      explanation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}explanation'],
      )!,
      minLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}min_level'],
      )!,
      isFixed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_fixed'],
      )!,
      attemptCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempt_count'],
      )!,
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
    );
  }

  @override
  $WeakPointsTableTable createAlias(String alias) {
    return $WeakPointsTableTable(attachedDatabase, alias);
  }
}

class WeakPointsTableData extends DataClass
    implements Insertable<WeakPointsTableData> {
  final String id;
  final String pointId;
  final String articleId;
  final String type;
  final String title;
  final String description;
  final String focusWord;
  final String sentence;
  final String sentenceTranslation;
  final String explanation;
  final String minLevel;
  final bool isFixed;
  final int attemptCount;
  final DateTime recordedAt;
  const WeakPointsTableData({
    required this.id,
    required this.pointId,
    required this.articleId,
    required this.type,
    required this.title,
    required this.description,
    required this.focusWord,
    required this.sentence,
    required this.sentenceTranslation,
    required this.explanation,
    required this.minLevel,
    required this.isFixed,
    required this.attemptCount,
    required this.recordedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['point_id'] = Variable<String>(pointId);
    map['article_id'] = Variable<String>(articleId);
    map['type'] = Variable<String>(type);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['focus_word'] = Variable<String>(focusWord);
    map['sentence'] = Variable<String>(sentence);
    map['sentence_translation'] = Variable<String>(sentenceTranslation);
    map['explanation'] = Variable<String>(explanation);
    map['min_level'] = Variable<String>(minLevel);
    map['is_fixed'] = Variable<bool>(isFixed);
    map['attempt_count'] = Variable<int>(attemptCount);
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    return map;
  }

  WeakPointsTableCompanion toCompanion(bool nullToAbsent) {
    return WeakPointsTableCompanion(
      id: Value(id),
      pointId: Value(pointId),
      articleId: Value(articleId),
      type: Value(type),
      title: Value(title),
      description: Value(description),
      focusWord: Value(focusWord),
      sentence: Value(sentence),
      sentenceTranslation: Value(sentenceTranslation),
      explanation: Value(explanation),
      minLevel: Value(minLevel),
      isFixed: Value(isFixed),
      attemptCount: Value(attemptCount),
      recordedAt: Value(recordedAt),
    );
  }

  factory WeakPointsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeakPointsTableData(
      id: serializer.fromJson<String>(json['id']),
      pointId: serializer.fromJson<String>(json['pointId']),
      articleId: serializer.fromJson<String>(json['articleId']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      focusWord: serializer.fromJson<String>(json['focusWord']),
      sentence: serializer.fromJson<String>(json['sentence']),
      sentenceTranslation: serializer.fromJson<String>(
        json['sentenceTranslation'],
      ),
      explanation: serializer.fromJson<String>(json['explanation']),
      minLevel: serializer.fromJson<String>(json['minLevel']),
      isFixed: serializer.fromJson<bool>(json['isFixed']),
      attemptCount: serializer.fromJson<int>(json['attemptCount']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pointId': serializer.toJson<String>(pointId),
      'articleId': serializer.toJson<String>(articleId),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'focusWord': serializer.toJson<String>(focusWord),
      'sentence': serializer.toJson<String>(sentence),
      'sentenceTranslation': serializer.toJson<String>(sentenceTranslation),
      'explanation': serializer.toJson<String>(explanation),
      'minLevel': serializer.toJson<String>(minLevel),
      'isFixed': serializer.toJson<bool>(isFixed),
      'attemptCount': serializer.toJson<int>(attemptCount),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
    };
  }

  WeakPointsTableData copyWith({
    String? id,
    String? pointId,
    String? articleId,
    String? type,
    String? title,
    String? description,
    String? focusWord,
    String? sentence,
    String? sentenceTranslation,
    String? explanation,
    String? minLevel,
    bool? isFixed,
    int? attemptCount,
    DateTime? recordedAt,
  }) => WeakPointsTableData(
    id: id ?? this.id,
    pointId: pointId ?? this.pointId,
    articleId: articleId ?? this.articleId,
    type: type ?? this.type,
    title: title ?? this.title,
    description: description ?? this.description,
    focusWord: focusWord ?? this.focusWord,
    sentence: sentence ?? this.sentence,
    sentenceTranslation: sentenceTranslation ?? this.sentenceTranslation,
    explanation: explanation ?? this.explanation,
    minLevel: minLevel ?? this.minLevel,
    isFixed: isFixed ?? this.isFixed,
    attemptCount: attemptCount ?? this.attemptCount,
    recordedAt: recordedAt ?? this.recordedAt,
  );
  WeakPointsTableData copyWithCompanion(WeakPointsTableCompanion data) {
    return WeakPointsTableData(
      id: data.id.present ? data.id.value : this.id,
      pointId: data.pointId.present ? data.pointId.value : this.pointId,
      articleId: data.articleId.present ? data.articleId.value : this.articleId,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      focusWord: data.focusWord.present ? data.focusWord.value : this.focusWord,
      sentence: data.sentence.present ? data.sentence.value : this.sentence,
      sentenceTranslation: data.sentenceTranslation.present
          ? data.sentenceTranslation.value
          : this.sentenceTranslation,
      explanation: data.explanation.present
          ? data.explanation.value
          : this.explanation,
      minLevel: data.minLevel.present ? data.minLevel.value : this.minLevel,
      isFixed: data.isFixed.present ? data.isFixed.value : this.isFixed,
      attemptCount: data.attemptCount.present
          ? data.attemptCount.value
          : this.attemptCount,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeakPointsTableData(')
          ..write('id: $id, ')
          ..write('pointId: $pointId, ')
          ..write('articleId: $articleId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('focusWord: $focusWord, ')
          ..write('sentence: $sentence, ')
          ..write('sentenceTranslation: $sentenceTranslation, ')
          ..write('explanation: $explanation, ')
          ..write('minLevel: $minLevel, ')
          ..write('isFixed: $isFixed, ')
          ..write('attemptCount: $attemptCount, ')
          ..write('recordedAt: $recordedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pointId,
    articleId,
    type,
    title,
    description,
    focusWord,
    sentence,
    sentenceTranslation,
    explanation,
    minLevel,
    isFixed,
    attemptCount,
    recordedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeakPointsTableData &&
          other.id == this.id &&
          other.pointId == this.pointId &&
          other.articleId == this.articleId &&
          other.type == this.type &&
          other.title == this.title &&
          other.description == this.description &&
          other.focusWord == this.focusWord &&
          other.sentence == this.sentence &&
          other.sentenceTranslation == this.sentenceTranslation &&
          other.explanation == this.explanation &&
          other.minLevel == this.minLevel &&
          other.isFixed == this.isFixed &&
          other.attemptCount == this.attemptCount &&
          other.recordedAt == this.recordedAt);
}

class WeakPointsTableCompanion extends UpdateCompanion<WeakPointsTableData> {
  final Value<String> id;
  final Value<String> pointId;
  final Value<String> articleId;
  final Value<String> type;
  final Value<String> title;
  final Value<String> description;
  final Value<String> focusWord;
  final Value<String> sentence;
  final Value<String> sentenceTranslation;
  final Value<String> explanation;
  final Value<String> minLevel;
  final Value<bool> isFixed;
  final Value<int> attemptCount;
  final Value<DateTime> recordedAt;
  final Value<int> rowid;
  const WeakPointsTableCompanion({
    this.id = const Value.absent(),
    this.pointId = const Value.absent(),
    this.articleId = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.focusWord = const Value.absent(),
    this.sentence = const Value.absent(),
    this.sentenceTranslation = const Value.absent(),
    this.explanation = const Value.absent(),
    this.minLevel = const Value.absent(),
    this.isFixed = const Value.absent(),
    this.attemptCount = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WeakPointsTableCompanion.insert({
    required String id,
    required String pointId,
    required String articleId,
    required String type,
    required String title,
    required String description,
    required String focusWord,
    required String sentence,
    this.sentenceTranslation = const Value.absent(),
    required String explanation,
    this.minLevel = const Value.absent(),
    this.isFixed = const Value.absent(),
    this.attemptCount = const Value.absent(),
    required DateTime recordedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       pointId = Value(pointId),
       articleId = Value(articleId),
       type = Value(type),
       title = Value(title),
       description = Value(description),
       focusWord = Value(focusWord),
       sentence = Value(sentence),
       explanation = Value(explanation),
       recordedAt = Value(recordedAt);
  static Insertable<WeakPointsTableData> custom({
    Expression<String>? id,
    Expression<String>? pointId,
    Expression<String>? articleId,
    Expression<String>? type,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? focusWord,
    Expression<String>? sentence,
    Expression<String>? sentenceTranslation,
    Expression<String>? explanation,
    Expression<String>? minLevel,
    Expression<bool>? isFixed,
    Expression<int>? attemptCount,
    Expression<DateTime>? recordedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pointId != null) 'point_id': pointId,
      if (articleId != null) 'article_id': articleId,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (focusWord != null) 'focus_word': focusWord,
      if (sentence != null) 'sentence': sentence,
      if (sentenceTranslation != null)
        'sentence_translation': sentenceTranslation,
      if (explanation != null) 'explanation': explanation,
      if (minLevel != null) 'min_level': minLevel,
      if (isFixed != null) 'is_fixed': isFixed,
      if (attemptCount != null) 'attempt_count': attemptCount,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WeakPointsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? pointId,
    Value<String>? articleId,
    Value<String>? type,
    Value<String>? title,
    Value<String>? description,
    Value<String>? focusWord,
    Value<String>? sentence,
    Value<String>? sentenceTranslation,
    Value<String>? explanation,
    Value<String>? minLevel,
    Value<bool>? isFixed,
    Value<int>? attemptCount,
    Value<DateTime>? recordedAt,
    Value<int>? rowid,
  }) {
    return WeakPointsTableCompanion(
      id: id ?? this.id,
      pointId: pointId ?? this.pointId,
      articleId: articleId ?? this.articleId,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      focusWord: focusWord ?? this.focusWord,
      sentence: sentence ?? this.sentence,
      sentenceTranslation: sentenceTranslation ?? this.sentenceTranslation,
      explanation: explanation ?? this.explanation,
      minLevel: minLevel ?? this.minLevel,
      isFixed: isFixed ?? this.isFixed,
      attemptCount: attemptCount ?? this.attemptCount,
      recordedAt: recordedAt ?? this.recordedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pointId.present) {
      map['point_id'] = Variable<String>(pointId.value);
    }
    if (articleId.present) {
      map['article_id'] = Variable<String>(articleId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (focusWord.present) {
      map['focus_word'] = Variable<String>(focusWord.value);
    }
    if (sentence.present) {
      map['sentence'] = Variable<String>(sentence.value);
    }
    if (sentenceTranslation.present) {
      map['sentence_translation'] = Variable<String>(sentenceTranslation.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    if (minLevel.present) {
      map['min_level'] = Variable<String>(minLevel.value);
    }
    if (isFixed.present) {
      map['is_fixed'] = Variable<bool>(isFixed.value);
    }
    if (attemptCount.present) {
      map['attempt_count'] = Variable<int>(attemptCount.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeakPointsTableCompanion(')
          ..write('id: $id, ')
          ..write('pointId: $pointId, ')
          ..write('articleId: $articleId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('focusWord: $focusWord, ')
          ..write('sentence: $sentence, ')
          ..write('sentenceTranslation: $sentenceTranslation, ')
          ..write('explanation: $explanation, ')
          ..write('minLevel: $minLevel, ')
          ..write('isFixed: $isFixed, ')
          ..write('attemptCount: $attemptCount, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VocabularyEntriesTableTable extends VocabularyEntriesTable
    with TableInfo<$VocabularyEntriesTableTable, VocabularyEntriesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VocabularyEntriesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
    'word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ipaMeta = const VerificationMeta('ipa');
  @override
  late final GeneratedColumn<String> ipa = GeneratedColumn<String>(
    'ipa',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _meaningMeta = const VerificationMeta(
    'meaning',
  );
  @override
  late final GeneratedColumn<String> meaning = GeneratedColumn<String>(
    'meaning',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _translationMeta = const VerificationMeta(
    'translation',
  );
  @override
  late final GeneratedColumn<String> translation = GeneratedColumn<String>(
    'translation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exampleSentenceMeta = const VerificationMeta(
    'exampleSentence',
  );
  @override
  late final GeneratedColumn<String> exampleSentence = GeneratedColumn<String>(
    'example_sentence',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _audioUrlMeta = const VerificationMeta(
    'audioUrl',
  );
  @override
  late final GeneratedColumn<String> audioUrl = GeneratedColumn<String>(
    'audio_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isLearnedMeta = const VerificationMeta(
    'isLearned',
  );
  @override
  late final GeneratedColumn<bool> isLearned = GeneratedColumn<bool>(
    'is_learned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_learned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isSavedMeta = const VerificationMeta(
    'isSaved',
  );
  @override
  late final GeneratedColumn<bool> isSaved = GeneratedColumn<bool>(
    'is_saved',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_saved" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isBookmarkedMeta = const VerificationMeta(
    'isBookmarked',
  );
  @override
  late final GeneratedColumn<bool> isBookmarked = GeneratedColumn<bool>(
    'is_bookmarked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_bookmarked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _reviewIntervalMeta = const VerificationMeta(
    'reviewInterval',
  );
  @override
  late final GeneratedColumn<int> reviewInterval = GeneratedColumn<int>(
    'review_interval',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _nextReviewAtMeta = const VerificationMeta(
    'nextReviewAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextReviewAt = GeneratedColumn<DateTime>(
    'next_review_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastReviewedAtMeta = const VerificationMeta(
    'lastReviewedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastReviewedAt =
      GeneratedColumn<DateTime>(
        'last_reviewed_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _easeFactorMeta = const VerificationMeta(
    'easeFactor',
  );
  @override
  late final GeneratedColumn<double> easeFactor = GeneratedColumn<double>(
    'ease_factor',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(2.5),
  );
  static const VerificationMeta _repetitionCountMeta = const VerificationMeta(
    'repetitionCount',
  );
  @override
  late final GeneratedColumn<int> repetitionCount = GeneratedColumn<int>(
    'repetition_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    word,
    ipa,
    meaning,
    translation,
    exampleSentence,
    audioUrl,
    isLearned,
    isSaved,
    isBookmarked,
    reviewInterval,
    nextReviewAt,
    lastReviewedAt,
    easeFactor,
    repetitionCount,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vocabulary_entries_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<VocabularyEntriesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('word')) {
      context.handle(
        _wordMeta,
        word.isAcceptableOrUnknown(data['word']!, _wordMeta),
      );
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('ipa')) {
      context.handle(
        _ipaMeta,
        ipa.isAcceptableOrUnknown(data['ipa']!, _ipaMeta),
      );
    } else if (isInserting) {
      context.missing(_ipaMeta);
    }
    if (data.containsKey('meaning')) {
      context.handle(
        _meaningMeta,
        meaning.isAcceptableOrUnknown(data['meaning']!, _meaningMeta),
      );
    } else if (isInserting) {
      context.missing(_meaningMeta);
    }
    if (data.containsKey('translation')) {
      context.handle(
        _translationMeta,
        translation.isAcceptableOrUnknown(
          data['translation']!,
          _translationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_translationMeta);
    }
    if (data.containsKey('example_sentence')) {
      context.handle(
        _exampleSentenceMeta,
        exampleSentence.isAcceptableOrUnknown(
          data['example_sentence']!,
          _exampleSentenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exampleSentenceMeta);
    }
    if (data.containsKey('audio_url')) {
      context.handle(
        _audioUrlMeta,
        audioUrl.isAcceptableOrUnknown(data['audio_url']!, _audioUrlMeta),
      );
    }
    if (data.containsKey('is_learned')) {
      context.handle(
        _isLearnedMeta,
        isLearned.isAcceptableOrUnknown(data['is_learned']!, _isLearnedMeta),
      );
    }
    if (data.containsKey('is_saved')) {
      context.handle(
        _isSavedMeta,
        isSaved.isAcceptableOrUnknown(data['is_saved']!, _isSavedMeta),
      );
    }
    if (data.containsKey('is_bookmarked')) {
      context.handle(
        _isBookmarkedMeta,
        isBookmarked.isAcceptableOrUnknown(
          data['is_bookmarked']!,
          _isBookmarkedMeta,
        ),
      );
    }
    if (data.containsKey('review_interval')) {
      context.handle(
        _reviewIntervalMeta,
        reviewInterval.isAcceptableOrUnknown(
          data['review_interval']!,
          _reviewIntervalMeta,
        ),
      );
    }
    if (data.containsKey('next_review_at')) {
      context.handle(
        _nextReviewAtMeta,
        nextReviewAt.isAcceptableOrUnknown(
          data['next_review_at']!,
          _nextReviewAtMeta,
        ),
      );
    }
    if (data.containsKey('last_reviewed_at')) {
      context.handle(
        _lastReviewedAtMeta,
        lastReviewedAt.isAcceptableOrUnknown(
          data['last_reviewed_at']!,
          _lastReviewedAtMeta,
        ),
      );
    }
    if (data.containsKey('ease_factor')) {
      context.handle(
        _easeFactorMeta,
        easeFactor.isAcceptableOrUnknown(data['ease_factor']!, _easeFactorMeta),
      );
    }
    if (data.containsKey('repetition_count')) {
      context.handle(
        _repetitionCountMeta,
        repetitionCount.isAcceptableOrUnknown(
          data['repetition_count']!,
          _repetitionCountMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VocabularyEntriesTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VocabularyEntriesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      word: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word'],
      )!,
      ipa: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ipa'],
      )!,
      meaning: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meaning'],
      )!,
      translation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}translation'],
      )!,
      exampleSentence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}example_sentence'],
      )!,
      audioUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_url'],
      ),
      isLearned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_learned'],
      )!,
      isSaved: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_saved'],
      )!,
      isBookmarked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_bookmarked'],
      )!,
      reviewInterval: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}review_interval'],
      )!,
      nextReviewAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_review_at'],
      ),
      lastReviewedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_reviewed_at'],
      ),
      easeFactor: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ease_factor'],
      )!,
      repetitionCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repetition_count'],
      )!,
    );
  }

  @override
  $VocabularyEntriesTableTable createAlias(String alias) {
    return $VocabularyEntriesTableTable(attachedDatabase, alias);
  }
}

class VocabularyEntriesTableData extends DataClass
    implements Insertable<VocabularyEntriesTableData> {
  final String id;
  final String word;
  final String ipa;
  final String meaning;
  final String translation;
  final String exampleSentence;
  final String? audioUrl;
  final bool isLearned;
  final bool isSaved;
  final bool isBookmarked;
  final int reviewInterval;
  final DateTime? nextReviewAt;
  final DateTime? lastReviewedAt;
  final double easeFactor;
  final int repetitionCount;
  const VocabularyEntriesTableData({
    required this.id,
    required this.word,
    required this.ipa,
    required this.meaning,
    required this.translation,
    required this.exampleSentence,
    this.audioUrl,
    required this.isLearned,
    required this.isSaved,
    required this.isBookmarked,
    required this.reviewInterval,
    this.nextReviewAt,
    this.lastReviewedAt,
    required this.easeFactor,
    required this.repetitionCount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['word'] = Variable<String>(word);
    map['ipa'] = Variable<String>(ipa);
    map['meaning'] = Variable<String>(meaning);
    map['translation'] = Variable<String>(translation);
    map['example_sentence'] = Variable<String>(exampleSentence);
    if (!nullToAbsent || audioUrl != null) {
      map['audio_url'] = Variable<String>(audioUrl);
    }
    map['is_learned'] = Variable<bool>(isLearned);
    map['is_saved'] = Variable<bool>(isSaved);
    map['is_bookmarked'] = Variable<bool>(isBookmarked);
    map['review_interval'] = Variable<int>(reviewInterval);
    if (!nullToAbsent || nextReviewAt != null) {
      map['next_review_at'] = Variable<DateTime>(nextReviewAt);
    }
    if (!nullToAbsent || lastReviewedAt != null) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt);
    }
    map['ease_factor'] = Variable<double>(easeFactor);
    map['repetition_count'] = Variable<int>(repetitionCount);
    return map;
  }

  VocabularyEntriesTableCompanion toCompanion(bool nullToAbsent) {
    return VocabularyEntriesTableCompanion(
      id: Value(id),
      word: Value(word),
      ipa: Value(ipa),
      meaning: Value(meaning),
      translation: Value(translation),
      exampleSentence: Value(exampleSentence),
      audioUrl: audioUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(audioUrl),
      isLearned: Value(isLearned),
      isSaved: Value(isSaved),
      isBookmarked: Value(isBookmarked),
      reviewInterval: Value(reviewInterval),
      nextReviewAt: nextReviewAt == null && nullToAbsent
          ? const Value.absent()
          : Value(nextReviewAt),
      lastReviewedAt: lastReviewedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReviewedAt),
      easeFactor: Value(easeFactor),
      repetitionCount: Value(repetitionCount),
    );
  }

  factory VocabularyEntriesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VocabularyEntriesTableData(
      id: serializer.fromJson<String>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      ipa: serializer.fromJson<String>(json['ipa']),
      meaning: serializer.fromJson<String>(json['meaning']),
      translation: serializer.fromJson<String>(json['translation']),
      exampleSentence: serializer.fromJson<String>(json['exampleSentence']),
      audioUrl: serializer.fromJson<String?>(json['audioUrl']),
      isLearned: serializer.fromJson<bool>(json['isLearned']),
      isSaved: serializer.fromJson<bool>(json['isSaved']),
      isBookmarked: serializer.fromJson<bool>(json['isBookmarked']),
      reviewInterval: serializer.fromJson<int>(json['reviewInterval']),
      nextReviewAt: serializer.fromJson<DateTime?>(json['nextReviewAt']),
      lastReviewedAt: serializer.fromJson<DateTime?>(json['lastReviewedAt']),
      easeFactor: serializer.fromJson<double>(json['easeFactor']),
      repetitionCount: serializer.fromJson<int>(json['repetitionCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'word': serializer.toJson<String>(word),
      'ipa': serializer.toJson<String>(ipa),
      'meaning': serializer.toJson<String>(meaning),
      'translation': serializer.toJson<String>(translation),
      'exampleSentence': serializer.toJson<String>(exampleSentence),
      'audioUrl': serializer.toJson<String?>(audioUrl),
      'isLearned': serializer.toJson<bool>(isLearned),
      'isSaved': serializer.toJson<bool>(isSaved),
      'isBookmarked': serializer.toJson<bool>(isBookmarked),
      'reviewInterval': serializer.toJson<int>(reviewInterval),
      'nextReviewAt': serializer.toJson<DateTime?>(nextReviewAt),
      'lastReviewedAt': serializer.toJson<DateTime?>(lastReviewedAt),
      'easeFactor': serializer.toJson<double>(easeFactor),
      'repetitionCount': serializer.toJson<int>(repetitionCount),
    };
  }

  VocabularyEntriesTableData copyWith({
    String? id,
    String? word,
    String? ipa,
    String? meaning,
    String? translation,
    String? exampleSentence,
    Value<String?> audioUrl = const Value.absent(),
    bool? isLearned,
    bool? isSaved,
    bool? isBookmarked,
    int? reviewInterval,
    Value<DateTime?> nextReviewAt = const Value.absent(),
    Value<DateTime?> lastReviewedAt = const Value.absent(),
    double? easeFactor,
    int? repetitionCount,
  }) => VocabularyEntriesTableData(
    id: id ?? this.id,
    word: word ?? this.word,
    ipa: ipa ?? this.ipa,
    meaning: meaning ?? this.meaning,
    translation: translation ?? this.translation,
    exampleSentence: exampleSentence ?? this.exampleSentence,
    audioUrl: audioUrl.present ? audioUrl.value : this.audioUrl,
    isLearned: isLearned ?? this.isLearned,
    isSaved: isSaved ?? this.isSaved,
    isBookmarked: isBookmarked ?? this.isBookmarked,
    reviewInterval: reviewInterval ?? this.reviewInterval,
    nextReviewAt: nextReviewAt.present ? nextReviewAt.value : this.nextReviewAt,
    lastReviewedAt: lastReviewedAt.present
        ? lastReviewedAt.value
        : this.lastReviewedAt,
    easeFactor: easeFactor ?? this.easeFactor,
    repetitionCount: repetitionCount ?? this.repetitionCount,
  );
  VocabularyEntriesTableData copyWithCompanion(
    VocabularyEntriesTableCompanion data,
  ) {
    return VocabularyEntriesTableData(
      id: data.id.present ? data.id.value : this.id,
      word: data.word.present ? data.word.value : this.word,
      ipa: data.ipa.present ? data.ipa.value : this.ipa,
      meaning: data.meaning.present ? data.meaning.value : this.meaning,
      translation: data.translation.present
          ? data.translation.value
          : this.translation,
      exampleSentence: data.exampleSentence.present
          ? data.exampleSentence.value
          : this.exampleSentence,
      audioUrl: data.audioUrl.present ? data.audioUrl.value : this.audioUrl,
      isLearned: data.isLearned.present ? data.isLearned.value : this.isLearned,
      isSaved: data.isSaved.present ? data.isSaved.value : this.isSaved,
      isBookmarked: data.isBookmarked.present
          ? data.isBookmarked.value
          : this.isBookmarked,
      reviewInterval: data.reviewInterval.present
          ? data.reviewInterval.value
          : this.reviewInterval,
      nextReviewAt: data.nextReviewAt.present
          ? data.nextReviewAt.value
          : this.nextReviewAt,
      lastReviewedAt: data.lastReviewedAt.present
          ? data.lastReviewedAt.value
          : this.lastReviewedAt,
      easeFactor: data.easeFactor.present
          ? data.easeFactor.value
          : this.easeFactor,
      repetitionCount: data.repetitionCount.present
          ? data.repetitionCount.value
          : this.repetitionCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VocabularyEntriesTableData(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('ipa: $ipa, ')
          ..write('meaning: $meaning, ')
          ..write('translation: $translation, ')
          ..write('exampleSentence: $exampleSentence, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('isLearned: $isLearned, ')
          ..write('isSaved: $isSaved, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('reviewInterval: $reviewInterval, ')
          ..write('nextReviewAt: $nextReviewAt, ')
          ..write('lastReviewedAt: $lastReviewedAt, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('repetitionCount: $repetitionCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    word,
    ipa,
    meaning,
    translation,
    exampleSentence,
    audioUrl,
    isLearned,
    isSaved,
    isBookmarked,
    reviewInterval,
    nextReviewAt,
    lastReviewedAt,
    easeFactor,
    repetitionCount,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VocabularyEntriesTableData &&
          other.id == this.id &&
          other.word == this.word &&
          other.ipa == this.ipa &&
          other.meaning == this.meaning &&
          other.translation == this.translation &&
          other.exampleSentence == this.exampleSentence &&
          other.audioUrl == this.audioUrl &&
          other.isLearned == this.isLearned &&
          other.isSaved == this.isSaved &&
          other.isBookmarked == this.isBookmarked &&
          other.reviewInterval == this.reviewInterval &&
          other.nextReviewAt == this.nextReviewAt &&
          other.lastReviewedAt == this.lastReviewedAt &&
          other.easeFactor == this.easeFactor &&
          other.repetitionCount == this.repetitionCount);
}

class VocabularyEntriesTableCompanion
    extends UpdateCompanion<VocabularyEntriesTableData> {
  final Value<String> id;
  final Value<String> word;
  final Value<String> ipa;
  final Value<String> meaning;
  final Value<String> translation;
  final Value<String> exampleSentence;
  final Value<String?> audioUrl;
  final Value<bool> isLearned;
  final Value<bool> isSaved;
  final Value<bool> isBookmarked;
  final Value<int> reviewInterval;
  final Value<DateTime?> nextReviewAt;
  final Value<DateTime?> lastReviewedAt;
  final Value<double> easeFactor;
  final Value<int> repetitionCount;
  final Value<int> rowid;
  const VocabularyEntriesTableCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.ipa = const Value.absent(),
    this.meaning = const Value.absent(),
    this.translation = const Value.absent(),
    this.exampleSentence = const Value.absent(),
    this.audioUrl = const Value.absent(),
    this.isLearned = const Value.absent(),
    this.isSaved = const Value.absent(),
    this.isBookmarked = const Value.absent(),
    this.reviewInterval = const Value.absent(),
    this.nextReviewAt = const Value.absent(),
    this.lastReviewedAt = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.repetitionCount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VocabularyEntriesTableCompanion.insert({
    required String id,
    required String word,
    required String ipa,
    required String meaning,
    required String translation,
    required String exampleSentence,
    this.audioUrl = const Value.absent(),
    this.isLearned = const Value.absent(),
    this.isSaved = const Value.absent(),
    this.isBookmarked = const Value.absent(),
    this.reviewInterval = const Value.absent(),
    this.nextReviewAt = const Value.absent(),
    this.lastReviewedAt = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.repetitionCount = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       word = Value(word),
       ipa = Value(ipa),
       meaning = Value(meaning),
       translation = Value(translation),
       exampleSentence = Value(exampleSentence);
  static Insertable<VocabularyEntriesTableData> custom({
    Expression<String>? id,
    Expression<String>? word,
    Expression<String>? ipa,
    Expression<String>? meaning,
    Expression<String>? translation,
    Expression<String>? exampleSentence,
    Expression<String>? audioUrl,
    Expression<bool>? isLearned,
    Expression<bool>? isSaved,
    Expression<bool>? isBookmarked,
    Expression<int>? reviewInterval,
    Expression<DateTime>? nextReviewAt,
    Expression<DateTime>? lastReviewedAt,
    Expression<double>? easeFactor,
    Expression<int>? repetitionCount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (ipa != null) 'ipa': ipa,
      if (meaning != null) 'meaning': meaning,
      if (translation != null) 'translation': translation,
      if (exampleSentence != null) 'example_sentence': exampleSentence,
      if (audioUrl != null) 'audio_url': audioUrl,
      if (isLearned != null) 'is_learned': isLearned,
      if (isSaved != null) 'is_saved': isSaved,
      if (isBookmarked != null) 'is_bookmarked': isBookmarked,
      if (reviewInterval != null) 'review_interval': reviewInterval,
      if (nextReviewAt != null) 'next_review_at': nextReviewAt,
      if (lastReviewedAt != null) 'last_reviewed_at': lastReviewedAt,
      if (easeFactor != null) 'ease_factor': easeFactor,
      if (repetitionCount != null) 'repetition_count': repetitionCount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VocabularyEntriesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? word,
    Value<String>? ipa,
    Value<String>? meaning,
    Value<String>? translation,
    Value<String>? exampleSentence,
    Value<String?>? audioUrl,
    Value<bool>? isLearned,
    Value<bool>? isSaved,
    Value<bool>? isBookmarked,
    Value<int>? reviewInterval,
    Value<DateTime?>? nextReviewAt,
    Value<DateTime?>? lastReviewedAt,
    Value<double>? easeFactor,
    Value<int>? repetitionCount,
    Value<int>? rowid,
  }) {
    return VocabularyEntriesTableCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      ipa: ipa ?? this.ipa,
      meaning: meaning ?? this.meaning,
      translation: translation ?? this.translation,
      exampleSentence: exampleSentence ?? this.exampleSentence,
      audioUrl: audioUrl ?? this.audioUrl,
      isLearned: isLearned ?? this.isLearned,
      isSaved: isSaved ?? this.isSaved,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      reviewInterval: reviewInterval ?? this.reviewInterval,
      nextReviewAt: nextReviewAt ?? this.nextReviewAt,
      lastReviewedAt: lastReviewedAt ?? this.lastReviewedAt,
      easeFactor: easeFactor ?? this.easeFactor,
      repetitionCount: repetitionCount ?? this.repetitionCount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (ipa.present) {
      map['ipa'] = Variable<String>(ipa.value);
    }
    if (meaning.present) {
      map['meaning'] = Variable<String>(meaning.value);
    }
    if (translation.present) {
      map['translation'] = Variable<String>(translation.value);
    }
    if (exampleSentence.present) {
      map['example_sentence'] = Variable<String>(exampleSentence.value);
    }
    if (audioUrl.present) {
      map['audio_url'] = Variable<String>(audioUrl.value);
    }
    if (isLearned.present) {
      map['is_learned'] = Variable<bool>(isLearned.value);
    }
    if (isSaved.present) {
      map['is_saved'] = Variable<bool>(isSaved.value);
    }
    if (isBookmarked.present) {
      map['is_bookmarked'] = Variable<bool>(isBookmarked.value);
    }
    if (reviewInterval.present) {
      map['review_interval'] = Variable<int>(reviewInterval.value);
    }
    if (nextReviewAt.present) {
      map['next_review_at'] = Variable<DateTime>(nextReviewAt.value);
    }
    if (lastReviewedAt.present) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt.value);
    }
    if (easeFactor.present) {
      map['ease_factor'] = Variable<double>(easeFactor.value);
    }
    if (repetitionCount.present) {
      map['repetition_count'] = Variable<int>(repetitionCount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VocabularyEntriesTableCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('ipa: $ipa, ')
          ..write('meaning: $meaning, ')
          ..write('translation: $translation, ')
          ..write('exampleSentence: $exampleSentence, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('isLearned: $isLearned, ')
          ..write('isSaved: $isSaved, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('reviewInterval: $reviewInterval, ')
          ..write('nextReviewAt: $nextReviewAt, ')
          ..write('lastReviewedAt: $lastReviewedAt, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('repetitionCount: $repetitionCount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WritingSubmissionsTableTable extends WritingSubmissionsTable
    with TableInfo<$WritingSubmissionsTableTable, WritingSubmissionsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WritingSubmissionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
    'task_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _articleTitleMeta = const VerificationMeta(
    'articleTitle',
  );
  @override
  late final GeneratedColumn<String> articleTitle = GeneratedColumn<String>(
    'article_title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _promptMeta = const VerificationMeta('prompt');
  @override
  late final GeneratedColumn<String> prompt = GeneratedColumn<String>(
    'prompt',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userTextMeta = const VerificationMeta(
    'userText',
  );
  @override
  late final GeneratedColumn<String> userText = GeneratedColumn<String>(
    'user_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<double> score = GeneratedColumn<double>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _overallFeedbackMeta = const VerificationMeta(
    'overallFeedback',
  );
  @override
  late final GeneratedColumn<String> overallFeedback = GeneratedColumn<String>(
    'overall_feedback',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _correctionsJsonMeta = const VerificationMeta(
    'correctionsJson',
  );
  @override
  late final GeneratedColumn<String> correctionsJson = GeneratedColumn<String>(
    'corrections_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _submittedAtMeta = const VerificationMeta(
    'submittedAt',
  );
  @override
  late final GeneratedColumn<DateTime> submittedAt = GeneratedColumn<DateTime>(
    'submitted_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    taskId,
    articleTitle,
    prompt,
    userText,
    score,
    overallFeedback,
    correctionsJson,
    submittedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'writing_submissions_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<WritingSubmissionsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('task_id')) {
      context.handle(
        _taskIdMeta,
        taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta),
      );
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('article_title')) {
      context.handle(
        _articleTitleMeta,
        articleTitle.isAcceptableOrUnknown(
          data['article_title']!,
          _articleTitleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_articleTitleMeta);
    }
    if (data.containsKey('prompt')) {
      context.handle(
        _promptMeta,
        prompt.isAcceptableOrUnknown(data['prompt']!, _promptMeta),
      );
    } else if (isInserting) {
      context.missing(_promptMeta);
    }
    if (data.containsKey('user_text')) {
      context.handle(
        _userTextMeta,
        userText.isAcceptableOrUnknown(data['user_text']!, _userTextMeta),
      );
    } else if (isInserting) {
      context.missing(_userTextMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('overall_feedback')) {
      context.handle(
        _overallFeedbackMeta,
        overallFeedback.isAcceptableOrUnknown(
          data['overall_feedback']!,
          _overallFeedbackMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_overallFeedbackMeta);
    }
    if (data.containsKey('corrections_json')) {
      context.handle(
        _correctionsJsonMeta,
        correctionsJson.isAcceptableOrUnknown(
          data['corrections_json']!,
          _correctionsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_correctionsJsonMeta);
    }
    if (data.containsKey('submitted_at')) {
      context.handle(
        _submittedAtMeta,
        submittedAt.isAcceptableOrUnknown(
          data['submitted_at']!,
          _submittedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_submittedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WritingSubmissionsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WritingSubmissionsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      taskId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}task_id'],
      )!,
      articleTitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}article_title'],
      )!,
      prompt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prompt'],
      )!,
      userText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_text'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}score'],
      )!,
      overallFeedback: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}overall_feedback'],
      )!,
      correctionsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}corrections_json'],
      )!,
      submittedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}submitted_at'],
      )!,
    );
  }

  @override
  $WritingSubmissionsTableTable createAlias(String alias) {
    return $WritingSubmissionsTableTable(attachedDatabase, alias);
  }
}

class WritingSubmissionsTableData extends DataClass
    implements Insertable<WritingSubmissionsTableData> {
  final String id;
  final String taskId;
  final String articleTitle;
  final String prompt;
  final String userText;
  final double score;
  final String overallFeedback;
  final String correctionsJson;
  final DateTime submittedAt;
  const WritingSubmissionsTableData({
    required this.id,
    required this.taskId,
    required this.articleTitle,
    required this.prompt,
    required this.userText,
    required this.score,
    required this.overallFeedback,
    required this.correctionsJson,
    required this.submittedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['task_id'] = Variable<String>(taskId);
    map['article_title'] = Variable<String>(articleTitle);
    map['prompt'] = Variable<String>(prompt);
    map['user_text'] = Variable<String>(userText);
    map['score'] = Variable<double>(score);
    map['overall_feedback'] = Variable<String>(overallFeedback);
    map['corrections_json'] = Variable<String>(correctionsJson);
    map['submitted_at'] = Variable<DateTime>(submittedAt);
    return map;
  }

  WritingSubmissionsTableCompanion toCompanion(bool nullToAbsent) {
    return WritingSubmissionsTableCompanion(
      id: Value(id),
      taskId: Value(taskId),
      articleTitle: Value(articleTitle),
      prompt: Value(prompt),
      userText: Value(userText),
      score: Value(score),
      overallFeedback: Value(overallFeedback),
      correctionsJson: Value(correctionsJson),
      submittedAt: Value(submittedAt),
    );
  }

  factory WritingSubmissionsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WritingSubmissionsTableData(
      id: serializer.fromJson<String>(json['id']),
      taskId: serializer.fromJson<String>(json['taskId']),
      articleTitle: serializer.fromJson<String>(json['articleTitle']),
      prompt: serializer.fromJson<String>(json['prompt']),
      userText: serializer.fromJson<String>(json['userText']),
      score: serializer.fromJson<double>(json['score']),
      overallFeedback: serializer.fromJson<String>(json['overallFeedback']),
      correctionsJson: serializer.fromJson<String>(json['correctionsJson']),
      submittedAt: serializer.fromJson<DateTime>(json['submittedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'taskId': serializer.toJson<String>(taskId),
      'articleTitle': serializer.toJson<String>(articleTitle),
      'prompt': serializer.toJson<String>(prompt),
      'userText': serializer.toJson<String>(userText),
      'score': serializer.toJson<double>(score),
      'overallFeedback': serializer.toJson<String>(overallFeedback),
      'correctionsJson': serializer.toJson<String>(correctionsJson),
      'submittedAt': serializer.toJson<DateTime>(submittedAt),
    };
  }

  WritingSubmissionsTableData copyWith({
    String? id,
    String? taskId,
    String? articleTitle,
    String? prompt,
    String? userText,
    double? score,
    String? overallFeedback,
    String? correctionsJson,
    DateTime? submittedAt,
  }) => WritingSubmissionsTableData(
    id: id ?? this.id,
    taskId: taskId ?? this.taskId,
    articleTitle: articleTitle ?? this.articleTitle,
    prompt: prompt ?? this.prompt,
    userText: userText ?? this.userText,
    score: score ?? this.score,
    overallFeedback: overallFeedback ?? this.overallFeedback,
    correctionsJson: correctionsJson ?? this.correctionsJson,
    submittedAt: submittedAt ?? this.submittedAt,
  );
  WritingSubmissionsTableData copyWithCompanion(
    WritingSubmissionsTableCompanion data,
  ) {
    return WritingSubmissionsTableData(
      id: data.id.present ? data.id.value : this.id,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      articleTitle: data.articleTitle.present
          ? data.articleTitle.value
          : this.articleTitle,
      prompt: data.prompt.present ? data.prompt.value : this.prompt,
      userText: data.userText.present ? data.userText.value : this.userText,
      score: data.score.present ? data.score.value : this.score,
      overallFeedback: data.overallFeedback.present
          ? data.overallFeedback.value
          : this.overallFeedback,
      correctionsJson: data.correctionsJson.present
          ? data.correctionsJson.value
          : this.correctionsJson,
      submittedAt: data.submittedAt.present
          ? data.submittedAt.value
          : this.submittedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WritingSubmissionsTableData(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('articleTitle: $articleTitle, ')
          ..write('prompt: $prompt, ')
          ..write('userText: $userText, ')
          ..write('score: $score, ')
          ..write('overallFeedback: $overallFeedback, ')
          ..write('correctionsJson: $correctionsJson, ')
          ..write('submittedAt: $submittedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    taskId,
    articleTitle,
    prompt,
    userText,
    score,
    overallFeedback,
    correctionsJson,
    submittedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WritingSubmissionsTableData &&
          other.id == this.id &&
          other.taskId == this.taskId &&
          other.articleTitle == this.articleTitle &&
          other.prompt == this.prompt &&
          other.userText == this.userText &&
          other.score == this.score &&
          other.overallFeedback == this.overallFeedback &&
          other.correctionsJson == this.correctionsJson &&
          other.submittedAt == this.submittedAt);
}

class WritingSubmissionsTableCompanion
    extends UpdateCompanion<WritingSubmissionsTableData> {
  final Value<String> id;
  final Value<String> taskId;
  final Value<String> articleTitle;
  final Value<String> prompt;
  final Value<String> userText;
  final Value<double> score;
  final Value<String> overallFeedback;
  final Value<String> correctionsJson;
  final Value<DateTime> submittedAt;
  final Value<int> rowid;
  const WritingSubmissionsTableCompanion({
    this.id = const Value.absent(),
    this.taskId = const Value.absent(),
    this.articleTitle = const Value.absent(),
    this.prompt = const Value.absent(),
    this.userText = const Value.absent(),
    this.score = const Value.absent(),
    this.overallFeedback = const Value.absent(),
    this.correctionsJson = const Value.absent(),
    this.submittedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WritingSubmissionsTableCompanion.insert({
    required String id,
    required String taskId,
    required String articleTitle,
    required String prompt,
    required String userText,
    required double score,
    required String overallFeedback,
    required String correctionsJson,
    required DateTime submittedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       taskId = Value(taskId),
       articleTitle = Value(articleTitle),
       prompt = Value(prompt),
       userText = Value(userText),
       score = Value(score),
       overallFeedback = Value(overallFeedback),
       correctionsJson = Value(correctionsJson),
       submittedAt = Value(submittedAt);
  static Insertable<WritingSubmissionsTableData> custom({
    Expression<String>? id,
    Expression<String>? taskId,
    Expression<String>? articleTitle,
    Expression<String>? prompt,
    Expression<String>? userText,
    Expression<double>? score,
    Expression<String>? overallFeedback,
    Expression<String>? correctionsJson,
    Expression<DateTime>? submittedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (taskId != null) 'task_id': taskId,
      if (articleTitle != null) 'article_title': articleTitle,
      if (prompt != null) 'prompt': prompt,
      if (userText != null) 'user_text': userText,
      if (score != null) 'score': score,
      if (overallFeedback != null) 'overall_feedback': overallFeedback,
      if (correctionsJson != null) 'corrections_json': correctionsJson,
      if (submittedAt != null) 'submitted_at': submittedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WritingSubmissionsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? taskId,
    Value<String>? articleTitle,
    Value<String>? prompt,
    Value<String>? userText,
    Value<double>? score,
    Value<String>? overallFeedback,
    Value<String>? correctionsJson,
    Value<DateTime>? submittedAt,
    Value<int>? rowid,
  }) {
    return WritingSubmissionsTableCompanion(
      id: id ?? this.id,
      taskId: taskId ?? this.taskId,
      articleTitle: articleTitle ?? this.articleTitle,
      prompt: prompt ?? this.prompt,
      userText: userText ?? this.userText,
      score: score ?? this.score,
      overallFeedback: overallFeedback ?? this.overallFeedback,
      correctionsJson: correctionsJson ?? this.correctionsJson,
      submittedAt: submittedAt ?? this.submittedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (articleTitle.present) {
      map['article_title'] = Variable<String>(articleTitle.value);
    }
    if (prompt.present) {
      map['prompt'] = Variable<String>(prompt.value);
    }
    if (userText.present) {
      map['user_text'] = Variable<String>(userText.value);
    }
    if (score.present) {
      map['score'] = Variable<double>(score.value);
    }
    if (overallFeedback.present) {
      map['overall_feedback'] = Variable<String>(overallFeedback.value);
    }
    if (correctionsJson.present) {
      map['corrections_json'] = Variable<String>(correctionsJson.value);
    }
    if (submittedAt.present) {
      map['submitted_at'] = Variable<DateTime>(submittedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WritingSubmissionsTableCompanion(')
          ..write('id: $id, ')
          ..write('taskId: $taskId, ')
          ..write('articleTitle: $articleTitle, ')
          ..write('prompt: $prompt, ')
          ..write('userText: $userText, ')
          ..write('score: $score, ')
          ..write('overallFeedback: $overallFeedback, ')
          ..write('correctionsJson: $correctionsJson, ')
          ..write('submittedAt: $submittedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SpacedRepetitionTableTable extends SpacedRepetitionTable
    with TableInfo<$SpacedRepetitionTableTable, SpacedRepetitionTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SpacedRepetitionTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _itemTypeMeta = const VerificationMeta(
    'itemType',
  );
  @override
  late final GeneratedColumn<String> itemType = GeneratedColumn<String>(
    'item_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _referenceIdMeta = const VerificationMeta(
    'referenceId',
  );
  @override
  late final GeneratedColumn<String> referenceId = GeneratedColumn<String>(
    'reference_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _promptSentenceMeta = const VerificationMeta(
    'promptSentence',
  );
  @override
  late final GeneratedColumn<String> promptSentence = GeneratedColumn<String>(
    'prompt_sentence',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _focusTextMeta = const VerificationMeta(
    'focusText',
  );
  @override
  late final GeneratedColumn<String> focusText = GeneratedColumn<String>(
    'focus_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reviewIntervalMeta = const VerificationMeta(
    'reviewInterval',
  );
  @override
  late final GeneratedColumn<int> reviewInterval = GeneratedColumn<int>(
    'review_interval',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _easeFactorMeta = const VerificationMeta(
    'easeFactor',
  );
  @override
  late final GeneratedColumn<double> easeFactor = GeneratedColumn<double>(
    'ease_factor',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(2.5),
  );
  static const VerificationMeta _repetitionsMeta = const VerificationMeta(
    'repetitions',
  );
  @override
  late final GeneratedColumn<int> repetitions = GeneratedColumn<int>(
    'repetitions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nextReviewAtMeta = const VerificationMeta(
    'nextReviewAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextReviewAt = GeneratedColumn<DateTime>(
    'next_review_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastReviewedAtMeta = const VerificationMeta(
    'lastReviewedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastReviewedAt =
      GeneratedColumn<DateTime>(
        'last_reviewed_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    itemType,
    referenceId,
    promptSentence,
    focusText,
    reviewInterval,
    easeFactor,
    repetitions,
    nextReviewAt,
    lastReviewedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'spaced_repetition_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SpacedRepetitionTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('item_type')) {
      context.handle(
        _itemTypeMeta,
        itemType.isAcceptableOrUnknown(data['item_type']!, _itemTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_itemTypeMeta);
    }
    if (data.containsKey('reference_id')) {
      context.handle(
        _referenceIdMeta,
        referenceId.isAcceptableOrUnknown(
          data['reference_id']!,
          _referenceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_referenceIdMeta);
    }
    if (data.containsKey('prompt_sentence')) {
      context.handle(
        _promptSentenceMeta,
        promptSentence.isAcceptableOrUnknown(
          data['prompt_sentence']!,
          _promptSentenceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_promptSentenceMeta);
    }
    if (data.containsKey('focus_text')) {
      context.handle(
        _focusTextMeta,
        focusText.isAcceptableOrUnknown(data['focus_text']!, _focusTextMeta),
      );
    } else if (isInserting) {
      context.missing(_focusTextMeta);
    }
    if (data.containsKey('review_interval')) {
      context.handle(
        _reviewIntervalMeta,
        reviewInterval.isAcceptableOrUnknown(
          data['review_interval']!,
          _reviewIntervalMeta,
        ),
      );
    }
    if (data.containsKey('ease_factor')) {
      context.handle(
        _easeFactorMeta,
        easeFactor.isAcceptableOrUnknown(data['ease_factor']!, _easeFactorMeta),
      );
    }
    if (data.containsKey('repetitions')) {
      context.handle(
        _repetitionsMeta,
        repetitions.isAcceptableOrUnknown(
          data['repetitions']!,
          _repetitionsMeta,
        ),
      );
    }
    if (data.containsKey('next_review_at')) {
      context.handle(
        _nextReviewAtMeta,
        nextReviewAt.isAcceptableOrUnknown(
          data['next_review_at']!,
          _nextReviewAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_nextReviewAtMeta);
    }
    if (data.containsKey('last_reviewed_at')) {
      context.handle(
        _lastReviewedAtMeta,
        lastReviewedAt.isAcceptableOrUnknown(
          data['last_reviewed_at']!,
          _lastReviewedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SpacedRepetitionTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SpacedRepetitionTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      itemType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_type'],
      )!,
      referenceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference_id'],
      )!,
      promptSentence: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prompt_sentence'],
      )!,
      focusText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}focus_text'],
      )!,
      reviewInterval: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}review_interval'],
      )!,
      easeFactor: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ease_factor'],
      )!,
      repetitions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repetitions'],
      )!,
      nextReviewAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_review_at'],
      )!,
      lastReviewedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_reviewed_at'],
      ),
    );
  }

  @override
  $SpacedRepetitionTableTable createAlias(String alias) {
    return $SpacedRepetitionTableTable(attachedDatabase, alias);
  }
}

class SpacedRepetitionTableData extends DataClass
    implements Insertable<SpacedRepetitionTableData> {
  final String id;
  final String itemType;
  final String referenceId;
  final String promptSentence;
  final String focusText;
  final int reviewInterval;
  final double easeFactor;
  final int repetitions;
  final DateTime nextReviewAt;
  final DateTime? lastReviewedAt;
  const SpacedRepetitionTableData({
    required this.id,
    required this.itemType,
    required this.referenceId,
    required this.promptSentence,
    required this.focusText,
    required this.reviewInterval,
    required this.easeFactor,
    required this.repetitions,
    required this.nextReviewAt,
    this.lastReviewedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['item_type'] = Variable<String>(itemType);
    map['reference_id'] = Variable<String>(referenceId);
    map['prompt_sentence'] = Variable<String>(promptSentence);
    map['focus_text'] = Variable<String>(focusText);
    map['review_interval'] = Variable<int>(reviewInterval);
    map['ease_factor'] = Variable<double>(easeFactor);
    map['repetitions'] = Variable<int>(repetitions);
    map['next_review_at'] = Variable<DateTime>(nextReviewAt);
    if (!nullToAbsent || lastReviewedAt != null) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt);
    }
    return map;
  }

  SpacedRepetitionTableCompanion toCompanion(bool nullToAbsent) {
    return SpacedRepetitionTableCompanion(
      id: Value(id),
      itemType: Value(itemType),
      referenceId: Value(referenceId),
      promptSentence: Value(promptSentence),
      focusText: Value(focusText),
      reviewInterval: Value(reviewInterval),
      easeFactor: Value(easeFactor),
      repetitions: Value(repetitions),
      nextReviewAt: Value(nextReviewAt),
      lastReviewedAt: lastReviewedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastReviewedAt),
    );
  }

  factory SpacedRepetitionTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SpacedRepetitionTableData(
      id: serializer.fromJson<String>(json['id']),
      itemType: serializer.fromJson<String>(json['itemType']),
      referenceId: serializer.fromJson<String>(json['referenceId']),
      promptSentence: serializer.fromJson<String>(json['promptSentence']),
      focusText: serializer.fromJson<String>(json['focusText']),
      reviewInterval: serializer.fromJson<int>(json['reviewInterval']),
      easeFactor: serializer.fromJson<double>(json['easeFactor']),
      repetitions: serializer.fromJson<int>(json['repetitions']),
      nextReviewAt: serializer.fromJson<DateTime>(json['nextReviewAt']),
      lastReviewedAt: serializer.fromJson<DateTime?>(json['lastReviewedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'itemType': serializer.toJson<String>(itemType),
      'referenceId': serializer.toJson<String>(referenceId),
      'promptSentence': serializer.toJson<String>(promptSentence),
      'focusText': serializer.toJson<String>(focusText),
      'reviewInterval': serializer.toJson<int>(reviewInterval),
      'easeFactor': serializer.toJson<double>(easeFactor),
      'repetitions': serializer.toJson<int>(repetitions),
      'nextReviewAt': serializer.toJson<DateTime>(nextReviewAt),
      'lastReviewedAt': serializer.toJson<DateTime?>(lastReviewedAt),
    };
  }

  SpacedRepetitionTableData copyWith({
    String? id,
    String? itemType,
    String? referenceId,
    String? promptSentence,
    String? focusText,
    int? reviewInterval,
    double? easeFactor,
    int? repetitions,
    DateTime? nextReviewAt,
    Value<DateTime?> lastReviewedAt = const Value.absent(),
  }) => SpacedRepetitionTableData(
    id: id ?? this.id,
    itemType: itemType ?? this.itemType,
    referenceId: referenceId ?? this.referenceId,
    promptSentence: promptSentence ?? this.promptSentence,
    focusText: focusText ?? this.focusText,
    reviewInterval: reviewInterval ?? this.reviewInterval,
    easeFactor: easeFactor ?? this.easeFactor,
    repetitions: repetitions ?? this.repetitions,
    nextReviewAt: nextReviewAt ?? this.nextReviewAt,
    lastReviewedAt: lastReviewedAt.present
        ? lastReviewedAt.value
        : this.lastReviewedAt,
  );
  SpacedRepetitionTableData copyWithCompanion(
    SpacedRepetitionTableCompanion data,
  ) {
    return SpacedRepetitionTableData(
      id: data.id.present ? data.id.value : this.id,
      itemType: data.itemType.present ? data.itemType.value : this.itemType,
      referenceId: data.referenceId.present
          ? data.referenceId.value
          : this.referenceId,
      promptSentence: data.promptSentence.present
          ? data.promptSentence.value
          : this.promptSentence,
      focusText: data.focusText.present ? data.focusText.value : this.focusText,
      reviewInterval: data.reviewInterval.present
          ? data.reviewInterval.value
          : this.reviewInterval,
      easeFactor: data.easeFactor.present
          ? data.easeFactor.value
          : this.easeFactor,
      repetitions: data.repetitions.present
          ? data.repetitions.value
          : this.repetitions,
      nextReviewAt: data.nextReviewAt.present
          ? data.nextReviewAt.value
          : this.nextReviewAt,
      lastReviewedAt: data.lastReviewedAt.present
          ? data.lastReviewedAt.value
          : this.lastReviewedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SpacedRepetitionTableData(')
          ..write('id: $id, ')
          ..write('itemType: $itemType, ')
          ..write('referenceId: $referenceId, ')
          ..write('promptSentence: $promptSentence, ')
          ..write('focusText: $focusText, ')
          ..write('reviewInterval: $reviewInterval, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('repetitions: $repetitions, ')
          ..write('nextReviewAt: $nextReviewAt, ')
          ..write('lastReviewedAt: $lastReviewedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    itemType,
    referenceId,
    promptSentence,
    focusText,
    reviewInterval,
    easeFactor,
    repetitions,
    nextReviewAt,
    lastReviewedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SpacedRepetitionTableData &&
          other.id == this.id &&
          other.itemType == this.itemType &&
          other.referenceId == this.referenceId &&
          other.promptSentence == this.promptSentence &&
          other.focusText == this.focusText &&
          other.reviewInterval == this.reviewInterval &&
          other.easeFactor == this.easeFactor &&
          other.repetitions == this.repetitions &&
          other.nextReviewAt == this.nextReviewAt &&
          other.lastReviewedAt == this.lastReviewedAt);
}

class SpacedRepetitionTableCompanion
    extends UpdateCompanion<SpacedRepetitionTableData> {
  final Value<String> id;
  final Value<String> itemType;
  final Value<String> referenceId;
  final Value<String> promptSentence;
  final Value<String> focusText;
  final Value<int> reviewInterval;
  final Value<double> easeFactor;
  final Value<int> repetitions;
  final Value<DateTime> nextReviewAt;
  final Value<DateTime?> lastReviewedAt;
  final Value<int> rowid;
  const SpacedRepetitionTableCompanion({
    this.id = const Value.absent(),
    this.itemType = const Value.absent(),
    this.referenceId = const Value.absent(),
    this.promptSentence = const Value.absent(),
    this.focusText = const Value.absent(),
    this.reviewInterval = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.nextReviewAt = const Value.absent(),
    this.lastReviewedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SpacedRepetitionTableCompanion.insert({
    required String id,
    required String itemType,
    required String referenceId,
    required String promptSentence,
    required String focusText,
    this.reviewInterval = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.repetitions = const Value.absent(),
    required DateTime nextReviewAt,
    this.lastReviewedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       itemType = Value(itemType),
       referenceId = Value(referenceId),
       promptSentence = Value(promptSentence),
       focusText = Value(focusText),
       nextReviewAt = Value(nextReviewAt);
  static Insertable<SpacedRepetitionTableData> custom({
    Expression<String>? id,
    Expression<String>? itemType,
    Expression<String>? referenceId,
    Expression<String>? promptSentence,
    Expression<String>? focusText,
    Expression<int>? reviewInterval,
    Expression<double>? easeFactor,
    Expression<int>? repetitions,
    Expression<DateTime>? nextReviewAt,
    Expression<DateTime>? lastReviewedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemType != null) 'item_type': itemType,
      if (referenceId != null) 'reference_id': referenceId,
      if (promptSentence != null) 'prompt_sentence': promptSentence,
      if (focusText != null) 'focus_text': focusText,
      if (reviewInterval != null) 'review_interval': reviewInterval,
      if (easeFactor != null) 'ease_factor': easeFactor,
      if (repetitions != null) 'repetitions': repetitions,
      if (nextReviewAt != null) 'next_review_at': nextReviewAt,
      if (lastReviewedAt != null) 'last_reviewed_at': lastReviewedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SpacedRepetitionTableCompanion copyWith({
    Value<String>? id,
    Value<String>? itemType,
    Value<String>? referenceId,
    Value<String>? promptSentence,
    Value<String>? focusText,
    Value<int>? reviewInterval,
    Value<double>? easeFactor,
    Value<int>? repetitions,
    Value<DateTime>? nextReviewAt,
    Value<DateTime?>? lastReviewedAt,
    Value<int>? rowid,
  }) {
    return SpacedRepetitionTableCompanion(
      id: id ?? this.id,
      itemType: itemType ?? this.itemType,
      referenceId: referenceId ?? this.referenceId,
      promptSentence: promptSentence ?? this.promptSentence,
      focusText: focusText ?? this.focusText,
      reviewInterval: reviewInterval ?? this.reviewInterval,
      easeFactor: easeFactor ?? this.easeFactor,
      repetitions: repetitions ?? this.repetitions,
      nextReviewAt: nextReviewAt ?? this.nextReviewAt,
      lastReviewedAt: lastReviewedAt ?? this.lastReviewedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (itemType.present) {
      map['item_type'] = Variable<String>(itemType.value);
    }
    if (referenceId.present) {
      map['reference_id'] = Variable<String>(referenceId.value);
    }
    if (promptSentence.present) {
      map['prompt_sentence'] = Variable<String>(promptSentence.value);
    }
    if (focusText.present) {
      map['focus_text'] = Variable<String>(focusText.value);
    }
    if (reviewInterval.present) {
      map['review_interval'] = Variable<int>(reviewInterval.value);
    }
    if (easeFactor.present) {
      map['ease_factor'] = Variable<double>(easeFactor.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<int>(repetitions.value);
    }
    if (nextReviewAt.present) {
      map['next_review_at'] = Variable<DateTime>(nextReviewAt.value);
    }
    if (lastReviewedAt.present) {
      map['last_reviewed_at'] = Variable<DateTime>(lastReviewedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpacedRepetitionTableCompanion(')
          ..write('id: $id, ')
          ..write('itemType: $itemType, ')
          ..write('referenceId: $referenceId, ')
          ..write('promptSentence: $promptSentence, ')
          ..write('focusText: $focusText, ')
          ..write('reviewInterval: $reviewInterval, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('repetitions: $repetitions, ')
          ..write('nextReviewAt: $nextReviewAt, ')
          ..write('lastReviewedAt: $lastReviewedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedArticlesTableTable extends CachedArticlesTable
    with TableInfo<$CachedArticlesTableTable, CachedArticlesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedArticlesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceNameMeta = const VerificationMeta(
    'sourceName',
  );
  @override
  late final GeneratedColumn<String> sourceName = GeneratedColumn<String>(
    'source_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceUrlMeta = const VerificationMeta(
    'sourceUrl',
  );
  @override
  late final GeneratedColumn<String> sourceUrl = GeneratedColumn<String>(
    'source_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _licenseMeta = const VerificationMeta(
    'license',
  );
  @override
  late final GeneratedColumn<String> license = GeneratedColumn<String>(
    'license',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Unknown'),
  );
  static const VerificationMeta _publishedAtMeta = const VerificationMeta(
    'publishedAt',
  );
  @override
  late final GeneratedColumn<DateTime> publishedAt = GeneratedColumn<DateTime>(
    'published_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cefrLevelMeta = const VerificationMeta(
    'cefrLevel',
  );
  @override
  late final GeneratedColumn<String> cefrLevel = GeneratedColumn<String>(
    'cefr_level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sentencesJsonMeta = const VerificationMeta(
    'sentencesJson',
  );
  @override
  late final GeneratedColumn<String> sentencesJson = GeneratedColumn<String>(
    'sentences_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _translationsArJsonMeta =
      const VerificationMeta('translationsArJson');
  @override
  late final GeneratedColumn<String> translationsArJson =
      GeneratedColumn<String>(
        'translations_ar_json',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _writingPromptMeta = const VerificationMeta(
    'writingPrompt',
  );
  @override
  late final GeneratedColumn<String> writingPrompt = GeneratedColumn<String>(
    'writing_prompt',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _readingMinutesMeta = const VerificationMeta(
    'readingMinutes',
  );
  @override
  late final GeneratedColumn<int> readingMinutes = GeneratedColumn<int>(
    'reading_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(5),
  );
  static const VerificationMeta _vocabCountMeta = const VerificationMeta(
    'vocabCount',
  );
  @override
  late final GeneratedColumn<int> vocabCount = GeneratedColumn<int>(
    'vocab_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10),
  );
  static const VerificationMeta _isNewMeta = const VerificationMeta('isNew');
  @override
  late final GeneratedColumn<bool> isNew = GeneratedColumn<bool>(
    'is_new',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_new" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
    'is_read',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_read" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sourceName,
    sourceUrl,
    license,
    author,
    publishedAt,
    category,
    cefrLevel,
    title,
    description,
    body,
    sentencesJson,
    translationsArJson,
    writingPrompt,
    readingMinutes,
    vocabCount,
    isNew,
    isRead,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_articles_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedArticlesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('source_name')) {
      context.handle(
        _sourceNameMeta,
        sourceName.isAcceptableOrUnknown(data['source_name']!, _sourceNameMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceNameMeta);
    }
    if (data.containsKey('source_url')) {
      context.handle(
        _sourceUrlMeta,
        sourceUrl.isAcceptableOrUnknown(data['source_url']!, _sourceUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceUrlMeta);
    }
    if (data.containsKey('license')) {
      context.handle(
        _licenseMeta,
        license.isAcceptableOrUnknown(data['license']!, _licenseMeta),
      );
    } else if (isInserting) {
      context.missing(_licenseMeta);
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    }
    if (data.containsKey('published_at')) {
      context.handle(
        _publishedAtMeta,
        publishedAt.isAcceptableOrUnknown(
          data['published_at']!,
          _publishedAtMeta,
        ),
      );
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('cefr_level')) {
      context.handle(
        _cefrLevelMeta,
        cefrLevel.isAcceptableOrUnknown(data['cefr_level']!, _cefrLevelMeta),
      );
    } else if (isInserting) {
      context.missing(_cefrLevelMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('sentences_json')) {
      context.handle(
        _sentencesJsonMeta,
        sentencesJson.isAcceptableOrUnknown(
          data['sentences_json']!,
          _sentencesJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sentencesJsonMeta);
    }
    if (data.containsKey('translations_ar_json')) {
      context.handle(
        _translationsArJsonMeta,
        translationsArJson.isAcceptableOrUnknown(
          data['translations_ar_json']!,
          _translationsArJsonMeta,
        ),
      );
    }
    if (data.containsKey('writing_prompt')) {
      context.handle(
        _writingPromptMeta,
        writingPrompt.isAcceptableOrUnknown(
          data['writing_prompt']!,
          _writingPromptMeta,
        ),
      );
    }
    if (data.containsKey('reading_minutes')) {
      context.handle(
        _readingMinutesMeta,
        readingMinutes.isAcceptableOrUnknown(
          data['reading_minutes']!,
          _readingMinutesMeta,
        ),
      );
    }
    if (data.containsKey('vocab_count')) {
      context.handle(
        _vocabCountMeta,
        vocabCount.isAcceptableOrUnknown(data['vocab_count']!, _vocabCountMeta),
      );
    }
    if (data.containsKey('is_new')) {
      context.handle(
        _isNewMeta,
        isNew.isAcceptableOrUnknown(data['is_new']!, _isNewMeta),
      );
    }
    if (data.containsKey('is_read')) {
      context.handle(
        _isReadMeta,
        isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta),
      );
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedArticlesTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedArticlesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      sourceName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_name'],
      )!,
      sourceUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_url'],
      )!,
      license: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}license'],
      )!,
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      )!,
      publishedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}published_at'],
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      cefrLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cefr_level'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      sentencesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sentences_json'],
      )!,
      translationsArJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}translations_ar_json'],
      ),
      writingPrompt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}writing_prompt'],
      ),
      readingMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reading_minutes'],
      )!,
      vocabCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vocab_count'],
      )!,
      isNew: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_new'],
      )!,
      isRead: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_read'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $CachedArticlesTableTable createAlias(String alias) {
    return $CachedArticlesTableTable(attachedDatabase, alias);
  }
}

class CachedArticlesTableData extends DataClass
    implements Insertable<CachedArticlesTableData> {
  final String id;
  final String sourceName;
  final String sourceUrl;
  final String license;
  final String author;
  final DateTime? publishedAt;
  final String category;
  final String cefrLevel;
  final String title;
  final String description;
  final String body;
  final String sentencesJson;
  final String? translationsArJson;
  final String? writingPrompt;
  final int readingMinutes;
  final int vocabCount;
  final bool isNew;
  final bool isRead;
  final DateTime cachedAt;
  const CachedArticlesTableData({
    required this.id,
    required this.sourceName,
    required this.sourceUrl,
    required this.license,
    required this.author,
    this.publishedAt,
    required this.category,
    required this.cefrLevel,
    required this.title,
    required this.description,
    required this.body,
    required this.sentencesJson,
    this.translationsArJson,
    this.writingPrompt,
    required this.readingMinutes,
    required this.vocabCount,
    required this.isNew,
    required this.isRead,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['source_name'] = Variable<String>(sourceName);
    map['source_url'] = Variable<String>(sourceUrl);
    map['license'] = Variable<String>(license);
    map['author'] = Variable<String>(author);
    if (!nullToAbsent || publishedAt != null) {
      map['published_at'] = Variable<DateTime>(publishedAt);
    }
    map['category'] = Variable<String>(category);
    map['cefr_level'] = Variable<String>(cefrLevel);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['body'] = Variable<String>(body);
    map['sentences_json'] = Variable<String>(sentencesJson);
    if (!nullToAbsent || translationsArJson != null) {
      map['translations_ar_json'] = Variable<String>(translationsArJson);
    }
    if (!nullToAbsent || writingPrompt != null) {
      map['writing_prompt'] = Variable<String>(writingPrompt);
    }
    map['reading_minutes'] = Variable<int>(readingMinutes);
    map['vocab_count'] = Variable<int>(vocabCount);
    map['is_new'] = Variable<bool>(isNew);
    map['is_read'] = Variable<bool>(isRead);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedArticlesTableCompanion toCompanion(bool nullToAbsent) {
    return CachedArticlesTableCompanion(
      id: Value(id),
      sourceName: Value(sourceName),
      sourceUrl: Value(sourceUrl),
      license: Value(license),
      author: Value(author),
      publishedAt: publishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedAt),
      category: Value(category),
      cefrLevel: Value(cefrLevel),
      title: Value(title),
      description: Value(description),
      body: Value(body),
      sentencesJson: Value(sentencesJson),
      translationsArJson: translationsArJson == null && nullToAbsent
          ? const Value.absent()
          : Value(translationsArJson),
      writingPrompt: writingPrompt == null && nullToAbsent
          ? const Value.absent()
          : Value(writingPrompt),
      readingMinutes: Value(readingMinutes),
      vocabCount: Value(vocabCount),
      isNew: Value(isNew),
      isRead: Value(isRead),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedArticlesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedArticlesTableData(
      id: serializer.fromJson<String>(json['id']),
      sourceName: serializer.fromJson<String>(json['sourceName']),
      sourceUrl: serializer.fromJson<String>(json['sourceUrl']),
      license: serializer.fromJson<String>(json['license']),
      author: serializer.fromJson<String>(json['author']),
      publishedAt: serializer.fromJson<DateTime?>(json['publishedAt']),
      category: serializer.fromJson<String>(json['category']),
      cefrLevel: serializer.fromJson<String>(json['cefrLevel']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      body: serializer.fromJson<String>(json['body']),
      sentencesJson: serializer.fromJson<String>(json['sentencesJson']),
      translationsArJson: serializer.fromJson<String?>(
        json['translationsArJson'],
      ),
      writingPrompt: serializer.fromJson<String?>(json['writingPrompt']),
      readingMinutes: serializer.fromJson<int>(json['readingMinutes']),
      vocabCount: serializer.fromJson<int>(json['vocabCount']),
      isNew: serializer.fromJson<bool>(json['isNew']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sourceName': serializer.toJson<String>(sourceName),
      'sourceUrl': serializer.toJson<String>(sourceUrl),
      'license': serializer.toJson<String>(license),
      'author': serializer.toJson<String>(author),
      'publishedAt': serializer.toJson<DateTime?>(publishedAt),
      'category': serializer.toJson<String>(category),
      'cefrLevel': serializer.toJson<String>(cefrLevel),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'body': serializer.toJson<String>(body),
      'sentencesJson': serializer.toJson<String>(sentencesJson),
      'translationsArJson': serializer.toJson<String?>(translationsArJson),
      'writingPrompt': serializer.toJson<String?>(writingPrompt),
      'readingMinutes': serializer.toJson<int>(readingMinutes),
      'vocabCount': serializer.toJson<int>(vocabCount),
      'isNew': serializer.toJson<bool>(isNew),
      'isRead': serializer.toJson<bool>(isRead),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedArticlesTableData copyWith({
    String? id,
    String? sourceName,
    String? sourceUrl,
    String? license,
    String? author,
    Value<DateTime?> publishedAt = const Value.absent(),
    String? category,
    String? cefrLevel,
    String? title,
    String? description,
    String? body,
    String? sentencesJson,
    Value<String?> translationsArJson = const Value.absent(),
    Value<String?> writingPrompt = const Value.absent(),
    int? readingMinutes,
    int? vocabCount,
    bool? isNew,
    bool? isRead,
    DateTime? cachedAt,
  }) => CachedArticlesTableData(
    id: id ?? this.id,
    sourceName: sourceName ?? this.sourceName,
    sourceUrl: sourceUrl ?? this.sourceUrl,
    license: license ?? this.license,
    author: author ?? this.author,
    publishedAt: publishedAt.present ? publishedAt.value : this.publishedAt,
    category: category ?? this.category,
    cefrLevel: cefrLevel ?? this.cefrLevel,
    title: title ?? this.title,
    description: description ?? this.description,
    body: body ?? this.body,
    sentencesJson: sentencesJson ?? this.sentencesJson,
    translationsArJson: translationsArJson.present
        ? translationsArJson.value
        : this.translationsArJson,
    writingPrompt: writingPrompt.present
        ? writingPrompt.value
        : this.writingPrompt,
    readingMinutes: readingMinutes ?? this.readingMinutes,
    vocabCount: vocabCount ?? this.vocabCount,
    isNew: isNew ?? this.isNew,
    isRead: isRead ?? this.isRead,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  CachedArticlesTableData copyWithCompanion(CachedArticlesTableCompanion data) {
    return CachedArticlesTableData(
      id: data.id.present ? data.id.value : this.id,
      sourceName: data.sourceName.present
          ? data.sourceName.value
          : this.sourceName,
      sourceUrl: data.sourceUrl.present ? data.sourceUrl.value : this.sourceUrl,
      license: data.license.present ? data.license.value : this.license,
      author: data.author.present ? data.author.value : this.author,
      publishedAt: data.publishedAt.present
          ? data.publishedAt.value
          : this.publishedAt,
      category: data.category.present ? data.category.value : this.category,
      cefrLevel: data.cefrLevel.present ? data.cefrLevel.value : this.cefrLevel,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      body: data.body.present ? data.body.value : this.body,
      sentencesJson: data.sentencesJson.present
          ? data.sentencesJson.value
          : this.sentencesJson,
      translationsArJson: data.translationsArJson.present
          ? data.translationsArJson.value
          : this.translationsArJson,
      writingPrompt: data.writingPrompt.present
          ? data.writingPrompt.value
          : this.writingPrompt,
      readingMinutes: data.readingMinutes.present
          ? data.readingMinutes.value
          : this.readingMinutes,
      vocabCount: data.vocabCount.present
          ? data.vocabCount.value
          : this.vocabCount,
      isNew: data.isNew.present ? data.isNew.value : this.isNew,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedArticlesTableData(')
          ..write('id: $id, ')
          ..write('sourceName: $sourceName, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('license: $license, ')
          ..write('author: $author, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('category: $category, ')
          ..write('cefrLevel: $cefrLevel, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('body: $body, ')
          ..write('sentencesJson: $sentencesJson, ')
          ..write('translationsArJson: $translationsArJson, ')
          ..write('writingPrompt: $writingPrompt, ')
          ..write('readingMinutes: $readingMinutes, ')
          ..write('vocabCount: $vocabCount, ')
          ..write('isNew: $isNew, ')
          ..write('isRead: $isRead, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sourceName,
    sourceUrl,
    license,
    author,
    publishedAt,
    category,
    cefrLevel,
    title,
    description,
    body,
    sentencesJson,
    translationsArJson,
    writingPrompt,
    readingMinutes,
    vocabCount,
    isNew,
    isRead,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedArticlesTableData &&
          other.id == this.id &&
          other.sourceName == this.sourceName &&
          other.sourceUrl == this.sourceUrl &&
          other.license == this.license &&
          other.author == this.author &&
          other.publishedAt == this.publishedAt &&
          other.category == this.category &&
          other.cefrLevel == this.cefrLevel &&
          other.title == this.title &&
          other.description == this.description &&
          other.body == this.body &&
          other.sentencesJson == this.sentencesJson &&
          other.translationsArJson == this.translationsArJson &&
          other.writingPrompt == this.writingPrompt &&
          other.readingMinutes == this.readingMinutes &&
          other.vocabCount == this.vocabCount &&
          other.isNew == this.isNew &&
          other.isRead == this.isRead &&
          other.cachedAt == this.cachedAt);
}

class CachedArticlesTableCompanion
    extends UpdateCompanion<CachedArticlesTableData> {
  final Value<String> id;
  final Value<String> sourceName;
  final Value<String> sourceUrl;
  final Value<String> license;
  final Value<String> author;
  final Value<DateTime?> publishedAt;
  final Value<String> category;
  final Value<String> cefrLevel;
  final Value<String> title;
  final Value<String> description;
  final Value<String> body;
  final Value<String> sentencesJson;
  final Value<String?> translationsArJson;
  final Value<String?> writingPrompt;
  final Value<int> readingMinutes;
  final Value<int> vocabCount;
  final Value<bool> isNew;
  final Value<bool> isRead;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const CachedArticlesTableCompanion({
    this.id = const Value.absent(),
    this.sourceName = const Value.absent(),
    this.sourceUrl = const Value.absent(),
    this.license = const Value.absent(),
    this.author = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.category = const Value.absent(),
    this.cefrLevel = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.body = const Value.absent(),
    this.sentencesJson = const Value.absent(),
    this.translationsArJson = const Value.absent(),
    this.writingPrompt = const Value.absent(),
    this.readingMinutes = const Value.absent(),
    this.vocabCount = const Value.absent(),
    this.isNew = const Value.absent(),
    this.isRead = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedArticlesTableCompanion.insert({
    required String id,
    required String sourceName,
    required String sourceUrl,
    required String license,
    this.author = const Value.absent(),
    this.publishedAt = const Value.absent(),
    required String category,
    required String cefrLevel,
    required String title,
    required String description,
    required String body,
    required String sentencesJson,
    this.translationsArJson = const Value.absent(),
    this.writingPrompt = const Value.absent(),
    this.readingMinutes = const Value.absent(),
    this.vocabCount = const Value.absent(),
    this.isNew = const Value.absent(),
    this.isRead = const Value.absent(),
    required DateTime cachedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       sourceName = Value(sourceName),
       sourceUrl = Value(sourceUrl),
       license = Value(license),
       category = Value(category),
       cefrLevel = Value(cefrLevel),
       title = Value(title),
       description = Value(description),
       body = Value(body),
       sentencesJson = Value(sentencesJson),
       cachedAt = Value(cachedAt);
  static Insertable<CachedArticlesTableData> custom({
    Expression<String>? id,
    Expression<String>? sourceName,
    Expression<String>? sourceUrl,
    Expression<String>? license,
    Expression<String>? author,
    Expression<DateTime>? publishedAt,
    Expression<String>? category,
    Expression<String>? cefrLevel,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? body,
    Expression<String>? sentencesJson,
    Expression<String>? translationsArJson,
    Expression<String>? writingPrompt,
    Expression<int>? readingMinutes,
    Expression<int>? vocabCount,
    Expression<bool>? isNew,
    Expression<bool>? isRead,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourceName != null) 'source_name': sourceName,
      if (sourceUrl != null) 'source_url': sourceUrl,
      if (license != null) 'license': license,
      if (author != null) 'author': author,
      if (publishedAt != null) 'published_at': publishedAt,
      if (category != null) 'category': category,
      if (cefrLevel != null) 'cefr_level': cefrLevel,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (body != null) 'body': body,
      if (sentencesJson != null) 'sentences_json': sentencesJson,
      if (translationsArJson != null)
        'translations_ar_json': translationsArJson,
      if (writingPrompt != null) 'writing_prompt': writingPrompt,
      if (readingMinutes != null) 'reading_minutes': readingMinutes,
      if (vocabCount != null) 'vocab_count': vocabCount,
      if (isNew != null) 'is_new': isNew,
      if (isRead != null) 'is_read': isRead,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedArticlesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? sourceName,
    Value<String>? sourceUrl,
    Value<String>? license,
    Value<String>? author,
    Value<DateTime?>? publishedAt,
    Value<String>? category,
    Value<String>? cefrLevel,
    Value<String>? title,
    Value<String>? description,
    Value<String>? body,
    Value<String>? sentencesJson,
    Value<String?>? translationsArJson,
    Value<String?>? writingPrompt,
    Value<int>? readingMinutes,
    Value<int>? vocabCount,
    Value<bool>? isNew,
    Value<bool>? isRead,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return CachedArticlesTableCompanion(
      id: id ?? this.id,
      sourceName: sourceName ?? this.sourceName,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      license: license ?? this.license,
      author: author ?? this.author,
      publishedAt: publishedAt ?? this.publishedAt,
      category: category ?? this.category,
      cefrLevel: cefrLevel ?? this.cefrLevel,
      title: title ?? this.title,
      description: description ?? this.description,
      body: body ?? this.body,
      sentencesJson: sentencesJson ?? this.sentencesJson,
      translationsArJson: translationsArJson ?? this.translationsArJson,
      writingPrompt: writingPrompt ?? this.writingPrompt,
      readingMinutes: readingMinutes ?? this.readingMinutes,
      vocabCount: vocabCount ?? this.vocabCount,
      isNew: isNew ?? this.isNew,
      isRead: isRead ?? this.isRead,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sourceName.present) {
      map['source_name'] = Variable<String>(sourceName.value);
    }
    if (sourceUrl.present) {
      map['source_url'] = Variable<String>(sourceUrl.value);
    }
    if (license.present) {
      map['license'] = Variable<String>(license.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<DateTime>(publishedAt.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (cefrLevel.present) {
      map['cefr_level'] = Variable<String>(cefrLevel.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (sentencesJson.present) {
      map['sentences_json'] = Variable<String>(sentencesJson.value);
    }
    if (translationsArJson.present) {
      map['translations_ar_json'] = Variable<String>(translationsArJson.value);
    }
    if (writingPrompt.present) {
      map['writing_prompt'] = Variable<String>(writingPrompt.value);
    }
    if (readingMinutes.present) {
      map['reading_minutes'] = Variable<int>(readingMinutes.value);
    }
    if (vocabCount.present) {
      map['vocab_count'] = Variable<int>(vocabCount.value);
    }
    if (isNew.present) {
      map['is_new'] = Variable<bool>(isNew.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedArticlesTableCompanion(')
          ..write('id: $id, ')
          ..write('sourceName: $sourceName, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('license: $license, ')
          ..write('author: $author, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('category: $category, ')
          ..write('cefrLevel: $cefrLevel, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('body: $body, ')
          ..write('sentencesJson: $sentencesJson, ')
          ..write('translationsArJson: $translationsArJson, ')
          ..write('writingPrompt: $writingPrompt, ')
          ..write('readingMinutes: $readingMinutes, ')
          ..write('vocabCount: $vocabCount, ')
          ..write('isNew: $isNew, ')
          ..write('isRead: $isRead, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedSentenceDataTableTable extends CachedSentenceDataTable
    with TableInfo<$CachedSentenceDataTableTable, CachedSentenceDataTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedSentenceDataTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _articleIdMeta = const VerificationMeta(
    'articleId',
  );
  @override
  late final GeneratedColumn<String> articleId = GeneratedColumn<String>(
    'article_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sentenceIndexMeta = const VerificationMeta(
    'sentenceIndex',
  );
  @override
  late final GeneratedColumn<int> sentenceIndex = GeneratedColumn<int>(
    'sentence_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _textContentMeta = const VerificationMeta(
    'textContent',
  );
  @override
  late final GeneratedColumn<String> textContent = GeneratedColumn<String>(
    'text_content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _translationArMeta = const VerificationMeta(
    'translationAr',
  );
  @override
  late final GeneratedColumn<String> translationAr = GeneratedColumn<String>(
    'translation_ar',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _audioUrlMeta = const VerificationMeta(
    'audioUrl',
  );
  @override
  late final GeneratedColumn<String> audioUrl = GeneratedColumn<String>(
    'audio_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    articleId,
    sentenceIndex,
    textContent,
    translationAr,
    audioUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_sentence_data_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedSentenceDataTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('article_id')) {
      context.handle(
        _articleIdMeta,
        articleId.isAcceptableOrUnknown(data['article_id']!, _articleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_articleIdMeta);
    }
    if (data.containsKey('sentence_index')) {
      context.handle(
        _sentenceIndexMeta,
        sentenceIndex.isAcceptableOrUnknown(
          data['sentence_index']!,
          _sentenceIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sentenceIndexMeta);
    }
    if (data.containsKey('text_content')) {
      context.handle(
        _textContentMeta,
        textContent.isAcceptableOrUnknown(
          data['text_content']!,
          _textContentMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_textContentMeta);
    }
    if (data.containsKey('translation_ar')) {
      context.handle(
        _translationArMeta,
        translationAr.isAcceptableOrUnknown(
          data['translation_ar']!,
          _translationArMeta,
        ),
      );
    }
    if (data.containsKey('audio_url')) {
      context.handle(
        _audioUrlMeta,
        audioUrl.isAcceptableOrUnknown(data['audio_url']!, _audioUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedSentenceDataTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedSentenceDataTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      articleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}article_id'],
      )!,
      sentenceIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sentence_index'],
      )!,
      textContent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text_content'],
      )!,
      translationAr: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}translation_ar'],
      ),
      audioUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_url'],
      ),
    );
  }

  @override
  $CachedSentenceDataTableTable createAlias(String alias) {
    return $CachedSentenceDataTableTable(attachedDatabase, alias);
  }
}

class CachedSentenceDataTableData extends DataClass
    implements Insertable<CachedSentenceDataTableData> {
  final String id;
  final String articleId;
  final int sentenceIndex;
  final String textContent;
  final String? translationAr;
  final String? audioUrl;
  const CachedSentenceDataTableData({
    required this.id,
    required this.articleId,
    required this.sentenceIndex,
    required this.textContent,
    this.translationAr,
    this.audioUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['article_id'] = Variable<String>(articleId);
    map['sentence_index'] = Variable<int>(sentenceIndex);
    map['text_content'] = Variable<String>(textContent);
    if (!nullToAbsent || translationAr != null) {
      map['translation_ar'] = Variable<String>(translationAr);
    }
    if (!nullToAbsent || audioUrl != null) {
      map['audio_url'] = Variable<String>(audioUrl);
    }
    return map;
  }

  CachedSentenceDataTableCompanion toCompanion(bool nullToAbsent) {
    return CachedSentenceDataTableCompanion(
      id: Value(id),
      articleId: Value(articleId),
      sentenceIndex: Value(sentenceIndex),
      textContent: Value(textContent),
      translationAr: translationAr == null && nullToAbsent
          ? const Value.absent()
          : Value(translationAr),
      audioUrl: audioUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(audioUrl),
    );
  }

  factory CachedSentenceDataTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedSentenceDataTableData(
      id: serializer.fromJson<String>(json['id']),
      articleId: serializer.fromJson<String>(json['articleId']),
      sentenceIndex: serializer.fromJson<int>(json['sentenceIndex']),
      textContent: serializer.fromJson<String>(json['textContent']),
      translationAr: serializer.fromJson<String?>(json['translationAr']),
      audioUrl: serializer.fromJson<String?>(json['audioUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'articleId': serializer.toJson<String>(articleId),
      'sentenceIndex': serializer.toJson<int>(sentenceIndex),
      'textContent': serializer.toJson<String>(textContent),
      'translationAr': serializer.toJson<String?>(translationAr),
      'audioUrl': serializer.toJson<String?>(audioUrl),
    };
  }

  CachedSentenceDataTableData copyWith({
    String? id,
    String? articleId,
    int? sentenceIndex,
    String? textContent,
    Value<String?> translationAr = const Value.absent(),
    Value<String?> audioUrl = const Value.absent(),
  }) => CachedSentenceDataTableData(
    id: id ?? this.id,
    articleId: articleId ?? this.articleId,
    sentenceIndex: sentenceIndex ?? this.sentenceIndex,
    textContent: textContent ?? this.textContent,
    translationAr: translationAr.present
        ? translationAr.value
        : this.translationAr,
    audioUrl: audioUrl.present ? audioUrl.value : this.audioUrl,
  );
  CachedSentenceDataTableData copyWithCompanion(
    CachedSentenceDataTableCompanion data,
  ) {
    return CachedSentenceDataTableData(
      id: data.id.present ? data.id.value : this.id,
      articleId: data.articleId.present ? data.articleId.value : this.articleId,
      sentenceIndex: data.sentenceIndex.present
          ? data.sentenceIndex.value
          : this.sentenceIndex,
      textContent: data.textContent.present
          ? data.textContent.value
          : this.textContent,
      translationAr: data.translationAr.present
          ? data.translationAr.value
          : this.translationAr,
      audioUrl: data.audioUrl.present ? data.audioUrl.value : this.audioUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedSentenceDataTableData(')
          ..write('id: $id, ')
          ..write('articleId: $articleId, ')
          ..write('sentenceIndex: $sentenceIndex, ')
          ..write('textContent: $textContent, ')
          ..write('translationAr: $translationAr, ')
          ..write('audioUrl: $audioUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    articleId,
    sentenceIndex,
    textContent,
    translationAr,
    audioUrl,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedSentenceDataTableData &&
          other.id == this.id &&
          other.articleId == this.articleId &&
          other.sentenceIndex == this.sentenceIndex &&
          other.textContent == this.textContent &&
          other.translationAr == this.translationAr &&
          other.audioUrl == this.audioUrl);
}

class CachedSentenceDataTableCompanion
    extends UpdateCompanion<CachedSentenceDataTableData> {
  final Value<String> id;
  final Value<String> articleId;
  final Value<int> sentenceIndex;
  final Value<String> textContent;
  final Value<String?> translationAr;
  final Value<String?> audioUrl;
  final Value<int> rowid;
  const CachedSentenceDataTableCompanion({
    this.id = const Value.absent(),
    this.articleId = const Value.absent(),
    this.sentenceIndex = const Value.absent(),
    this.textContent = const Value.absent(),
    this.translationAr = const Value.absent(),
    this.audioUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedSentenceDataTableCompanion.insert({
    required String id,
    required String articleId,
    required int sentenceIndex,
    required String textContent,
    this.translationAr = const Value.absent(),
    this.audioUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       articleId = Value(articleId),
       sentenceIndex = Value(sentenceIndex),
       textContent = Value(textContent);
  static Insertable<CachedSentenceDataTableData> custom({
    Expression<String>? id,
    Expression<String>? articleId,
    Expression<int>? sentenceIndex,
    Expression<String>? textContent,
    Expression<String>? translationAr,
    Expression<String>? audioUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (articleId != null) 'article_id': articleId,
      if (sentenceIndex != null) 'sentence_index': sentenceIndex,
      if (textContent != null) 'text_content': textContent,
      if (translationAr != null) 'translation_ar': translationAr,
      if (audioUrl != null) 'audio_url': audioUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedSentenceDataTableCompanion copyWith({
    Value<String>? id,
    Value<String>? articleId,
    Value<int>? sentenceIndex,
    Value<String>? textContent,
    Value<String?>? translationAr,
    Value<String?>? audioUrl,
    Value<int>? rowid,
  }) {
    return CachedSentenceDataTableCompanion(
      id: id ?? this.id,
      articleId: articleId ?? this.articleId,
      sentenceIndex: sentenceIndex ?? this.sentenceIndex,
      textContent: textContent ?? this.textContent,
      translationAr: translationAr ?? this.translationAr,
      audioUrl: audioUrl ?? this.audioUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (articleId.present) {
      map['article_id'] = Variable<String>(articleId.value);
    }
    if (sentenceIndex.present) {
      map['sentence_index'] = Variable<int>(sentenceIndex.value);
    }
    if (textContent.present) {
      map['text_content'] = Variable<String>(textContent.value);
    }
    if (translationAr.present) {
      map['translation_ar'] = Variable<String>(translationAr.value);
    }
    if (audioUrl.present) {
      map['audio_url'] = Variable<String>(audioUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedSentenceDataTableCompanion(')
          ..write('id: $id, ')
          ..write('articleId: $articleId, ')
          ..write('sentenceIndex: $sentenceIndex, ')
          ..write('textContent: $textContent, ')
          ..write('translationAr: $translationAr, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$FluentoDatabase extends GeneratedDatabase {
  _$FluentoDatabase(QueryExecutor e) : super(e);
  $FluentoDatabaseManager get managers => $FluentoDatabaseManager(this);
  late final $ReadingSessionsTableTable readingSessionsTable =
      $ReadingSessionsTableTable(this);
  late final $ArticleProgressTableTable articleProgressTable =
      $ArticleProgressTableTable(this);
  late final $ReadingResultsTableTable readingResultsTable =
      $ReadingResultsTableTable(this);
  late final $WeakPointsTableTable weakPointsTable = $WeakPointsTableTable(
    this,
  );
  late final $VocabularyEntriesTableTable vocabularyEntriesTable =
      $VocabularyEntriesTableTable(this);
  late final $WritingSubmissionsTableTable writingSubmissionsTable =
      $WritingSubmissionsTableTable(this);
  late final $SpacedRepetitionTableTable spacedRepetitionTable =
      $SpacedRepetitionTableTable(this);
  late final $CachedArticlesTableTable cachedArticlesTable =
      $CachedArticlesTableTable(this);
  late final $CachedSentenceDataTableTable cachedSentenceDataTable =
      $CachedSentenceDataTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    readingSessionsTable,
    articleProgressTable,
    readingResultsTable,
    weakPointsTable,
    vocabularyEntriesTable,
    writingSubmissionsTable,
    spacedRepetitionTable,
    cachedArticlesTable,
    cachedSentenceDataTable,
  ];
}

typedef $$ReadingSessionsTableTableCreateCompanionBuilder =
    ReadingSessionsTableCompanion Function({
      required String id,
      required String articleId,
      required String articleTitle,
      required double overallScore,
      required double readingAccuracy,
      required double pronunciationScore,
      required double fluencyScore,
      required int wpm,
      required int wordsRead,
      required DateTime completedAt,
      Value<int> rowid,
    });
typedef $$ReadingSessionsTableTableUpdateCompanionBuilder =
    ReadingSessionsTableCompanion Function({
      Value<String> id,
      Value<String> articleId,
      Value<String> articleTitle,
      Value<double> overallScore,
      Value<double> readingAccuracy,
      Value<double> pronunciationScore,
      Value<double> fluencyScore,
      Value<int> wpm,
      Value<int> wordsRead,
      Value<DateTime> completedAt,
      Value<int> rowid,
    });

class $$ReadingSessionsTableTableFilterComposer
    extends Composer<_$FluentoDatabase, $ReadingSessionsTableTable> {
  $$ReadingSessionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get articleId => $composableBuilder(
    column: $table.articleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get articleTitle => $composableBuilder(
    column: $table.articleTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get overallScore => $composableBuilder(
    column: $table.overallScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get readingAccuracy => $composableBuilder(
    column: $table.readingAccuracy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pronunciationScore => $composableBuilder(
    column: $table.pronunciationScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fluencyScore => $composableBuilder(
    column: $table.fluencyScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wpm => $composableBuilder(
    column: $table.wpm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wordsRead => $composableBuilder(
    column: $table.wordsRead,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReadingSessionsTableTableOrderingComposer
    extends Composer<_$FluentoDatabase, $ReadingSessionsTableTable> {
  $$ReadingSessionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get articleId => $composableBuilder(
    column: $table.articleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get articleTitle => $composableBuilder(
    column: $table.articleTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get overallScore => $composableBuilder(
    column: $table.overallScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get readingAccuracy => $composableBuilder(
    column: $table.readingAccuracy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pronunciationScore => $composableBuilder(
    column: $table.pronunciationScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fluencyScore => $composableBuilder(
    column: $table.fluencyScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wpm => $composableBuilder(
    column: $table.wpm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wordsRead => $composableBuilder(
    column: $table.wordsRead,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReadingSessionsTableTableAnnotationComposer
    extends Composer<_$FluentoDatabase, $ReadingSessionsTableTable> {
  $$ReadingSessionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get articleId =>
      $composableBuilder(column: $table.articleId, builder: (column) => column);

  GeneratedColumn<String> get articleTitle => $composableBuilder(
    column: $table.articleTitle,
    builder: (column) => column,
  );

  GeneratedColumn<double> get overallScore => $composableBuilder(
    column: $table.overallScore,
    builder: (column) => column,
  );

  GeneratedColumn<double> get readingAccuracy => $composableBuilder(
    column: $table.readingAccuracy,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pronunciationScore => $composableBuilder(
    column: $table.pronunciationScore,
    builder: (column) => column,
  );

  GeneratedColumn<double> get fluencyScore => $composableBuilder(
    column: $table.fluencyScore,
    builder: (column) => column,
  );

  GeneratedColumn<int> get wpm =>
      $composableBuilder(column: $table.wpm, builder: (column) => column);

  GeneratedColumn<int> get wordsRead =>
      $composableBuilder(column: $table.wordsRead, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );
}

class $$ReadingSessionsTableTableTableManager
    extends
        RootTableManager<
          _$FluentoDatabase,
          $ReadingSessionsTableTable,
          ReadingSessionsTableData,
          $$ReadingSessionsTableTableFilterComposer,
          $$ReadingSessionsTableTableOrderingComposer,
          $$ReadingSessionsTableTableAnnotationComposer,
          $$ReadingSessionsTableTableCreateCompanionBuilder,
          $$ReadingSessionsTableTableUpdateCompanionBuilder,
          (
            ReadingSessionsTableData,
            BaseReferences<
              _$FluentoDatabase,
              $ReadingSessionsTableTable,
              ReadingSessionsTableData
            >,
          ),
          ReadingSessionsTableData,
          PrefetchHooks Function()
        > {
  $$ReadingSessionsTableTableTableManager(
    _$FluentoDatabase db,
    $ReadingSessionsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReadingSessionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReadingSessionsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ReadingSessionsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> articleId = const Value.absent(),
                Value<String> articleTitle = const Value.absent(),
                Value<double> overallScore = const Value.absent(),
                Value<double> readingAccuracy = const Value.absent(),
                Value<double> pronunciationScore = const Value.absent(),
                Value<double> fluencyScore = const Value.absent(),
                Value<int> wpm = const Value.absent(),
                Value<int> wordsRead = const Value.absent(),
                Value<DateTime> completedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReadingSessionsTableCompanion(
                id: id,
                articleId: articleId,
                articleTitle: articleTitle,
                overallScore: overallScore,
                readingAccuracy: readingAccuracy,
                pronunciationScore: pronunciationScore,
                fluencyScore: fluencyScore,
                wpm: wpm,
                wordsRead: wordsRead,
                completedAt: completedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String articleId,
                required String articleTitle,
                required double overallScore,
                required double readingAccuracy,
                required double pronunciationScore,
                required double fluencyScore,
                required int wpm,
                required int wordsRead,
                required DateTime completedAt,
                Value<int> rowid = const Value.absent(),
              }) => ReadingSessionsTableCompanion.insert(
                id: id,
                articleId: articleId,
                articleTitle: articleTitle,
                overallScore: overallScore,
                readingAccuracy: readingAccuracy,
                pronunciationScore: pronunciationScore,
                fluencyScore: fluencyScore,
                wpm: wpm,
                wordsRead: wordsRead,
                completedAt: completedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $ReadingSessionsTableTable,
                    ReadingSessionsTableData
                  >(table),
                  BaseReferences<
                    _$FluentoDatabase,
                    $ReadingSessionsTableTable,
                    ReadingSessionsTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReadingSessionsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$FluentoDatabase,
      $ReadingSessionsTableTable,
      ReadingSessionsTableData,
      $$ReadingSessionsTableTableFilterComposer,
      $$ReadingSessionsTableTableOrderingComposer,
      $$ReadingSessionsTableTableAnnotationComposer,
      $$ReadingSessionsTableTableCreateCompanionBuilder,
      $$ReadingSessionsTableTableUpdateCompanionBuilder,
      (
        ReadingSessionsTableData,
        BaseReferences<
          _$FluentoDatabase,
          $ReadingSessionsTableTable,
          ReadingSessionsTableData
        >,
      ),
      ReadingSessionsTableData,
      PrefetchHooks Function()
    >;
typedef $$ArticleProgressTableTableCreateCompanionBuilder =
    ArticleProgressTableCompanion Function({
      required String articleId,
      Value<bool> isCompleted,
      Value<int> readCount,
      Value<double> highestScore,
      required DateTime lastReadAt,
      Value<int> rowid,
    });
typedef $$ArticleProgressTableTableUpdateCompanionBuilder =
    ArticleProgressTableCompanion Function({
      Value<String> articleId,
      Value<bool> isCompleted,
      Value<int> readCount,
      Value<double> highestScore,
      Value<DateTime> lastReadAt,
      Value<int> rowid,
    });

class $$ArticleProgressTableTableFilterComposer
    extends Composer<_$FluentoDatabase, $ArticleProgressTableTable> {
  $$ArticleProgressTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get articleId => $composableBuilder(
    column: $table.articleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get readCount => $composableBuilder(
    column: $table.readCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get highestScore => $composableBuilder(
    column: $table.highestScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReadAt => $composableBuilder(
    column: $table.lastReadAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ArticleProgressTableTableOrderingComposer
    extends Composer<_$FluentoDatabase, $ArticleProgressTableTable> {
  $$ArticleProgressTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get articleId => $composableBuilder(
    column: $table.articleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get readCount => $composableBuilder(
    column: $table.readCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get highestScore => $composableBuilder(
    column: $table.highestScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReadAt => $composableBuilder(
    column: $table.lastReadAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ArticleProgressTableTableAnnotationComposer
    extends Composer<_$FluentoDatabase, $ArticleProgressTableTable> {
  $$ArticleProgressTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get articleId =>
      $composableBuilder(column: $table.articleId, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get readCount =>
      $composableBuilder(column: $table.readCount, builder: (column) => column);

  GeneratedColumn<double> get highestScore => $composableBuilder(
    column: $table.highestScore,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastReadAt => $composableBuilder(
    column: $table.lastReadAt,
    builder: (column) => column,
  );
}

class $$ArticleProgressTableTableTableManager
    extends
        RootTableManager<
          _$FluentoDatabase,
          $ArticleProgressTableTable,
          ArticleProgressTableData,
          $$ArticleProgressTableTableFilterComposer,
          $$ArticleProgressTableTableOrderingComposer,
          $$ArticleProgressTableTableAnnotationComposer,
          $$ArticleProgressTableTableCreateCompanionBuilder,
          $$ArticleProgressTableTableUpdateCompanionBuilder,
          (
            ArticleProgressTableData,
            BaseReferences<
              _$FluentoDatabase,
              $ArticleProgressTableTable,
              ArticleProgressTableData
            >,
          ),
          ArticleProgressTableData,
          PrefetchHooks Function()
        > {
  $$ArticleProgressTableTableTableManager(
    _$FluentoDatabase db,
    $ArticleProgressTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArticleProgressTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArticleProgressTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ArticleProgressTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> articleId = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<int> readCount = const Value.absent(),
                Value<double> highestScore = const Value.absent(),
                Value<DateTime> lastReadAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ArticleProgressTableCompanion(
                articleId: articleId,
                isCompleted: isCompleted,
                readCount: readCount,
                highestScore: highestScore,
                lastReadAt: lastReadAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String articleId,
                Value<bool> isCompleted = const Value.absent(),
                Value<int> readCount = const Value.absent(),
                Value<double> highestScore = const Value.absent(),
                required DateTime lastReadAt,
                Value<int> rowid = const Value.absent(),
              }) => ArticleProgressTableCompanion.insert(
                articleId: articleId,
                isCompleted: isCompleted,
                readCount: readCount,
                highestScore: highestScore,
                lastReadAt: lastReadAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $ArticleProgressTableTable,
                    ArticleProgressTableData
                  >(table),
                  BaseReferences<
                    _$FluentoDatabase,
                    $ArticleProgressTableTable,
                    ArticleProgressTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ArticleProgressTableTableProcessedTableManager =
    ProcessedTableManager<
      _$FluentoDatabase,
      $ArticleProgressTableTable,
      ArticleProgressTableData,
      $$ArticleProgressTableTableFilterComposer,
      $$ArticleProgressTableTableOrderingComposer,
      $$ArticleProgressTableTableAnnotationComposer,
      $$ArticleProgressTableTableCreateCompanionBuilder,
      $$ArticleProgressTableTableUpdateCompanionBuilder,
      (
        ArticleProgressTableData,
        BaseReferences<
          _$FluentoDatabase,
          $ArticleProgressTableTable,
          ArticleProgressTableData
        >,
      ),
      ArticleProgressTableData,
      PrefetchHooks Function()
    >;
typedef $$ReadingResultsTableTableCreateCompanionBuilder =
    ReadingResultsTableCompanion Function({
      required String id,
      required String sessionId,
      required String encouragement,
      Value<int> rowid,
    });
typedef $$ReadingResultsTableTableUpdateCompanionBuilder =
    ReadingResultsTableCompanion Function({
      Value<String> id,
      Value<String> sessionId,
      Value<String> encouragement,
      Value<int> rowid,
    });

class $$ReadingResultsTableTableFilterComposer
    extends Composer<_$FluentoDatabase, $ReadingResultsTableTable> {
  $$ReadingResultsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get encouragement => $composableBuilder(
    column: $table.encouragement,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReadingResultsTableTableOrderingComposer
    extends Composer<_$FluentoDatabase, $ReadingResultsTableTable> {
  $$ReadingResultsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get encouragement => $composableBuilder(
    column: $table.encouragement,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReadingResultsTableTableAnnotationComposer
    extends Composer<_$FluentoDatabase, $ReadingResultsTableTable> {
  $$ReadingResultsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get encouragement => $composableBuilder(
    column: $table.encouragement,
    builder: (column) => column,
  );
}

class $$ReadingResultsTableTableTableManager
    extends
        RootTableManager<
          _$FluentoDatabase,
          $ReadingResultsTableTable,
          ReadingResultsTableData,
          $$ReadingResultsTableTableFilterComposer,
          $$ReadingResultsTableTableOrderingComposer,
          $$ReadingResultsTableTableAnnotationComposer,
          $$ReadingResultsTableTableCreateCompanionBuilder,
          $$ReadingResultsTableTableUpdateCompanionBuilder,
          (
            ReadingResultsTableData,
            BaseReferences<
              _$FluentoDatabase,
              $ReadingResultsTableTable,
              ReadingResultsTableData
            >,
          ),
          ReadingResultsTableData,
          PrefetchHooks Function()
        > {
  $$ReadingResultsTableTableTableManager(
    _$FluentoDatabase db,
    $ReadingResultsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReadingResultsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReadingResultsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ReadingResultsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String> encouragement = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReadingResultsTableCompanion(
                id: id,
                sessionId: sessionId,
                encouragement: encouragement,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sessionId,
                required String encouragement,
                Value<int> rowid = const Value.absent(),
              }) => ReadingResultsTableCompanion.insert(
                id: id,
                sessionId: sessionId,
                encouragement: encouragement,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $ReadingResultsTableTable,
                    ReadingResultsTableData
                  >(table),
                  BaseReferences<
                    _$FluentoDatabase,
                    $ReadingResultsTableTable,
                    ReadingResultsTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReadingResultsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$FluentoDatabase,
      $ReadingResultsTableTable,
      ReadingResultsTableData,
      $$ReadingResultsTableTableFilterComposer,
      $$ReadingResultsTableTableOrderingComposer,
      $$ReadingResultsTableTableAnnotationComposer,
      $$ReadingResultsTableTableCreateCompanionBuilder,
      $$ReadingResultsTableTableUpdateCompanionBuilder,
      (
        ReadingResultsTableData,
        BaseReferences<
          _$FluentoDatabase,
          $ReadingResultsTableTable,
          ReadingResultsTableData
        >,
      ),
      ReadingResultsTableData,
      PrefetchHooks Function()
    >;
typedef $$WeakPointsTableTableCreateCompanionBuilder =
    WeakPointsTableCompanion Function({
      required String id,
      required String pointId,
      required String articleId,
      required String type,
      required String title,
      required String description,
      required String focusWord,
      required String sentence,
      Value<String> sentenceTranslation,
      required String explanation,
      Value<String> minLevel,
      Value<bool> isFixed,
      Value<int> attemptCount,
      required DateTime recordedAt,
      Value<int> rowid,
    });
typedef $$WeakPointsTableTableUpdateCompanionBuilder =
    WeakPointsTableCompanion Function({
      Value<String> id,
      Value<String> pointId,
      Value<String> articleId,
      Value<String> type,
      Value<String> title,
      Value<String> description,
      Value<String> focusWord,
      Value<String> sentence,
      Value<String> sentenceTranslation,
      Value<String> explanation,
      Value<String> minLevel,
      Value<bool> isFixed,
      Value<int> attemptCount,
      Value<DateTime> recordedAt,
      Value<int> rowid,
    });

class $$WeakPointsTableTableFilterComposer
    extends Composer<_$FluentoDatabase, $WeakPointsTableTable> {
  $$WeakPointsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pointId => $composableBuilder(
    column: $table.pointId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get articleId => $composableBuilder(
    column: $table.articleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get focusWord => $composableBuilder(
    column: $table.focusWord,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sentence => $composableBuilder(
    column: $table.sentence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sentenceTranslation => $composableBuilder(
    column: $table.sentenceTranslation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get minLevel => $composableBuilder(
    column: $table.minLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isFixed => $composableBuilder(
    column: $table.isFixed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WeakPointsTableTableOrderingComposer
    extends Composer<_$FluentoDatabase, $WeakPointsTableTable> {
  $$WeakPointsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pointId => $composableBuilder(
    column: $table.pointId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get articleId => $composableBuilder(
    column: $table.articleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get focusWord => $composableBuilder(
    column: $table.focusWord,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sentence => $composableBuilder(
    column: $table.sentence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sentenceTranslation => $composableBuilder(
    column: $table.sentenceTranslation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get minLevel => $composableBuilder(
    column: $table.minLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isFixed => $composableBuilder(
    column: $table.isFixed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WeakPointsTableTableAnnotationComposer
    extends Composer<_$FluentoDatabase, $WeakPointsTableTable> {
  $$WeakPointsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pointId =>
      $composableBuilder(column: $table.pointId, builder: (column) => column);

  GeneratedColumn<String> get articleId =>
      $composableBuilder(column: $table.articleId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get focusWord =>
      $composableBuilder(column: $table.focusWord, builder: (column) => column);

  GeneratedColumn<String> get sentence =>
      $composableBuilder(column: $table.sentence, builder: (column) => column);

  GeneratedColumn<String> get sentenceTranslation => $composableBuilder(
    column: $table.sentenceTranslation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get explanation => $composableBuilder(
    column: $table.explanation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get minLevel =>
      $composableBuilder(column: $table.minLevel, builder: (column) => column);

  GeneratedColumn<bool> get isFixed =>
      $composableBuilder(column: $table.isFixed, builder: (column) => column);

  GeneratedColumn<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );
}

class $$WeakPointsTableTableTableManager
    extends
        RootTableManager<
          _$FluentoDatabase,
          $WeakPointsTableTable,
          WeakPointsTableData,
          $$WeakPointsTableTableFilterComposer,
          $$WeakPointsTableTableOrderingComposer,
          $$WeakPointsTableTableAnnotationComposer,
          $$WeakPointsTableTableCreateCompanionBuilder,
          $$WeakPointsTableTableUpdateCompanionBuilder,
          (
            WeakPointsTableData,
            BaseReferences<
              _$FluentoDatabase,
              $WeakPointsTableTable,
              WeakPointsTableData
            >,
          ),
          WeakPointsTableData,
          PrefetchHooks Function()
        > {
  $$WeakPointsTableTableTableManager(
    _$FluentoDatabase db,
    $WeakPointsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeakPointsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeakPointsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeakPointsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> pointId = const Value.absent(),
                Value<String> articleId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> focusWord = const Value.absent(),
                Value<String> sentence = const Value.absent(),
                Value<String> sentenceTranslation = const Value.absent(),
                Value<String> explanation = const Value.absent(),
                Value<String> minLevel = const Value.absent(),
                Value<bool> isFixed = const Value.absent(),
                Value<int> attemptCount = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WeakPointsTableCompanion(
                id: id,
                pointId: pointId,
                articleId: articleId,
                type: type,
                title: title,
                description: description,
                focusWord: focusWord,
                sentence: sentence,
                sentenceTranslation: sentenceTranslation,
                explanation: explanation,
                minLevel: minLevel,
                isFixed: isFixed,
                attemptCount: attemptCount,
                recordedAt: recordedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String pointId,
                required String articleId,
                required String type,
                required String title,
                required String description,
                required String focusWord,
                required String sentence,
                Value<String> sentenceTranslation = const Value.absent(),
                required String explanation,
                Value<String> minLevel = const Value.absent(),
                Value<bool> isFixed = const Value.absent(),
                Value<int> attemptCount = const Value.absent(),
                required DateTime recordedAt,
                Value<int> rowid = const Value.absent(),
              }) => WeakPointsTableCompanion.insert(
                id: id,
                pointId: pointId,
                articleId: articleId,
                type: type,
                title: title,
                description: description,
                focusWord: focusWord,
                sentence: sentence,
                sentenceTranslation: sentenceTranslation,
                explanation: explanation,
                minLevel: minLevel,
                isFixed: isFixed,
                attemptCount: attemptCount,
                recordedAt: recordedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$WeakPointsTableTable, WeakPointsTableData>(
                    table,
                  ),
                  BaseReferences<
                    _$FluentoDatabase,
                    $WeakPointsTableTable,
                    WeakPointsTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WeakPointsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$FluentoDatabase,
      $WeakPointsTableTable,
      WeakPointsTableData,
      $$WeakPointsTableTableFilterComposer,
      $$WeakPointsTableTableOrderingComposer,
      $$WeakPointsTableTableAnnotationComposer,
      $$WeakPointsTableTableCreateCompanionBuilder,
      $$WeakPointsTableTableUpdateCompanionBuilder,
      (
        WeakPointsTableData,
        BaseReferences<
          _$FluentoDatabase,
          $WeakPointsTableTable,
          WeakPointsTableData
        >,
      ),
      WeakPointsTableData,
      PrefetchHooks Function()
    >;
typedef $$VocabularyEntriesTableTableCreateCompanionBuilder =
    VocabularyEntriesTableCompanion Function({
      required String id,
      required String word,
      required String ipa,
      required String meaning,
      required String translation,
      required String exampleSentence,
      Value<String?> audioUrl,
      Value<bool> isLearned,
      Value<bool> isSaved,
      Value<bool> isBookmarked,
      Value<int> reviewInterval,
      Value<DateTime?> nextReviewAt,
      Value<DateTime?> lastReviewedAt,
      Value<double> easeFactor,
      Value<int> repetitionCount,
      Value<int> rowid,
    });
typedef $$VocabularyEntriesTableTableUpdateCompanionBuilder =
    VocabularyEntriesTableCompanion Function({
      Value<String> id,
      Value<String> word,
      Value<String> ipa,
      Value<String> meaning,
      Value<String> translation,
      Value<String> exampleSentence,
      Value<String?> audioUrl,
      Value<bool> isLearned,
      Value<bool> isSaved,
      Value<bool> isBookmarked,
      Value<int> reviewInterval,
      Value<DateTime?> nextReviewAt,
      Value<DateTime?> lastReviewedAt,
      Value<double> easeFactor,
      Value<int> repetitionCount,
      Value<int> rowid,
    });

class $$VocabularyEntriesTableTableFilterComposer
    extends Composer<_$FluentoDatabase, $VocabularyEntriesTableTable> {
  $$VocabularyEntriesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ipa => $composableBuilder(
    column: $table.ipa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get meaning => $composableBuilder(
    column: $table.meaning,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get translation => $composableBuilder(
    column: $table.translation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get exampleSentence => $composableBuilder(
    column: $table.exampleSentence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get audioUrl => $composableBuilder(
    column: $table.audioUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLearned => $composableBuilder(
    column: $table.isLearned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSaved => $composableBuilder(
    column: $table.isSaved,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reviewInterval => $composableBuilder(
    column: $table.reviewInterval,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextReviewAt => $composableBuilder(
    column: $table.nextReviewAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repetitionCount => $composableBuilder(
    column: $table.repetitionCount,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VocabularyEntriesTableTableOrderingComposer
    extends Composer<_$FluentoDatabase, $VocabularyEntriesTableTable> {
  $$VocabularyEntriesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ipa => $composableBuilder(
    column: $table.ipa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get meaning => $composableBuilder(
    column: $table.meaning,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get translation => $composableBuilder(
    column: $table.translation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get exampleSentence => $composableBuilder(
    column: $table.exampleSentence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get audioUrl => $composableBuilder(
    column: $table.audioUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLearned => $composableBuilder(
    column: $table.isLearned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSaved => $composableBuilder(
    column: $table.isSaved,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reviewInterval => $composableBuilder(
    column: $table.reviewInterval,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextReviewAt => $composableBuilder(
    column: $table.nextReviewAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repetitionCount => $composableBuilder(
    column: $table.repetitionCount,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VocabularyEntriesTableTableAnnotationComposer
    extends Composer<_$FluentoDatabase, $VocabularyEntriesTableTable> {
  $$VocabularyEntriesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumn<String> get ipa =>
      $composableBuilder(column: $table.ipa, builder: (column) => column);

  GeneratedColumn<String> get meaning =>
      $composableBuilder(column: $table.meaning, builder: (column) => column);

  GeneratedColumn<String> get translation => $composableBuilder(
    column: $table.translation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get exampleSentence => $composableBuilder(
    column: $table.exampleSentence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get audioUrl =>
      $composableBuilder(column: $table.audioUrl, builder: (column) => column);

  GeneratedColumn<bool> get isLearned =>
      $composableBuilder(column: $table.isLearned, builder: (column) => column);

  GeneratedColumn<bool> get isSaved =>
      $composableBuilder(column: $table.isSaved, builder: (column) => column);

  GeneratedColumn<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => column,
  );

  GeneratedColumn<int> get reviewInterval => $composableBuilder(
    column: $table.reviewInterval,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get nextReviewAt => $composableBuilder(
    column: $table.nextReviewAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => column,
  );

  GeneratedColumn<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get repetitionCount => $composableBuilder(
    column: $table.repetitionCount,
    builder: (column) => column,
  );
}

class $$VocabularyEntriesTableTableTableManager
    extends
        RootTableManager<
          _$FluentoDatabase,
          $VocabularyEntriesTableTable,
          VocabularyEntriesTableData,
          $$VocabularyEntriesTableTableFilterComposer,
          $$VocabularyEntriesTableTableOrderingComposer,
          $$VocabularyEntriesTableTableAnnotationComposer,
          $$VocabularyEntriesTableTableCreateCompanionBuilder,
          $$VocabularyEntriesTableTableUpdateCompanionBuilder,
          (
            VocabularyEntriesTableData,
            BaseReferences<
              _$FluentoDatabase,
              $VocabularyEntriesTableTable,
              VocabularyEntriesTableData
            >,
          ),
          VocabularyEntriesTableData,
          PrefetchHooks Function()
        > {
  $$VocabularyEntriesTableTableTableManager(
    _$FluentoDatabase db,
    $VocabularyEntriesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VocabularyEntriesTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$VocabularyEntriesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$VocabularyEntriesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> word = const Value.absent(),
                Value<String> ipa = const Value.absent(),
                Value<String> meaning = const Value.absent(),
                Value<String> translation = const Value.absent(),
                Value<String> exampleSentence = const Value.absent(),
                Value<String?> audioUrl = const Value.absent(),
                Value<bool> isLearned = const Value.absent(),
                Value<bool> isSaved = const Value.absent(),
                Value<bool> isBookmarked = const Value.absent(),
                Value<int> reviewInterval = const Value.absent(),
                Value<DateTime?> nextReviewAt = const Value.absent(),
                Value<DateTime?> lastReviewedAt = const Value.absent(),
                Value<double> easeFactor = const Value.absent(),
                Value<int> repetitionCount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VocabularyEntriesTableCompanion(
                id: id,
                word: word,
                ipa: ipa,
                meaning: meaning,
                translation: translation,
                exampleSentence: exampleSentence,
                audioUrl: audioUrl,
                isLearned: isLearned,
                isSaved: isSaved,
                isBookmarked: isBookmarked,
                reviewInterval: reviewInterval,
                nextReviewAt: nextReviewAt,
                lastReviewedAt: lastReviewedAt,
                easeFactor: easeFactor,
                repetitionCount: repetitionCount,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String word,
                required String ipa,
                required String meaning,
                required String translation,
                required String exampleSentence,
                Value<String?> audioUrl = const Value.absent(),
                Value<bool> isLearned = const Value.absent(),
                Value<bool> isSaved = const Value.absent(),
                Value<bool> isBookmarked = const Value.absent(),
                Value<int> reviewInterval = const Value.absent(),
                Value<DateTime?> nextReviewAt = const Value.absent(),
                Value<DateTime?> lastReviewedAt = const Value.absent(),
                Value<double> easeFactor = const Value.absent(),
                Value<int> repetitionCount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VocabularyEntriesTableCompanion.insert(
                id: id,
                word: word,
                ipa: ipa,
                meaning: meaning,
                translation: translation,
                exampleSentence: exampleSentence,
                audioUrl: audioUrl,
                isLearned: isLearned,
                isSaved: isSaved,
                isBookmarked: isBookmarked,
                reviewInterval: reviewInterval,
                nextReviewAt: nextReviewAt,
                lastReviewedAt: lastReviewedAt,
                easeFactor: easeFactor,
                repetitionCount: repetitionCount,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $VocabularyEntriesTableTable,
                    VocabularyEntriesTableData
                  >(table),
                  BaseReferences<
                    _$FluentoDatabase,
                    $VocabularyEntriesTableTable,
                    VocabularyEntriesTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VocabularyEntriesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$FluentoDatabase,
      $VocabularyEntriesTableTable,
      VocabularyEntriesTableData,
      $$VocabularyEntriesTableTableFilterComposer,
      $$VocabularyEntriesTableTableOrderingComposer,
      $$VocabularyEntriesTableTableAnnotationComposer,
      $$VocabularyEntriesTableTableCreateCompanionBuilder,
      $$VocabularyEntriesTableTableUpdateCompanionBuilder,
      (
        VocabularyEntriesTableData,
        BaseReferences<
          _$FluentoDatabase,
          $VocabularyEntriesTableTable,
          VocabularyEntriesTableData
        >,
      ),
      VocabularyEntriesTableData,
      PrefetchHooks Function()
    >;
typedef $$WritingSubmissionsTableTableCreateCompanionBuilder =
    WritingSubmissionsTableCompanion Function({
      required String id,
      required String taskId,
      required String articleTitle,
      required String prompt,
      required String userText,
      required double score,
      required String overallFeedback,
      required String correctionsJson,
      required DateTime submittedAt,
      Value<int> rowid,
    });
typedef $$WritingSubmissionsTableTableUpdateCompanionBuilder =
    WritingSubmissionsTableCompanion Function({
      Value<String> id,
      Value<String> taskId,
      Value<String> articleTitle,
      Value<String> prompt,
      Value<String> userText,
      Value<double> score,
      Value<String> overallFeedback,
      Value<String> correctionsJson,
      Value<DateTime> submittedAt,
      Value<int> rowid,
    });

class $$WritingSubmissionsTableTableFilterComposer
    extends Composer<_$FluentoDatabase, $WritingSubmissionsTableTable> {
  $$WritingSubmissionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taskId => $composableBuilder(
    column: $table.taskId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get articleTitle => $composableBuilder(
    column: $table.articleTitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prompt => $composableBuilder(
    column: $table.prompt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userText => $composableBuilder(
    column: $table.userText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get overallFeedback => $composableBuilder(
    column: $table.overallFeedback,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get correctionsJson => $composableBuilder(
    column: $table.correctionsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get submittedAt => $composableBuilder(
    column: $table.submittedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WritingSubmissionsTableTableOrderingComposer
    extends Composer<_$FluentoDatabase, $WritingSubmissionsTableTable> {
  $$WritingSubmissionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taskId => $composableBuilder(
    column: $table.taskId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get articleTitle => $composableBuilder(
    column: $table.articleTitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prompt => $composableBuilder(
    column: $table.prompt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userText => $composableBuilder(
    column: $table.userText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get overallFeedback => $composableBuilder(
    column: $table.overallFeedback,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get correctionsJson => $composableBuilder(
    column: $table.correctionsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get submittedAt => $composableBuilder(
    column: $table.submittedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WritingSubmissionsTableTableAnnotationComposer
    extends Composer<_$FluentoDatabase, $WritingSubmissionsTableTable> {
  $$WritingSubmissionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get taskId =>
      $composableBuilder(column: $table.taskId, builder: (column) => column);

  GeneratedColumn<String> get articleTitle => $composableBuilder(
    column: $table.articleTitle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get prompt =>
      $composableBuilder(column: $table.prompt, builder: (column) => column);

  GeneratedColumn<String> get userText =>
      $composableBuilder(column: $table.userText, builder: (column) => column);

  GeneratedColumn<double> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<String> get overallFeedback => $composableBuilder(
    column: $table.overallFeedback,
    builder: (column) => column,
  );

  GeneratedColumn<String> get correctionsJson => $composableBuilder(
    column: $table.correctionsJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get submittedAt => $composableBuilder(
    column: $table.submittedAt,
    builder: (column) => column,
  );
}

class $$WritingSubmissionsTableTableTableManager
    extends
        RootTableManager<
          _$FluentoDatabase,
          $WritingSubmissionsTableTable,
          WritingSubmissionsTableData,
          $$WritingSubmissionsTableTableFilterComposer,
          $$WritingSubmissionsTableTableOrderingComposer,
          $$WritingSubmissionsTableTableAnnotationComposer,
          $$WritingSubmissionsTableTableCreateCompanionBuilder,
          $$WritingSubmissionsTableTableUpdateCompanionBuilder,
          (
            WritingSubmissionsTableData,
            BaseReferences<
              _$FluentoDatabase,
              $WritingSubmissionsTableTable,
              WritingSubmissionsTableData
            >,
          ),
          WritingSubmissionsTableData,
          PrefetchHooks Function()
        > {
  $$WritingSubmissionsTableTableTableManager(
    _$FluentoDatabase db,
    $WritingSubmissionsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WritingSubmissionsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$WritingSubmissionsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$WritingSubmissionsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> taskId = const Value.absent(),
                Value<String> articleTitle = const Value.absent(),
                Value<String> prompt = const Value.absent(),
                Value<String> userText = const Value.absent(),
                Value<double> score = const Value.absent(),
                Value<String> overallFeedback = const Value.absent(),
                Value<String> correctionsJson = const Value.absent(),
                Value<DateTime> submittedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WritingSubmissionsTableCompanion(
                id: id,
                taskId: taskId,
                articleTitle: articleTitle,
                prompt: prompt,
                userText: userText,
                score: score,
                overallFeedback: overallFeedback,
                correctionsJson: correctionsJson,
                submittedAt: submittedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String taskId,
                required String articleTitle,
                required String prompt,
                required String userText,
                required double score,
                required String overallFeedback,
                required String correctionsJson,
                required DateTime submittedAt,
                Value<int> rowid = const Value.absent(),
              }) => WritingSubmissionsTableCompanion.insert(
                id: id,
                taskId: taskId,
                articleTitle: articleTitle,
                prompt: prompt,
                userText: userText,
                score: score,
                overallFeedback: overallFeedback,
                correctionsJson: correctionsJson,
                submittedAt: submittedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $WritingSubmissionsTableTable,
                    WritingSubmissionsTableData
                  >(table),
                  BaseReferences<
                    _$FluentoDatabase,
                    $WritingSubmissionsTableTable,
                    WritingSubmissionsTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WritingSubmissionsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$FluentoDatabase,
      $WritingSubmissionsTableTable,
      WritingSubmissionsTableData,
      $$WritingSubmissionsTableTableFilterComposer,
      $$WritingSubmissionsTableTableOrderingComposer,
      $$WritingSubmissionsTableTableAnnotationComposer,
      $$WritingSubmissionsTableTableCreateCompanionBuilder,
      $$WritingSubmissionsTableTableUpdateCompanionBuilder,
      (
        WritingSubmissionsTableData,
        BaseReferences<
          _$FluentoDatabase,
          $WritingSubmissionsTableTable,
          WritingSubmissionsTableData
        >,
      ),
      WritingSubmissionsTableData,
      PrefetchHooks Function()
    >;
typedef $$SpacedRepetitionTableTableCreateCompanionBuilder =
    SpacedRepetitionTableCompanion Function({
      required String id,
      required String itemType,
      required String referenceId,
      required String promptSentence,
      required String focusText,
      Value<int> reviewInterval,
      Value<double> easeFactor,
      Value<int> repetitions,
      required DateTime nextReviewAt,
      Value<DateTime?> lastReviewedAt,
      Value<int> rowid,
    });
typedef $$SpacedRepetitionTableTableUpdateCompanionBuilder =
    SpacedRepetitionTableCompanion Function({
      Value<String> id,
      Value<String> itemType,
      Value<String> referenceId,
      Value<String> promptSentence,
      Value<String> focusText,
      Value<int> reviewInterval,
      Value<double> easeFactor,
      Value<int> repetitions,
      Value<DateTime> nextReviewAt,
      Value<DateTime?> lastReviewedAt,
      Value<int> rowid,
    });

class $$SpacedRepetitionTableTableFilterComposer
    extends Composer<_$FluentoDatabase, $SpacedRepetitionTableTable> {
  $$SpacedRepetitionTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get itemType => $composableBuilder(
    column: $table.itemType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get referenceId => $composableBuilder(
    column: $table.referenceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get promptSentence => $composableBuilder(
    column: $table.promptSentence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get focusText => $composableBuilder(
    column: $table.focusText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reviewInterval => $composableBuilder(
    column: $table.reviewInterval,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextReviewAt => $composableBuilder(
    column: $table.nextReviewAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SpacedRepetitionTableTableOrderingComposer
    extends Composer<_$FluentoDatabase, $SpacedRepetitionTableTable> {
  $$SpacedRepetitionTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get itemType => $composableBuilder(
    column: $table.itemType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get referenceId => $composableBuilder(
    column: $table.referenceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get promptSentence => $composableBuilder(
    column: $table.promptSentence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get focusText => $composableBuilder(
    column: $table.focusText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reviewInterval => $composableBuilder(
    column: $table.reviewInterval,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextReviewAt => $composableBuilder(
    column: $table.nextReviewAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SpacedRepetitionTableTableAnnotationComposer
    extends Composer<_$FluentoDatabase, $SpacedRepetitionTableTable> {
  $$SpacedRepetitionTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get itemType =>
      $composableBuilder(column: $table.itemType, builder: (column) => column);

  GeneratedColumn<String> get referenceId => $composableBuilder(
    column: $table.referenceId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get promptSentence => $composableBuilder(
    column: $table.promptSentence,
    builder: (column) => column,
  );

  GeneratedColumn<String> get focusText =>
      $composableBuilder(column: $table.focusText, builder: (column) => column);

  GeneratedColumn<int> get reviewInterval => $composableBuilder(
    column: $table.reviewInterval,
    builder: (column) => column,
  );

  GeneratedColumn<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get nextReviewAt => $composableBuilder(
    column: $table.nextReviewAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastReviewedAt => $composableBuilder(
    column: $table.lastReviewedAt,
    builder: (column) => column,
  );
}

class $$SpacedRepetitionTableTableTableManager
    extends
        RootTableManager<
          _$FluentoDatabase,
          $SpacedRepetitionTableTable,
          SpacedRepetitionTableData,
          $$SpacedRepetitionTableTableFilterComposer,
          $$SpacedRepetitionTableTableOrderingComposer,
          $$SpacedRepetitionTableTableAnnotationComposer,
          $$SpacedRepetitionTableTableCreateCompanionBuilder,
          $$SpacedRepetitionTableTableUpdateCompanionBuilder,
          (
            SpacedRepetitionTableData,
            BaseReferences<
              _$FluentoDatabase,
              $SpacedRepetitionTableTable,
              SpacedRepetitionTableData
            >,
          ),
          SpacedRepetitionTableData,
          PrefetchHooks Function()
        > {
  $$SpacedRepetitionTableTableTableManager(
    _$FluentoDatabase db,
    $SpacedRepetitionTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SpacedRepetitionTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$SpacedRepetitionTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SpacedRepetitionTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> itemType = const Value.absent(),
                Value<String> referenceId = const Value.absent(),
                Value<String> promptSentence = const Value.absent(),
                Value<String> focusText = const Value.absent(),
                Value<int> reviewInterval = const Value.absent(),
                Value<double> easeFactor = const Value.absent(),
                Value<int> repetitions = const Value.absent(),
                Value<DateTime> nextReviewAt = const Value.absent(),
                Value<DateTime?> lastReviewedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SpacedRepetitionTableCompanion(
                id: id,
                itemType: itemType,
                referenceId: referenceId,
                promptSentence: promptSentence,
                focusText: focusText,
                reviewInterval: reviewInterval,
                easeFactor: easeFactor,
                repetitions: repetitions,
                nextReviewAt: nextReviewAt,
                lastReviewedAt: lastReviewedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String itemType,
                required String referenceId,
                required String promptSentence,
                required String focusText,
                Value<int> reviewInterval = const Value.absent(),
                Value<double> easeFactor = const Value.absent(),
                Value<int> repetitions = const Value.absent(),
                required DateTime nextReviewAt,
                Value<DateTime?> lastReviewedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SpacedRepetitionTableCompanion.insert(
                id: id,
                itemType: itemType,
                referenceId: referenceId,
                promptSentence: promptSentence,
                focusText: focusText,
                reviewInterval: reviewInterval,
                easeFactor: easeFactor,
                repetitions: repetitions,
                nextReviewAt: nextReviewAt,
                lastReviewedAt: lastReviewedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $SpacedRepetitionTableTable,
                    SpacedRepetitionTableData
                  >(table),
                  BaseReferences<
                    _$FluentoDatabase,
                    $SpacedRepetitionTableTable,
                    SpacedRepetitionTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SpacedRepetitionTableTableProcessedTableManager =
    ProcessedTableManager<
      _$FluentoDatabase,
      $SpacedRepetitionTableTable,
      SpacedRepetitionTableData,
      $$SpacedRepetitionTableTableFilterComposer,
      $$SpacedRepetitionTableTableOrderingComposer,
      $$SpacedRepetitionTableTableAnnotationComposer,
      $$SpacedRepetitionTableTableCreateCompanionBuilder,
      $$SpacedRepetitionTableTableUpdateCompanionBuilder,
      (
        SpacedRepetitionTableData,
        BaseReferences<
          _$FluentoDatabase,
          $SpacedRepetitionTableTable,
          SpacedRepetitionTableData
        >,
      ),
      SpacedRepetitionTableData,
      PrefetchHooks Function()
    >;
typedef $$CachedArticlesTableTableCreateCompanionBuilder =
    CachedArticlesTableCompanion Function({
      required String id,
      required String sourceName,
      required String sourceUrl,
      required String license,
      Value<String> author,
      Value<DateTime?> publishedAt,
      required String category,
      required String cefrLevel,
      required String title,
      required String description,
      required String body,
      required String sentencesJson,
      Value<String?> translationsArJson,
      Value<String?> writingPrompt,
      Value<int> readingMinutes,
      Value<int> vocabCount,
      Value<bool> isNew,
      Value<bool> isRead,
      required DateTime cachedAt,
      Value<int> rowid,
    });
typedef $$CachedArticlesTableTableUpdateCompanionBuilder =
    CachedArticlesTableCompanion Function({
      Value<String> id,
      Value<String> sourceName,
      Value<String> sourceUrl,
      Value<String> license,
      Value<String> author,
      Value<DateTime?> publishedAt,
      Value<String> category,
      Value<String> cefrLevel,
      Value<String> title,
      Value<String> description,
      Value<String> body,
      Value<String> sentencesJson,
      Value<String?> translationsArJson,
      Value<String?> writingPrompt,
      Value<int> readingMinutes,
      Value<int> vocabCount,
      Value<bool> isNew,
      Value<bool> isRead,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$CachedArticlesTableTableFilterComposer
    extends Composer<_$FluentoDatabase, $CachedArticlesTableTable> {
  $$CachedArticlesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceUrl => $composableBuilder(
    column: $table.sourceUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get license => $composableBuilder(
    column: $table.license,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cefrLevel => $composableBuilder(
    column: $table.cefrLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sentencesJson => $composableBuilder(
    column: $table.sentencesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get translationsArJson => $composableBuilder(
    column: $table.translationsArJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get writingPrompt => $composableBuilder(
    column: $table.writingPrompt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get readingMinutes => $composableBuilder(
    column: $table.readingMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get vocabCount => $composableBuilder(
    column: $table.vocabCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isNew => $composableBuilder(
    column: $table.isNew,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedArticlesTableTableOrderingComposer
    extends Composer<_$FluentoDatabase, $CachedArticlesTableTable> {
  $$CachedArticlesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceUrl => $composableBuilder(
    column: $table.sourceUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get license => $composableBuilder(
    column: $table.license,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cefrLevel => $composableBuilder(
    column: $table.cefrLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sentencesJson => $composableBuilder(
    column: $table.sentencesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get translationsArJson => $composableBuilder(
    column: $table.translationsArJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get writingPrompt => $composableBuilder(
    column: $table.writingPrompt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get readingMinutes => $composableBuilder(
    column: $table.readingMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get vocabCount => $composableBuilder(
    column: $table.vocabCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isNew => $composableBuilder(
    column: $table.isNew,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedArticlesTableTableAnnotationComposer
    extends Composer<_$FluentoDatabase, $CachedArticlesTableTable> {
  $$CachedArticlesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceUrl =>
      $composableBuilder(column: $table.sourceUrl, builder: (column) => column);

  GeneratedColumn<String> get license =>
      $composableBuilder(column: $table.license, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get cefrLevel =>
      $composableBuilder(column: $table.cefrLevel, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get sentencesJson => $composableBuilder(
    column: $table.sentencesJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get translationsArJson => $composableBuilder(
    column: $table.translationsArJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get writingPrompt => $composableBuilder(
    column: $table.writingPrompt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get readingMinutes => $composableBuilder(
    column: $table.readingMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get vocabCount => $composableBuilder(
    column: $table.vocabCount,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isNew =>
      $composableBuilder(column: $table.isNew, builder: (column) => column);

  GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedArticlesTableTableTableManager
    extends
        RootTableManager<
          _$FluentoDatabase,
          $CachedArticlesTableTable,
          CachedArticlesTableData,
          $$CachedArticlesTableTableFilterComposer,
          $$CachedArticlesTableTableOrderingComposer,
          $$CachedArticlesTableTableAnnotationComposer,
          $$CachedArticlesTableTableCreateCompanionBuilder,
          $$CachedArticlesTableTableUpdateCompanionBuilder,
          (
            CachedArticlesTableData,
            BaseReferences<
              _$FluentoDatabase,
              $CachedArticlesTableTable,
              CachedArticlesTableData
            >,
          ),
          CachedArticlesTableData,
          PrefetchHooks Function()
        > {
  $$CachedArticlesTableTableTableManager(
    _$FluentoDatabase db,
    $CachedArticlesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedArticlesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedArticlesTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CachedArticlesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> sourceName = const Value.absent(),
                Value<String> sourceUrl = const Value.absent(),
                Value<String> license = const Value.absent(),
                Value<String> author = const Value.absent(),
                Value<DateTime?> publishedAt = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> cefrLevel = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<String> sentencesJson = const Value.absent(),
                Value<String?> translationsArJson = const Value.absent(),
                Value<String?> writingPrompt = const Value.absent(),
                Value<int> readingMinutes = const Value.absent(),
                Value<int> vocabCount = const Value.absent(),
                Value<bool> isNew = const Value.absent(),
                Value<bool> isRead = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedArticlesTableCompanion(
                id: id,
                sourceName: sourceName,
                sourceUrl: sourceUrl,
                license: license,
                author: author,
                publishedAt: publishedAt,
                category: category,
                cefrLevel: cefrLevel,
                title: title,
                description: description,
                body: body,
                sentencesJson: sentencesJson,
                translationsArJson: translationsArJson,
                writingPrompt: writingPrompt,
                readingMinutes: readingMinutes,
                vocabCount: vocabCount,
                isNew: isNew,
                isRead: isRead,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String sourceName,
                required String sourceUrl,
                required String license,
                Value<String> author = const Value.absent(),
                Value<DateTime?> publishedAt = const Value.absent(),
                required String category,
                required String cefrLevel,
                required String title,
                required String description,
                required String body,
                required String sentencesJson,
                Value<String?> translationsArJson = const Value.absent(),
                Value<String?> writingPrompt = const Value.absent(),
                Value<int> readingMinutes = const Value.absent(),
                Value<int> vocabCount = const Value.absent(),
                Value<bool> isNew = const Value.absent(),
                Value<bool> isRead = const Value.absent(),
                required DateTime cachedAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedArticlesTableCompanion.insert(
                id: id,
                sourceName: sourceName,
                sourceUrl: sourceUrl,
                license: license,
                author: author,
                publishedAt: publishedAt,
                category: category,
                cefrLevel: cefrLevel,
                title: title,
                description: description,
                body: body,
                sentencesJson: sentencesJson,
                translationsArJson: translationsArJson,
                writingPrompt: writingPrompt,
                readingMinutes: readingMinutes,
                vocabCount: vocabCount,
                isNew: isNew,
                isRead: isRead,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $CachedArticlesTableTable,
                    CachedArticlesTableData
                  >(table),
                  BaseReferences<
                    _$FluentoDatabase,
                    $CachedArticlesTableTable,
                    CachedArticlesTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedArticlesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$FluentoDatabase,
      $CachedArticlesTableTable,
      CachedArticlesTableData,
      $$CachedArticlesTableTableFilterComposer,
      $$CachedArticlesTableTableOrderingComposer,
      $$CachedArticlesTableTableAnnotationComposer,
      $$CachedArticlesTableTableCreateCompanionBuilder,
      $$CachedArticlesTableTableUpdateCompanionBuilder,
      (
        CachedArticlesTableData,
        BaseReferences<
          _$FluentoDatabase,
          $CachedArticlesTableTable,
          CachedArticlesTableData
        >,
      ),
      CachedArticlesTableData,
      PrefetchHooks Function()
    >;
typedef $$CachedSentenceDataTableTableCreateCompanionBuilder =
    CachedSentenceDataTableCompanion Function({
      required String id,
      required String articleId,
      required int sentenceIndex,
      required String textContent,
      Value<String?> translationAr,
      Value<String?> audioUrl,
      Value<int> rowid,
    });
typedef $$CachedSentenceDataTableTableUpdateCompanionBuilder =
    CachedSentenceDataTableCompanion Function({
      Value<String> id,
      Value<String> articleId,
      Value<int> sentenceIndex,
      Value<String> textContent,
      Value<String?> translationAr,
      Value<String?> audioUrl,
      Value<int> rowid,
    });

class $$CachedSentenceDataTableTableFilterComposer
    extends Composer<_$FluentoDatabase, $CachedSentenceDataTableTable> {
  $$CachedSentenceDataTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get articleId => $composableBuilder(
    column: $table.articleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sentenceIndex => $composableBuilder(
    column: $table.sentenceIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get translationAr => $composableBuilder(
    column: $table.translationAr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get audioUrl => $composableBuilder(
    column: $table.audioUrl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedSentenceDataTableTableOrderingComposer
    extends Composer<_$FluentoDatabase, $CachedSentenceDataTableTable> {
  $$CachedSentenceDataTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get articleId => $composableBuilder(
    column: $table.articleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sentenceIndex => $composableBuilder(
    column: $table.sentenceIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get translationAr => $composableBuilder(
    column: $table.translationAr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get audioUrl => $composableBuilder(
    column: $table.audioUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedSentenceDataTableTableAnnotationComposer
    extends Composer<_$FluentoDatabase, $CachedSentenceDataTableTable> {
  $$CachedSentenceDataTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get articleId =>
      $composableBuilder(column: $table.articleId, builder: (column) => column);

  GeneratedColumn<int> get sentenceIndex => $composableBuilder(
    column: $table.sentenceIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get translationAr => $composableBuilder(
    column: $table.translationAr,
    builder: (column) => column,
  );

  GeneratedColumn<String> get audioUrl =>
      $composableBuilder(column: $table.audioUrl, builder: (column) => column);
}

class $$CachedSentenceDataTableTableTableManager
    extends
        RootTableManager<
          _$FluentoDatabase,
          $CachedSentenceDataTableTable,
          CachedSentenceDataTableData,
          $$CachedSentenceDataTableTableFilterComposer,
          $$CachedSentenceDataTableTableOrderingComposer,
          $$CachedSentenceDataTableTableAnnotationComposer,
          $$CachedSentenceDataTableTableCreateCompanionBuilder,
          $$CachedSentenceDataTableTableUpdateCompanionBuilder,
          (
            CachedSentenceDataTableData,
            BaseReferences<
              _$FluentoDatabase,
              $CachedSentenceDataTableTable,
              CachedSentenceDataTableData
            >,
          ),
          CachedSentenceDataTableData,
          PrefetchHooks Function()
        > {
  $$CachedSentenceDataTableTableTableManager(
    _$FluentoDatabase db,
    $CachedSentenceDataTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedSentenceDataTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CachedSentenceDataTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CachedSentenceDataTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> articleId = const Value.absent(),
                Value<int> sentenceIndex = const Value.absent(),
                Value<String> textContent = const Value.absent(),
                Value<String?> translationAr = const Value.absent(),
                Value<String?> audioUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedSentenceDataTableCompanion(
                id: id,
                articleId: articleId,
                sentenceIndex: sentenceIndex,
                textContent: textContent,
                translationAr: translationAr,
                audioUrl: audioUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String articleId,
                required int sentenceIndex,
                required String textContent,
                Value<String?> translationAr = const Value.absent(),
                Value<String?> audioUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedSentenceDataTableCompanion.insert(
                id: id,
                articleId: articleId,
                sentenceIndex: sentenceIndex,
                textContent: textContent,
                translationAr: translationAr,
                audioUrl: audioUrl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $CachedSentenceDataTableTable,
                    CachedSentenceDataTableData
                  >(table),
                  BaseReferences<
                    _$FluentoDatabase,
                    $CachedSentenceDataTableTable,
                    CachedSentenceDataTableData
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedSentenceDataTableTableProcessedTableManager =
    ProcessedTableManager<
      _$FluentoDatabase,
      $CachedSentenceDataTableTable,
      CachedSentenceDataTableData,
      $$CachedSentenceDataTableTableFilterComposer,
      $$CachedSentenceDataTableTableOrderingComposer,
      $$CachedSentenceDataTableTableAnnotationComposer,
      $$CachedSentenceDataTableTableCreateCompanionBuilder,
      $$CachedSentenceDataTableTableUpdateCompanionBuilder,
      (
        CachedSentenceDataTableData,
        BaseReferences<
          _$FluentoDatabase,
          $CachedSentenceDataTableTable,
          CachedSentenceDataTableData
        >,
      ),
      CachedSentenceDataTableData,
      PrefetchHooks Function()
    >;

class $FluentoDatabaseManager {
  final _$FluentoDatabase _db;
  $FluentoDatabaseManager(this._db);
  $$ReadingSessionsTableTableTableManager get readingSessionsTable =>
      $$ReadingSessionsTableTableTableManager(_db, _db.readingSessionsTable);
  $$ArticleProgressTableTableTableManager get articleProgressTable =>
      $$ArticleProgressTableTableTableManager(_db, _db.articleProgressTable);
  $$ReadingResultsTableTableTableManager get readingResultsTable =>
      $$ReadingResultsTableTableTableManager(_db, _db.readingResultsTable);
  $$WeakPointsTableTableTableManager get weakPointsTable =>
      $$WeakPointsTableTableTableManager(_db, _db.weakPointsTable);
  $$VocabularyEntriesTableTableTableManager get vocabularyEntriesTable =>
      $$VocabularyEntriesTableTableTableManager(
        _db,
        _db.vocabularyEntriesTable,
      );
  $$WritingSubmissionsTableTableTableManager get writingSubmissionsTable =>
      $$WritingSubmissionsTableTableTableManager(
        _db,
        _db.writingSubmissionsTable,
      );
  $$SpacedRepetitionTableTableTableManager get spacedRepetitionTable =>
      $$SpacedRepetitionTableTableTableManager(_db, _db.spacedRepetitionTable);
  $$CachedArticlesTableTableTableManager get cachedArticlesTable =>
      $$CachedArticlesTableTableTableManager(_db, _db.cachedArticlesTable);
  $$CachedSentenceDataTableTableTableManager get cachedSentenceDataTable =>
      $$CachedSentenceDataTableTableTableManager(
        _db,
        _db.cachedSentenceDataTable,
      );
}
