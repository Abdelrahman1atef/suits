import 'package:flutter/material.dart';
import 'package:suits/core/widgets/app_button.dart';
import 'package:suits/core/widgets/app_text.dart';
import 'package:suits/views/add_card/widget/credit_card_widget.dart';

import '../../core/widgets/app_bar.dart';
import '../../core/widgets/app_input_text.dart';
import '../payment.dart';

class AddCardView extends StatefulWidget {
  const AddCardView({super.key});

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  final _formKey = GlobalKey<FormState>();
  final _nameOnCardController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expController = TextEditingController();
  final _cvvController = TextEditingController();
  bool showBackView = false;

  @override
  void initState() {
    super.initState();
    _cvvController.addListener(() {
      if (_cvvController.text.isEmpty) {
        setState(() {
          showBackView = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _nameOnCardController.dispose();
    _cardNumberController.dispose();
    _expController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Scaffold(
      appBar: const CustomAppBar(haveTitle: true, haveSearchBar: false, title: "Add Card"),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: color.secondary,
          border: const Border(top: BorderSide(color: Color(0xFFB1B1B1))),
        ),
        padding: const EdgeInsetsDirectional.only(start: 24, end: 24, top: 12, bottom: 24),
        child: AppButton(
          onPressed: () => _saveCard(),
          text: "Add Card",
          borderRadius: 18,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            CustomCreditCardWidget(
              nameOnCardController: _nameOnCardController,
              cardNumberController: _cardNumberController,
              expController: _expController,

              cvvController: _cvvController,
              showBackView: showBackView,
            ),
            const SizedBox(height: 30),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField(
                    controller: _nameOnCardController,
                    title: "Card Holder Name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Name On Card';
                      }
                      return null;
                    },
                    onChanged: () => setState(() {}),
                    onTap: () => setState(() {
                      showBackView ? showBackView = !showBackView : null;
                    }),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    controller: _cardNumberController,
                    title: "Card Number",
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Card Number';
                      }
                      if (value.length < 16) {
                        return 'Card number must be 16 digits';
                      }
                      return null;
                    },
                    onChanged: () => setState(() {}),
                    onTap: () => setState(() {
                      showBackView ? showBackView = !showBackView : null;
                    }),
                    isCardNumber: true,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildTextField(
                          controller: _expController,
                          title: "Expiry Data",
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Exp Month';
                            }
                            return null;
                          },
                          onChanged: () => setState(() {}),
                          onTap: () => setState(() {
                            showBackView ? showBackView = !showBackView : null;
                          }),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: _buildTextField(
                          controller: _cvvController,
                          title: "CVV",
                          onChanged: () => setState(() {}),
                          // Update preview
                          onTap: () => setState(() {
                            showBackView = !showBackView;
                          }),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter CVV';
                            }
                            if (value.length < 3) {
                              return 'CVV must be 3 digits';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 17),
                  Row(
                    children: [
                      const _CheckBox(),
                      AppText("Save Card", style: textTheme.titleSmall),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String title,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    VoidCallback? onChanged,
    VoidCallback? onTap,
    bool? isCardNumber,
  }) {
    return AppInputText(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged != null ? (_) => onChanged() : null,
      onTap: onTap,
      textStyle: const TextStyle(color: Color(0xFF858585), fontVariations: [FontVariation("wght", 400)]),
      haveTitle: true,
      filled: false,
      title: title,
      borderWidth: 2,
      borderColor: const Color(0xFFAFAFAF),
      borderRadius: 10,
      validator: validator,
    );
  }

  void _saveCard() {
    if (_formKey.currentState!.validate()) {
      // final paymentModel = PaymentModel(
      //   nameOnCart: _nameOnCardController.text,
      //   cardNumber: _cardNumberController.text,
      //   expMonth: _expMonthController.text,
      //   expDate: _expDateController.text,
      //   cvv: _cvvController.text,
      // );

      // OrderModel.order = OrderModel(
      //   address: OrderModel.order?.address,
      //   payment: paymentModel,
      //   products: OrderModel.order?.products,
      //   total: OrderModel.order?.total,
      // );

      // Navigate back
      Navigator.push(context,MaterialPageRoute<void>(builder: (context) => const PaymentView(),));
    }
  }
}
class _CheckBox extends StatefulWidget {
  const _CheckBox();

  @override
  State<_CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<_CheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
      shape: const CircleBorder(),
      activeColor: theme.primaryColor,
    );
  }
}

