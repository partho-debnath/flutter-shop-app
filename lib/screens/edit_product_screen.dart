import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const String routeName = '/edit-product-screen';
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final TextEditingController imageURLController = TextEditingController();
  final FocusNode imageURLFocusNode = FocusNode();
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  void initState() {
    imageURLFocusNode.addListener(previewImage);
    super.initState();
  }

  @override
  void dispose() {
    imageURLController.dispose();
    imageURLFocusNode.removeListener(previewImage);
    imageURLFocusNode.dispose();
    super.dispose();
  }

  void previewImage() {
    if (!imageURLFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    if (_form.currentState!.validate() == false) {
      return;
    }
    _form.currentState!.save();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Item is added.'),
        duration: Duration(seconds: 2),
      ),
    );
    _form.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        actions: [
          IconButton(
            onPressed: () {
              _saveForm();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Form(
        key: _form,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty == true) {
                    return 'Please enter the title';
                  } else if (value.length <= 5) {
                    return 'The length of title must be 5 characters or more. But you entered ${value.length} characters.';
                  } else if (value.length > 15) {
                    return 'The length of title must be 15 characters or fewer. But uou entered ${value.length} characters.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Price',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.isEmpty == true) {
                    return 'Please enter the price';
                  } else if (double.tryParse(value) == null) {
                    return 'Please enter valid number';
                  } else if (double.parse(value) <= 0) {
                    return 'Price should be greater than zero';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value == null || value.isEmpty == true) {
                    return 'Please enter the description';
                  } else if (value.length <= 10) {
                    return 'The length of description must be 10 characters or more. But you entered ${value.length} characters.';
                  } else if (value.length > 30) {
                    return 'The length of description must be 30 characters or fewer. But uou entered ${value.length} characters.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    margin: const EdgeInsets.only(right: 5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: imageURLController.text.isEmpty == true
                        ? const Text(
                            'Enter Image URL',
                            textAlign: TextAlign.center,
                          )
                        : FittedBox(
                            child: Image.network(
                              imageURLController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Image URL',
                      ),
                      controller: imageURLController,
                      focusNode: imageURLFocusNode,
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.isEmpty == true) {
                          return 'Please enter image URL';
                        } else if (value.startsWith('http') == false ||
                            value.startsWith('https') == false) {
                          return 'Please enter valid image URL';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
