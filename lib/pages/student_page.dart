import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stud_attain_minor_pro/pages/student_list_page.dart';
import '../controller/db_provider.dart';
import '../model/class_model.dart';
import '../model/student_model.dart';

class StudentCRUDPage extends StatefulWidget {
  const StudentCRUDPage({super.key});

  @override
  State<StudentCRUDPage> createState() => _StudentCRUDPageState();
}

class _StudentCRUDPageState extends State<StudentCRUDPage> {
  ClassModel? selectedClass;

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DatabaseProvider>(context);
    final classes = dbProvider.getAllClasses();
    selectedClass = classes[0];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Students'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            const SizedBox(height: 20),

            ElevatedButton.icon(
              icon: const Icon(Icons.file_upload),
              label: const Text('Import from Excel'),
              onPressed: () {
                _importFromExcel();
              },
            ),
            const SizedBox(height: 20),

            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Add New Student'),
              onPressed: () {
                _addNewStudent(context, selectedClass);
              },
            ),
            const SizedBox(height: 20),

            // Display Students Button
            ElevatedButton.icon(
              icon: const Icon(Icons.list),
              label: const Text('Display Students'),
              onPressed: () {
                _displayStudents(context, selectedClass);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _importFromExcel() {
    // TODO: Excel Import
  }

  void _addNewStudent(BuildContext context, ClassModel? selectedClass) {
    if (selectedClass == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a class first!')),
      );
      return;
    }
    // TODO: Navigate to add new student page
  }

  void _displayStudents(BuildContext context, ClassModel? selectedClass) {
    if (selectedClass == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a class first!')),
      );
      return;
    }

    // Navigate to the Student List Page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentListPage(classId: selectedClass.id),
      ),
    );
  }
}
