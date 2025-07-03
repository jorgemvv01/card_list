import 'package:card_list/core/utils/button/custom_elevetad_button.dart';
import 'package:card_list/domain/custom_card/model/custom_card.dart';
import 'package:card_list/presentation/home/cubit/card_cubit.dart';
import 'package:card_list/core/utils/text_style/custom_text_style.dart';
import 'package:card_list/core/utils/textfield/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FormScreen extends StatefulWidget {
  final int? editCardId;

  const FormScreen({
    super.key,
    this.editCardId,
  });

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  CustomCard? editCard;

  @override
  void initState() {
    super.initState();

    final cubit = context.read<CardCubit>();

    if (widget.editCardId != null) {
      editCard = cubit.getCardById(widget.editCardId!);
    }

    _titleController = TextEditingController(text: editCard?.title ?? "");
    _descriptionController = TextEditingController(text: editCard?.description ?? "");
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CardCubit>();

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            editCard != null ? "Edit card" : "Add card",
            style: CustomTextStyles.titleH1(isBold: true),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(22),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Complete the form below',
                    style: CustomTextStyles.titleH2(isBold: true),
                  ),
                  Text(
                    "Please fill in the required fields marked with *",
                    style: CustomTextStyles.paragraph()
                  ),
                  const SizedBox(height: 22),
                  Text("Title*:", style: CustomTextStyles.titleH3(isBold: true)),
                  CustomTextFormField(
                    controller: _titleController,
                    labelText: "",
                    validator: (v) => v!.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 16),
                  Text( "Description*:", style: CustomTextStyles.titleH3(isBold: true)),
                  CustomTextFormField(
                    maxLines: 10,
                    controller: _descriptionController,
                    labelText: "",
                    validator: (v) => v!.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: CustomElevetadButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (editCard != null) {
                              cubit.updateCard(
                                editCard!.copyWith(
                                  title: _titleController.text,
                                  description: _descriptionController.text,
                                ),
                              );
                            } else {
                              final newCard = CustomCard(
                                id: DateTime.now().millisecondsSinceEpoch,
                                title: _titleController.text,
                                description: _descriptionController.text,
                                createdAt: DateTime.now(),
                              );
                              cubit.addCard(newCard);
                            }
                            context.pop();
                          }
                        },
                        label: "Save",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
