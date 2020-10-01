import 'package:flutter/material.dart';
import 'package:buku_pesak/core/enums/viewstate.dart';
import 'package:buku_pesak/core/viewmodels/reminder_model.dart';
import 'package:buku_pesak/ui/views/base_view.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ReminderModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('Pengingat')),
        body: model.state == ViewState.Busy
            ? CircularProgressIndicator()
            : Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Pengingat Harian'),
                    subtitle: Text(model.timeText),
                    trailing: InkWell(
                      child: Icon(Icons.edit),
                      onTap: () {
                        model.pickTime(context);
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
