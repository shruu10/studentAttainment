
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stud_attain_minor_pro/pages/student_page.dart';
import 'package:stud_attain_minor_pro/pages/subject_page.dart';

import 'class_page.dart';
import 'exam_page.dart';

class HomeListPage extends StatelessWidget {
  const HomeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD Operations'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Classes'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ClassPage()));
            },
          ),


          ListTile(
            title: Text('Subjects'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SubjectCRUDPage()));
            },
          ),
          ListTile(
            title: Text('Exams'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ExamCRUDPage()));
            },
          ),
          ListTile(
            title: Text('Students'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => StudentCRUDPage()));
            },
          ),
        ],
      ),
    );
  }
}