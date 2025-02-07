part of 'companies_cubit.dart';

class CompaniesState extends Equatable {
  const CompaniesState({this.page = 0});

  final int page;

  CompaniesState copyWith({int? page}) {
    return CompaniesState(
      page: page ?? this.page,
    );
  }

  Company get currentCompany {
    if (items.isEmpty || page < 0 || page > items.length) return Company.empty;

    return items[page];
  }

  List<Company> get items => [
        const Company(
          logo: AppAsset.samsung,
          name: 'Samsung',
          website: 'https://www.samsung.com',
        ),
        const Company(
          logo: AppAsset.apple,
          name: 'Apple',
          website: 'https://www.apple.com',
        ),
        const Company(
          logo: AppAsset.windows,
          name: 'Windows',
          website: 'https://microsoft.com',
        ),
      ];

  @override
  List<Object?> get props => [];
}
