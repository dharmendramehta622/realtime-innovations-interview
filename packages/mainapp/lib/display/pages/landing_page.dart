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
                  return ListView.separated(
                    itemCount: state.data.length,
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8), 
                    separatorBuilder: (BuildContext context, int index) {
                      return const Gap(12);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      User e = state.data.toList()[index] as User;
                      return UserContainer(e);
                    },
                  ); 
                default:
                  throw UnimplementedError('Not a valid state');
              }
            },
          ),),
    );
  }
}

