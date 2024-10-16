import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/db_provider.dart';
import '../model/student_model.dart';

class EditStudentPage extends StatefulWidget {
  final Student student;

  const EditStudentPage({super.key, required this.student});

  @override
  State<EditStudentPage> createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  late TextEditingController _nameController;
  late TextEditingController _enrollmentController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.student.studentName);
    _enrollmentController = TextEditingController(text: widget.student.enrollmentNo);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _enrollmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DatabaseProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Student Name'),
            ),
            TextField(
              controller: _enrollmentController,
              decoration: const InputDecoration(labelText: 'Enrollment No'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveStudent(dbProvider);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveStudent(DatabaseProvider dbProvider) {
    final updatedStudent = widget.student.copyWith(
      studentName: _nameController.text,
      enrollmentNo: _enrollmentController.text,
    );
    dbProvider.updateStudent(updatedStudent);
    Navigator.pop(context);
  }
}
