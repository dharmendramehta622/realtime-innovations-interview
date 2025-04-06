part of mainapp;

class SafeAreaContainer extends StatelessWidget {
  const SafeAreaContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimary800,
      child: SafeArea(child: child),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title = ''});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kPrimary700,
      title: mediumText(title, 18, kWhite),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bloc = context.read<EmployeeBloc>();

    return SafeAreaContainer(
      child: Scaffold(
        backgroundColor: kBackground,
        appBar: CustomAppBar(
          title: 'Employee List',
        ),
        floatingActionButton: GestureDetector(
          onTap: () => context.push(Routes.addEmployee),
          child: Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kPrimary700,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SVG.asset(Assets.icons.plus, height: 18, width: 18),
          ),
        ),
        body: BlocConsumer<EmployeeBloc, EmployeeState>(
          listener: (context, state) {
            switch (state.status) {
              case ListStatus.success:
                showSnackbar(
                  context,
                  widget: DeleteConfirmationDialog(
                    onTap: () {
                      bloc.add(UndoDeleteEmployee(state.deleteIndex));
                    },
                  ),
                );
                break;
              default:
                break;
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case ListStatus.initial:
                return const LoadingContainer();
              case ListStatus.loading:
                return const LoadingContainer();
              case ListStatus.loaded:
                if (state.data.isEmpty && state.removedUsers.isEmpty) {
                  return EmptyDataPage();
                }
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //current employees
                      Container(
                        width: size.width,
                        height: 56,
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                        decoration: BoxDecoration(color: kBackground),
                        child: mediumText('Current employees', 16, kPrimary700),
                      ),
                      Container(
                        width: size.width,
                        height: size.height * .5,
                        color: kWhite,
                        child: ListView.separated(
                          itemCount: state.data.length,
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              color: kBorder,
                              thickness: 0.5,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            User e = state.data.toList()[index] as User;
                            return UserContainer(e, index: index);
                          },
                        ),
                      ),
                      //previous employees
                      Container(
                        width: size.width,
                        height: 56,
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                        decoration: BoxDecoration(color: kBackground),
                        child:
                            mediumText('Previous employees', 16, kPrimary700),
                      ),
                      Container(
                        width: size.width,
                        height: size.height * .5,
                        color: kWhite,
                        child: ListView.separated(
                          itemCount: state.removedUsers.length,
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              color: kBorder,
                              thickness: 0.5,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            User e = state.removedUsers.toList()[index] as User;
                            return UserContainer(
                              e,
                              index: index,
                              enabled: false,
                            );
                          },
                        ),
                      ),
                      const Gap(12),
                      regularText('Swipe left to delete', 15, kTextSecondary),
                      const Gap(40),
                    ],
                  ),
                );
              default:
                throw UnimplementedError('Not a valid state');
            }
          },
        ),
      ),
    );
  }
}
