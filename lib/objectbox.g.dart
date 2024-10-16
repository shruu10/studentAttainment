// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'model/class_model.dart';
import 'model/exam_model.dart';
import 'model/result_model.dart';
import 'model/student_model.dart';
import 'model/subject_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 8121387333330509352),
      name: 'ClassModel',
      lastPropertyId: const obx_int.IdUid(3, 1458235019417834667),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 8344741435823709404),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 649198398780069505),
            name: 'classID',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(1, 4388691329613373954)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 1458235019417834667),
            name: 'className',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[
        obx_int.ModelRelation(
            id: const obx_int.IdUid(1, 6693927113703936857),
            name: 'subjects',
            targetId: const obx_int.IdUid(5, 5168867376406878954)),
        obx_int.ModelRelation(
            id: const obx_int.IdUid(2, 297570568055590294),
            name: 'students',
            targetId: const obx_int.IdUid(4, 694201165520271826))
      ],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 4240947466676987661),
      name: 'Exam',
      lastPropertyId: const obx_int.IdUid(8, 907065268397318414),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 1383432547719829200),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 1278391489801295707),
            name: 'examID',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(2, 4559386912830050448)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 1564217348732373818),
            name: 'examName',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 1392486143892457501),
            name: 'subjectRelationId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(6, 637092123362249792),
            relationTarget: 'Subject'),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 6326410434559639483),
            name: 'classRelationId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(7, 1294875051994019043),
            relationTarget: 'ClassModel'),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 8127231044769572273),
            name: 'subjectId',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(8, 907065268397318414),
            name: 'classId',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[
        obx_int.ModelRelation(
            id: const obx_int.IdUid(3, 668777592474530047),
            name: 'results',
            targetId: const obx_int.IdUid(3, 2122912694261922191))
      ],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(3, 2122912694261922191),
      name: 'Result',
      lastPropertyId: const obx_int.IdUid(10, 1055005393549539642),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 8217340774236899497),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 7849931209381640598),
            name: 'resultID',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(3, 196917123607408810)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 6180442013201368901),
            name: 'studentId',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 3463577293222681081),
            name: 'examId',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 3270302831683871918),
            name: 'marksJson',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 245176516753601821),
            name: 'subjectRelationId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(8, 2884068924956536533),
            relationTarget: 'Subject'),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 7098093932686256358),
            name: 'classRelationId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(9, 865633332150397112),
            relationTarget: 'ClassModel'),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(8, 290114917244638443),
            name: 'studentRelationId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(10, 7311640072115044153),
            relationTarget: 'Student'),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(9, 3903931810567838957),
            name: 'subjectId',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(10, 1055005393549539642),
            name: 'classId',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(4, 694201165520271826),
      name: 'Student',
      lastPropertyId: const obx_int.IdUid(5, 3376629945168078003),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 2055059726826722177),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 1139988689415514451),
            name: 'studentID',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(4, 8163789812325243822)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 1653131775444523458),
            name: 'enrollmentNo',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 5354813011484784613),
            name: 'studentName',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 3376629945168078003),
            name: 'classId',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[
        obx_int.ModelRelation(
            id: const obx_int.IdUid(4, 599563247502765828),
            name: 'results',
            targetId: const obx_int.IdUid(3, 2122912694261922191)),
        obx_int.ModelRelation(
            id: const obx_int.IdUid(6, 6776949172144395563),
            name: 'subjects',
            targetId: const obx_int.IdUid(5, 5168867376406878954))
      ],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(5, 5168867376406878954),
      name: 'Subject',
      lastPropertyId: const obx_int.IdUid(5, 1107838572209926702),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 2041423086405635650),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 7269928527157205398),
            name: 'subjectID',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(5, 56633869664900096)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 5800660077900968037),
            name: 'subjectName',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 3064716034671020343),
            name: 'classRelationId',
            type: 11,
            flags: 520,
            indexId: const obx_int.IdUid(11, 589626067979143932),
            relationTarget: 'ClassModel'),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 1107838572209926702),
            name: 'classId',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(5, 5168867376406878954),
      lastIndexId: const obx_int.IdUid(11, 589626067979143932),
      lastRelationId: const obx_int.IdUid(6, 6776949172144395563),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [8803990178385988372],
      retiredRelationUids: const [623756514686240118],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    ClassModel: obx_int.EntityDefinition<ClassModel>(
        model: _entities[0],
        toOneRelations: (ClassModel object) => [],
        toManyRelations: (ClassModel object) => {
              obx_int.RelInfo<ClassModel>.toMany(1, object.id): object.subjects,
              obx_int.RelInfo<ClassModel>.toMany(2, object.id): object.students
            },
        getId: (ClassModel object) => object.id,
        setId: (ClassModel object, int id) {
          object.id = id;
        },
        objectToFB: (ClassModel object, fb.Builder fbb) {
          final classIDOffset = fbb.writeString(object.classID);
          final classNameOffset = fbb.writeString(object.className);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, classIDOffset);
          fbb.addOffset(2, classNameOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final classIDParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final classNameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final object = ClassModel(
              id: idParam, classID: classIDParam, className: classNameParam);
          obx_int.InternalToManyAccess.setRelInfo<ClassModel>(object.subjects,
              store, obx_int.RelInfo<ClassModel>.toMany(1, object.id));
          obx_int.InternalToManyAccess.setRelInfo<ClassModel>(object.students,
              store, obx_int.RelInfo<ClassModel>.toMany(2, object.id));
          return object;
        }),
    Exam: obx_int.EntityDefinition<Exam>(
        model: _entities[1],
        toOneRelations: (Exam object) =>
            [object.subjectRelation, object.classRelation],
        toManyRelations: (Exam object) =>
            {obx_int.RelInfo<Exam>.toMany(3, object.id): object.results},
        getId: (Exam object) => object.id,
        setId: (Exam object, int id) {
          object.id = id;
        },
        objectToFB: (Exam object, fb.Builder fbb) {
          final examIDOffset = fbb.writeString(object.examID);
          final examNameOffset = fbb.writeString(object.examName);
          final subjectIdOffset = fbb.writeString(object.subjectId);
          final classIdOffset = fbb.writeString(object.classId);
          fbb.startTable(9);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, examIDOffset);
          fbb.addOffset(2, examNameOffset);
          fbb.addInt64(4, object.subjectRelation.targetId);
          fbb.addInt64(5, object.classRelation.targetId);
          fbb.addOffset(6, subjectIdOffset);
          fbb.addOffset(7, classIdOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final examIDParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final examNameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final subjectIdParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 16, '');
          final classIdParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 18, '');
          final object = Exam(
              id: idParam,
              examID: examIDParam,
              examName: examNameParam,
              subjectId: subjectIdParam,
              classId: classIdParam);
          object.subjectRelation.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          object.subjectRelation.attach(store);
          object.classRelation.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          object.classRelation.attach(store);
          obx_int.InternalToManyAccess.setRelInfo<Exam>(object.results, store,
              obx_int.RelInfo<Exam>.toMany(3, object.id));
          return object;
        }),
    Result: obx_int.EntityDefinition<Result>(
        model: _entities[2],
        toOneRelations: (Result object) => [
              object.subjectRelation,
              object.classRelation,
              object.studentRelation
            ],
        toManyRelations: (Result object) => {},
        getId: (Result object) => object.id,
        setId: (Result object, int id) {
          object.id = id;
        },
        objectToFB: (Result object, fb.Builder fbb) {
          final resultIDOffset = fbb.writeString(object.resultID);
          final marksJsonOffset = fbb.writeString(object.marksJson);
          final subjectIdOffset = fbb.writeString(object.subjectId);
          final classIdOffset = fbb.writeString(object.classId);
          fbb.startTable(11);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, resultIDOffset);
          fbb.addInt64(2, object.studentId);
          fbb.addInt64(3, object.examId);
          fbb.addOffset(4, marksJsonOffset);
          fbb.addInt64(5, object.subjectRelation.targetId);
          fbb.addInt64(6, object.classRelation.targetId);
          fbb.addInt64(7, object.studentRelation.targetId);
          fbb.addOffset(8, subjectIdOffset);
          fbb.addOffset(9, classIdOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final resultIDParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final studentIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final examIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          final subjectIdParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 20, '');
          final classIdParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 22, '');
          final object = Result(
              id: idParam,
              resultID: resultIDParam,
              studentId: studentIdParam,
              examId: examIdParam,
              subjectId: subjectIdParam,
              classId: classIdParam)
            ..marksJson = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 12, '');
          object.subjectRelation.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          object.subjectRelation.attach(store);
          object.classRelation.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0);
          object.classRelation.attach(store);
          object.studentRelation.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 18, 0);
          object.studentRelation.attach(store);
          return object;
        }),
    Student: obx_int.EntityDefinition<Student>(
        model: _entities[3],
        toOneRelations: (Student object) => [],
        toManyRelations: (Student object) => {
              obx_int.RelInfo<Student>.toMany(4, object.id): object.results,
              obx_int.RelInfo<Student>.toMany(6, object.id): object.subjects
            },
        getId: (Student object) => object.id,
        setId: (Student object, int id) {
          object.id = id;
        },
        objectToFB: (Student object, fb.Builder fbb) {
          final studentIDOffset = fbb.writeString(object.studentID);
          final enrollmentNoOffset = fbb.writeString(object.enrollmentNo);
          final studentNameOffset = fbb.writeString(object.studentName);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, studentIDOffset);
          fbb.addOffset(2, enrollmentNoOffset);
          fbb.addOffset(3, studentNameOffset);
          fbb.addInt64(4, object.classId);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final studentIDParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final enrollmentNoParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, '');
          final studentNameParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, '');
          final classIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          final object = Student(
              id: idParam,
              studentID: studentIDParam,
              enrollmentNo: enrollmentNoParam,
              studentName: studentNameParam,
              classId: classIdParam);
          obx_int.InternalToManyAccess.setRelInfo<Student>(object.results,
              store, obx_int.RelInfo<Student>.toMany(4, object.id));
          obx_int.InternalToManyAccess.setRelInfo<Student>(object.subjects,
              store, obx_int.RelInfo<Student>.toMany(6, object.id));
          return object;
        }),
    Subject: obx_int.EntityDefinition<Subject>(
        model: _entities[4],
        toOneRelations: (Subject object) => [object.classRelation],
        toManyRelations: (Subject object) => {},
        getId: (Subject object) => object.id,
        setId: (Subject object, int id) {
          object.id = id;
        },
        objectToFB: (Subject object, fb.Builder fbb) {
          final subjectIDOffset = fbb.writeString(object.subjectID);
          final subjectNameOffset = fbb.writeString(object.subjectName);
          final classIdOffset = fbb.writeString(object.classId);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, subjectIDOffset);
          fbb.addOffset(2, subjectNameOffset);
          fbb.addInt64(3, object.classRelation.targetId);
          fbb.addOffset(4, classIdOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final subjectIDParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final subjectNameParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, '');
          final classIdParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 12, '');
          final object = Subject(
              id: idParam,
              subjectID: subjectIDParam,
              subjectName: subjectNameParam,
              classId: classIdParam);
          object.classRelation.targetId =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0);
          object.classRelation.attach(store);
          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [ClassModel] entity fields to define ObjectBox queries.
class ClassModel_ {
  /// See [ClassModel.id].
  static final id =
      obx.QueryIntegerProperty<ClassModel>(_entities[0].properties[0]);

  /// See [ClassModel.classID].
  static final classID =
      obx.QueryStringProperty<ClassModel>(_entities[0].properties[1]);

  /// See [ClassModel.className].
  static final className =
      obx.QueryStringProperty<ClassModel>(_entities[0].properties[2]);

  /// see [ClassModel.subjects]
  static final subjects =
      obx.QueryRelationToMany<ClassModel, Subject>(_entities[0].relations[0]);

  /// see [ClassModel.students]
  static final students =
      obx.QueryRelationToMany<ClassModel, Student>(_entities[0].relations[1]);
}

/// [Exam] entity fields to define ObjectBox queries.
class Exam_ {
  /// See [Exam.id].
  static final id = obx.QueryIntegerProperty<Exam>(_entities[1].properties[0]);

  /// See [Exam.examID].
  static final examID =
      obx.QueryStringProperty<Exam>(_entities[1].properties[1]);

  /// See [Exam.examName].
  static final examName =
      obx.QueryStringProperty<Exam>(_entities[1].properties[2]);

  /// See [Exam.subjectRelation].
  static final subjectRelation =
      obx.QueryRelationToOne<Exam, Subject>(_entities[1].properties[3]);

  /// See [Exam.classRelation].
  static final classRelation =
      obx.QueryRelationToOne<Exam, ClassModel>(_entities[1].properties[4]);

  /// See [Exam.subjectId].
  static final subjectId =
      obx.QueryStringProperty<Exam>(_entities[1].properties[5]);

  /// See [Exam.classId].
  static final classId =
      obx.QueryStringProperty<Exam>(_entities[1].properties[6]);

  /// see [Exam.results]
  static final results =
      obx.QueryRelationToMany<Exam, Result>(_entities[1].relations[0]);
}

/// [Result] entity fields to define ObjectBox queries.
class Result_ {
  /// See [Result.id].
  static final id =
      obx.QueryIntegerProperty<Result>(_entities[2].properties[0]);

  /// See [Result.resultID].
  static final resultID =
      obx.QueryStringProperty<Result>(_entities[2].properties[1]);

  /// See [Result.studentId].
  static final studentId =
      obx.QueryIntegerProperty<Result>(_entities[2].properties[2]);

  /// See [Result.examId].
  static final examId =
      obx.QueryIntegerProperty<Result>(_entities[2].properties[3]);

  /// See [Result.marksJson].
  static final marksJson =
      obx.QueryStringProperty<Result>(_entities[2].properties[4]);

  /// See [Result.subjectRelation].
  static final subjectRelation =
      obx.QueryRelationToOne<Result, Subject>(_entities[2].properties[5]);

  /// See [Result.classRelation].
  static final classRelation =
      obx.QueryRelationToOne<Result, ClassModel>(_entities[2].properties[6]);

  /// See [Result.studentRelation].
  static final studentRelation =
      obx.QueryRelationToOne<Result, Student>(_entities[2].properties[7]);

  /// See [Result.subjectId].
  static final subjectId =
      obx.QueryStringProperty<Result>(_entities[2].properties[8]);

  /// See [Result.classId].
  static final classId =
      obx.QueryStringProperty<Result>(_entities[2].properties[9]);
}

/// [Student] entity fields to define ObjectBox queries.
class Student_ {
  /// See [Student.id].
  static final id =
      obx.QueryIntegerProperty<Student>(_entities[3].properties[0]);

  /// See [Student.studentID].
  static final studentID =
      obx.QueryStringProperty<Student>(_entities[3].properties[1]);

  /// See [Student.enrollmentNo].
  static final enrollmentNo =
      obx.QueryStringProperty<Student>(_entities[3].properties[2]);

  /// See [Student.studentName].
  static final studentName =
      obx.QueryStringProperty<Student>(_entities[3].properties[3]);

  /// See [Student.classId].
  static final classId =
      obx.QueryIntegerProperty<Student>(_entities[3].properties[4]);

  /// see [Student.results]
  static final results =
      obx.QueryRelationToMany<Student, Result>(_entities[3].relations[0]);

  /// see [Student.subjects]
  static final subjects =
      obx.QueryRelationToMany<Student, Subject>(_entities[3].relations[1]);
}

/// [Subject] entity fields to define ObjectBox queries.
class Subject_ {
  /// See [Subject.id].
  static final id =
      obx.QueryIntegerProperty<Subject>(_entities[4].properties[0]);

  /// See [Subject.subjectID].
  static final subjectID =
      obx.QueryStringProperty<Subject>(_entities[4].properties[1]);

  /// See [Subject.subjectName].
  static final subjectName =
      obx.QueryStringProperty<Subject>(_entities[4].properties[2]);

  /// See [Subject.classRelation].
  static final classRelation =
      obx.QueryRelationToOne<Subject, ClassModel>(_entities[4].properties[3]);

  /// See [Subject.classId].
  static final classId =
      obx.QueryStringProperty<Subject>(_entities[4].properties[4]);
}
