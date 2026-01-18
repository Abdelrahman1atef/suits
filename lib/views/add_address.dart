import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_input_text.dart';
import '../core/widgets/app_bar.dart';
import '../core/widgets/app_button.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _addressController = TextEditingController();
  final _buildingNoController = TextEditingController();
  final _floorNoController = TextEditingController();
  final _apartmentNoController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _addressController.dispose();
    _buildingNoController.dispose();
    _floorNoController.dispose();
    _apartmentNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(haveTitle: true, haveSearchBar: false, title: "Add Address"),

      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 17),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              AppInputText(
                controller: _titleController,
                labelText: "Title",
                filled: false,
                borderWidth: 2,
                borderColor: const Color(0xFFB5B5B5),
                borderRadius: 10,
              ),
              const SizedBox(height: 32),
              AppInputText(
                controller: _addressController,
                labelText: "Address",
                filled: false,
                borderWidth: 2,
                borderColor: const Color(0xFFB5B5B5),
                borderRadius: 10,
              ),
              const SizedBox(height: 32),
              AppInputText(
                controller: _buildingNoController,
                labelText: "Building No",
                filled: false,
                borderWidth: 2,
                borderColor: const Color(0xFFB5B5B5),
                borderRadius: 10,
              ),
              const SizedBox(height: 32),
              AppInputText(
                controller: _floorNoController,
                labelText: "Floor No",
                filled: false,
                borderWidth: 2,
                borderColor: const Color(0xFFB5B5B5),
                borderRadius: 10,
              ),
              const SizedBox(height: 32),
              AppInputText(
                controller: _apartmentNoController,
                labelText: "Apartment No",
                filled: false,
                borderWidth: 2,
                borderColor: const Color(0xFFB5B5B5),
                borderRadius: 10,
              ),
              const SizedBox(height: 100),
              Row(
                children: [
                  Expanded(child: AppButton(onPressed: () => Navigator.pop(context), text: "Save", borderRadius: 18)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
