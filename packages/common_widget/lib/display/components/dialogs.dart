part of common_widget;

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: 40,
      width: size.width,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      decoration: BoxDecoration(color: kBlack),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          regularText('Employee data has been deleted.', 15, kWhite),
          GestureDetector(
            onTap: onTap,
            child: regularText('Undo', 15, kPrimary700),
          ),
        ],
      ),
    );
  }
}

void showSnackbar(BuildContext context, {String? message, Widget? widget}) {
    assert(message != null || widget != null, 'Either message or widget must be provided');
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content:
          message != null ? regularText(message, 16, kTextPrimary) : widget!,
      duration: Duration(seconds: 5),
    ),
  );
}
