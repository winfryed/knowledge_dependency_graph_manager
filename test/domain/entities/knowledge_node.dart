// @author Matthias Weigt 01.03.23
// All rights reserved ©2023

import 'package:flutter_test/flutter_test.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/gateways/and_necessary.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/knowledge_node.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/knowledge_node_dependency.dart';

void main() {
  test(
    "knowledge node test",
    () {
      KnowledgeNode knowledgeNode = KnowledgeNode(
        id: "a",
        title: "testnode",
        description: "testdescription",
        hardForwardDependencyGateway:
          KnowledgeNodeDependencyGatewayAndNecessary(
              {KnowledgeNodeDependency("b", 1)})
        ,
      );
      print(knowledgeNode);
    },
  );
}
