import 'package:flutter/material.dart';

class PendingIcon extends StatelessWidget {
  const PendingIcon({Key? key, this.isEditPage}) : super(key: key);
  final bool ? isEditPage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isEditPage == true ? 25 : 20,
      width: isEditPage == true ? 25 : 20,
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: Colors.white),
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Colors.amber),
      ),
    );
  }
}

class RejectedIcon extends StatelessWidget {
  const RejectedIcon({Key? key, this.isEditPage}) : super(key: key);
  final bool ? isEditPage;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: Colors.red),
      child: Icon(
        Icons.close,
        color: Colors.white,
        size: isEditPage == true ? 23 : 20,
      ),
    );
  }
}

class VerifiedIcon extends StatelessWidget {
  const VerifiedIcon({Key? key, this.isEditPage}) : super(key: key);
  final bool ? isEditPage;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: Colors.white),
      child: Icon(
        Icons.check_circle,
        color: Colors.green,
        size: isEditPage == true ? 25 : 20,
      ),
    );
  }
}


