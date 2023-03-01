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
import 'json.dart';

class KnowledgeJsonConverterDefault extends KnowledgeJsonConverter {
  @override
  Map<String, dynamic> fromKnowledgeNode(KnowledgeNode knowledgeNode) {

    Map<String, dynamic> output = {};


    output["id"] = knowledgeNode.id;

    if(knowledgeNode.title!=null) {
      output["title"] = knowledgeNode.title;
    }
    if(knowledgeNode.description!=null) {
      output["description"] = knowledgeNode.description;
    }

    if(knowledgeNode.gatewaysSuccessors!=null) {
      if(knowledgeNode.gatewaysSuccessors!.isNotEmpty) {
        output["gatewaysSuccessors"] = <dynamic>[];
        for(var v in knowledgeNode.gatewaysSuccessors!) {
          output["gatewaysSuccessors"].add(fromKnowledgeNodeGateway(v));
        }
      }
    }
    if(knowledgeNode.gatewaysPredecessors!=null) {
      if(knowledgeNode.gatewaysPredecessors!.isNotEmpty) {
        output["gatewaysPredecessors"] = <dynamic>[];
        for(var v in knowledgeNode.gatewaysPredecessors!) {
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
}
