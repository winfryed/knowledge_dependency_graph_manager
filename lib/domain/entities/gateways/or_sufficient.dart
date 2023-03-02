// @author Matthias Weigt 01.03.23
// All rights reserved ©2023


import 'knowledge_node_dependency_gateway.dart';

///propositional logic operand OR and sufficient condition for succeeding node
class KnowledgeNodeDependencyGatewayOrSufficient extends KnowledgeNodeDependencyGateway{
  KnowledgeNodeDependencyGatewayOrSufficient(super.dependencies);
  static const id= "orSufficient";

  @override
  bool get isAndGateway => false;

  @override
  bool get isNecessaryGateway => false;

  @override
  bool get isOrGateway => true;

  @override
  bool get isSufficientGateway => true;

  @override
  String get gatewayId => id;
}