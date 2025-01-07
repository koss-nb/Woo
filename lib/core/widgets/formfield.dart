import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';

class FormFieldWidget extends StatefulWidget {
  final String ?labelContent;
  final int ?maxLengtText;
  final Widget ?prefixIconWidget; // Icône pour le début du champ
  final Widget? suffixIconVisible; // Icône pour afficher le texte (facultatif)
  final Widget? suffixIconHidden; // Icône pour masquer le texte (facultatif)
  final void Function()? onTap;
  final bool isPasswordField; // Indique si le champ est un mot de passe

  const FormFieldWidget({
    super.key,
    this.labelContent,
    this.maxLengtText,
    this.prefixIconWidget,
    this.suffixIconVisible,
    this.suffixIconHidden,
    this.onTap,
    this.isPasswordField = false, // Par défaut, ce n'est pas un champ de mot de passe
  });

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  bool _isPasswordVisible = false; // Contrôler la visibilité du mot de passe

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      maxLength: widget.maxLengtText,
      obscureText: widget.isPasswordField ? !_isPasswordVisible : false, // Masquer uniquement si c'est un champ de mot de passe
      style: const TextStyle(
        color: Colors.white, // Appliquez la couleur blanche au texte saisi
      ),
      decoration: InputDecoration(
        prefixIcon: widget.prefixIconWidget,
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: _isPasswordVisible
                    ? widget.suffixIconVisible ?? const SizedBox()
                    : widget.suffixIconHidden ?? const SizedBox(),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible; // Alterner entre les icônes et visibilité du mot de passe
                  });
                },
              )
            : IconButton(
                icon: _isPasswordVisible
                    ? widget.suffixIconVisible ?? const SizedBox()
                    : widget.suffixIconHidden ?? const SizedBox(),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible; // Alterner entre les icônes sans affecter la saisie
                  });
                },
              ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: AppColors.primary, // Changez la couleur du bord quand le champ est sélectionné
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: Colors.white30, // Changez la couleur du bord lorsque le champ est désactivé
            width: 2.0,
          ),
        ),
        fillColor: Colors.white30, // Changez la couleur de fond ici
        filled: true, // Applique la couleur de fond
        labelText: widget.labelContent,
        labelStyle: const TextStyle(
          color: Colors.white, // Couleur du texte du label
        ),
      ),
    );
  }
}
