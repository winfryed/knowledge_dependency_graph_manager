// @author Matthias Weigt 02.03.23
// All rights reserved ©2023


class KnowledgeNodeDependency{

  KnowledgeNodeDependency(this.nodeId, this.rating);

  final String nodeId;
  final int rating;

  @override
  String toString() {
    return 'KnowledgeNodeDependency{nodeId: $nodeId, rating: $rating}';
  }

}