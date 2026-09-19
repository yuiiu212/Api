import 'package:docdoc_app/core/Share/CustomeNavigationBar.dart';
import 'package:docdoc_app/core/Utilis/units.dart';
import 'package:docdoc_app/core/style/ColorManager.dart';
import 'package:docdoc_app/feature/Home/Presentation/manager/home_cubit.dart';
import 'package:docdoc_app/feature/Home/Presentation/manager/home_state.dart';
import 'package:docdoc_app/feature/Home/Presentation/view/archetures/DoctorSpecialities.dart';
import 'package:docdoc_app/feature/Home/Presentation/view/archetures/Home_header.dart';
import 'package:docdoc_app/feature/Home/Presentation/view/archetures/Promo%20Banner.dart';
import 'package:docdoc_app/feature/Home/Presentation/view/archetures/Section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomePageState();
}

class _HomePageState extends State<HomeView> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.WhiteBackground,
      body: SafeArea(
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is SuccessHomeState) {
              print('Home GET Success');
              print(state.data);
            }

            if (state is FailureHomeState) {
              print('Home GET Error');
              print(state.errorMessage);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Units.getHorizontal(
                    context: context,
                    value: 20,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Units.getHeight(
                        context: context,
                        value: 20,
                      ),
                    ),
                    const HomeHeader(
                      name: 'Omar',
                    ),
                    SizedBox(
                      height: Units.getHeight(
                        context: context,
                        value: 30,
                      ),
                    ),
                    const PromoBanner(),
                    SizedBox(
                      height: Units.getHeight(
                        context: context,
                        value: 30,
                      ),
                    ),
                    const SectionHeader(
                      title: 'Doctor Speciality',
                      actionText: 'See All',
                    ),
                    SizedBox(
                      height: Units.getHeight(
                        context: context,
                        value: 16,
                      ),
                    ),
                    const DoctorSpecialitiesList(),
                    SizedBox(
                      height: Units.getVertical(
                        context: context,
                        value: 30,
                      ),
                    ),
                    const SectionHeader(
                      title: 'Recommendation Doctor',
                      actionText: 'See All',
                    ),
                    SizedBox(
                      height: Units.getHeight(
                        context: context,
                        value: 16,
                      ),
                    ),
                    SizedBox(
                      height: Units.getHeight(
                        context: context,
                        value: 100,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorManager.PrimaryColor100,
        elevation: 2,
        child: Icon(
          Icons.search,
          color: ColorManager.WhiteBackground,
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}