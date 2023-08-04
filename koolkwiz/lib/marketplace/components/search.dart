import 'package:flutter/material.dart';
import 'package:koolkwiz/marketplace/marketplace.dart';

class SearchBox extends StatelessWidget {
  SearchBox(
      { //required this.controller,
      //required this.focus,
      //this.focusNode,
      super.key});

  //final RestorableTextEditingController controller;
  //final bool focus;
  //final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Marketplace.theme.colorScheme.onSecondary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(100),
          color: Marketplace.theme.colorScheme.onPrimary,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Icon(Icons.search, size: 18),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Try to find...',
                    hintStyle: Marketplace.subheading1
                        .copyWith(color: Marketplace.theme.colorScheme.shadow),
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );

    /*
    Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        /*Rdecoration:BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(100),
        ),*/
        child: Row(
          children: [
            Icon(FontAwesomeIcons.magnifyingGlass),
            TextField(
              //controller: controller.value,
              //focusNode: focus ? focusNode : null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            )
          ],
        ),
      ),
    );
  */
  }
}
