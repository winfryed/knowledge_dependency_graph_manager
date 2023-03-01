// @author Matthias Weigt 01.03.23
// All rights reserved ©2023

import '../dependencies/knowledge_node_dependency.dart';

///is a base for a collection of edges (here [dependencies]) in a layer that make up a classic propositional logic operand for the succeeding node
abstract class KnowledgeNodeDependencyGateway<T extends KnowledgeNodeDependency>{

  KnowledgeNodeDependencyGateway(this.dependencies);

  final Set<T> dependencies;

  @override
  String toString() {
    return 'KnowledgeNodeDependencyGateway{dependencies: $dependencies}';
  }

  String getGatewayId();

}