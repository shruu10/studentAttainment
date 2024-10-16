import 'package:objectbox/objectbox.dart';
import 'class_model.dart';  // Import ClassModel

@Entity()
class Subject {
  int id;

  @Unique()
  String subjectID;  // Unique identifier for the subject

  String subjectName;  //

  @Property()
  String classId;// Subject name (e.g., Mathematics)

  // Relation
  final classRelation = ToOne<ClassModel>();  // Many-to-one relation to ClassModel

  Subject({
    this.id = 0,
    required this.subjectID,
    required this.subjectName,
    required this.classId,
  });
}
