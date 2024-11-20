part of 'dialogs.dart';

Future<Chain?> showChainPicker(
  BuildContext context, {
  void Function()? onRemoved,
}) async {
  final completer = Completer<Chain?>();

  unawaited(
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      showDragHandle: true,
      useSafeArea: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          snap: true,
          maxChildSize: 0.5,
          builder: (context, controller) {
            return Consumer(
              builder: (context, ref, child) {
                final chains = ref.watch(chainsPod);

                return Column(
                  children: [
                    if (onRemoved != null)
                      Row(
                        children: [
                          const Spacer(),
                          TextButton.icon(
                            onPressed: onRemoved,
                            label: const Text('Remove'),
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    Expanded(
                      child: ListView.builder(
                        padding: Gaps.of(context).safeBottom,
                        controller: controller,
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
                      ),
                    ),
                  ],
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
