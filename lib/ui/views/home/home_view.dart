import 'package:flutter/material.dart';
import 'package:flutter_starter/ui/views/home/home_view_model.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_starter/ui/views/home/home_controls.dart';


class HomeView extends ViewModelBuilderWidget<HomeViewModel>{
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter starter'),
        actions: [
          IconButton(onPressed: (){
            viewModel.goForm();
          }, icon: const Icon(Icons.assignment_outlined)),
        ],
      ),
      body:  SingleChildScrollView(
        child: ReactiveForm(
            formGroup: viewModel.formGroup,
            child: Row(
              children: [
                const SizedBox(
                  height: 15,
                ),
                //Name
                ReactiveTextField(
                  formControlName: HomeFormControls.name,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Date of Birth
                ReactiveTextField(
                    formControlName: HomeFormControls.dateOfBirth,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                        hintText: "Date Of Birth"),
                    onTap: (value) {
                      viewModel.selectDate(context);
                    }),
                const SizedBox(
                  height: 20,
                ),
                //Gender
                ReactiveDropdownField<String>(
                  formControlName: HomeFormControls.gender,
                  hint: const Text('Select Gender'),
                  items: const [
                    DropdownMenuItem(
                      value: "male",
                      child: Text('male'),
                    ),
                    DropdownMenuItem(
                      value: "female",
                      child: Text('female'),
                    ),
                  ],
                  onChanged: (_) {
                    // viewModel.changeCallType();
                  },
                ),
              ],
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => viewModel.init();
}
