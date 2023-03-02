// @author Matthias Weigt 01.03.23
// All rights reserved ©2023


import 'knowledge_node_dependency_gateway.dart';

///propositional logic operand AND and sufficient condition for succeeding node
class KnowledgeNodeDependencyGatewayAndSufficient extends KnowledgeNodeDependencyGateway{
  KnowledgeNodeDependencyGatewayAndSufficient(super.dependencies);
  static const id= "andSufficient";

  @override
  bool get isAndGateway => true;

  @override
  bool get isNecessaryGateway => false;

  @override
  bool get isOrGateway => false;

  @override
  bool get isSufficientGateway => true;

  @override
  String get gatewayId => id;
}