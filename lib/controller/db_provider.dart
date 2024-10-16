import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:stud_attain_minor_pro/model/class_model.dart';
import 'package:stud_attain_minor_pro/model/exam_model.dart';
import 'package:stud_attain_minor_pro/model/student_model.dart';
import '../model/subject_model.dart';
import '../objectbox.g.dart';

class DatabaseProvider with ChangeNotifier {
  late final Box<ClassModel> _classBox;
  late final Box<Exam> _examBox;
  late final Box<Student> _studentBox;
  late final Box<Subject> _subjectBox;

  DatabaseProvider(Store store) {
    _classBox = store.box<ClassModel>();
    _examBox = store.box<Exam>();
    _studentBox = store.box<Student>();
    _subjectBox = store.box<Subject>();
  }

  // CRUD operations for ClassModel
  void addClass(ClassModel classModel) {
    _classBox.put(classModel);
    notifyListeners();
  }

  List<ClassModel> getAllClasses() {
    return _classBox.getAll();
  }

  void updateClass(ClassModel classModel) {
    _classBox.put(classModel);
    notifyListeners();
  }

  void deleteClass(int id) {
    _classBox.remove(id);
    notifyListeners();
  }

  // CRUD operations for Exam
  void addExam(Exam exam) {
    _examBox.put(exam);
    notifyListeners();
  }

  // Get Exam by ID
  Exam getExamById(String examId) {
    return _examBox.query(Exam_.examID.equals(examId)).build().findFirst()!;
  }

  List<Exam> getAllExams() {
    return _examBox.getAll();
  }

  void updateExam(Exam exam) {
    _examBox.put(exam);
    notifyListeners();
  }

  void deleteExam(int id) {
    _examBox.remove(id);
    notifyListeners();
  }

  // CRUD operations for Student
  void addStudent(Student student) {
    _studentBox.put(student);
    notifyListeners();
  }

  List<Student> getAllStudents() {
    return _studentBox.getAll();
  }

  void updateStudent(Student student) {
    _studentBox.put(student);
    notifyListeners();
  }

  void deleteStudent(int id) {
    _studentBox.remove(id);
    notifyListeners();
  }

  // CRUD operations for Subject
  void addSubject(Subject subject) {
    _subjectBox.put(subject);
    notifyListeners();
  }

  List<Subject> getAllSubjects() {
    return _subjectBox.getAll();
  }

  void updateSubject(Subject subject) {
    _subjectBox.put(subject);
    notifyListeners();
  }

  void deleteSubject(int id) {
    _subjectBox.remove(id);
    notifyListeners();
  }

  List<Student> getStudentsByClassId(int classId) {
    return _studentBox.query(Student_.classId.equals(classId)).build().find();
  }


}
