part of common_widget;

class DateField extends StatelessWidget {
  const DateField({super.key,this.title='Today',this.onTap,});
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: size.width * .4,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: kBorder),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 12,
          children: [
            // title and icon
            SVG.asset(Assets.icons.date, height: 24, width: 24),
            regularText(title, 16, kTextSecondary),
          ],
        ),
      ),
    );
  }
}
