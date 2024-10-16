import 'package:objectbox/objectbox.dart';
import 'package:stud_attain_minor_pro/model/result_model.dart';
import 'class_model.dart';   // Import the Class model
import 'subject_model.dart';  // Import the Subject model

@Entity()
class Student {
  int id;

  @Unique()
  String studentID;  // Unique identifier for the student

  String enrollmentNo;  // Student enrollment number
  String studentName;  // Student name

  // Relations
  final results = ToMany<Result>();  // One-to-many relation to Result

  // Each student must belong to a class
  @Property()
  int classId;  // Foreign key reference to Class

  // Each student must be associated with one or more subjects
  final subjects = ToMany<Subject>();  // Many-to-many relation to Subject

  Student({
    this.id = 0,
    required this.studentID,
    required this.enrollmentNo,
    required this.studentName,
    required this.classId,   // Class is required
  });

  Student copyWith({
    int? id,
    String? studentID,
    String? enrollmentNo,
    String? studentName,
    int? classId,
  }) {
    return Student(
      id: id ?? this.id,
      studentID: studentID ?? this.studentID,
      enrollmentNo: enrollmentNo ?? this.enrollmentNo,
      studentName: studentName ?? this.studentName,
      classId: classId ?? this.classId,
    );
  }
}
