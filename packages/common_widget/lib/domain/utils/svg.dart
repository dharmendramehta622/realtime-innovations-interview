part of common_widget;

class SVG extends StatelessWidget {
  final String svgType;
  final String src;
  final double width;
  final double height;
  final Color color;

  const SVG.asset(
    this.src, {
    super.key,
    this.width=18,
    this.height=18,
    this.color=kWhite,
    this.svgType = 'ASSET',
  });

  const SVG.network(
    this.src, {
    super.key,
    this.width=18,
    this.height=18,
    this.color = kWhite,
    this.svgType = 'NETWORK',
  });

  @override
  Widget build(BuildContext context) { 
    switch (svgType) {
      case 'ASSET':
        return buildAsset(context, color);
      case 'NETWORK':
        return buildNetwork(context, color);
      default:
        throw 'Type not provided';
    }
  }

  Widget buildAsset(
    BuildContext context,
    Color color,
  ) {
    return SvgPicture.asset(
      src,
      width: width ,
      height: height ,
    );
  }

  Widget buildNetwork(BuildContext context, Color color) {
    return SvgPicture.network(
      src,
      width: width  ,
      height: height  ,
    );
  }
}
