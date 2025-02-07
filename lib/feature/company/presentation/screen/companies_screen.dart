import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_exam/feature/company/presentation/bloc/companies_cubit.dart';
import 'package:flutter_exam/presentation/component/custom_button.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../domain/model/company.dart';

class CompaniesScreen extends StatelessWidget {
  const CompaniesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompaniesCubit>(
      create: (_) => CompaniesCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Others'),
          foregroundColor: Colors.white,
          backgroundColor: Colors.amber,
        ),
        body: const _CompaniesCarouselView(),
      ),
    );
  }
}

class _CompaniesCarouselView extends StatelessWidget {
  const _CompaniesCarouselView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocSelector<CompaniesCubit, CompaniesState, List<Company>>(
          selector: (state) => state.items,
          builder: (context, items) {
            return FlutterCarousel(
              items: items.map((company) => Image.asset(company.logo)).toList(),
              options: FlutterCarouselOptions(
                autoPlay: true,
                showIndicator: false,
                onPageChanged: (page, __) {
                  context.read<CompaniesCubit>().pageChanged(page);
                },
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: BlocSelector<CompaniesCubit, CompaniesState, Company>(
            selector: (state) => state.currentCompany,
            builder: (context, currentCompany) {
              return CustomButton(
                label: 'Visit ${currentCompany.name} Website',
                foregroundColor: Colors.white,
                backgroundColor: Colors.amber,
                onTap: () async {
                  await launchUrl(Uri.parse(currentCompany.website));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
