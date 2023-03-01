// @author Matthias Weigt 01.03.23
// All rights reserved ©2023


import 'package:knowledge_dependency_graph_manager/domain/entities/dependencies/knowledge_node_dependency.dart';

class HardKnowledgeNodeDependency extends KnowledgeNodeDependency{
  HardKnowledgeNodeDependency(super.id, super.rating);

  static const dependencyId = "hardDependency";
}