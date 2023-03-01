// @author Matthias Weigt 01.03.23
// All rights reserved ©2023

import '../dependencies/knowledge_node_dependency.dart';

abstract class KnowledgeNodeDependencyGateway<T extends KnowledgeNodeDependency>{

  KnowledgeNodeDependencyGateway(this.dependencies);




  final Set<T> dependencies;

}