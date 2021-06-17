import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';

import '../../../services/auth_service.dart';
import '../../../services/settings_service.dart';

class AddressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: Row(
        children: [
          Icon(Icons.place_outlined),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "101 E Park Blvd Suite 600 Plano, Texas, USA" ?? "Loading...".tr, 
              style: Get.textTheme.bodyText1,
              )
            // child: Obx(() {
            //   return Text(Get.find<AuthService>().address.value?.address ?? "Loading...".tr, style: Get.textTheme.bodyText1);
            // }),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.gps_fixed),
            onPressed: () async {
            /* LocationResult result = await showLocationPicker(context, Get.find<SettingsService>().setting.value.googleMapsKey,
                  initialCenter: Get.find<AuthService>().address.value.getLatLng(),
                  automaticallyAnimateToCurrentLocation: false,
                  myLocationButtonEnabled: true,
                  layersButtonEnabled: true,
                  language: Get.locale.languageCode,
                  desiredAccuracy: LocationAccuracy.best,
                  appBarColor: Get.theme.primaryColor);
              print("result = $result");
              Get.find<AuthService>().address.update((val) {
                val.address = result.address;
                val.latitude = result.latLng.latitude;
                val.longitude = result.latLng.longitude;
              });*/

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PlacePicker(
                      apiKey: Get.find<SettingsService>().setting.value.googleMapsKey,
                      initialPosition: Get.find<AuthService>().address.value.getLatLng(),
                      useCurrentLocation: true,
                      selectInitialPosition: true,
                      usePlaceDetailSearch: true,
                      onPlacePicked: (result) {
                        Get.find<AuthService>().address.update((val) {
                          val.address = result.formattedAddress;
                          val.latitude = result.geometry.location.lat;
                          val.longitude = result.geometry.location.lng;
                        });
                        Get.back();
                      },
                      //forceSearchOnZoomChanged: true,
                      //automaticallyImplyAppBarLeading: false,
                      //autocompleteLanguage: "ko",
                      //region: 'au',
                      //selectInitialPosition: true,
                      // selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocused) {
                      //   print("state: $state, isSearchBarFocused: $isSearchBarFocused");
                      //   return isSearchBarFocused
                      //       ? Container()
                      //       : FloatingCard(
                      //           bottomPosition: 0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                      //           leftPosition: 0.0,
                      //           rightPosition: 0.0,
                      //           width: 500,
                      //           borderRadius: BorderRadius.circular(12.0),
                      //           child: state == SearchingState.Searching
                      //               ? Center(child: CircularProgressIndicator())
                      //               : RaisedButton(
                      //                   child: Text("Pick Here"),
                      //                   onPressed: () {
                      //                     // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
                      //                     //            this will override default 'Select here' Button.
                      //                     print("do something with [selectedPlace] data");
                      //                     Navigator.of(context).pop();
                      //                   },
                      //                 ),
                      //         );
                      // },
                      // pinBuilder: (context, state) {
                      //   if (state == PinState.Idle) {
                      //     return Icon(Icons.favorite_border);
                      //   } else {
                      //     return Icon(Icons.favorite);
                      //   }
                      // },
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
