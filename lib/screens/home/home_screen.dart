import 'package:digikala/theme/app_colors.dart';
import 'package:digikala/theme/app_spacings.dart';
import 'package:digikala/utils/app_images.dart';
import 'package:digikala/widgets/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/mobile_model.dart';
import '../../widgets/app_spacer.dart';
import 'widgets/ads_widget.dart';
import 'widgets/banner_widget.dart';
import 'widgets/based_on_your_views_widget.dart';
import 'widgets/category_widget.dart';
import 'widgets/digi_apps_widget.dart';
import 'widgets/offers_widget.dart';
import 'widgets/products_widget.dart';
import 'widgets/slider_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          _isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacings.l,
            vertical: AppSpacings.m,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacings.m),
            color: AppColors.lightGrey100,
          ),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                color: AppColors.darkGrey200,
              ),
              const SizedBox(width: AppSpacings.l),
              Text(
                "جستجو در ",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                  color: AppColors.darkGrey100,
                ),
              ),
              const SizedBox(width: AppSpacings.s),
              SvgPicture.network(
                AppImages.logo,
                width: 60,
              ),
            ],
          ),
        ),
      ),
      body: _isLoading
          ? const AppLoading()
          : SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SliderWidget(),
                  const DigiAppsWidget(),
                  const OffersWidget(),
                  const AdsWidget(),
                  const CategoryWidget(),
                  const BannerWidget(image: "assets/images/single_banner.jpeg"),
                  BasedOnYourViewsWidget(
                    title: "گوشی موبایل",
                    items: MobileModel.items,
                  ),
                  const BannerWidget(
                      image: "assets/images/single_banner_2.jpeg"),
                  BasedOnYourViewsWidget(
                    title: "کیف و کاور گوشی",
                    items: MobileModel.covers,
                  ),
                  const AppSpacer(),
                  const ProductsWidget(),
                ],
              ),
            ),
    );
  }
}
