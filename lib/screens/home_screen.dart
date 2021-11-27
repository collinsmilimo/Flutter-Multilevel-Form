import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentStep = 0;
  StepperType type = StepperType.vertical;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // ignore: prefer_const_constructors
        title: const Text("Sign Up"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              type: type,
              physics: const ScrollPhysics(),
              currentStep: _currentStep,
              onStepCancel: onStepCancel,
              onStepContinue: onStepContinue,
              onStepTapped: onStepTapped,
              steps: [
                Step(
                  title: const Text("Account"), 
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Full Names"),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Email Address"),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Password"),
                      )
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep == 0 ? StepState.indexed : StepState.complete,
                  ),

                Step(
                  title: const Text("Address"), 
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Street Address"),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Zip Code"),
                      )
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep > 1 ? StepState.complete : StepState.indexed,
                  ),

                Step(
                  title: const Text("Additional"), 
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Phone Number"),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Gender"),
                      )
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep > 2 ? StepState.complete : StepState.indexed,
                  ),

              ],
            )
            )
        ],
      ),
      //body
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.list),
        onPressed: onFabPressed,
      ),
    );
  }

  onStepTapped(int index){
    setState(() {
      _currentStep = index;
    });
  }

  onStepContinue(){
    _currentStep < 2 ?
    setState(() {
      _currentStep += 1;
    }) : null;
  }

  onStepCancel(){
    _currentStep > 0 ?
    setState(() {
      _currentStep -= 1;
    }) : _currentStep = 0;
  }

  onFabPressed(){
    setState(() {
      type == StepperType.vertical ? type = StepperType.horizontal : type = StepperType.vertical;
    });
  }
}