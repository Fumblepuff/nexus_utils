import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/format.dart';
import '../buttons/custom_popup_menu.dart';
import '../cards/card_white.dart';
import 'markdown_parser.dart';

class MarkdownEditor extends StatefulWidget {
  final TextEditingController controller;
  const MarkdownEditor({super.key, required this.controller});

  @override
  State<MarkdownEditor> createState() => _MarkdownEditorState();
}

class _MarkdownEditorState extends State<MarkdownEditor> {
  final UndoHistoryController _undoController = UndoHistoryController();
  bool preview = false;
  bool hoverToolbar = false;
  late final _focusNode = FocusNode(
    onKeyEvent: (FocusNode node, KeyEvent evt) {
      if (!HardwareKeyboard.instance.isShiftPressed &&
          evt.logicalKey.keyLabel == 'Enter') {
        if (evt is KeyDownEvent) {
          widget.controller.text = '${widget.controller.text}\n\n';
        }
        return KeyEventResult.handled;
      } else {
        return KeyEventResult.ignored;
      }
    },
  );

  @override
  void initState() {
    super.initState();
    // Listen for controller selection changes
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: preview
              ? MarkdownParser(data: widget.controller.text)
              : SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: widget.controller,
                        undoController: _undoController,
                        focusNode: _focusNode,
                        decoration: const InputDecoration(
                          hintText: 'Body',
                          border: InputBorder.none,
                        ),
                        style: bodyStyle,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 5),
                      toolBar(),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              '${widget.controller.text.length} characters',
              style: roboto.copyWith(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: formatMenu(),
          ),
        ),
      ],
    );
  }

  Widget formatMenu() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Preview
        IconButton(
          tooltip: preview ? 'Edit' : 'Preview',
          onPressed: () {
            setState(() {
              preview = !preview;
            });
          },
          icon: Icon(
            preview ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
            size: 16,
          ),
        ),
        const SizedBox(width: 10),
        CustomPopupMenu(
          tooltip: 'Format Text',
          items: [
            // Bold
            PopupMenuItem(
              onTap: () {
                formatText('bold');
              },
              value: 'bold',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bold',
                    style: roboto.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const FaIcon(
                    FontAwesomeIcons.bold,
                    color: Colors.black,
                    size: 16,
                  ),
                ],
              ),
            ),

            // Italic
            PopupMenuItem(
              onTap: () {
                formatText('italic');
              },
              value: 'italic',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Italic',
                    style: roboto.copyWith(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const FaIcon(
                    FontAwesomeIcons.italic,
                    color: Colors.black,
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget toolBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: IgnorePointer(
        ignoring: widget.controller.text.isEmpty,
        child: ValueListenableBuilder<UndoHistoryValue>(
          valueListenable: _undoController,
          builder: (context, value, child) {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: widget.controller.text.isEmpty
                  ? 0
                  : hoverToolbar
                      ? 1
                      : 0.25,
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    hoverToolbar = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    hoverToolbar = false;
                  });
                },
                child: WhiteCard(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Bold
                      IconButton(
                        tooltip: 'Bold',
                        onPressed: () {
                          formatText('bold');
                        },
                        icon: const Icon(FontAwesomeIcons.bold, size: 16),
                      ),

                      // Italic
                      IconButton(
                        tooltip: 'Italic',
                        onPressed: () {
                          formatText('italic');
                        },
                        icon: const Icon(FontAwesomeIcons.italic, size: 16),
                      ),

                      // Heading
                      headingMenu(),

                      // Link
                      IconButton(
                        tooltip: 'Instert Link',
                        onPressed: () {
                          formatText('link');
                        },
                        icon: const Icon(FontAwesomeIcons.link, size: 16),
                      ),

                      // Bullet List
                      IconButton(
                        tooltip: 'Bullet List',
                        onPressed: () {
                          formatText('bullet');
                        },
                        icon: const Icon(FontAwesomeIcons.listUl, size: 16),
                      ),

                      // Undo
                      IconButton(
                        tooltip: 'Undo',
                        onPressed: value.canUndo
                            ? () {
                                _undoController.undo();
                                setState(() {});
                              }
                            : null,
                        icon: Icon(
                          FontAwesomeIcons.arrowRotateLeft,
                          size: 16,
                          color: value.canUndo ? Colors.black : Colors.grey,
                        ),
                      ),

                      // Redo
                      IconButton(
                        tooltip: 'Redo',
                        onPressed: value.canRedo
                            ? () {
                                _undoController.redo();
                                setState(() {});
                              }
                            : null,
                        icon: Icon(
                          FontAwesomeIcons.arrowRotateRight,
                          size: 16,
                          color: value.canRedo ? Colors.black : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget headingMenu() {
    return CustomPopupMenu(
      tooltip: 'Heading',
      icon: FontAwesomeIcons.heading,
      iconSize: 16,
      items: [
        // Heading 1
        PopupMenuItem(
          onTap: () {
            formatText('h1');
          },
          value: 'h1',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Heading 1',
                style: titleStyle,
              ),
              const FaIcon(
                FontAwesomeIcons.heading,
                color: Colors.black,
                size: 16,
              ),
            ],
          ),
        ),

        // Heading 2
        PopupMenuItem(
          onTap: () {
            formatText('h2');
          },
          value: 'h2',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Heading 2',
                style: headerStyle,
              ),
              const FaIcon(
                FontAwesomeIcons.heading,
                color: Colors.black,
                size: 16,
              ),
            ],
          ),
        ),

        // Heading 3
        PopupMenuItem(
          onTap: () {
            formatText('h3');
          },
          value: 'h3',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Heading 3',
                style: subheaderStyle,
              ),
              const FaIcon(
                FontAwesomeIcons.heading,
                color: Colors.black,
                size: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void formatText(String format) {
    final text = widget.controller.text;
    final selection = widget.controller.selection;
    final preText = text.substring(0, selection.start);
    final selectedText = text.substring(selection.start, selection.end);
    final postText = text.substring(selection.end);
    switch (format) {
      case 'bold':
        final newText = '$preText**$selectedText**$postText';
        widget.controller.text = newText;
        widget.controller.selection = TextSelection(
          baseOffset: selection.start + 2,
          extentOffset: selection.end + 2,
        );
        break;
      case 'italic':
        final newText = '$preText*$selectedText*$postText';
        widget.controller.text = newText;
        widget.controller.selection = TextSelection(
          baseOffset: selection.start + 1,
          extentOffset: selection.end + 1,
        );
        break;
      case 'link':
        String linkName = selectedText.isEmpty ? 'text label' : selectedText;
        final newText = '$preText[$linkName](url)$postText';
        widget.controller.text = newText;
        widget.controller.selection = TextSelection(
          baseOffset: selection.start + 1,
          extentOffset: selection.end + 1,
        );
        break;
      case 'bullet':
        final newText = '$preText- $selectedText$postText';
        widget.controller.text = newText;
        widget.controller.selection = TextSelection(
          baseOffset: selection.start + 2,
          extentOffset: selection.end + 2,
        );
        break;
      case 'h1':
        final newText = '$preText# $selectedText$postText';
        widget.controller.text = newText;
        widget.controller.selection = TextSelection(
          baseOffset: selection.start + 2,
          extentOffset: selection.end + 2,
        );
        break;
      case 'h2':
        final newText = '$preText## $selectedText$postText';
        widget.controller.text = newText;
        widget.controller.selection = TextSelection(
          baseOffset: selection.start + 3,
          extentOffset: selection.end + 3,
        );
        break;
      case 'h3':
        final newText = '$preText### $selectedText$postText';
        widget.controller.text = newText;
        widget.controller.selection = TextSelection(
          baseOffset: selection.start + 4,
          extentOffset: selection.end + 4,
        );
        break;
    }
  }
}
