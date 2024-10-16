import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/db_provider.dart';
import '../model/student_model.dart';
import 'edit_student_page.dart';

class StudentListPage extends StatelessWidget {
  final int classId;

  const StudentListPage({super.key, required this.classId});

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DatabaseProvider>(context);
    final students = dbProvider.getStudentsByClassId(classId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Students List'),
      ),
      body: students.isEmpty
          ? const Center(child: Text('No students found.'))
          : ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            title: Text(student.studentName),
            subtitle: Text('Enrollment: ${student.enrollmentNo}'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                _editStudent(context, student);
              },
            ),
          );
        },
      ),
    );
  }

  // Function to navigate to the edit student page
  void _editStudent(BuildContext context, Student student) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditStudentPage(student: student),
      ),
    );
  }
}
