import 'package:doctor_app/module/appointment/calendar_screen.dart';
import 'package:flutter/material.dart';


class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final List<String> _surgeryTypes = [    'Type 1',    'Type 2',    'Type 3',    'Type 4',  ];

  String? _selectedSurgeryType;
  String? _selectedOption ;
  final TextEditingController _numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff30384c),
        title: Text("Appointment"),
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select surgery type:'),
              SizedBox(height: 10,),
              DropdownButtonFormField<String>(
                value: _selectedSurgeryType,
                items: _surgeryTypes.map((option) {
                  return DropdownMenuItem<String>(
                    value: option , // append unique identifier
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedSurgeryType = newValue;
                  });
                },
                decoration: InputDecoration(

                  suffixIcon: Icon(Icons.type_specimen_outlined,color: Color(0xff30384c),),
                  hintText: 'Please select an option',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Color(0xff30384c)),
                  ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff30384c))
                    )
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an option';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16.0),
              if (_selectedSurgeryType != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Select an option:'),
                    RadioListTile<String>(
                      title: Text('Option 1'),
                      value: 'Option 1',
                      groupValue: _selectedOption,
                      onChanged: ( newValue) {
                        setState(() {
                          _selectedOption = newValue!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: Text('Option 2'),
                      value: 'Option 2',
                      groupValue: _selectedOption,
                      onChanged: ( newValue) {
                        setState(() {
                          _selectedOption = newValue!;
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _numberController,

                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.timelapse,color: Color(0xff30384c),),
                        hintText: 'Enter a number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Color(0xff30384c)),
                          ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff30384c))
                        )
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a number';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'uniqueTag1',
        onPressed: () {
          if (_formKey.currentState!.validate()) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => CalendarScreen()
          )).then((value){
            setState(() {
              _selectedSurgeryType = null;
              _selectedOption = '';
              _numberController.clear();
              Focus.of(context).unfocus();

            });
          });
          }
        },
        child: Icon(Icons.save),
        backgroundColor: Colors.blueGrey[800],
      ),
    );
  }
}
