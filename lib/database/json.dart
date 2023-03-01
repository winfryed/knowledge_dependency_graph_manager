// @author Matthias Weigt 01.03.23
// All rights reserved ©2023




import 'package:knowledge_dependency_graph_manager/domain/entities/dependencies/knowledge_node_dependency.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/gateways/knowledge_node_dependency_gateway.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/knowledge_node.dart';

abstract class KnowledgeJsonConverter{

  static late KnowledgeJsonConverter instance;


  static init(KnowledgeJsonConverter converter) => instance=converter;



  Map<String,dynamic> fromKnowledgeNode(KnowledgeNode knowledgeNode);


  Map<String,dynamic> fromKnowledgeNodeDependency(KnowledgeNodeDependency knowledgeNodeDependency);


  Map<String,dynamic> fromKnowledgeNodeGateway(KnowledgeNodeDependencyGateway knowledgeNodeDependencyGateway);



}