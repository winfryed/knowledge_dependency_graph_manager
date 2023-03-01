// @author Matthias Weigt 01.03.23
// All rights reserved ©2023

import 'package:knowledge_dependency_graph_manager/domain/entities/dependencies/hard_knowledge_node_dependency.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/dependencies/knowledge_node_dependency.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/gateways/and_necessary.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/gateways/and_sufficient.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/gateways/knowledge_node_dependency_gateway.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/gateways/or_sufficient.dart';
import 'package:knowledge_dependency_graph_manager/domain/entities/knowledge_node.dart';

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

    if (knowledgeNode.gatewaysSuccessors != null) {
      if (knowledgeNode.gatewaysSuccessors!.isNotEmpty) {
        output["gatewaysSuccessors"] = <dynamic>[];
        for (var v in knowledgeNode.gatewaysSuccessors!) {
          output["gatewaysSuccessors"].add(fromKnowledgeNodeGateway(v));
        }
      }
    }
    if (knowledgeNode.gatewaysPredecessors != null) {
      if (knowledgeNode.gatewaysPredecessors!.isNotEmpty) {
        output["gatewaysPredecessors"] = <dynamic>[];
        for (var v in knowledgeNode.gatewaysPredecessors!) {
          output["gatewaysPredecessors"].add(fromKnowledgeNodeGateway(v));
        }
      }
    }
    return output;
  }

  @override
  Map<String, dynamic> fromKnowledgeNodeDependency(
      KnowledgeNodeDependency knowledgeNodeDependency) {
    if (knowledgeNodeDependency.runtimeType != HardKnowledgeNodeDependency) {
      throw UnimplementedError(
          "The type ${knowledgeNodeDependency.runtimeType} is not supported yet.");
    }

    Map<String, dynamic> output = {};
    output["type"] = HardKnowledgeNodeDependency.dependencyId;
    output["id"] = knowledgeNodeDependency.id;
    output["rating"] = knowledgeNodeDependency.rating;

    return output;
  }

  @override
  Map<String, dynamic> fromKnowledgeNodeGateway(
      KnowledgeNodeDependencyGateway knowledgeNodeDependencyGateway) {
    String? type;
    if (knowledgeNodeDependencyGateway.getGatewayId() ==
        KnowledgeNodeDependencyGatewayAndNecessary.gatewayId) {
      type = KnowledgeNodeDependencyGatewayAndNecessary.gatewayId;
    } else if (knowledgeNodeDependencyGateway.getGatewayId() ==
        KnowledgeNodeDependencyGatewayOrNecessary.gatewayId) {
      type = KnowledgeNodeDependencyGatewayOrNecessary.gatewayId;
    } else if (knowledgeNodeDependencyGateway.getGatewayId() ==
        KnowledgeNodeDependencyGatewayAndSufficient.gatewayId) {
      type = KnowledgeNodeDependencyGatewayAndSufficient.gatewayId;
    } else if (knowledgeNodeDependencyGateway.getGatewayId() ==
        KnowledgeNodeDependencyGatewayOrSufficient.gatewayId) {
      type = KnowledgeNodeDependencyGatewayOrSufficient.gatewayId;
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

  ///converts from json

  @override
  KnowledgeNodeDependency fromKnowledgeNodeDependencyJson(
      Map<String, dynamic> knowledgeNodeDependencyJson) {
    if (knowledgeNodeDependencyJson["type"] !=
        HardKnowledgeNodeDependency.dependencyId) {
      throw UnimplementedError(
          "The type ${knowledgeNodeDependencyJson["type"]} is not supported yet.");
    }
    return HardKnowledgeNodeDependency(knowledgeNodeDependencyJson["id"],
        knowledgeNodeDependencyJson["rating"]);
  }

  @override
  KnowledgeNodeDependencyGateway<KnowledgeNodeDependency>
      fromKnowledgeNodeGatewayJson(
          Map<String, dynamic> knowledgeNodeGatewayJson) {
    Set<KnowledgeNodeDependency> dependencies = {};
    for (var v in knowledgeNodeGatewayJson["dependencies"]) {
      dependencies.add(fromKnowledgeNodeDependencyJson(v));
    }
    if (knowledgeNodeGatewayJson["type"] ==
        KnowledgeNodeDependencyGatewayAndNecessary.gatewayId) {
      return KnowledgeNodeDependencyGatewayAndNecessary(dependencies);
    } else if (knowledgeNodeGatewayJson["type"] ==
        KnowledgeNodeDependencyGatewayOrNecessary.gatewayId) {
      return KnowledgeNodeDependencyGatewayOrNecessary(dependencies);
    } else if (knowledgeNodeGatewayJson["type"] ==
        KnowledgeNodeDependencyGatewayAndSufficient.gatewayId) {
      return KnowledgeNodeDependencyGatewayAndSufficient(dependencies);
    } else if (knowledgeNodeGatewayJson["type"] ==
        KnowledgeNodeDependencyGatewayOrSufficient.gatewayId) {
      return KnowledgeNodeDependencyGatewayOrSufficient(dependencies);
    } else {
      throw UnimplementedError(
          "The type ${knowledgeNodeGatewayJson["type"]} is not supported yet.");
    }
  }

  @override
  KnowledgeNode fromKnowledgeNodeJson(Map<String, dynamic> knowledgeNodeJson) {
    String? title;
    String? description;
    Set<KnowledgeNodeDependencyGateway> successorSet = {};
    Set<KnowledgeNodeDependencyGateway> predecessor = {};
    if(knowledgeNodeJson["id"]==null) {
      throw ArgumentError("id == null");
    }


    title = knowledgeNodeJson["title"];
    description = knowledgeNodeJson["description"];
    if (knowledgeNodeJson["gatewaysSuccessors"] != null) {
      if (knowledgeNodeJson["gatewaysSuccessors"]!.isNotEmpty) {
        for (var v in knowledgeNodeJson["gatewaysSuccessors"]) {
          successorSet.add(fromKnowledgeNodeGatewayJson(v));
        }
      }
    }
    if (knowledgeNodeJson["gatewaysPredecessors"] != null) {
      if (knowledgeNodeJson["gatewaysPredecessors"]!.isNotEmpty) {
        for (var v in knowledgeNodeJson["gatewaysPredecessors"]) {
          predecessor.add(fromKnowledgeNodeGatewayJson(v));
        }
      }
    }
    return KnowledgeNode(
        id: knowledgeNodeJson["id"],
        title: title,
        description: description,
        gatewaysPredecessors: predecessor.isEmpty?null:predecessor,
        gatewaysSuccessors: successorSet.isEmpty?null:predecessor);
  }
}
