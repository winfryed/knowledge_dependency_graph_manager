// @author Matthias Weigt 01.03.23
// All rights reserved ©2023


import '../dependencies/knowledge_node_dependency.dart';
import 'knowledge_node_dependency_gateway.dart';

///propositional logic operand OR and sufficient condition for succeeding node
class KnowledgeNodeDependencyGatewayOrSufficient<T extends KnowledgeNodeDependency> extends KnowledgeNodeDependencyGateway<T>{
  KnowledgeNodeDependencyGatewayOrSufficient(super.dependencies);
  static const gatewayId = "orSufficient";

  @override
  String getGatewayId() => gatewayId;
}