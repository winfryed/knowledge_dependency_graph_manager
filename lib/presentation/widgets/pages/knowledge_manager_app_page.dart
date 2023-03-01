// @author Matthias Weigt 01.03.23
// All rights reserved ©2023


import 'package:flutter/material.dart';
class KnowledgeManagerAppPage extends StatelessWidget {
  const KnowledgeManagerAppPage(
      {super.key,
        required this.title,
        required this.children,
        this.showFeedbackButton = true,
        this.showBackButton = false});

  final String title;
  final bool showBackButton;
  final List<Widget> children;

  final bool showFeedbackButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50,),
              Row(
                children: [
                  if (showBackButton)
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: FloatingActionButton(
                        heroTag: const SizedBox(),
                        onPressed: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.displayMedium,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              const Divider(),
              ...children
            ]),
      ),
    );
  }
}
