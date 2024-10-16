import 'package:objectbox/objectbox.dart';
import 'package:stud_attain_minor_pro/model/result_model.dart';
import 'class_model.dart'; // Import ClassModel
import 'subject_model.dart'; // Import SubjectModel

@Entity()
class Exam {
  int id;

  @Unique()
  String examID; // Unique identifier for the exam

  String examName; // Exam name (e.g., Midterm Exam)

  String subjectId;
  String classId;

  // Relations
  final results = ToMany<Result>(); // One-to-many relation to Result
  final subjectRelation = ToOne<Subject>(); // Many-to-one relation to Subject
  final classRelation = ToOne<ClassModel>(); // Many-to-one relation to ClassModel

  Exam({
    this.id = 0,
    required this.examID,
    required this.examName,
    required this.subjectId,
    required this.classId,
  });
}
