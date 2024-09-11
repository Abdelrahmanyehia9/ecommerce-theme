import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/dimentions.dart';

class CustomAccordion extends StatelessWidget {
  const CustomAccordion({super.key });

  @override
  Widget build(BuildContext context) {
    return  Accordion(

        headerBackgroundColor: Colors.transparent,
        headerBorderWidth: 2,

        rightIcon: const Icon(Icons.arrow_forward_ios_rounded , size: 18,),
        headerBorderColorOpened: Colors.transparent,
        contentBorderWidth: 0,
        scaleWhenAnimating: false,

        openAndCloseAnimation: true,
        contentBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        scrollIntoViewOfItems: ScrollIntoViewOfItems.fast,
        disableScrolling: true,

        headerPadding:
        const EdgeInsets.symmetric(vertical: 7, horizontal: 0),
        sectionOpeningHapticFeedback: SectionHapticFeedback.vibrate,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: [
          AccordionSection(
            isOpen: true,
            contentVerticalPadding: 8,
            header:  const Text("Description", style: TextStyle(fontSize: 18 ,),),
            content: const Text("loremIpsum gfg fgdfjg gdfhgdf gdfjgdf gdfhgdf gfdjhgdf gdfghjg dfghdfjgbdf gfdhgjdfg", style: TextStyle(color: Colors.grey),),
          ),

          AccordionSection(

            isOpen: true,
            contentVerticalPadding: 8,
            header:  const Text("Additional Info", style: TextStyle(fontSize: 18 ,),),
            content: const Text("loremIpsum gfg fgdfjg gdfhgdf gdfjgdf gdfhgdf gfdjhgdf gdfghjg dfghdfjgbdf gfdhgjdfg", style: TextStyle(color: Colors.grey),),
          ),
          AccordionSection(


            isOpen: false,
            contentVerticalPadding: 8,
            header:  const Row(
              children: [
                Text("Reviews ", style: TextStyle(fontSize: 18 ,),),
                Text(" (0)", style: TextStyle(fontSize: 16 , color: Colors.grey),),

              ],
            ),
            content: const Text("loremIpsum gfg fgdfjg gdfhgdf gdfjgdf gdfhgdf gfdjhgdf gdfghjg dfghdfjgbdf gfdhgjdfg", style: TextStyle(color: Colors.grey),),
          ),



        ]);

  }
}


