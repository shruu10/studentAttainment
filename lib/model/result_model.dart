import 'dart:convert';
import 'package:objectbox/objectbox.dart';
import 'class_model.dart'; // Import ClassModel
import 'subject_model.dart'; // Import SubjectModel
import 'student_model.dart'; // Import StudentModel
import 'exam_model.dart'; // Import ExamModel

@Entity()
class Result {
  int id;

  @Unique()
  String resultID;

  @Property()
  int studentId; // Reference to the student

  @Property()
  int examId; // Reference to the exam

  @Property()
  String marksJson; // Store marks as a JSON string

  @Property()
  String subjectId;

  @Property()
  String classId;



  // Relations
  final subjectRelation = ToOne<Subject>(); // Many-to-one relation to Subject
  final classRelation = ToOne<ClassModel>(); // Many-to-one relation to ClassModel
  final studentRelation = ToOne<Student>(); // Many-to-one relation to Student

  Result({
    this.id = 0,
    required this.resultID,
    required this.studentId,
    required this.examId,
    List<List<int>>? marks,
  required this.subjectId,
  required this.classId,
  })  : marksJson = _encodeMarks(marks);

  // Getter for marks
  List<List<int>> get marks => _decodeMarks(marksJson);

  // Setter for marks
  set marks(List<List<int>> value) {
    marksJson = _encodeMarks(value);
  }

  // Static helper method to encode marks
  static String _encodeMarks(List<List<int>>? marks) {
    if (marks == null || marks.isEmpty) return '';
    return jsonEncode(marks);
  }

  // Static helper method to decode marks
  static List<List<int>> _decodeMarks(String json) {
    if (json.isEmpty) return [];
    try {
      final List<dynamic> decoded = jsonDecode(json);
      return decoded.map<List<int>>((item) {
        if (item is List) {
          return item.map<int>((e) => e as int).toList();
        }
        return [];
      }).toList();
    } catch (e) {
      print('Error decoding marks: $e');
      return [];
    }
  }

  // Optional: Add a method to easily add new marks
  void addMark(int index, int mark) {
    final currentMarks = marks;
    if (index >= 0 && index < currentMarks.length) {
      currentMarks[index].add(mark);
      marks = currentMarks;
    }
  }

  // Optional: Add a method to get marks for a specific index
  List<int> getMarksAt(int index) {
    final currentMarks = marks;
    if (index >= 0 && index < currentMarks.length) {
      return List<int>.from(currentMarks[index]);
    }
    return [];
  }
}
