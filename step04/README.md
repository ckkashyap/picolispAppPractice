In this app, we will create a simple list of tasks. Query chart is used to filter the names of the tasks.

It will have the feature to edit tasks ... this will probably require idform.

So it turns out that idForm - which is meant to edit a specific object so it needs to be in a separate file - task.l in this case.
This was particularly coming in the way for the newButton.

idForm in app.l simply invokes choTask since \*ID id not set in a GET operation

Use pilog to select TAGS

Display the tags along with the task titles
