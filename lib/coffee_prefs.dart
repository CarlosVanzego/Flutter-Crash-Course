import 'package:coffee_card/styled_body_text.dart';
import 'package:coffee_card/styled_button.dart';
import 'package:flutter/material.dart';

class CoffeePrefs extends StatefulWidget {
  const CoffeePrefs({super.key});

  @override
  State<CoffeePrefs> createState() => _CoffeePrefsState();
}
// CoffeePrefs
class _CoffeePrefsState extends State<CoffeePrefs> {

int strength = 1; // Default strength
int sugars = 1; // Default sugars

  // Methods to increase strength and sugars
  void increaseStrength() {
    setState(() {
      strength = strength < 5 ? strength + 1 : 1;
    });
  }
  void increaseSugars() {
    setState(() {
      sugars = sugars < 5 ? sugars + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const StyledBodyText('Strength: '),

            // For loop to display coffee beans based on strength
            for (int i = 0; i < strength; i++)
              Image.asset('assets/img/coffee_bean.png', 
                width: 25,
                color: Colors.brown[100],
                colorBlendMode: BlendMode.multiply,
              ),

            const Expanded(child: SizedBox()),
            StyledButton(
              onPressed: increaseStrength,
              child: const Text('+'),
            ),
          ]
        ),
        Row(
           children: [
            const StyledBodyText('Sugars: '),
            
            if (sugars == 0)
              const StyledBodyText('No sugars.... '),
            
            for (int i = 0; i < sugars; i++)
              Image.asset('assets/img/sugar_cube.png', 
                width: 25,
                color: Colors.brown[100],
                colorBlendMode: BlendMode.multiply,
              ),

            const Expanded(child: SizedBox()),
            StyledButton(
              onPressed: increaseSugars,
              child: const Text('+'),
            ),
          ]
        ),
      ]
    );
  }
}