import 'package:flutter/material.dart';

class ScrollItems extends StatelessWidget {
  const ScrollItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Tooltip(message: 'just tap',
                    child: InkWell(
                      child: Container(
                        width: 150,
                        color: Colors.brown,
                        height: 200,
                      ),
                    ),
                  ),
                ),
                const Text(
                  'data',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          itemCount: 10),
    );
  }
}
