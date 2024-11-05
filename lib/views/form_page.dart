import 'package:flutter/material.dart';
import 'package:prova_flutter/models/diario_model.dart';
import 'package:prova_flutter/services/diario_services.dart';

class FormsDiario extends StatefulWidget {
  final Diario? diario;

  const FormsDiario({super.key, this.diario});

  @override
  State<FormsDiario> createState() => _FormsDiarioState();
}

class _FormsDiarioState extends State<FormsDiario> {
  final _formKey = GlobalKey<FormState>();
  final DiarioService _diarioService = DiarioService();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    if (widget.diario != null) {
      _titleController.text = widget.diario!.title;
      _descriptionController.text = widget.diario!.description;
      _selectedDate = widget.diario!.date;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.diario != null ? 'Editar Registro' : 'Novo Registro',
        style: TextStyle(color: Colors.white),),
        
        backgroundColor: Color.fromARGB(255, 69, 42, 16),
      ),
      backgroundColor: Color.fromARGB(199, 242, 214, 196),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Título não preenchido';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text('Título'),
                  labelStyle: TextStyle(color: Color.fromARGB(255, 69, 42, 16)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 69, 42, 16)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 69, 42, 16)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 69, 42, 16)),
                          ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _descriptionController,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, faça um registro antes.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text('O que gostaria de registrar hoje?'),
                  labelStyle: TextStyle(color: Color.fromARGB(255, 69, 42, 16)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 69, 42, 16)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 69, 42, 16)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 69, 42, 16)),
                          ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text("Data: ${_selectedDate.toLocal()}"),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null && picked != _selectedDate) {
                        setState(() {
                          _selectedDate = picked;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 69, 42, 16),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String title = _titleController.text;
                    String description = _descriptionController.text;

                    if (widget.diario != null) {
                      await _diarioService.editDiario(
                        widget.diario!.id!,
                        title,
                        description,
                        _selectedDate,
                      );
                    } else {
                      await _diarioService.saveDiario(
                        title,
                        description,
                        _selectedDate,
                      );
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  widget.diario != null ? 'Alterar' : 'Salvar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
