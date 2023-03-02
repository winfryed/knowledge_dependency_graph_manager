// @author Matthias Weigt 01.03.23
// All rights reserved ©2023


import 'package:knowledge_dependency_graph_manager/domain/entities/knowledge_node_dependency.dart';

///is a base for a collection of edges (here [dependencies]) in a layer that make up a classic propositional logic operand for the succeeding node
abstract class KnowledgeNodeDependencyGateway{

  KnowledgeNodeDependencyGateway(this.dependencies);

  final Set<KnowledgeNodeDependency> dependencies;

  @override
  String toString() {
    return 'KnowledgeNodeDependencyGateway{dependencies: $dependencies}';
  }


  bool get isOrGateway;
  bool get isAndGateway;
  bool get isSufficientGateway;
  bool get isNecessaryGateway;


  String get gatewayId;

}