// @author Matthias Weigt 01.03.23
// All rights reserved ©2023

import 'package:flutter_test/flutter_test.dart';
import 'package:knowledge_dependency_graph_manager/database/knowledge_database.dart';
import 'package:knowledge_dependency_graph_manager/database/knowledge_database_test.dart';
import 'package:knowledge_dependency_graph_manager/database/knowledge_json_converter.dart';
import 'package:knowledge_dependency_graph_manager/database/knowledge_json_converter_default.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/gateways/knowledge_node_dependency_gateway.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/gateways/or_necessary.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/knowledge_node.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/knowledge_node_dependency.dart';

void main() {

  KnowledgeJsonConverter.init(KnowledgeJsonConverterDefault());
  KnowledgeDatabase.init(KnowledgeDatabaseTest());
  KnowledgeNodeDependency hardKnowledgeNodeDependency1 =
  KnowledgeNodeDependency("b", 1);
  KnowledgeNodeDependency hardKnowledgeNodeDependency2 =
  KnowledgeNodeDependency("c", 1);
  KnowledgeNodeDependency hardKnowledgeNodeDependency3 =
  KnowledgeNodeDependency("d", 1);

  KnowledgeNodeDependencyGateway gateway1 =
  KnowledgeNodeDependencyGatewayOrNecessary({
    hardKnowledgeNodeDependency1,
    hardKnowledgeNodeDependency2,
    hardKnowledgeNodeDependency3
  });
  KnowledgeNodeDependencyGateway gatewayEmpty =
  KnowledgeNodeDependencyGatewayOrNecessary(
      {});

  KnowledgeNode knowledgeNode =
  KnowledgeNode(id: "a", hardForwardDependencyGateway: gateway1);
  KnowledgeNode knowledgeNodeEmpty =
  KnowledgeNode(id: "a", hardForwardDependencyGateway: gatewayEmpty);


  test("add node", () => KnowledgeDatabase.instance.setKnowledgeNode(knowledgeNode));
  test("add empty node", () => KnowledgeDatabase.instance.setKnowledgeNode(knowledgeNodeEmpty));

}