// @author Matthias Weigt 01.03.23
// All rights reserved ©2023

import 'package:knowledge_dependency_graph_manager/domain/entities/exercises/exercise.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/gateways/and_necessary.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/gateways/and_sufficient.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/gateways/knowledge_node_dependency_gateway.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/gateways/or_sufficient.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/knowledge_node.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/knowledge_node_dependency.dart';

import '../domain/entities/gateways/or_necessary.dart';
import 'knowledge_json_converter.dart';

/// written for firebase db in mind, converts to and fro json for various entities
class KnowledgeJsonConverterDefault extends KnowledgeJsonConverter {
  ///converts to json

  @override
  Map<String, dynamic> fromKnowledgeNode(KnowledgeNode knowledgeNode) {
    Map<String, dynamic> output = {};

    output["id"] = knowledgeNode.id;

    if (knowledgeNode.title != null) {
      output["title"] = knowledgeNode.title;
    }
    if (knowledgeNode.description != null) {
      output["description"] = knowledgeNode.description;
    }


    if(knowledgeNode.hardForwardDependencyGateway!=null) {
      output["hardForwardDependencyGateway"] = fromKnowledgeNodeGateway(knowledgeNode.hardForwardDependencyGateway!);
    }
    if(knowledgeNode.backwardDependencies!=null) {
      if(knowledgeNode.backwardDependencies!.isNotEmpty) {
        output["backwardDependencies"] = <dynamic>[];
        for(var v in knowledgeNode.backwardDependencies!) {
          output["backwardDependencies"].add(v);
        }
      }
    }
    return output;
  }


  @override
  Map<String, dynamic> fromKnowledgeNodeGateway(
      KnowledgeNodeDependencyGateway knowledgeNodeDependencyGateway) {
    String? type;
    if (knowledgeNodeDependencyGateway.gatewayId ==
        KnowledgeNodeDependencyGatewayAndNecessary.id) {
      type = KnowledgeNodeDependencyGatewayAndNecessary.id;
    } else if (knowledgeNodeDependencyGateway.gatewayId ==
        KnowledgeNodeDependencyGatewayOrNecessary.id) {
      type = KnowledgeNodeDependencyGatewayOrNecessary.id;
    } else if (knowledgeNodeDependencyGateway.gatewayId ==
        KnowledgeNodeDependencyGatewayAndSufficient.id) {
      type = KnowledgeNodeDependencyGatewayAndSufficient.id;
    } else if (knowledgeNodeDependencyGateway.gatewayId ==
        KnowledgeNodeDependencyGatewayOrSufficient.id) {
      type = KnowledgeNodeDependencyGatewayOrSufficient.id;
    } else {
      throw UnimplementedError(
          "The type ${knowledgeNodeDependencyGateway.runtimeType} is not supported yet.");
    }

    Map<String, dynamic> output = {};
    output["type"] = type;

    output["dependencies"] = <dynamic>[];
    for (var singleDependency in knowledgeNodeDependencyGateway.dependencies) {
      output["dependencies"].add(fromKnowledgeNodeDependency(singleDependency));
    }

    return output;
  }


  @override
  KnowledgeNodeDependencyGateway
      toKnowledgeNodeGateway(
          Map<String, dynamic> knowledgeNodeGatewayJson) {
    Set<KnowledgeNodeDependency> dependencies = {};
    for (var v in knowledgeNodeGatewayJson["dependencies"]) {
      dependencies.add(toKnowledgeNodeDependency(v));
    }
    if (knowledgeNodeGatewayJson["type"] ==
        KnowledgeNodeDependencyGatewayAndNecessary.id) {
      return KnowledgeNodeDependencyGatewayAndNecessary(dependencies);
    } else if (knowledgeNodeGatewayJson["type"] ==
        KnowledgeNodeDependencyGatewayOrNecessary.id) {
      return KnowledgeNodeDependencyGatewayOrNecessary(dependencies);
    } else if (knowledgeNodeGatewayJson["type"] ==
        KnowledgeNodeDependencyGatewayAndSufficient.id) {
      return KnowledgeNodeDependencyGatewayAndSufficient(dependencies);
    } else if (knowledgeNodeGatewayJson["type"] ==
        KnowledgeNodeDependencyGatewayOrSufficient.id) {
      return KnowledgeNodeDependencyGatewayOrSufficient(dependencies);
    } else {
      throw UnimplementedError(
          "The type ${knowledgeNodeGatewayJson["type"]} is not supported yet.");
    }
  }

  @override
  KnowledgeNode toKnowledgeNode(Map<String, dynamic> knowledgeNodeJson) {
    String? title;
    String? description;
    KnowledgeNodeDependencyGateway? hardForwardDependencyGateway;
    Set<String> backwardDependencies={};
    if(knowledgeNodeJson["id"]==null) {
      throw ArgumentError("id == null");
    }


    title = knowledgeNodeJson["title"];
    description = knowledgeNodeJson["description"];
    if (knowledgeNodeJson["hardForwardDependencyGateway"] != null) {
      hardForwardDependencyGateway = toKnowledgeNodeGateway(knowledgeNodeJson["hardForwardDependencyGateway"]);
    }
    if (knowledgeNodeJson["backwardDependencies"] != null) {
      if (knowledgeNodeJson["backwardDependencies"]!.isNotEmpty) {
        for (var v in knowledgeNodeJson["backwardDependencies"]) {
          backwardDependencies.add(v);
        }
      }
    }
    return KnowledgeNode(
        id: knowledgeNodeJson["id"],
        title: title,
        description: description,
        backwardDependencies:backwardDependencies.isEmpty?null:backwardDependencies,
        hardForwardDependencyGateway: hardForwardDependencyGateway
    );
  }

  @override
  Map<String, dynamic> fromKnowledgeNodeDependency(KnowledgeNodeDependency knowledgeNodeDependency) {
    Map<String, dynamic> output = {};

    output["nodeId"] = knowledgeNodeDependency.nodeId;
    output["rating"] = knowledgeNodeDependency.rating;

    return output;
  }

  @override
  KnowledgeNodeDependency toKnowledgeNodeDependency(Map<String, dynamic> knowledgeNodeDependencyJson) {
    if(knowledgeNodeDependencyJson["nodeId"]==null) {
      throw ArgumentError("nodeId == null");
    }
    if(knowledgeNodeDependencyJson["rating"]==null) {
      throw ArgumentError("rating == null");
    }

    return KnowledgeNodeDependency(knowledgeNodeDependencyJson["nodeId"], knowledgeNodeDependencyJson["rating"]);
  }

  @override
  Map<String, dynamic> fromExercise(KnowledgeNodeExercise knowledgeNodeExercise) {
    Map<String, dynamic> output= {};
    output["assignmentText"] = knowledgeNodeExercise.assignmentText;
    output["solutionText"] = knowledgeNodeExercise.solutionText;
    output["rating"] = knowledgeNodeExercise.rating;
    return output;
  }

  @override
  KnowledgeNodeExercise toExercise(Map<String, dynamic> knowledgeNodeExerciseJson) {
    if(knowledgeNodeExerciseJson["assignmentText"] == null) {
      throw ArgumentError("solutionText == null");
    }
    if(knowledgeNodeExerciseJson["solutionText"] == null) {
      throw ArgumentError("solutionText == null");
    }
    if(knowledgeNodeExerciseJson["rating"] == null) {
      throw ArgumentError("rating == null");
    }
    return KnowledgeNodeExercise(knowledgeNodeExerciseJson["assignmentText"], knowledgeNodeExerciseJson["solutionText"], knowledgeNodeExerciseJson["rating"]);
  }
}
