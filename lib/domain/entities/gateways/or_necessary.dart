// @author Matthias Weigt 01.03.23
// All rights reserved ©2023

import 'knowledge_node_dependency_gateway.dart';

///propositional logic operand OR and necessary condition for succeeding node
class KnowledgeNodeDependencyGatewayOrNecessary extends KnowledgeNodeDependencyGateway{
  KnowledgeNodeDependencyGatewayOrNecessary(super.dependencies);

  static const id= "orNecessary";
  @override
  bool get isAndGateway => false;

  @override
  bool get isNecessaryGateway => true;

  @override
  bool get isOrGateway => true;

  @override
  bool get isSufficientGateway => false;

  @override
  String get gatewayId => id;
}