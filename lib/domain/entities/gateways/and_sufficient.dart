// @author Matthias Weigt 01.03.23
// All rights reserved ©2023


import '../dependencies/knowledge_node_dependency.dart';
import 'knowledge_node_dependency_gateway.dart';

class KnowledgeNodeDependencyGatewayAndSufficient<T extends KnowledgeNodeDependency> extends KnowledgeNodeDependencyGateway<T>{
  KnowledgeNodeDependencyGatewayAndSufficient(super.dependencies);
  static const gatewayId = "andSufficient";

  @override
  String getGatewayId() => gatewayId;
}