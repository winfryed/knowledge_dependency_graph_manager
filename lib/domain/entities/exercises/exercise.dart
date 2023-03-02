// @author Yuri Hassink 01.03.2023
// All rights reserved ©2023

/// models an exercise for a given node
class KnowledgeNodeExercise {
  KnowledgeNodeExercise(this.assignmentText, this.solutionText, this.rating);

  final String assignmentText;
  final String solutionText;
  final int rating;
}