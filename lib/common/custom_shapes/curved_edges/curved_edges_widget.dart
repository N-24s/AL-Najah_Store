import 'package:al_najah_store/common/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class NCurvedEdgeWidget extends StatelessWidget {
  const NCurvedEdgeWidget({
    super.key, 
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: NCustomCurvedEdges(),
      child:child,
    );
  }
}

