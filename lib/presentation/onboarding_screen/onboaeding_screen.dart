import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopapp22/presentation/resources/color_manager.dart';
import 'package:shopapp22/presentation/resources/fonts_manager.dart';
import 'package:shopapp22/presentation/resources/value_manager.dart';

import '../resources/assets_manager.dart';
import '../resources/string_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/style_manager.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final List<SliderObject> _list = _getSliderData();
  PageController pageController = PageController(initialPage: 0);
  int _currentIndex = 0;
  int _getPreviousIndex(){
    int previousIndex = _currentIndex--;
    if(previousIndex == -1){
      previousIndex = _list.length-1;
    }
    return previousIndex;
  }
  int _getNextIndex(){
    int nextIndex = _currentIndex++;
    if(nextIndex == 4){
      nextIndex = _list.length-4;
    }
    return nextIndex;
  }
  List<SliderObject> _getSliderData() {
    return [
      SliderObject(
          ImageAssets.onBoardingLogo1,
          AppString.onBoardingScreenHeadLine1,
          AppString.onBoardingScreenSubTitle1),
      SliderObject(
          ImageAssets.onBoardingLogo2,
          AppString.onBoardingScreenHeadLine2,
          AppString.onBoardingScreenSubTitle2),
      SliderObject(
          ImageAssets.onBoardingLogo3,
          AppString.onBoardingScreenHeadLine3,
          AppString.onBoardingScreenSubTitle3),
      SliderObject(
          ImageAssets.onBoardingLogo4,
          AppString.onBoardingScreenHeadLine4,
          AppString.onBoardingScreenSubTitle4),
    ];
  }
  Widget _getProperCircle(int index){
    if(index == _currentIndex){
      return SvgPicture.asset(ImageAssets.onBoardingCircleEmpty);
    }else{
      return SvgPicture.asset(ImageAssets.onBoardingCircleWhite);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s0,
        backgroundColor: ColorManager.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        itemBuilder: (context, index) {
          return OnBoardingPage(_list[index]);
        },
        controller: pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomSheet: Container(
        height: AppSize.s100,
        color: ColorManager.white,
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  AppString.skip,
                  textAlign: TextAlign.end,
                  style: getBoldStyle(
                      color: ColorManager.primary, fontSize: FontSize.s15),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: ColorManager.primary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p14),
                      child: GestureDetector(onTap: (){
                        pageController.animateToPage(_getPreviousIndex(), duration:const Duration(milliseconds:DurationConstants.d300) , curve: Curves.bounceInOut);
                      },child: SizedBox(height: AppSize.s20 ,width: AppSize.s20,child: SvgPicture.asset(ImageAssets.onBoardingArrowLeft))),
                    ),
                  Row(
                    children: [
                      for(int i =0 ; i<_list.length;i++)
                        Padding(padding: const EdgeInsets.all(AppPadding.p8)
                            ,child: _getProperCircle(i),
                        ),

                    ],
                  ),
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p14),
                      child: GestureDetector(onTap: (){
                        pageController.animateToPage(_getNextIndex(), duration:const Duration(milliseconds:DurationConstants.d300) , curve: Curves.bounceInOut);

                      },child:SizedBox(height: AppSize.s20,width: AppSize.s20,child: SvgPicture.asset(ImageAssets.onBoardingArrowRight)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSize.s8,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        SizedBox(
          height: AppSize.s8,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;
  SliderObject(this.image, this.subTitle, this.title);
}
