// @author Matthias Weigt 01.03.23
// All rights reserved ©2023


import 'gateways/knowledge_node_dependency_gateway.dart';

class KnowledgeNode{
  KnowledgeNode(
      {required this.id,
      this.title,
      this.description,
      this.gatewaysSuccessors,
      this.gatewaysPredecessors});


  final String id;
  final String? title;
  final String? description;
  final Set<KnowledgeNodeDependencyGateway>? gatewaysSuccessors;
  final Set<KnowledgeNodeDependencyGateway>? gatewaysPredecessors;

  @override
  String toString() {
    return 'KnowledgeNode{id: $id, title: $title, description: $description, gatewaysSuccessors: $gatewaysSuccessors, gatewaysPredecessors: $gatewaysPredecessors}';
  }
}