part of 'widgets.dart';

class ColorPanel extends ConsumerWidget {
  const ColorPanel({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final chain = ref.watch(chainPod);

    return StreamBuilder(
      stream: chain.run(),
      builder: (context, snap) {
        if (!snap.hasData) {
          return const SizedBox.shrink();
        }

        return ColoredBox(color: snap.requireData);
      },
    );
  }
}
