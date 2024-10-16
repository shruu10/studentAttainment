import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Provider for state management
import 'package:stud_attain_minor_pro/pages/class_page.dart';
import 'package:stud_attain_minor_pro/pages/exam_page.dart';
import 'package:stud_attain_minor_pro/pages/home.dart';
import 'package:stud_attain_minor_pro/pages/student_page.dart';
import 'package:stud_attain_minor_pro/pages/subject_page.dart';
import 'package:stud_attain_minor_pro/model/class_model.dart';
import 'package:stud_attain_minor_pro/model/exam_model.dart';
import 'package:stud_attain_minor_pro/model/subject_model.dart';

import 'controller/db_provider.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  SelectPageState createState() => SelectPageState();
}

class SelectPageState extends State<SelectPage> {
  ClassModel? selectedClass;
  Exam? selectedExam;
  Subject? selectedSubject;

  List<ClassModel> classValues = [];
  List<Exam> examValues = [];
  List<Subject> subjectValues = [];

  @override
  void initState() {
    super.initState();
    // Fetch the data from the database when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
      _fetchData(databaseProvider);
    });
  }

  // Fetch the data from the database
  void _fetchData(DatabaseProvider databaseProvider) {
    setState(() {
      classValues = databaseProvider.getAllClasses();
      examValues = databaseProvider.getAllExams();
      subjectValues = databaseProvider.getAllSubjects();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(" ", style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text('Classes'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ClassPage()));
              },
            ),
            ListTile(
              title: const Text('Subjects'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const SubjectCRUDPage()));
              },
            ),
            ListTile(
              title: const Text('Exams'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ExamCRUDPage()));
              },
            ),
            ListTile(
              title: const Text('Students'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const StudentCRUDPage()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Select Class, Exam, and Subject"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Dropdown for selecting class
            DropdownButtonFormField<ClassModel>(
              value: selectedClass,
              decoration: const InputDecoration(
                labelText: "Select Class",
                border: OutlineInputBorder(),
              ),
              items: classValues.map((ClassModel classModel) {
                return DropdownMenuItem<ClassModel>(
                  value: classModel,
                  child: Text(classModel.className),
                );
              }).toList(),
              onChanged: (ClassModel? newValue) {
                setState(() {
                  selectedClass = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            // Dropdown for selecting exam
            DropdownButtonFormField<Exam>(
              value: selectedExam,
              decoration: const InputDecoration(
                labelText: "Select Exam",
                border: OutlineInputBorder(),
              ),
              items: examValues.map((Exam exam) {
                return DropdownMenuItem<Exam>(
                  value: exam,
                  child: Text(exam.examID),
                );
              }).toList(),
              onChanged: (Exam? newValue) {
                setState(() {
                  selectedExam = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            // Dropdown for selecting subject
            DropdownButtonFormField<Subject>(
              value: selectedSubject,
              decoration: const InputDecoration(
                labelText: "Select Subject",
                border: OutlineInputBorder(),
              ),
              items: subjectValues.map((Subject subject) {
                return DropdownMenuItem<Subject>(
                  value: subject,
                  child: Text(subject.subjectName),
                );
              }).toList(),
              onChanged: (Subject? newValue) {
                setState(() {
                  selectedSubject = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            // Submit button
            ElevatedButton(
              onPressed: () {
                // Handle submission logic here
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
