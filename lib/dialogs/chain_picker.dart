part of 'dialogs.dart';

Future<Chain?> showChainPicker(BuildContext context) async {
  final completer = Completer<Chain?>();

  unawaited(
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          maxChildSize: 0.5,
          builder: (context, scrollController) {
            return Consumer(
              builder: (context, ref, child) {
                final chains = ref.watch(chainsPod);

                return ListView.builder(
                  padding: Gaps.of(context).safeBottom,
                  controller: scrollController,
                  itemCount: chains.length + 1,
                  itemBuilder: (context, index) {
                    if (index >= chains.length) {
                      return ListTile(
                        onTap: () {},
                        leading: const Icon(Icons.add),
                        title: const Text('Add Custom'),
                      );
                    }

                    final chain = chains[index];

                    return ListTile(
                      onTap: () {
                        completer.complete(chain);
                        Navigator.pop(context);
                      },
                      title: Text(chain.name),
                    );
                  },
                );
              },
            );
          },
        );
      },
    ),
  );

  return completer.future;
}
