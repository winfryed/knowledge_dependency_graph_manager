// @author Matthias Weigt 01.03.23
// All rights reserved ©2023

import 'package:knowledge_dependency_graph_manager/domain/entities/dependencies/knowledge_node_dependency.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/gateways/knowledge_node_dependency_gateway.dart';

///propositional logic operand AND and necessary condition for succeeding node
class KnowledgeNodeDependencyGatewayAndNecessary<T extends KnowledgeNodeDependency> extends KnowledgeNodeDependencyGateway<T>{
  KnowledgeNodeDependencyGatewayAndNecessary(super.dependencies);
  static const gatewayId = "andNecessary";

  @override
  String getGatewayId() => gatewayId;
}