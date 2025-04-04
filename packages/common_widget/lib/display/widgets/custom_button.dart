part of common_widget;

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.text = 'Confirm',
    this.color = kPrimary700,
    this.textColor = kWhite,
    this.height=40,
    this.width=174,
  });

  final void Function()? onTap;
  final String text;
  final Color color;
  final Color textColor;
  final double height;
  final double width;


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: mediumText(text, 14, textColor),
        ),
      ),
    );
  }
}
