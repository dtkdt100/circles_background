import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';
import 'presets.dart';

/// Shows presets full screen; swipe to move between them.
class PresetViewer extends StatefulWidget {
  const PresetViewer({super.key, required this.initialIndex});

  final int initialIndex;

  @override
  State<PresetViewer> createState() => _PresetViewerState();
}

class _PresetViewerState extends State<PresetViewer> {
  late final _controller = PageController(initialPage: widget.initialIndex);
  late int _index = widget.initialIndex;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final preset = presets[_index];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actions: [
          const ThemeToggleButton(),
          IconButton(
            tooltip: 'View code',
            icon: const Icon(Icons.code),
            onPressed: () => showCodeSheet(context, preset),
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: presets.length,
            onPageChanged: (index) => setState(() => _index = index),
            itemBuilder: (context, index) => presets[index].builder(
              size,
              _DemoContent(preset: presets[index]),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _PageDots(count: presets.length, index: _index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Opens a bottom sheet with the code for [preset].
void showCodeSheet(BuildContext context, Preset preset) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (context) => _CodeSheet(preset: preset),
  );
}

/// Sample screen content drawn on top of the background.
class _DemoContent extends StatelessWidget {
  const _DemoContent({required this.preset});

  final Preset preset;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, kToolbarHeight + 8, 24, 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              preset.name,
              style: textTheme.displayMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              preset.description,
              style: textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
            const Spacer(),
            Card(
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your content here', style: textTheme.titleLarge),
                    const SizedBox(height: 8),
                    Text(
                      'The background is painted behind any child widget. '
                      'Try dark mode to see it dim automatically, or tap '
                      '</> to copy the code.',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: preset.accent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () => showCodeSheet(context, preset),
                      icon: const Icon(Icons.code),
                      label: const Text('View code'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageDots extends StatelessWidget {
  const _PageDots({required this.count, required this.index});

  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < count; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: i == index ? 22 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: i == index ? 1 : 0.5),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
      ],
    );
  }
}

class _CodeSheet extends StatelessWidget {
  const _CodeSheet({required this.preset});

  final Preset preset;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      builder: (context, scrollController) => ListView(
        controller: scrollController,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${preset.name} code',
                  style: theme.textTheme.titleLarge,
                ),
              ),
              FilledButton.tonalIcon(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: preset.code));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Copied to clipboard')),
                  );
                },
                icon: const Icon(Icons.copy, size: 18),
                label: const Text('Copy'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SelectableText(
                preset.code,
                style: const TextStyle(fontFamily: 'monospace', fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
