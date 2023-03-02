// @author Yuri Hassink 01.03.2023
// All rights reserved ©2023

/// models an exercise for a given node
class KnowledgeNodeExercise {
  KnowledgeNodeExercise(this.assignmentText, this.solutionText, this.rating);

  final String assignmentText;
  final String solutionText;
  final String rating;
  Stopwatch stopwatch = Stopwatch();
  Duration timeElapsed = const Duration(seconds: 0);

  void startStopwatch(){
    stopwatch.start();
  }

  Duration stopStopwatch(){
    stopwatch.stop();
    timeElapsed=Duration(milliseconds: stopwatch.elapsedMilliseconds);
    return timeElapsed;
  }
}