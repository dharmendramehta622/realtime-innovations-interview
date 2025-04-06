part of mainapp;

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {

  @override
  Widget build(BuildContext context) {

    final bloc = context.read<EmployeeBloc>();
    return BlocConsumer<EmployeeBloc, EmployeeState>(
      listener: (context, state) {
        switch (state.status) {
          case ListStatus.success:
          context.pop();
            break;
          case ListStatus.failure:
            break;
          default:
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Add Employee Details',
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    hintText: 'Employee name',
                    controller: bloc.nameEC,
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
                              separatorBuilder:
                                  (BuildContext context, int index) {
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
                              SVG.asset(Assets.icons.briefcase,
                                  height: 24, width: 24),
                              regularText(bloc.role ?? "Select role", 16,
                                  kTextSecondary),
                            ],
                          ),
                          SVG.asset(Assets.icons.dropdown_arrow,
                              height: 12, width: 12),
                        ],
                      ),
                    ),
                  ),
                  const Gap(12),
                  //date selection
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //start date
                      DateField(
                        title: bloc.startDate?.formatToReadableDate ?? 'Today',
                        onTap: () async {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled:
                                true, // To allow full screen height
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            builder: (context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                  left: 16,
                                  right: 16,
                                  top: 16,
                                ),
                                child: StatefulBuilder(
                                  builder: (context, setState) {
                                    return DatePicker(
                                      initialDate: bloc.startDate ?? DateTime.now(),
                                      onSave: (selectedDate) {
                                        bloc.startDate = selectedDate;
                                        context.pop();
                                        setState(() {});
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                      SVG.asset(Assets.icons.arrow_right,
                          height: 20, width: 20),
                      //end date
                      DateField(
                        title: bloc.endDate?.formatToReadableDate ?? 'No Date',
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled:
                                true, // To allow full screen height
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            builder: (context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                  left: 16,
                                  right: 16,
                                  top: 16,
                                ),
                                child: StatefulBuilder(
                                  builder: (context, setState) {
                                    return DatePicker(
                                      initialDate:
                                          bloc.endDate ?? DateTime.now(),
                                      onSave: (selectedDate) {
                                        bloc.endDate = selectedDate;
                                        setState(() {});
                                        context.pop();
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              // divider and save button
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Divider(color: kBorder),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 12,
                    children: [
                      CustomButton(
                        color: kPrimary50,
                        width: 73,
                        text: 'Cancel',
                        textColor: kPrimary700,
                        onTap: () {
                          bloc.clear();
                          context.pop();
                        },
                      ),
                      CustomButton(
                        text: 'Save',
                        width: 73,
                        onTap: () => bloc.add(AddEmployee()),
                      ),
                      const Gap(12),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
