import 'package:ambiant/dialogs/dialogs.dart';
import 'package:ambiant/models/models.dart';
import 'package:flutter/material.dart';

class _Playground extends InheritedWidget {
  const _Playground({
    required this.chains,
    required super.child,
    required this.onChanged,
  });

  final List<List<Chain?>> chains;
  final void Function(List<List<Chain?>> chains) onChanged;

  static _Playground? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_Playground>();
  }

  static _Playground of(BuildContext context) {
    final result = maybeOf(context);
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant _Playground oldWidget) {
    return chains != oldWidget.chains;
  }
}

class PlaygroundScreen extends StatefulWidget {
  const PlaygroundScreen({super.key});

  @override
  State<PlaygroundScreen> createState() => _PlaygroundScreenState();
}

class _PlaygroundScreenState extends State<PlaygroundScreen> {
  var chains = <List<Chain?>>[
    [null],
  ];

  void onDoubleTapHandler() {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Column(
          children: [
            Text('Add'),
          ],
        );
      },
    );
  }

  void onSaveHandler() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Playground'),
        actions: [
          IconButton(
            onPressed: onSaveHandler,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: _Playground(
        chains: chains,
        onChanged: (chains) {
          setState(() {
            this.chains = chains;
          });
        },
        child: const ColumnsBuilder(),
      ),
    );
  }
}

class RowBuilder extends StatelessWidget {
  const RowBuilder({required this.index, super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    final playground = _Playground.of(context);
    final row = playground.chains[index];

    return Expanded(
      child: Stack(
        children: [
          Row(
            children: [
              for (var r = 0; r < row.length; r++)
                Expanded(
                  child: StreamBuilder(
                    stream: row[r]?.run(),
                    builder: (context, snapshot) {
                      return SizedBox.expand(
                        child: Stack(
                          children: [
                            if (snapshot.hasData)
                              Positioned.fill(
                                child: ColoredBox(
                                  color: snapshot.requireData,
                                ),
                              ),
                            Positioned.fill(
                              child: Center(
                                child: IconButton.filled(
                                  onPressed: () async {
                                    final clone = List<List<Chain?>>.from(
                                      playground.chains,
                                    );

                                    final isFirst = index == 0 && r == 0;

                                    final chain = await showChainPicker(
                                      context,
                                      onRemoved: isFirst
                                          ? null
                                          : () {
                                              clone[index].removeAt(r);
                                              playground.onChanged(clone);
                                            },
                                    );

                                    if (chain == null || !context.mounted) {
                                      return;
                                    }

                                    clone[index][r] = chain;

                                    playground.onChanged(clone);
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: IconButton(
                onPressed: () {
                  final clone = List<List<Chain?>>.from(playground.chains);
                  clone[index].add(null);

                  playground.onChanged(clone);
                },
                icon: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ColumnsBuilder extends StatelessWidget {
  const ColumnsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final playground = _Playground.of(context);

    return Stack(
      children: [
        Column(
          children: [
            for (var i = 0; i < playground.chains.length; i++)
              RowBuilder(index: i),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: MediaQuery.paddingOf(context).bottom,
          child: Center(
            child: IconButton(
              onPressed: () {
                final clone = List<List<Chain?>>.from(playground.chains)
                  ..add([null]);

                playground.onChanged(clone);
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
