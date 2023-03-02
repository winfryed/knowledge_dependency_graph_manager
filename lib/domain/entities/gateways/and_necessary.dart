// @author Matthias Weigt 01.03.23
// All rights reserved ©2023

import 'package:knowledge_dependency_graph_manager/domain/entities/gateways/knowledge_node_dependency_gateway.dart';

///propositional logic operand AND and necessary condition for succeeding node
class KnowledgeNodeDependencyGatewayAndNecessary extends KnowledgeNodeDependencyGateway{
  KnowledgeNodeDependencyGatewayAndNecessary(super.dependencies);

  static const id= "andNecessary";

  @override
  bool get isAndGateway => true;

  @override
  bool get isNecessaryGateway => true;

  @override
  bool get isOrGateway => false;

  @override
  bool get isSufficientGateway => false;

  @override
  String get gatewayId => id;
}