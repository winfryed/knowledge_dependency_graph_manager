// @author Matthias Weigt 01.03.23
// All rights reserved ©2023


import 'package:knowledge_dependency_graph_manager/domain/entities/knowledge_node.dart';

abstract class KnowledgeDatabase{
  static KnowledgeDatabase get instance{
    if(_instance==null) {
      throw StateError("KnowledgeDatabase must be initialized.");
    }
    return _instance!;
  }
  static KnowledgeDatabase? _instance;

  static init(KnowledgeDatabase database) => _instance=database;

  Future<void> setKnowledgeNode(KnowledgeNode knowledgeNode);

}