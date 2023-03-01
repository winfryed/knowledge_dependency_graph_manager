// @author Matthias Weigt 01.03.23
// All rights reserved ©2023

import 'package:knowledge_dependency_graph_manager/database/knowledge_database.dart';
import 'package:knowledge_dependency_graph_manager/database/knowledge_json_converter.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/knowledge_node.dart';

class KnowledgeDatabaseTest extends KnowledgeDatabase{
  @override
  Future<void> setKnowledgeNode(KnowledgeNode knowledgeNode) async {
    print(KnowledgeJsonConverter.instance.fromKnowledgeNode(knowledgeNode));
  }


}