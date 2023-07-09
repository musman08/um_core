import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reusables/mixins/form_state_mixin.dart';
import 'package:reusables/reusables.dart';
import 'package:um_core/um_core.dart';
import 'package:user_management_web/widgets/confirmation_dialog.dart';

class WorkActivityItem extends StatelessWidget {
  const WorkActivityItem({
    Key? key,
    required this.isAdminPanel,
    required this.dataModel,
    this.passValueFunction,
  }) : super(key: key);

  final bool isAdminPanel;
  final AddDataModel dataModel;
  final Function(AddDataModel)? passValueFunction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date: ${dataModel.dateAndTime}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  dataModel.status!,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if(isAdminPanel)...[
              Text(
                dataModel.title!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Text(
                  dataModel.description!,
                  style: const TextStyle(fontSize: 16),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if(dataModel.status == UserAuthorization.approved.name)...[
                    ActivityActionButton(
                      uAuth: UserAuthorization.rejected.name,
                      title: "Reject",
                      data: dataModel,
                    ),
                  ] else if(dataModel.status == UserAuthorization.pending.name)...[
                      ActivityActionButton(
                        uAuth: UserAuthorization.approved.name,
                        title: "Accept",
                        data: dataModel,

                      ),
                      ActivityActionButton(
                        uAuth: UserAuthorization.rejected.name,
                        title: "Reject",
                        data: dataModel,
                      ),
                      ActivityActionButton(
                        uAuth: UserAuthorization.changeRequest.name,
                        title: "Change Request",
                        data: dataModel,
                      )
                    ]else if(dataModel.status == UserAuthorization.changeRequest.name)...[
                      ActivityActionButton(
                        uAuth: UserAuthorization.approved.name,
                        title: "Accept",
                        data: dataModel,

                      ),
                      ActivityActionButton(
                        uAuth: UserAuthorization.rejected.name,
                        title: "Reject",
                        data: dataModel,
                      ),
                    ] else...[
                      ActivityActionButton(
                        uAuth: UserAuthorization.approved.name,
                        title: "Accept",
                        data: dataModel,
                      ),
                      ]
                ],
              ),
            ] else...[
                Text(
                  dataModel.title!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dataModel.description!,
                  style: const TextStyle(fontSize: 16),
                ),
                if(dataModel.status == UserAuthorization.changeRequest.name)...[
                  const SizedBox(height: 20,),
                  Text(
                   'Details:',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    dataModel.crDescription!,
                    style: const TextStyle(fontSize: 14),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: ()=> passValueFunction!(dataModel),
                      child:
                      Text("Edit",),
                    ),
                  ),
                ]
              ],
          ],
        ),
      ),
    );
  }
}

class ActivityActionButton extends StatelessWidget {
  ActivityActionButton({
    Key? key,
    required this.uAuth,
    required this.title,
    required this.data,
  }) : super(key: key);


  final AddDataModel data;
  final String uAuth;
  final String title;
  bool boolCheck = false;

  void confirmation(bool check){
    boolCheck = check;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        if (uAuth != UserAuthorization.changeRequest.name) {
          if(uAuth == UserAuthorization.rejected.name){
            await ConfirmationDialogWidget(onConfirmation: confirmation).show(context);
            if(boolCheck){
              try {
                data.status = uAuth;
                await AddWorkActivityFirestoreService().updateFirestore(data);
              } catch (e) {
                const PopUpDialog('Failed. Try Again').show(context);
              }
            }
          }else{
            try {
              data.status = uAuth;
              await AddWorkActivityFirestoreService().updateFirestore(data);
            } catch (e) {
              const PopUpDialog('Failed. Try Again').show(context);
            }
          }
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context){
            return ChangeRequestPopUp(dataModel: data,);
          });
          // PopUpDialog("Change request will be made").show(context);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7),
        child: Text(
          title, style: const TextStyle(color: AppColors.primaryColor),),
      )
    );
  }
}

class ChangeRequestPopUp extends StatefulWidget {
  ChangeRequestPopUp({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  final AddDataModel dataModel;

  @override
  State<ChangeRequestPopUp> createState() => _ChangeRequestPopUpState();
}
class _ChangeRequestPopUpState extends State<ChangeRequestPopUp> with FormStateMixin {

  late AddDataModel dataModel;

  @override
  void initState() {
    super.initState();
    dataModel = widget.dataModel;
  }
  final TextEditingController changeRequestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: AlertDialog(
        title: Text('Change Request'),
        content: SizedBox(
          width: 300,
          child: AppTextField(
              textEditingController: changeRequestController,
              maxLines: 3,
              hint: "Describe the change",
              label: "Description",
              validator: InputValidator.multiple([
                InputValidator.required(
                    message: 'Description is required'
                )!,
                    (value){
                  if(changeRequestController.text.trim().isEmpty){
                    return 'Description is required';
                  }else{
                    return null;
                  }
                }
              ])
          ),
        ),
        actions: [
          TextButton(
              onPressed: (){
                submitter();
              },
              child: Text(
                "Send", style: TextStyle(color: AppColors.primaryColor),
              )
          )
        ],
      ),
    );
  }
  @override
  FutureOr<void> onSubmit() async {
    Navigator.pop(context);
    try {
      dataModel.status = UserAuthorization.changeRequest.name;
      dataModel.crDescription = changeRequestController.text;
      await AddWorkActivityFirestoreService().updateFirestore(dataModel);
    } catch (e) {
      const PopUpDialog('Failed. Try Again').show(context);
    }
  }
}



