part of common_widget;



class LoadingContainer extends StatelessWidget {

  const LoadingContainer({ super.key });

   @override
   Widget build(BuildContext context) {
       return Center(child: CircularProgressIndicator(color: kPrimary700,),);
  }
}