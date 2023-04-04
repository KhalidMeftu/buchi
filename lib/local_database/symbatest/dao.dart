import 'package:flutter/material.dart';
import 'package:sembast/sembast.dart';

import '../../const/app_strings.dart';
import '../../data/model/pets_model.dart';
import 'app_database.dart';

class PetsDAO {
  static const String FRUIT_STORE_NAME = 'fruits';

  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Fruit objects converted to Map
  final _fruitStore = intMapStoreFactory.store(FRUIT_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(PetsModel fruit) async {
    //await _fruitStore.add(await _db, fruit.toMap());
    await _fruitStore.add(await _db, fruit.toJson());
  }

  Future update(PetsModel fruit) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(fruit.id));
    await _fruitStore.update(
      await _db,
      //fruit.toMap(),
      fruit.toJson(),
      finder: finder,
    );
  }

  Future delete(PetsModel fruit) async {
    final finder = Finder(filter: Filter.byKey(fruit.id));
    await _fruitStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<PetsModel>> getAllSortedByName() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('type'),
    ]);

    final recordSnapshots = await _fruitStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Fruit> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final fruit = PetsModel.fromJson(snapshot.value);
      // An ID is a key of a record from the database.
      fruit.id = snapshot.key;
      return fruit;
    }).toList();
  }

  Future getAllSortedByName2(List<String> pets, bool gwch, String age,
      String gender, String size) async {

    // check what is user is query
    var query;
    var  queryContainsCat;
    var  queryContainsDog;
    var  queryContainsOthers;

    if(pets.contains(AppStrings.dogs) && pets.contains(AppStrings.cats) && pets.contains(AppStrings.others))
      {
        queryContainsDog=true;
        queryContainsOthers=true;
        queryContainsCat=true;
      }

    if(pets.contains(AppStrings.dogs)==false)
    {
      queryContainsDog=false;

    }

    if(pets.contains(AppStrings.cats)==false)
    {
      queryContainsCat=false;

    }

    if(pets.contains(AppStrings.others)==false)
    {
      queryContainsOthers=false;

    }

    if(pets.contains(AppStrings.others)==false)
    {
      queryContainsOthers=false;

    }


    if(age.isNotEmpty && gender.isNotEmpty && size.isNotEmpty)
    {
          // query all
      query=AppStrings.queryAll;
    }
    if(age.isEmpty && gender.isEmpty && size.isEmpty)
    {
        // query gwch
      query=AppStrings.queryGoodWithChildren;

    }

    if(age.isNotEmpty && size.isNotEmpty && gender.isEmpty)
    {
      // query age and size and gwch
          query=AppStrings.querySizeAgeAndGoodWithChildren;


    }

    if(age.isNotEmpty && gender.isEmpty && size.isEmpty)
    {
      // query age and gw


        query=AppStrings.queryAgeAndGoodWithChildren;



    }

    if(age.isNotEmpty && gender.isNotEmpty && size.isEmpty )
    {
      // query age gender and qwch


        query=AppStrings.queryGenderAgeAndGoodWithChildren;


    }

    if( size.isNotEmpty && gender.isEmpty && age.isEmpty )
    {

        query=AppStrings.querySizeAndGoodWithChildren;



    }

    if( gender.isNotEmpty && size.isEmpty && age.isEmpty )
    {
     // query gender gwch

        query=AppStrings.queryGenderAndGoodWithChildren;



    }

    if( gender.isNotEmpty && size.isNotEmpty && age.isEmpty)
    {
      // query gender and size


        query=AppStrings.queryGenderSizeAndGoodWithChildren;


    }

    // now logic part is done

    if(pets.toString() =='[]')
      {
        // find all types
        if(query==AppStrings.queryAll)
          {
            final recordSnapshots = await _fruitStore.find(
              await _db,
            );

            return recordSnapshots.map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              // An ID is a key of a record from the database.
              fruit.id = snapshot.key;
              return fruit;
            }).where((element) {
              return element.type == 'Cat' || element.type == 'Dog' || element.type == 'Other' &&
                  element.good_with_children == gwch &&
                  element.size==size &&
                  element.age==age &&
                  element.gender==gender;
            }).toList();
          }

        if(query==AppStrings.queryGoodWithChildren)
        {
          final recordSnapshots = await _fruitStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Cat' || element.type == 'Dog' || element.type == 'Other' &&
                element.good_with_children == gwch ;
          }).toList();
        }

        if(query==AppStrings.querySizeAgeAndGoodWithChildren)
        {
          final recordSnapshots = await _fruitStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Cat' || element.type == 'Dog' || element.type == 'Other' &&
                element.good_with_children == gwch &&
                element.size==size &&
                element.age==age;
          }).toList();
        }

        if(query==AppStrings.queryAgeAndGoodWithChildren)
        {
          final recordSnapshots = await _fruitStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Cat' || element.type == 'Dog' || element.type == 'Other' &&
                element.good_with_children == gwch &&
                element.age==age;
          }).toList();
        }

        if(query==AppStrings.queryGenderAgeAndGoodWithChildren)
        {
          final recordSnapshots = await _fruitStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Cat' || element.type == 'Dog' || element.type == 'Other' &&
                element.good_with_children == gwch &&
                element.age==age &&
                element.gender==gender;
          }).toList();
        }
        if(query==AppStrings.querySizeAndGoodWithChildren)
        {
          final recordSnapshots = await _fruitStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Cat' || element.type == 'Dog' || element.type == 'Other' &&
                element.good_with_children == gwch &&
                element.size==size;

          }).toList();
        }
        if(query==AppStrings.queryGenderAndGoodWithChildren){
          final recordSnapshots = await _fruitStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Cat' || element.type == 'Dog' || element.type == 'Other' &&
                element.good_with_children == gwch &&
                element.gender==gender;
          }).toList();
        }

        if(query==AppStrings.queryGenderSizeAndGoodWithChildren){
          final recordSnapshots = await _fruitStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Cat' || element.type == 'Dog' || element.type == 'Other' &&
                element.good_with_children == gwch &&
                element.size==size &&
                element.gender==gender;
          }).toList();
        }
      }


    // now user can search of pets with the following category

    // dogs and cats
    // dogs and others
    // cats and others
    else if(pets.toString() != '[]')
      {
        if(pets.contains(AppStrings.dogs) && pets.contains(AppStrings.cats)
            && pets.contains(AppStrings.others)==false)
          {
            // find dog and cat
            if(query==AppStrings.queryAll)
            {
              final recordSnapshots = await _fruitStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Cat' || element.type == 'Dog' &&
                    element.good_with_children == gwch &&
                    element.size==size &&
                    element.age==age &&
                    element.gender==gender;
              }).toList();
            }

            if(query==AppStrings.queryGoodWithChildren)
            {
              final recordSnapshots = await _fruitStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Cat' || element.type == 'Dog'  &&
                    element.good_with_children == gwch ;
              }).toList();
            }

            if(query==AppStrings.querySizeAgeAndGoodWithChildren)
            {
              final recordSnapshots = await _fruitStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Cat' || element.type == 'Dog'  &&
                    element.good_with_children == gwch &&
                    element.size==size &&
                    element.age==age;
              }).toList();
            }

            if(query==AppStrings.queryAgeAndGoodWithChildren)
            {
              final recordSnapshots = await _fruitStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Cat' || element.type == 'Dog' &&
                    element.good_with_children == gwch &&
                    element.age==age;
              }).toList();
            }

            if(query==AppStrings.queryGenderAgeAndGoodWithChildren)
            {
              final recordSnapshots = await _fruitStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Cat' || element.type == 'Dog' &&
                    element.good_with_children == gwch &&
                    element.age==age &&
                    element.gender==gender;
              }).toList();
            }
            if(query==AppStrings.querySizeAndGoodWithChildren)
            {
              final recordSnapshots = await _fruitStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Cat' || element.type == 'Dog'  &&
                    element.good_with_children == gwch &&
                    element.size==size;

              }).toList();
            }
            if(query==AppStrings.queryGenderAndGoodWithChildren){
              final recordSnapshots = await _fruitStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Cat' || element.type == 'Dog' &&
                    element.good_with_children == gwch &&
                    element.gender==gender;
              }).toList();
            }

            if(query==AppStrings.queryGenderSizeAndGoodWithChildren){
              final recordSnapshots = await _fruitStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Cat' || element.type == 'Dog'  &&
                    element.good_with_children == gwch &&
                    element.size==size &&
                    element.gender==gender;
              }).toList();
            }
          }
        if(pets.contains(AppStrings.dogs) && pets.contains(AppStrings.others)&&
            pets.contains(AppStrings.cats)==false)
          {
            // find dog and others

            if(query==AppStrings.queryAll)
            {
              final recordSnapshots = await _fruitStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Others' || element.type == 'Dog' &&
                    element.good_with_children == gwch &&
                    element.size==size &&
                    element.age==age &&
                    element.gender==gender;
              }).toList();
            }

            if(query==AppStrings.queryGoodWithChildren)
            {
              final recordSnapshots = await _fruitStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Others' || element.type == 'Dog' &&
                    element.good_with_children == gwch ;
              }).toList();
            }

            if(query==AppStrings.querySizeAgeAndGoodWithChildren)
            {
              final recordSnapshots = await _fruitStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Others' || element.type == 'Dog' &&
                    element.good_with_children == gwch &&
                    element.size==size &&
                    element.age==age;
              }).toList();
            }

            if(query==AppStrings.queryAgeAndGoodWithChildren)
            {
              final recordSnapshots = await _fruitStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Others' || element.type == 'Dog' &&
                    element.good_with_children == gwch &&
                    element.age==age;
              }).toList();
            }

            if(query==AppStrings.queryGenderAgeAndGoodWithChildren)
            {
              final recordSnapshots = await _fruitStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Others' || element.type == 'Dog' &&
                    element.good_with_children == gwch &&
                    element.age==age &&
                    element.gender==gender;
              }).toList();
            }
            if(query==AppStrings.querySizeAndGoodWithChildren)
            {
              final recordSnapshots = await _fruitStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Others' || element.type == 'Dog' &&
                    element.good_with_children == gwch &&
                    element.size==size;

              }).toList();
            }
            if(query==AppStrings.queryGenderAndGoodWithChildren){
              final recordSnapshots = await _fruitStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Others' || element.type == 'Dog' &&
                    element.good_with_children == gwch &&
                    element.gender==gender;
              }).toList();
            }

            if(query==AppStrings.queryGenderSizeAndGoodWithChildren){
              final recordSnapshots = await _fruitStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Others' || element.type == 'Dog' &&
                    element.good_with_children == gwch &&
                    element.size==size &&
                    element.gender==gender;
              }).toList();
            }

          }

        if( pets.contains(AppStrings.cats) && pets.contains(AppStrings.others)&&pets.contains(AppStrings.dogs)==false)
          {
          // find cat others
// find dog and others

          if(query==AppStrings.queryAll)
          {
            final recordSnapshots = await _fruitStore.find(
              await _db,
            );

            return recordSnapshots.map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              // An ID is a key of a record from the database.
              fruit.id = snapshot.key;
              return fruit;
            }).where((element) {
              return element.type == 'Cat' || element.type == 'Other' &&
                  element.good_with_children == gwch &&
                  element.size==size &&
                  element.age==age &&
                  element.gender==gender;
            }).toList();
          }

          if(query==AppStrings.queryGoodWithChildren)
          {
            final recordSnapshots = await _fruitStore.find(
              await _db,
            );

            return recordSnapshots.map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              // An ID is a key of a record from the database.
              fruit.id = snapshot.key;
              return fruit;
            }).where((element) {
              return element.type == 'Others' || element.type == 'Cat' &&
                  element.good_with_children == gwch ;
            }).toList();
          }

          if(query==AppStrings.querySizeAgeAndGoodWithChildren)
          {
            final recordSnapshots = await _fruitStore.find(
              await _db,
            );

            return recordSnapshots.map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              // An ID is a key of a record from the database.
              fruit.id = snapshot.key;
              return fruit;
            }).where((element) {
              return element.type == 'Others' || element.type == 'Cat' &&
                  element.good_with_children == gwch &&
                  element.size==size &&
                  element.age==age;
            }).toList();
          }

          if(query==AppStrings.queryAgeAndGoodWithChildren)
          {
            final recordSnapshots = await _fruitStore.find(
              await _db,
            );

            return recordSnapshots.map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              // An ID is a key of a record from the database.
              fruit.id = snapshot.key;
              return fruit;
            }).where((element) {
              return element.type == 'Others' || element.type == 'Cat' &&
                  element.good_with_children == gwch &&
                  element.age==age;
            }).toList();
          }

          if(query==AppStrings.queryGenderAgeAndGoodWithChildren)
          {
            final recordSnapshots = await _fruitStore.find(
              await _db,
            );

            return recordSnapshots.map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              // An ID is a key of a record from the database.
              fruit.id = snapshot.key;
              return fruit;
            }).where((element) {
              return element.type == 'Others' || element.type == 'Cat' &&
                  element.good_with_children == gwch &&
                  element.age==age &&
                  element.gender==gender;
            }).toList();
          }
          if(query==AppStrings.querySizeAndGoodWithChildren)
          {
            final recordSnapshots = await _fruitStore.find(
              await _db,
            );

            return recordSnapshots.map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              // An ID is a key of a record from the database.
              fruit.id = snapshot.key;
              return fruit;
            }).where((element) {
              return element.type == 'Others' || element.type == 'Cat' &&
                  element.good_with_children == gwch &&
                  element.size==size;

            }).toList();
          }
          if(query==AppStrings.queryGenderAndGoodWithChildren){
            final recordSnapshots = await _fruitStore.find(
              await _db,
            );

            return recordSnapshots.map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              // An ID is a key of a record from the database.
              fruit.id = snapshot.key;
              return fruit;
            }).where((element) {
              return element.type == 'Others' || element.type == 'Dog' &&
                  element.good_with_children == gwch &&
                  element.gender==gender;
            }).toList();
          }

          if(query==AppStrings.queryGenderSizeAndGoodWithChildren){
            final recordSnapshots = await _fruitStore.find(
              await _db,
            );

            return recordSnapshots.map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              // An ID is a key of a record from the database.
              fruit.id = snapshot.key;
              return fruit;
            }).where((element) {
              return element.type == 'Others' || element.type == 'Cat' &&
                  element.good_with_children == gwch &&
                  element.size==size &&
                  element.gender==gender;
            }).toList();
          }

          }
      }




/*
    else if (pets.toString() != '[]') {
      for (var x in pets) {
        final recordSnapshots = await _fruitStore.find(
          await _db,
        );

        // Making a List<Fruit> out of List<RecordSnapshot>
        return recordSnapshots
            .map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              // An ID is a key of a record from the database.
              fruit.id = snapshot.key;
              return fruit;
            })
            .where((element) => element.type == 'Cat' //&&
                // element.good_with_children==gwch ||
                //  age.isNotEmpty?element.age==age ||
                //  gender.isNotEmpty? element.gender==gender ||
                // size.isNotEmpty? element.size==size:true:true:true
                )
            .toList();
      }
    }
    */

    /*final recordSnapshots = await _fruitStore.find(
      await _db,

    );

    // Making a List<Fruit> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {

      final fruit = PetsModel.fromJson(snapshot.value);
      // An ID is a key of a record from the database.
      fruit.id = snapshot.key;
      return fruit;
    }).toList();

    */
  }
}
