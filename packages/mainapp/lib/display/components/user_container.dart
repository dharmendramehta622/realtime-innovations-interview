part of mainapp;

class UserContainer extends StatelessWidget {
  const UserContainer(this.e,
      {super.key, required this.index, this.enabled = true});
  final User e;
  final int index;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bloc = context.read<EmployeeBloc>();

    return enabled
        ? Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    bloc.currentIndex = index;
                    context.push(Routes.editEmployee, extra: e);
                  },
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
                // A SlidableAction can have an icon and/or a label.
                SlidableAction(
                  onPressed: (context) {
                    bloc.add(DeleteEmployee(index));
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: Container(
              width: size.width,
              decoration: BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  semiBoldText(e.name, 16, kTextPrimary),
                  regularText(e.role, 16, kTextPrimary),
                  regularText(
                      e.startDate.formatToReadableDate, 16, kTextPrimary),
                ],
              ),
            ),
          )
        : Container(
            width: size.width,
            decoration: BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                semiBoldText(e.name, 16, kTextPrimary),
                regularText(e.role, 16, kTextPrimary),
                regularText("${e.startDate.formatToReadableDate} - ${e.endDate?.formatToReadableDate}", 16, kTextPrimary),
              ],
            ),
          );
  }
}
