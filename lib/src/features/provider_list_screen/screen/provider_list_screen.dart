import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:quickservice/src/core/constant/color_constant.dart';
import 'package:quickservice/src/core/constant/loading_state.dart';
import 'package:quickservice/src/features/provider_list_screen/controller/service_provider_controller.dart';
import 'package:quickservice/src/features/provider_list_screen/widget/provider_card.dart';
import 'package:quickservice/src/features/provider_list_screen/widget/provider_skeleton.dart';
import 'package:quickservice/src/shared/widget/app_bar.dart';
import 'package:quickservice/src/shared/widget/space.dart';
import 'package:quickservice/src/shared/widget/text.dart';
import 'package:quickservice/src/shared/widget/textfield.dart';


class ProviderListScreen extends ConsumerStatefulWidget {
  const ProviderListScreen({super.key});

  @override
  ConsumerState<ProviderListScreen> createState() => _ProviderListScreenState();
}

class _ProviderListScreenState extends ConsumerState<ProviderListScreen> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final serviceController = ref.read(serviceProvider);
      serviceController.loadProviders();
    });
    searchController.addListener(_filterServices);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterServices);
    searchController.dispose();
    super.dispose();
  }

  void _filterServices() {
    final query = searchController.text;
    final serviceController = ref.read(serviceProvider);
    serviceController.filterProviders(query);
  }

  @override
  Widget build(BuildContext context) {
      final serviceController = ref.watch(serviceProvider);

    return Scaffold(
      appBar: appBar(title: 'Bookings'),
      body: Padding(
        padding: simPad(10, 20),
        child: Column(
          children: [
            vSpace(10),

            MMTextField(
              height: 70,
              controller: searchController,
              suffixIcon: Padding(
                padding: EdgeInsets.only(
                  right: 10
                ),
                child: Icon(
                  IconsaxPlusLinear.search_normal
                ),
              ),
            ),
           //  vSpace(30),
              Expanded(
                child: Visibility(
                   visible: !(serviceController.loadingState == LoadingState.loading),
                   replacement: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: simPad(20, 0),
                        child: ProviderSkeleton(),
                      );
                    },
                   ),
                  child: Visibility(
                    visible: serviceController.filteredProviders.isNotEmpty,
                    replacement: Center(
                      child: SmallAppText(
                        'No Service Providers found',
                        color: ColorConstant.lightestGrey,
                        fontSize: 17.sp,
                      )
                    ),
                     child: ListView.separated(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            itemCount: serviceController.filteredProviders.length,
                            separatorBuilder: (BuildContext context, int index) {
                              return vSpace(35);
                            },
                           itemBuilder: (BuildContext context, int index) {
                            if (index >= serviceController.filteredProviders.length) {
                              return const SizedBox.shrink();
                            }
                            final provider = serviceController.filteredProviders[index];
                            return ProviderCard(
                              provider: provider,
                            );
                           }
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

