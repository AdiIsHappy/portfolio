import 'package:flutter/material.dart';
import 'package:portfolio/app/utils/constants/colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HyperText extends StatefulWidget {
  HyperText(
    this.text, {
    this.margin,
    super.key,
  });

  final String text;
  final EdgeInsets? margin;

  @override
  State<HyperText> createState() => _HyperTextState();
}

class _HyperTextState extends State<HyperText> {
  @override
  Widget build(BuildContext context) {
    List outsideBraces = [];
    List insideBraces = [];
    List<bool> hover = [];

    bool inside = false;
    String currentString = '';

    for (int i = 0; i < widget.text.length; i++) {
      if (widget.text[i] == '{') {
        outsideBraces.add(currentString.trim());
        currentString = '';

        inside = true;
      } else if (widget.text[i] == '}') {
        insideBraces.add(currentString.trim().split('|'));
        hover.add(false);
        currentString = '';
        inside = false;
      } else {
        currentString += widget.text[i];
      }
    }
    if (inside) {
      insideBraces.add(currentString.trim().split('|'));
    } else {
      outsideBraces.add(currentString.trim());
    }

    // Prepare rich texts
    List<InlineSpan> textSpans = [];
    int i = 0;
    int j = 0;
    while (i < outsideBraces.length || j < insideBraces.length) {
      if (i < outsideBraces.length) {
        textSpans.add(TextSpan(
            text: '${outsideBraces[i]} ',
            style: TextStyle(color: TColors.darkGrey, fontSize: 16)));
        i++;
      }
      if (j < insideBraces.length) {
        textSpans.add(WidgetSpan(
            child: HoverableTextSpan(
          text: '${insideBraces[j][0]} ',
          url: insideBraces[j][1],
        )));
        j++;
      }
    }

    return Container(
      margin: widget.margin,
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(children: textSpans),
      ),
    );
  }
}

class HoverableTextSpan extends StatefulWidget {
  final String text;
  final String? url;
  final VoidCallback? onTap;
  const HoverableTextSpan({
    super.key,
    required this.text,
    this.url,
    this.onTap,
  });

  @override
  _HoverableTextSpanState createState() => _HoverableTextSpanState();
}

class _HoverableTextSpanState extends State<HoverableTextSpan> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (widget.url != null) {
          await launchUrlString(widget.url!);
        }
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: MouseRegion(
        onHover: (event) => setState(() => _isHovered = true),
        onExit: (event) => setState(() => _isHovered = false),
        child: Text.rich(
          TextSpan(
            text: widget.text,
            style: TextStyle(
              fontSize: 16,
              color: _isHovered ? TColors.secondary : TColors.grey,
              decoration:
                  _isHovered ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
