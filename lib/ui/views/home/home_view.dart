import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter/ui/views/home/home_view_model.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_starter/ui/views/home/home_controls.dart';
import 'package:dropdown_search/dropdown_search.dart';


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
            child: Center(
              child: Container(
                child: Column(
                  children: [
                     SizedBox(
                      height: 15.h,
                    ),
                    //Name
                    ReactiveTextField(
                      formControlName: HomeFormControls.name,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        hintText: 'Name_1',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ReactiveTextField(
                      formControlName: HomeFormControls.name,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        hintText: 'Name_2',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    
                    const SizedBox(
                      height: 20,
                    ),
                    //Date of Birth
                    ReactiveTextField(
                        formControlName: HomeFormControls.dateOfBirth,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                            hintText: "Date"),
                        onTap: (value) {
                          viewModel.selectDate(context);
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                      const SizedBox(
                      height: 20,
                    ),
                    //Gender
                    DropdownButtonFormField<String>(
                      // formControlName: HomeFormControls.gender,
                     
                      hint: const Text('Gender'),
                      items: viewModel.dropdownItems
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                    
                  ),
                  )
              .toList(),
                      onChanged: (_) {
                        // viewModel.changeCallType();
                      },
                    ),
                  ],
                ),
              ),
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
