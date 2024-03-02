import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ContactForm extends StatelessWidget {
  final FormGroup form = FormGroup({
    'email': FormControl<String>(validators: [
      Validators.email,
      Validators.required,
    ]),
    'phoneNumber': FormControl<String>(validators: [
      Validators.pattern(RegExp(r'^\+\d{1,3}\d{10}$')),
    ]),
    'name': FormControl<String>(validators: [
      Validators.required,
    ]),
    'issue': FormControl<String>(validators: [
      Validators.required,
    ]),
  });

  ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: 8,
      gradient:
          const LinearGradient(colors: [Color(0xff8E2DE2), Color(0xff4A00E0)]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ReactiveForm(
          formGroup: form,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _buildReactiveTextField(
                  label: 'Email Address',
                  hint: 'john.doe@xyz.com',
                  formControlName: 'email',
                  validationMessages: {
                    'email': (error) => 'Please enter a valid email address',
                    'required': (error) => 'Email can not be empty',
                  },
                ),
                _buildReactiveTextField(
                  label: 'Full Name',
                  hint: 'John Doe',
                  formControlName: 'name',
                  validationMessages: {
                    'required': (error) => 'Name can not be empty',
                  },
                ),
                // _buildReactiveTextField(
                //   label: 'Phone Number',
                //   hint: '+919876543210',
                //   formControlName: 'phoneNumber',
                //   validationMessages: {
                //     'pattern': (error) => 'Please enter a valid phone number',
                //   },
                // ),
                _buildReactiveTextField(
                  label: 'Description',
                  formControlName: 'issue',
                  validationMessages: {
                    'required': (error) => 'Description can not be empty',
                  },
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReactiveTextField({
    required String label,
    String? hint,
    required String formControlName,
    required Map<String, String Function(Object)> validationMessages,
    int? maxLines,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ReactiveTextField(
        formControlName: formControlName,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: const TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        maxLines: maxLines ?? 1,
        expands: false,
        style: const TextStyle(color: Colors.white),
        validationMessages: validationMessages,
      ),
    );
  }
}
