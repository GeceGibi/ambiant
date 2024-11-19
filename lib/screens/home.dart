import 'package:ambiant/core/core.dart';
import 'package:ambiant/pods/pods.dart';
import 'package:ambiant/screens/playground.dart';
import 'package:ambiant/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marqueer/marqueer.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  final inputController = TextEditingController();
  final marqueerController = MarqueerController();
  final textSizeNotifier = ValueNotifier<double>(180);
  final ppsNotifier = ValueNotifier<double>(15);

  var hideUi = true;

  void onTapBackgroundHandler() {
    return;
    setState(() {
      hideUi = !hideUi;
    });

    if (hideUi) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  void onTypePickHandler() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          maxChildSize: 0.5,
          builder: (context, scrollController) {
            return Consumer(
              builder: (context, ref, child) {
                final templates = ref.watch(chainsPod);
                final activeTemplate = ref.watch(chainPod);

                return ListView.builder(
                  padding: Gaps.of(context).safeBottom,
                  controller: scrollController,
                  itemCount: templates.length + 1,
                  itemBuilder: (context, index) {
                    if (index >= templates.length) {
                      return ListTile(
                        onTap: () {},
                        leading: const Icon(Icons.add),
                        title: const Text('Add Custom'),
                      );
                    }

                    final template = templates[index];
                    final isActive = template == activeTemplate;

                    return ListTile(
                      selected: template == activeTemplate,
                      leading: Icon(
                        isActive ? Icons.circle : Icons.circle_outlined,
                      ),
                      onTap: () {
                        ref.read(chainPod.notifier).state = template;
                        Navigator.of(context).pop();
                      },
                      title: Text(template.name),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  void onInputSubmitHandler() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: PlaygroundScreen()),
          if (inputController.text.isNotEmpty)
            Positioned.fill(
              child: ValueListenableBuilder(
                valueListenable: ppsNotifier,
                builder: (context, pps, child) {
                  return ValueListenableBuilder(
                    valueListenable: textSizeNotifier,
                    builder: (context, textSize, child) {
                      return Marqueer(
                        pps: pps,
                        controller: marqueerController,
                        interaction: false,
                        child: Text(
                          inputController.text,
                          style: TextStyle(
                            fontSize: textSize,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          Positioned(
            left: 20,
            right: 20,
            bottom: padding.bottom + 20,
            child: AnimatedSlide(
              duration: const Duration(seconds: 1),
              offset: Offset(0, hideUi ? 2 : 0),
              curve: Curves.easeOutQuart,
              child: ClipRRect(
                borderRadius: UiConstants.borderRadius,
                child: ColoredBox(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer(
                          builder: (context, ref, child) {
                            final chain = ref.watch(chainPod);

                            return GestureDetector(
                              onTap: onTypePickHandler,
                              child: Text(chain.name),
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextInput(
                                controller: inputController,
                                onSubmitted: onInputSubmitHandler,
                              ),
                            ),
                            const SizedBox(width: 8),
                            FilledButton(
                              onPressed: onInputSubmitHandler,
                              child: const Text('Save'),
                            ),
                          ],
                        ),
                        ValueListenableBuilder(
                          valueListenable: textSizeNotifier,
                          builder: (context, textSize, child) {
                            return Slider.adaptive(
                              value: textSize,
                              max: 1000,
                              onChanged: (size) {
                                textSizeNotifier.value = size;
                              },
                            );
                          },
                        ),
                        ValueListenableBuilder(
                          valueListenable: ppsNotifier,
                          builder: (context, pps, child) {
                            return Slider.adaptive(
                              value: pps,
                              max: 2000,
                              onChanged: (size) {
                                ppsNotifier.value = size;
                                marqueerController
                                  ..stop()
                                  ..start();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  const TextInput({
    required this.controller,
    required this.onSubmitted,
    super.key,
  });

  final TextEditingController controller;
  final void Function() onSubmitted;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: UiConstants.borderRadius,
        color: Color(0x11000000),
      ),
      child: TextField(
        controller: controller,
        onSubmitted: (value) => onSubmitted(),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(8),
          border: InputBorder.none,
          hintText: 'Text',
          isDense: true,
        ),
      ),
    );
  }
}
