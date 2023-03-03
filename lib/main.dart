// @author Matthias Weigt 01.03.23
// All rights reserved ©2023


import 'package:flutter/material.dart';
import 'package:knowledge_dependency_graph_manager/database/knowledge_database.dart';
import 'package:knowledge_dependency_graph_manager/database/knowledge_json_converter.dart';
import 'package:knowledge_dependency_graph_manager/database/knowledge_json_converter_default.dart';
import 'package:knowledge_dependency_graph_manager/presentation/widgets/pages/knowledge_exercise_editor.dart';
import 'package:knowledge_dependency_graph_manager/presentation/widgets/pages/knowledge_node_editor.dart';

void main() {

  KnowledgeJsonConverter.init(KnowledgeJsonConverterDefault());

  runApp(const KnowledgeFrameworkManagerApp());
}

class KnowledgeFrameworkManagerApp extends StatelessWidget {
  const KnowledgeFrameworkManagerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true,colorSchemeSeed: Colors.blueAccent,brightness: Brightness.dark
      ),
      home: Scaffold(body: KnowledgeExerciseEditorPage(onAdd: (exercise) {
        // KnowledgeDatabase.instance.setKnowledgeNode(knowledgeNode);
      },),),
    );
  }
}
