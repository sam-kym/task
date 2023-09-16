import 'package:flutter/material.dart';



class CVView extends StatefulWidget {
  @override
  _CVViewState createState() => _CVViewState();
}

class _CVViewState extends State<CVView> {
  String name = "Samuel Kimani";
  String slackUsername = 'Kimani Wangui';
  String githubHandle = "sam-kym";
  String bio = "I'm a Flutter Developer and a Software Engineering graduate,\n also equipped with react web development skills, \n an enthusiastic software developer.";

  void updateCV(String name, String slackUsername, String githubHandle, String bio) {
    setState(() {
      this.name = name;
      this.slackUsername = slackUsername;
      this.githubHandle = githubHandle;
      this.bio = bio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CV Main Page'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CVEdit(name, slackUsername, githubHandle, bio)),
              );
              if (result != null) {
                updateCV(result['name'], result['slackUsername'], result['githubHandle'], result['bio']);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
              child: Center(
                child: Text('Name: $name'),
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              height: 30,
              child: Center(
                child:Text('Slack Username: $slackUsername'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 30,
              child: Center(
                child:Text('GitHub Handle: $githubHandle'),
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              height: 80,
              child: Center(
                child:Text('Bio: $bio'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CVEdit extends StatefulWidget {
  final String name;
  final String slackUsername;
  final String githubHandle;
  final String bio;

  CVEdit(this.name, this.slackUsername, this.githubHandle, this.bio);

  @override
  _CVEditState createState() => _CVEditState();
}

class _CVEditState extends State<CVEdit> {
  late TextEditingController nameController;
  late TextEditingController slackUsernameController;
  late TextEditingController githubHandleController;
  late TextEditingController bioController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    slackUsernameController = TextEditingController(text: widget.slackUsername);
    githubHandleController = TextEditingController(text: widget.githubHandle);
    bioController = TextEditingController(text: widget.bio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit CV'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: slackUsernameController,
              decoration: const InputDecoration(labelText: 'Slack Username'),
            ),
            TextField(
              controller: githubHandleController,
              decoration: const InputDecoration(labelText: 'GitHub Handle'),
            ),
            TextField(
              controller: bioController,
              decoration: const InputDecoration(labelText: 'Bio'),
            ),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                Navigator.pop(context, {
                  'name': nameController.text,
                  'slackUsername': slackUsernameController.text,
                  'githubHandle': githubHandleController.text,
                  'bio': bioController.text,
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
