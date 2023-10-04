import 'package:flutter/material.dart';

class ModalSearchCity extends StatefulWidget {
  final String country;
  final Function(String) onSearch;

  const ModalSearchCity({
    Key? key,
    required this.country,
    required this.onSearch,
  }) : super(key: key);

  @override
  State<ModalSearchCity> createState() => _ModalSearchCityState();
}

class _ModalSearchCityState extends State<ModalSearchCity> {
  final TextEditingController _textEditingController = TextEditingController();

  void _clearSearch() {
    setState(() {
      _textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Digite uma cidade',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2E3B42),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: _textEditingController,
                  onChanged: (text) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: 'Ex.: São Paulo',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _clearSearch();
                      },
                      icon: const Icon(Icons.clear_rounded),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                          color: Colors.black,
                        ),
                        backgroundColor: const Color(0xFF2E3B42),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancelar'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: _textEditingController.text.length > 1
                            ? Colors.green
                            : Colors.grey,
                      ),
                      onPressed: _textEditingController.text.length > 1
                          ? () {
                              widget.onSearch(_textEditingController.text);
                              Navigator.of(context).pop();
                            }
                          : null,
                      child: const Text(
                        'Pesquisar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              child: const Padding(
                padding: EdgeInsets.all(2.0),
                child: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
