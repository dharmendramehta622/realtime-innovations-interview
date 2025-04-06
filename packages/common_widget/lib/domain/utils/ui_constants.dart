part of common_widget;


//primary colors
const Color kPrimary25 = Color(0xffF5F8FF);
const Color kPrimary50 = Color(0xffEDF8FF);
const Color kPrimary100 = Color(0xffEFB0B0);
const Color kPrimary200 = Color(0xffE88A8A);
const Color kPrimary300 = Color(0xffDD5554);
const Color kPrimary400 = Color(0xffD63433);
const Color kPrimary500 = Color(0xffCC0100);
const Color kPrimary600 = Color(0xffBA0100);
const Color kPrimary700 = Color(0xff1DA1F2);
const Color kPrimary800 = Color(0xff0E8AD7);
const Color kPrimary900 = Color(0xff560000);

//General Colors
const Color kWhite = Color(0xFFFFFFFF);
const Color kBlack = Color(0xFF141414);

const Color kBorder = Color(0xFFE5E5E5);
const Color kBackground = Color(0xFFF2F2F2);

//Text Colors
const Color kTextPrimary = Color(0xFF141414);
const Color kTextSecondary = Color(0xff949C9E);

Widget boldText(String txt, double fontSize, Color color) => Text(
      txt,
      style: GoogleFonts.roboto(
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.bold,
          textStyle: TextStyle(overflow: TextOverflow.ellipsis)),
    );

 
Widget boldBlackText(String txt, double fontSize, Color color) => Text(
      txt,
      style: GoogleFonts.roboto(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w900,
      ),
    );
 

Widget semiBoldText(String txt, double fontSize, Color? color,
        {int maxLines = 1,
        TextDecoration decoration = TextDecoration.none,
        TextAlign textAlign = TextAlign.start}) =>
    Text(
      txt,
      maxLines: maxLines,
      textAlign: textAlign,
      style: GoogleFonts.roboto(
        fontSize: fontSize,
        color: color ?? kBlack,
        fontWeight: FontWeight.w600,
        decoration: decoration,
        decorationColor: color,
      ),
    );

 

Widget mediumText(String txt, double fontSize, Color? color,
        {int maxLines = 1, TextAlign textAlign = TextAlign.justify}) =>
    Text(
      txt,
      // maxLines: maxLines,
      style: GoogleFonts.roboto(
        fontSize: fontSize,
        color: color ?? kBlack,
        fontWeight: FontWeight.w500,
      ),
      textAlign: textAlign,
    );

 

Widget regularText(String txt, double fontSize, Color? color,
        {int maxLines = 1,
        TextDecoration decoration = TextDecoration.none,
        TextAlign? textAlign}) =>
    Text(
      txt,
      maxLines: 2,
      textAlign: textAlign,
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: fontSize,
          color: color ?? kBlack,
          fontWeight: FontWeight.w400,
          decoration: decoration,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
