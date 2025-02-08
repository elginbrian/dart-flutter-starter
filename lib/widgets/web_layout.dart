import 'package:flutter/material.dart';

class WebLayout extends StatelessWidget {
  final Widget child;
  final String? localBackgroundImagePath;

  const WebLayout(
      {super.key, required this.child, this.localBackgroundImagePath});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double aspectRatio = constraints.maxWidth / constraints.maxHeight;
        double maxPortraitWidth = constraints.maxHeight * 0.5;
        double maxPortraitHeight = constraints.maxHeight * 0.95;

        bool isLocalImageAvailable = localBackgroundImagePath != null;

        return Container(
          decoration: BoxDecoration(
            color: isLocalImageAvailable ? null : Colors.black,
            image: isLocalImageAvailable
                ? DecorationImage(
                    image: AssetImage(localBackgroundImagePath!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          alignment: Alignment.center,
          child: Container(
            width: maxPortraitWidth,
            height: maxPortraitHeight,
            decoration: BoxDecoration(
              color: Colors.grey[800]?.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF222222), width: 1),
            ),
            padding: const EdgeInsets.all(4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                color: Colors.white,
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
