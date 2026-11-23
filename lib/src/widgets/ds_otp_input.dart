import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

import '../tokens/colors.dart';
import '../tokens/radii.dart';
import '../tokens/sizes.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';

/// Six-digit one-time code entry (`OtpInput`), grouped 3—3.
///
/// States per Figma: Empty, Focus (cobalt 2px on the next empty box),
/// Filled, Error (crimson 2px on every box — always paired with a message
/// below, never colour alone), Disabled (while a submit is in flight).
///
/// [compact] renders the mobile width variant: 40×48 boxes with 4px gaps;
/// the default is the web Full variant: 48×48 boxes with 8px gaps.
class DsOtpInput extends StatefulWidget {
  const DsOtpInput({
    super.key,
    required this.onChanged,
    this.value = '',
    this.length = 6,
    this.error = false,
    this.enabled = true,
    this.compact = false,
    this.onCompleted,
    this.autofocus = false,
  });

  final String value;
  final ValueChanged<String> onChanged;
  final int length;
  final bool error;
  final bool enabled;
  final bool compact;
  final ValueChanged<String>? onCompleted;
  final bool autofocus;

  @override
  State<DsOtpInput> createState() => _DsOtpInputState();
}

class _DsOtpInputState extends State<DsOtpInput> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _focusNode = FocusNode();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void didUpdateWidget(DsOtpInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) {
      _controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleChanged(String text) {
    widget.onChanged(text);
    if (text.length == widget.length) {
      widget.onCompleted?.call(text);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final digits = _controller.text;
    final boxWidth = widget.compact ? 40.0 : DsSizes.controlLg;
    final gap = widget.compact ? DsSpacing.inlineXs : DsSpacing.inlineSm;
    final half = widget.length ~/ 2;

    Widget box(int index) {
      final char = index < digits.length ? digits[index] : null;
      final isNext = _focusNode.hasFocus &&
          widget.enabled &&
          index == digits.length.clamp(0, widget.length - 1) &&
          digits.length < widget.length;

      final Color borderColor;
      final double borderWidth;
      if (widget.error) {
        borderColor = DsColors.statusDangerBorder;
        borderWidth = 2;
      } else if (isNext) {
        borderColor = DsColors.actionPrimaryBg;
        borderWidth = 2;
      } else {
        borderColor = DsColors.inputBorder;
        borderWidth = DsSizes.borderWidthDefault;
      }

      return Container(
        width: boxWidth,
        height: DsSizes.controlLg,
        decoration: BoxDecoration(
          color: DsColors.inputBg,
          borderRadius: BorderRadius.circular(DsRadii.input),
          border: Border.all(color: borderColor, width: borderWidth),
        ),
        alignment: Alignment.center,
        child: char == null
            ? null
            : Text(
                char,
                style: DsTypography.h3.copyWith(
                  color: widget.enabled
                      ? DsColors.inputText
                      : DsColors.textTertiary,
                ),
              ),
      );
    }

    return Stack(
      children: [
        // Hidden input that actually receives keystrokes / paste.
        Positioned.fill(
          child: Opacity(
            opacity: 0,
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              enabled: widget.enabled,
              autofocus: widget.autofocus,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(widget.length),
              ],
              autofillHints: const [AutofillHints.oneTimeCode],
              onChanged: _handleChanged,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
        ),
        GestureDetector(
          onTap: widget.enabled ? _focusNode.requestFocus : null,
          behavior: HitTestBehavior.opaque,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 0; i < widget.length; i++) ...[
                if (i == half) ...[
                  SizedBox(width: gap),
                  Text(
                    '—',
                    style: DsTypography.body
                        .copyWith(color: DsColors.textTertiary),
                  ),
                ],
                if (i > 0) SizedBox(width: gap),
                box(i),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
