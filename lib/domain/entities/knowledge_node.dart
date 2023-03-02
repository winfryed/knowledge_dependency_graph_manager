// @author Matthias Weigt 01.03.23
// All rights reserved ©2023

import 'exercises/exercise.dart';
import 'gateways/knowledge_node_dependency_gateway.dart';

/// a node that represents a granular piece of knowledge, ideally one that is so small, as to leave the learner with a next viable step in learning,
/// given that the given layer of knowledge before this one is learning appropriately
/// [KnowledgeNode] is built with the data structure adjacency list for graphs in mind and therefore has a list of predecessors and successors, which are
/// duplicated in the predecessors and successors lists as well to give every node a sense of independence
class KnowledgeNode {
  KnowledgeNode(
      {required this.id,
      this.title,
      this.rating,
      this.exerciseList,
      this.description,
      this.hardForwardDependencyGateway,
      this.backwardDependencies});

  final String id;
  final String? title;
  final String? description;
  final int? rating;
  final List<KnowledgeNodeExercise>? exerciseList;

  final KnowledgeNodeDependencyGateway? hardForwardDependencyGateway;
  final Set<String>? backwardDependencies;

  @override
  String toString() {
    return 'KnowledgeNode{id: $id, title: $title, description: $description, hardForwardDependencyGateway: $hardForwardDependencyGateway, backwardDependencies: $backwardDependencies}';
  }
}
