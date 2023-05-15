import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PlaceHolderPage extends StatelessWidget{
  const PlaceHolderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

}