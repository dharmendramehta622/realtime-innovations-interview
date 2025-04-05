part of common_widget;


class EmptyDataPage extends StatelessWidget {

  const EmptyDataPage({ super.key });

   @override
   Widget build(BuildContext context) {
       return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.images.empty),
              semiBoldText('No employee records found.', 18, kTextPrimary),
            ],
          ),
        );
  }
}