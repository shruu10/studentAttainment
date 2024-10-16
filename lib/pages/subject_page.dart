import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/db_provider.dart';
import '../model/subject_model.dart';
import '../model/class_model.dart';

class SubjectCRUDPage extends StatefulWidget {
  const SubjectCRUDPage({super.key});

  @override
  State<SubjectCRUDPage> createState() => _SubjectCRUDPageState();
}

class _SubjectCRUDPageState extends State<SubjectCRUDPage> {
  TextEditingController subjectIdController = TextEditingController();
  TextEditingController subjectNameController = TextEditingController();
  ClassModel? selectedClass; // For linking subjects to a class
  bool isEditing = false; // To differentiate between add and update
  Subject? currentSubject; // For updating the selected subject



  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DatabaseProvider>(context);
    final classes = dbProvider.getAllClasses();
    final subjects = dbProvider.getAllSubjects();
    selectedClass = classes[0];



    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Subjects'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  final subject = subjects[index];
                  final associatedClass = classes.firstWhere(
                          (cls) => cls.classID == subject.classId,
                      orElse: () => ClassModel(classID: '101', className: 'MCA'));

                  return ListTile(
                    title: Text(subject.subjectName),
                    subtitle: Text(
                        'ID: ${subject.subjectID}, Class: ${associatedClass.className}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // Populate data for editing
                            subjectIdController.text = subject.subjectID;
                            subjectNameController.text = subject.subjectName;
                            selectedClass = associatedClass;
                            currentSubject = subject;
                            setState(() {
                              isEditing = true;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            dbProvider.deleteSubject(subject.id);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            // Form for adding/updating subject
            TextField(
              controller: subjectIdController,
              decoration: const InputDecoration(labelText: 'Subject ID'),
            ),
            TextField(
              controller: subjectNameController,
              decoration: const InputDecoration(labelText: 'Subject Name'),
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
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (subjectIdController.text.isNotEmpty &&
                    subjectNameController.text.isNotEmpty &&
                    selectedClass != null) {
                  if (isEditing && currentSubject != null) {
                    // Update existing subject
                    dbProvider.updateSubject(Subject(
                      id: currentSubject!.id,
                      subjectID: subjectIdController.text,
                      subjectName: subjectNameController.text,
                      classId: selectedClass!.classID,
                    ));
                  } else {
                    // Add new subject
                    dbProvider.addSubject(Subject(
                      subjectID: subjectIdController.text,
                      subjectName: subjectNameController.text,
                      classId: selectedClass!.classID,
                    ));
                  }
                  // Clear the form
                  subjectIdController.clear();
                  subjectNameController.clear();
                  selectedClass = null;
                  setState(() {
                    isEditing = false;
                    currentSubject = null;
                  });
                }
              },
              child: Text(isEditing ? 'Update Subject' : 'Add Subject'),
            ),
          ],
        ),
      ),
    );
  }
}
