part of common_widget;


class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.validator,
      this.onSaved,
      this.onChanged,
      this.icon,
      this.fieldName = '',
      required this.hintText,
      this.isPhoneField = false,
      this.autoFocus = false,
      this.enabled,
      this.scrollPadding,
      this.padding,
      this.isPasswordField = false,
      this.maxLines = 1,
      this.maxLength = 50000,
      this.prefixIcon,
      this.fillColor=kWhite,
      this.textInputAction = TextInputAction.done,
      this.prefixIconColor = kWhite,
      this.onEditingComplete});

  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final Function()? onEditingComplete;
  final bool autoFocus;
  final TextEditingController? controller;
  final bool? enabled;
  final String fieldName;
  final String hintText;
  final String? icon;
  final bool isPasswordField;
  final bool isPhoneField;
  final int maxLength;
  final int maxLines;
  final EdgeInsetsGeometry? padding;
  final String? prefixIcon;
  final Color prefixIconColor;
  final Color fillColor;
  final EdgeInsets? scrollPadding;
  final TextInputAction textInputAction;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          semiBoldText(widget.fieldName, 14, kTextPrimary),
          const Gap(6),
          Container(
            padding: const EdgeInsets.only(right: 16, left: 12),
            decoration: BoxDecoration(
              color: widget.fillColor,
              border: Border.all(color: kBorder),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              textAlign: TextAlign.start,
              autofocus: widget.autoFocus,
              maxLines: widget.maxLines,
              obscureText: widget.isPasswordField ? obsecureText : false,
              // maxLength: widget.maxLength,
              // textInputAction: widget.textInputAction,
              enabled: widget.enabled ?? true,
              // onEditingComplete: widget.onEditingComplete,
              keyboardType: widget.isPhoneField
                  ? TextInputType.phone
                  : TextInputType.text,
              controller: widget.controller,
              onChanged: (value) => widget.onChanged!(value),
              scrollPadding:
                  widget.scrollPadding ?? const EdgeInsets.only(bottom: 200),
              decoration: InputDecoration(
                hintText: widget.hintText,
                prefixIcon:widget.prefixIcon != null ? Padding(
                  padding: const EdgeInsets.fromLTRB(0,8,0,8),
                  child: SVG.asset(widget.prefixIcon!,height: 14,width: 14),
                ):null,
                prefixIconColor: widget.prefixIconColor,
                counterText: '', 
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                border: InputBorder.none,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: kTextSecondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
