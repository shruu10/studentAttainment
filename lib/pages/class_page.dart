import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stud_attain_minor_pro/model/class_model.dart';

import '../controller/db_provider.dart';

class ClassPage extends StatelessWidget {
  const ClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DatabaseProvider>(context);
    TextEditingController classIDController = TextEditingController();
    TextEditingController classNameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Classes'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dbProvider.getAllClasses().length,
              itemBuilder: (context, index) {
                final classModel = dbProvider.getAllClasses()[index];
                return ListTile(
                  title: Text(classModel.className),
                  subtitle: Text('Class ID: ${classModel.classID}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      dbProvider.deleteClass(classModel.id);
                    },
                  ),
                  onTap: () {
                    classIDController.text = classModel.classID;
                    classNameController.text = classModel.className;

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Edit Class'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: classIDController,
                                decoration: InputDecoration(labelText: 'Class ID'),
                              ),
                              TextField(
                                controller: classNameController,
                                decoration: InputDecoration(labelText: 'Class Name'),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                dbProvider.updateClass(ClassModel(
                                  id: classModel.id,
                                  classID: classIDController.text,
                                  className: classNameController.text,
                                ));
                                Navigator.of(context).pop();
                              },
                              child: Text('Update'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: classIDController,
                    decoration: InputDecoration(labelText: 'Class ID'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: classNameController,
                    decoration: InputDecoration(labelText: 'Class Name'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    dbProvider.addClass(ClassModel(
                      classID: classIDController.text,
                      className: classNameController.text,
                    ));
                    classIDController.clear();
                    classNameController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
