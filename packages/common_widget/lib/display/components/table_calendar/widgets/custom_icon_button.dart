part of common_widget; 

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  final EdgeInsets margin;
  final EdgeInsets padding;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(8.0),
  });

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    return Padding(
      padding: margin,
      child: !kIsWeb &&
              (platform == TargetPlatform.iOS ||
                  platform == TargetPlatform.macOS)
          ? CupertinoButton(
              onPressed: onTap,
              padding: padding,
              child: icon,
            )
          : InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(100.0),
              child: Padding(
                padding: padding,
                child: icon,
              ),
            ),
    );
  }
}
