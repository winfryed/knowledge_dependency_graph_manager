// @author Matthias Weigt 01.03.23
// All rights reserved ©2023

import '../dependencies/knowledge_node_dependency.dart';
import 'knowledge_node_dependency_gateway.dart';

///propositional logic operand OR and necessary condition for succeeding node
class KnowledgeNodeDependencyGatewayOrNecessary<T extends KnowledgeNodeDependency> extends KnowledgeNodeDependencyGateway<T>{
  KnowledgeNodeDependencyGatewayOrNecessary(super.dependencies);
  static const gatewayId = "orNecessary";

  @override
  String getGatewayId() => gatewayId;
}