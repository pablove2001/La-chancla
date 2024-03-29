import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lachancla/providers/upload_photo_provider.dart';
import 'package:lachancla/providers/user_events_provider.dart';
import 'package:lachancla/screens/home_page.dart';
import 'package:lachancla/services/bloc/auth_bloc.dart';
import 'package:lachancla/widgets/edit_avatar_modal.dart';
import 'package:provider/provider.dart';
import '../widgets/favorites_cards.dart';
import '../widgets/my_events_cards.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    void mostrarModal(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return EditAvatarModal();
        },
      );
    }

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignOutSuccessState) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: ListTile(
                      leading: GestureDetector(
                        onTap: () {
                          mostrarModal(context);
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            context.watch<UploadPhotoProvider>().imageURL,
                          ),
                        ),
                      ),
                      title: Text(
                        "${FirebaseAuth.instance.currentUser?.displayName ?? 'Sin Nombre'}",
                        style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 24,
                        ),
                      ),
                      subtitle: Text(
                        "21-04-2023",
                        style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 20,
                        ),
                      ),
                      trailing: MaterialButton(
                        child: Column(children: [
                          Icon(
                            Icons.logout,
                          ),
                          Text(
                            "Log out",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ]),
                        onPressed: () async {
                          BlocProvider.of<AuthBloc>(context)
                              .add(SignOutEvent());
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        text: "My events",
                      ),
                      Tab(
                        text: "Favorites",
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(10),
                      itemCount:
                          context.watch<UserEventsProvider>().getEvents.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MyEventsCards(
                            event: context
                                .read<UserEventsProvider>()
                                .getEvents[index]);
                      },
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(10),
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return FavoritesCards();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
