<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

This project is to aid the managing of dependent knowledge graphs, especially for the management
of Kanten und Knoten UG knowledge graphs and is designed to support such primarily but not exclusively
## Features

-Has classes to model knowledge graphs with a host of dependencies

-Has classes to enable up- and download of graphs and its subcomponents to firebase and DBs

-Offers a front-end for graph view and editing

-Has APIs for other K & K applications

## Getting started

Clone this project and aid its progression to enable people around the world to map knowledge in 
various domains of interest in high quality dependency knowledge graphs!

## Usage

Creating a note in a math graph:
```dart
KnowledgeNode knowledgeNode = KnowledgeNode(
    id: "d9i9w29i9a0d9isda",
    title: "Ableiten einer Funktion n-ten Grades",
    description: "",
    gatewaysPredecessors: {
      KnowledgeNodeDependencyGatewayAndNecessary<HardKnowledgeNodeDependency>(
            {
              KnowledgeNodeDependencyGatewayAndNecessary({
                HardKnowledgeNodeDependency("this node is a necessary condition combined with the node under this for the successor node", 3),
                HardKnowledgeNodeDependency("with the previous node this node is a necessary condition for the successor node", 2)
              }),
              KnowledgeNodeDependencyGatewayOrNecessary({
                HardKnowledgeNodeDependency("either this node or the next node is necessary for the successor node", 4),
                HardKnowledgeNodeDependency("either this node or the previous node is necessary for the successor node", 3)
              })
            }
        )
    },
);
```

## Additional information

This project is managed by the company Kanten und Knoten UG (haftungsbeschränkt)
