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

    return SafeAreaContainer(
      child: Scaffold(
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
        body: BlocBuilder<EmployeeBloc, EmployeeState>(
          builder: (context, state) {
            switch (state.status) {
              case ListStatus.initial:
                return const LoadingContainer();
              case ListStatus.loading:
                return const LoadingContainer();
              case ListStatus.loaded:
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
                      SizedBox(
                        width: size.width,
                        height: size.height * .5,
                        child: ListView.separated(
                          itemCount: state.data.length,
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
                      SizedBox(
                        width: size.width,
                        height: size.height * .5,
                        child: ListView.separated(
                          itemCount: state.removedUsers.length,
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
