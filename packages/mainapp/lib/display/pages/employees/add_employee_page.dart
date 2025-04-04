part of mainapp;

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final bloc = context.read<EmployeeBloc>();
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Employee Details',
      ),
      body: Column(
        children: [
          CustomTextField(
            hintText: 'Employee name',
            prefixIcon: Assets.icons.person,
            onChanged: (p0) {},
          ),
          const Gap(12),
          // roles selection
          GestureDetector(
            onTap: () async {
              showModalBottomSheet(
                context: context,
                backgroundColor: kWhite,
                builder: (context) {
                  return SizedBox(
                    height: 240,
                    child: ListView.separated(
                      itemCount: roles.length,
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(color: kBorder);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        String e = roles.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            bloc.role = e;
                            context.pop();
                            setState(() {});
                          },
                          child: SizedBox(
                            height: 46,
                            child: Center(
                              child: regularText(e, 16, kTextPrimary),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
            child: Container(
              height: 48,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // title and icon
                  Row(
                    spacing: 6,
                    children: [
                      SVG.asset(Assets.icons.briefcase, height: 24, width: 24),
                      regularText(
                          bloc.role ?? "Select role", 16, kTextSecondary),
                    ],
                  ),
                  SVG.asset(Assets.icons.dropdown_arrow, height: 12, width: 12),
                ],
              ),
            ),
          ),
          const Gap(12),
          DatePicker(
            initialDate: DateTime.now(),
          ),
          //date selection
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //start date
              DateField(
                title: bloc.startDate ?? 'Today',
                onTap: () async {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true, // To allow full screen height
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                          left: 16,
                          right: 16,
                          top: 16,
                        ),
                        child: StatefulBuilder(
                          builder: (context, setState) {
                            return DatePicker(
                              initialDate: DateTime.now(),
                                // onDateSelected: (DateTime selectedDate) {
                                //   Navigator.pop(context); // Close modal
                                //   setState(() {
                                //     bloc.startDate = DateFormat('d MMM y').format(selectedDate);
                                //   });
                                // },
                                );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              SVG.asset(Assets.icons.arrow_right, height: 20, width: 20),
              //end date
              DateField(
                title: bloc.endDate ?? 'No Date',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
