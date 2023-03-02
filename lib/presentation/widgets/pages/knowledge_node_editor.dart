// @author Matthias Weigt 02.03.23
// All rights reserved ©2023

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/random/random_generators.dart';

import '../../../domain/entities/knowledge_node.dart';
import 'knowledge_manager_app_page.dart';

class KnowledgeNodeEditorPage extends StatefulWidget {
  const KnowledgeNodeEditorPage(
      {super.key, this.knowledgeNode, required this.onAdd});

  final KnowledgeNode? knowledgeNode;
  final void Function(KnowledgeNode knowledgeNode) onAdd;

  @override
  State<KnowledgeNodeEditorPage> createState() =>
      _KnowledgeNodeEditorPageState();
}

class _KnowledgeNodeEditorPageState extends State<KnowledgeNodeEditorPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? nodeId;

  @override
  void initState() {
    if (widget.knowledgeNode != null) {
      KnowledgeNode knowledgeNode = widget.knowledgeNode!;
      nodeId = knowledgeNode.id;

      titleController.text = knowledgeNode.title ?? "";
      descriptionController.text = knowledgeNode.description ?? "";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => KnowledgeManagerAppPage(
          title: "Knowledge Node Editor Page",
          children: [
            Container(
              width: p1.maxWidth * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    TextField(
                        controller: titleController,
                        onChanged: (s) => setState(() {}),
                        decoration: const InputDecoration(hintText: "title")),
                    TextField(
                        controller: descriptionController,
                        onChanged: (s) => setState(() {}),
                        decoration:
                            const InputDecoration(hintText: "description")),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Preview"),
                    Card(
                      elevation: 4,
                      child: SizedBox(
                        width: p1.maxWidth * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(titleController.text),
                              Text(
                                descriptionController.text,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        widget.onAdd(KnowledgeNode(
                            title: titleController.text,
                            description: descriptionController.text,
                            id: nodeId ?? RandomHashGenerator().get()));
                      },
                    )
                  ],
                ),
              ),
            )
          ]),
    );
  }
}
