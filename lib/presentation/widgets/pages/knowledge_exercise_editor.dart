// @author Matthias Weigt 02.03.23
// All rights reserved ©2023

import 'package:flutter/material.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/exercises/exercise.dart';
import 'package:knowledge_dependency_graph_manager/presentation/widgets/other/kfm_card_with_column.dart';
import 'package:knowledge_dependency_graph_manager/presentation/widgets/other/kfm_text_field.dart';
import 'package:knowledge_dependency_graph_manager/presentation/widgets/other/kfmy.dart';
import 'package:knowledge_dependency_graph_manager/presentation/widgets/pages/knowledge_manager_app_page.dart';
import 'package:knowledge_dependency_graph_manager/presentation/widgets/pages/rendered_tex.dart';

class KnowledgeExerciseEditorPage extends StatefulWidget {
  const KnowledgeExerciseEditorPage(
      {super.key, this.knowledgeNodeExercise, required this.onAdd});

  final KnowledgeNodeExercise? knowledgeNodeExercise;

  final void Function(KnowledgeNodeExercise exercise) onAdd;

  @override
  State<KnowledgeExerciseEditorPage> createState() =>
      _KnowledgeExerciseEditorPageState();
}

class _KnowledgeExerciseEditorPageState
    extends State<KnowledgeExerciseEditorPage> {
  final TextEditingController assignmentController = TextEditingController();

  final TextEditingController solutionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => KnowledgeManagerAppPage(
          title: "knowledge exercise editor",
          children: [
            KFMTextField(
              controller: assignmentController,
              onChanged: (text) => setState(() {}),
              width: p1.maxWidth * 0.9,
              hintText: "assignment text",
            ),
            KFMTextField(
              controller: solutionController,
              width: p1.maxWidth * 0.9,
              hintText: "solution text",
              onChanged: (value) {
                setState(() {});
              },
            ),
            KFMY(y: 50),
            KFMCardWithColumn(width: p1.maxWidth*0.9,children: [
              RenderedTex(text: assignmentController.text),
              RenderedTex(text: solutionController.text)
            ]),
          ]),
    );
  }
}
