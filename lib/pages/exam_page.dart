import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/db_provider.dart';
import '../model/exam_model.dart';
import '../model/class_model.dart';
import '../model/subject_model.dart';

class ExamCRUDPage extends StatefulWidget {
  const ExamCRUDPage({super.key});

  @override
  State<ExamCRUDPage> createState() => _ExamCRUDPageState();
}

class _ExamCRUDPageState extends State<ExamCRUDPage> {
  TextEditingController examIdController = TextEditingController();
  TextEditingController examNameController = TextEditingController();
  ClassModel? selectedClass; // For linking exams to a class
  Subject? selectedSubject; // For linking exams to a subject
  bool isEditing = false; // To differentiate between add and update
  Exam? currentExam; // For updating the selected exam

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DatabaseProvider>(context);
    final classes = dbProvider.getAllClasses();
    final subjects = dbProvider.getAllSubjects();
    final exams = dbProvider.getAllExams();

    selectedClass = classes.isNotEmpty ? classes[0] : null;
    selectedSubject = subjects.isNotEmpty ? subjects[0] : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Exams'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: exams.length,
                itemBuilder: (context, index) {
                  final exam = exams[index];
                  final associatedClass = classes.firstWhere(
                          (cls) => cls.classID == exam.classId,
                      orElse: () => ClassModel(classID: '101', className: 'Unknown'));
                  final associatedSubject = subjects.firstWhere(
                          (subj) => subj.subjectID == exam.subjectId,
                      orElse: () => Subject(subjectID: "101", subjectName: 'Unknown', classId: '101'));

                  return ListTile(
                    title: Text(exam.examName),
                    subtitle: Text(
                        'ID: ${exam.examID}, Class: ${associatedClass.className}, Subject: ${associatedSubject.subjectName}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // Populate data for editing
                            examIdController.text = exam.examID;
                            examNameController.text = exam.examName;
                            selectedClass = associatedClass;
                            selectedSubject = associatedSubject;
                            currentExam = exam;
                            setState(() {
                              isEditing = true;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            dbProvider.deleteExam(exam.id);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            // Form for adding/updating exam
            TextField(
              controller: examIdController,
              decoration: const InputDecoration(labelText: 'Exam ID'),
            ),
            TextField(
              controller: examNameController,
              decoration: const InputDecoration(labelText: 'Exam Name'),
            ),
            DropdownButton<ClassModel>(
              value: selectedClass,
              hint: const Text('Select Class'),
              items: classes.map((cls) {
                return DropdownMenuItem<ClassModel>(
                  value: cls,
                  child: Text(cls.className),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedClass = value;
                });
              },
            ),
            DropdownButton<Subject>(
              value: selectedSubject,
              hint: const Text('Select Subject'),
              items: subjects.map((subject) {
                return DropdownMenuItem<Subject>(
                  value: subject,
                  child: Text(subject.subjectName),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSubject = value;
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (examIdController.text.isNotEmpty &&
                    examNameController.text.isNotEmpty &&
                    selectedClass != null &&
                    selectedSubject != null) {
                  if (isEditing && currentExam != null) {
                    // Update existing exam
                    dbProvider.updateExam(Exam(
                      id: currentExam!.id,
                      examID: examIdController.text,
                      examName: examNameController.text,
                      classId: selectedClass!.classID,
                      subjectId: selectedSubject!.subjectID,
                    ));
                  } else {
                    // Add new exam
                    dbProvider.addExam(Exam(
                      examID: examIdController.text,
                      examName: examNameController.text,
                      classId: selectedClass!.classID,
                      subjectId: selectedSubject!.subjectID,
                    ));
                  }
                  // Clear the form
                  examIdController.clear();
                  examNameController.clear();
                  selectedClass = null;
                  selectedSubject = null;
                  setState(() {
                    isEditing = false;
                    currentExam = null;
                  });
                }
              },
              child: Text(isEditing ? 'Update Exam' : 'Add Exam'),
            ),
          ],
        ),
      ),
    );
  }
}
