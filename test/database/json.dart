// @author Matthias Weigt 01.03.23
// All rights reserved ©2023

import 'package:flutter_test/flutter_test.dart';
import 'package:knowledge_dependency_graph_manager/database/json.dart';
import 'package:knowledge_dependency_graph_manager/database/knowledge_json_converter_default.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/dependencies/hard_knowledge_node_dependency.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/gateways/and_sufficient.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/gateways/or_necessary.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/knowledge_node.dart';

void main() {
  KnowledgeJsonConverter.init(KnowledgeJsonConverterDefault());
  test(
    "database convert test",
    () {
      KnowledgeJsonConverter.instance
          .fromKnowledgeNodeDependency(HardKnowledgeNodeDependency("a", 1));
    },
  );

  test(
    "gateway test",
    () {
      KnowledgeJsonConverter.instance.fromKnowledgeNodeGateway(
          KnowledgeNodeDependencyGatewayAndSufficient({
            HardKnowledgeNodeDependency("a", 1),
            HardKnowledgeNodeDependency("b", 1)
          }));
    },
  );
  test(
    "node test",
    () {
      print(KnowledgeJsonConverter.instance.fromKnowledgeNode(
          KnowledgeNode(id: "a",gatewaysPredecessors: {KnowledgeNodeDependencyGatewayAndSufficient({
          HardKnowledgeNodeDependency("a", 1),
          HardKnowledgeNodeDependency("b", 1)
          }),KnowledgeNodeDependencyGatewayOrNecessary({
            HardKnowledgeNodeDependency("a", 1),
            HardKnowledgeNodeDependency("b", 1)
          })})));
    },
  );
  test(
    "json to node",
      () {
        print(KnowledgeJsonConverter.instance.fromKnowledgeNodeJson(KnowledgeJsonConverter.instance.fromKnowledgeNode(
            KnowledgeNode(id: "a",gatewaysPredecessors: {KnowledgeNodeDependencyGatewayAndSufficient({
              HardKnowledgeNodeDependency("a", 1),
              HardKnowledgeNodeDependency("b", 1)
            }),KnowledgeNodeDependencyGatewayOrNecessary({
              HardKnowledgeNodeDependency("a", 1),
              HardKnowledgeNodeDependency("b", 1)
            })})))
        );
      }
  );
}
