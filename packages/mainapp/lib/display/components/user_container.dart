part of mainapp;


class UserContainer extends StatelessWidget {
  const UserContainer(this.e, {super.key});
  final User e;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        semiBoldText(e.name, 16, kTextPrimary),
        regularText(e.role, 16, kTextPrimary),
        regularText(e.startDate.formatToReadableDate, 16, kTextPrimary),
      ],
    );
  }
}
