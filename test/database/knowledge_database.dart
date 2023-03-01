// @author Matthias Weigt 01.03.23
// All rights reserved ©2023

import 'package:flutter_test/flutter_test.dart';
import 'package:knowledge_dependency_graph_manager/database/knowledge_database.dart';
import 'package:knowledge_dependency_graph_manager/database/knowledge_database_test.dart';
import 'package:knowledge_dependency_graph_manager/database/knowledge_json_converter.dart';
import 'package:knowledge_dependency_graph_manager/database/knowledge_json_converter_default.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/dependencies/hard_knowledge_node_dependency.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/gateways/knowledge_node_dependency_gateway.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/gateways/or_necessary.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/knowledge_node.dart';

void main() {

  KnowledgeJsonConverter.init(KnowledgeJsonConverterDefault());
  KnowledgeDatabase.init(KnowledgeDatabaseTest());
  HardKnowledgeNodeDependency hardKnowledgeNodeDependency1 =
  HardKnowledgeNodeDependency("b", 1);
  HardKnowledgeNodeDependency hardKnowledgeNodeDependency2 =
  HardKnowledgeNodeDependency("c", 1);
  HardKnowledgeNodeDependency hardKnowledgeNodeDependency3 =
  HardKnowledgeNodeDependency("d", 1);

  KnowledgeNodeDependencyGateway gateway1 =
  KnowledgeNodeDependencyGatewayOrNecessary<HardKnowledgeNodeDependency>({
    hardKnowledgeNodeDependency1,
    hardKnowledgeNodeDependency2,
    hardKnowledgeNodeDependency3
  });
  KnowledgeNodeDependencyGateway gatewayEmpty =
  KnowledgeNodeDependencyGatewayOrNecessary<HardKnowledgeNodeDependency>(
      {});

  KnowledgeNode knowledgeNode =
  KnowledgeNode(id: "a", gatewaysPredecessors: {gateway1});
  KnowledgeNode knowledgeNodeEmpty =
  KnowledgeNode(id: "a", gatewaysPredecessors: {gatewayEmpty});


  test("add node", () => KnowledgeDatabase.instance.setKnowledgeNode(knowledgeNode));
  test("add empty node", () => KnowledgeDatabase.instance.setKnowledgeNode(knowledgeNodeEmpty));

}