import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lachancla/providers/states_builder_provider.dart';
import 'package:lachancla/screens/events_page.dart';
import 'package:lachancla/screens/starting_page.dart';
import 'package:lachancla/services/firebase_service.dart';
import 'package:provider/provider.dart';

class AddEventsProvider with ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController capacityController = TextEditingController();
  TextEditingController urlMapsController = TextEditingController();
  XFile? image;
  final ImagePicker picker = ImagePicker();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.fromDateTime(DateTime.now());
  DateTime endDate = DateTime.now();
  TimeOfDay endTime = TimeOfDay.fromDateTime(DateTime.now());

  Future<void> getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    if (img == null) return;
    image = img!;
    notifyListeners();
  }

  void cleanValues() {
    titleController.clear();
    descriptionController.clear();
    capacityController.clear();
    urlMapsController.clear();
    image = null;
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.fromDateTime(DateTime.now());
    endDate = DateTime.now();
    endTime = TimeOfDay.fromDateTime(DateTime.now());
    notifyListeners();
  }

  void printValues() {
    print(titleController.text);
    print(descriptionController.text);
    print(capacityController.text);
    print(urlMapsController.text);
    if (image != null) {
      print(image!.path);
    }
    print(selectedDate);
    print(selectedTime);
    print(endDate);
    print(endTime);
  }

  Future<void> selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      final TimeOfDay? timePicked = await showTimePicker(
        context: context,
        initialTime: selectedTime,
      );
      if (timePicked != null) {
        selectedDate = DateTime(
          picked.year,
          picked.month,
          picked.day,
          timePicked.hour,
          timePicked.minute,
        );
        selectedTime = timePicked;
        notifyListeners();
      }
    }
  }

  Future<void> endSelectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      final TimeOfDay? timePicked = await showTimePicker(
        context: context,
        initialTime: endTime,
      );
      if (timePicked != null) {
        endDate = DateTime(
          picked.year,
          picked.month,
          picked.day,
          timePicked.hour,
          timePicked.minute,
        );
        endTime = timePicked;
        notifyListeners();
      }
    }
  }

  void myAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text('Please choose media to select'),
          content: Container(
            height: MediaQuery.of(context).size.height / 6,
            child: Column(
              children: [
                ElevatedButton(
                  //if user click this button, user can upload image from gallery
                  onPressed: () {
                    Navigator.pop(context);
                    getImage(ImageSource.gallery);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.image),
                      Text('From Gallery'),
                    ],
                  ),
                ),
                ElevatedButton(
                  //if user click this button. user can upload image from camera
                  onPressed: () {
                    Navigator.pop(context);
                    getImage(ImageSource.camera);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.camera),
                      Text('From Camera'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<bool> submitForm(String estado, BuildContext context) async {
    try {
      bool nice = await createEventService(int.parse(this.capacityController.text), this.descriptionController.text, this.selectedDate, this.endDate, this.image, estado, this.titleController.text, this.urlMapsController.text);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Evento creado')));
      Navigator.push( context, MaterialPageRoute(builder: (context) => EventsPage()),);

      return nice;
    } catch (e) {}

    return false;    
    
  }
}
