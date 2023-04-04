import 'package:sembast/sembast.dart';
import '../const/app_strings.dart';
import '../data/model/pets_model.dart';
import 'app_database.dart';

class PetsDAO {
  static const String Pets_Name = 'pets';
  final _petsStore = intMapStoreFactory.store(Pets_Name);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(PetsModel fruit) async {
    await _petsStore.add(await _db, fruit.toJson());
  }



  Future<List<PetsModel>> getPetslSortedByName() async {
    final finder = Finder(sortOrders: [
      SortOrder('type'),
    ]);

    final recordSnapshots = await _petsStore.find(
      await _db,
      finder: finder,
    );

    return recordSnapshots.map((snapshot) {
      final fruit = PetsModel.fromJson(snapshot.value);
      fruit.id = snapshot.key;
      return fruit;
    }).toList();
  }

  Future searchLocalDatabase(List<String> pets, bool gwch, String age,
      String gender, String size) async {

    if(pets.toString() =='[]')
      {
        /// no pet type selected which show cats or dogs or others will be included
        // find all types
        if(age.isEmpty && gender.isEmpty && size.isEmpty)
          {
            ///  no age or gender or size will be selected

            final recordSnapshots = await _petsStore.find(
              await _db,
            );

            return recordSnapshots.map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              fruit.id = snapshot.key;
              return fruit;
            }).where((element) {
              return element.type == 'Cat' || element.type == 'Dog' || element.type == 'Other' && element.good_with_children== gwch ;

            }).toList();
          }
        if(age.isNotEmpty && gender.isNotEmpty && size.isNotEmpty)
        {
          ///  no age or gender or size will be selected

          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Cat' || element.type == 'Dog' || element.type == 'Other' &&
                element.good_with_children== gwch && element.age==age
                && element.size==size &&
                element.gender==gender ;

          }).toList();
        }
        if(size.isEmpty && age.isNotEmpty)
        {
          /// size age and gwch
          final recordSnapshots = await _petsStore.find(
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
        if(age.isNotEmpty)
        {
          final recordSnapshots = await _petsStore.find(
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
        if(gender.isNotEmpty && age.isNotEmpty)
        {
          final recordSnapshots = await _petsStore.find(
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
        if(size.isNotEmpty)
        {
          final recordSnapshots = await _petsStore.find(
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
        if(gender.isNotEmpty){
          final recordSnapshots = await _petsStore.find(
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
        if(gender.isNotEmpty && size.isNotEmpty){
          final recordSnapshots = await _petsStore.find(
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
      else{

        if(pets.contains(AppStrings.dog) && pets.contains(AppStrings.cat)
            && pets.contains(AppStrings.others)==false)
          {
              ///dogs and cats will be searched
            if(age.isNotEmpty && size.isNotEmpty && gender.isNotEmpty)
            {
              final recordSnapshots = await _petsStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Cat' || element.type == 'Dog'&&
                    element.good_with_children == gwch &&
                    element.size==size &&
                    element.age==age &&
                    element.gender==gender;
              }).toList();
            }

            if(age.isEmpty && size.isEmpty && gender.isEmpty)
            {
              final recordSnapshots = await _petsStore.find(
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

            if(size.isNotEmpty&& age.isNotEmpty)
            {
              final recordSnapshots = await _petsStore.find(
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

            if(age.isNotEmpty)
            {
              final recordSnapshots = await _petsStore.find(
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

            if(gender.isNotEmpty && age.isNotEmpty)
            {
              final recordSnapshots = await _petsStore.find(
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
            if(size.isNotEmpty)
            {
              final recordSnapshots = await _petsStore.find(
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

            if(gender.isNotEmpty){
              final recordSnapshots = await _petsStore.find(
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

            if(gender.isNotEmpty && size.isNotEmpty){
              final recordSnapshots = await _petsStore.find(
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
        if(pets.contains(AppStrings.dog) && pets.contains(AppStrings.others)&&
            pets.contains(AppStrings.cat)==false)
          {


            if(age.isNotEmpty && size.isNotEmpty && gender.isNotEmpty)
            {
              final recordSnapshots = await _petsStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Others' || element.type == 'Dog'&&
                    element.good_with_children == gwch &&
                    element.size==size &&
                    element.age==age &&
                    element.gender==gender;
              }).toList();
            }

            if(age.isEmpty && size.isEmpty && gender.isEmpty)
            {
              final recordSnapshots = await _petsStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Others' || element.type == 'Dog'&&
                    element.good_with_children == gwch ;
              }).toList();
            }

            if(size.isNotEmpty&& age.isNotEmpty)
            {
              final recordSnapshots = await _petsStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Others' || element.type == 'Dog'&&
                    element.good_with_children == gwch &&
                    element.size==size &&
                    element.age==age;
              }).toList();
            }

            if(age.isNotEmpty)
            {
              final recordSnapshots = await _petsStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Others' || element.type == 'Dog'&&
                    element.good_with_children == gwch &&
                    element.age==age;
              }).toList();
            }

            if(gender.isNotEmpty && age.isNotEmpty)
            {
              final recordSnapshots = await _petsStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Others' || element.type == 'Dog'&&
                    element.good_with_children == gwch &&
                    element.age==age &&
                    element.gender==gender;
              }).toList();
            }
            if(size.isNotEmpty)
            {
              final recordSnapshots = await _petsStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Others' || element.type == 'Dog'&&
                    element.good_with_children == gwch &&
                    element.size==size;

              }).toList();
            }

            if(gender.isNotEmpty){
              final recordSnapshots = await _petsStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Others' || element.type == 'Dog'&&
                    element.good_with_children == gwch &&
                    element.gender==gender;
              }).toList();
            }

            if(gender.isNotEmpty && size.isNotEmpty){
              final recordSnapshots = await _petsStore.find(
                await _db,
              );

              return recordSnapshots.map((snapshot) {
                final fruit = PetsModel.fromJson(snapshot.value);
                // An ID is a key of a record from the database.
                fruit.id = snapshot.key;
                return fruit;
              }).where((element) {
                return element.type == 'Others' || element.type == 'Dog'&&
                    element.good_with_children == gwch &&
                    element.size==size &&
                    element.gender==gender;
              }).toList();
            }

          }

        if( pets.contains(AppStrings.cat) && pets.contains(AppStrings.others)&&pets.contains(AppStrings.dog)==false)
          {
          // find cat others
// find dog and others



          if(age.isNotEmpty && size.isNotEmpty && gender.isNotEmpty)
          {
            final recordSnapshots = await _petsStore.find(
              await _db,
            );

            return recordSnapshots.map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              // An ID is a key of a record from the database.
              fruit.id = snapshot.key;
              return fruit;
            }).where((element) {
              return element.type == 'Others' || element.type == 'Cat'&&
                  element.good_with_children == gwch &&
                  element.size==size &&
                  element.age==age &&
                  element.gender==gender;
            }).toList();
          }

          if(age.isEmpty && size.isEmpty && gender.isEmpty)
          {
            final recordSnapshots = await _petsStore.find(
              await _db,
            );

            return recordSnapshots.map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              // An ID is a key of a record from the database.
              fruit.id = snapshot.key;
              return fruit;
            }).where((element) {
              return element.type == 'Others' || element.type == 'Cat'&&
                  element.good_with_children == gwch ;
            }).toList();
          }

          if(size.isNotEmpty&& age.isNotEmpty)
          {
            final recordSnapshots = await _petsStore.find(
              await _db,
            );

            return recordSnapshots.map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              // An ID is a key of a record from the database.
              fruit.id = snapshot.key;
              return fruit;
            }).where((element) {
              return element.type == 'Others' || element.type == 'Cat'&&
                  element.good_with_children == gwch &&
                  element.size==size &&
                  element.age==age;
            }).toList();
          }

          if(age.isNotEmpty)
          {
            final recordSnapshots = await _petsStore.find(
              await _db,
            );

            return recordSnapshots.map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              // An ID is a key of a record from the database.
              fruit.id = snapshot.key;
              return fruit;
            }).where((element) {
              return element.type == 'Others' || element.type == 'Cat'&&
                  element.good_with_children == gwch &&
                  element.age==age;
            }).toList();
          }

          if(gender.isNotEmpty && age.isNotEmpty)
          {
            final recordSnapshots = await _petsStore.find(
              await _db,
            );

            return recordSnapshots.map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              // An ID is a key of a record from the database.
              fruit.id = snapshot.key;
              return fruit;
            }).where((element) {
              return element.type == 'Others' || element.type == 'Cat'&&
                  element.good_with_children == gwch &&
                  element.age==age &&
                  element.gender==gender;
            }).toList();
          }
          if(size.isNotEmpty)
          {
            final recordSnapshots = await _petsStore.find(
              await _db,
            );

            return recordSnapshots.map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              // An ID is a key of a record from the database.
              fruit.id = snapshot.key;
              return fruit;
            }).where((element) {
              return element.type == 'Others' || element.type == 'Cat'&&
                  element.good_with_children == gwch &&
                  element.size==size;

            }).toList();
          }

          if(gender.isNotEmpty){
            final recordSnapshots = await _petsStore.find(
              await _db,
            );

            return recordSnapshots.map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              // An ID is a key of a record from the database.
              fruit.id = snapshot.key;
              return fruit;
            }).where((element) {
              return element.type == 'Others' || element.type == 'Cat'&&
                  element.good_with_children == gwch &&
                  element.gender==gender;
            }).toList();
          }

          if(gender.isNotEmpty && size.isNotEmpty){
            final recordSnapshots = await _petsStore.find(
              await _db,
            );

            return recordSnapshots.map((snapshot) {
              final fruit = PetsModel.fromJson(snapshot.value);
              // An ID is a key of a record from the database.
              fruit.id = snapshot.key;
              return fruit;
            }).where((element) {
              return element.type == 'Others' || element.type == 'Cat'&&
                  element.good_with_children == gwch &&
                  element.size==size &&
                  element.gender==gender;
            }).toList();
          }

          }

        // only dog
      if(pets.contains(AppStrings.dog) && pets.contains(AppStrings.cat)==false
          && pets.contains(AppStrings.others)==false)
      {

        if(age.isNotEmpty && size.isNotEmpty && gender.isNotEmpty)
        {
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return  element.type == 'Dog'&&
                element.good_with_children == gwch &&
                element.size==size &&
                element.age==age &&
                element.gender==gender;
          }).toList();
        }

        if(age.isEmpty && size.isEmpty && gender.isEmpty)
        {
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Dog'  &&
                element.good_with_children == gwch ;
          }).toList();
        }

        if(size.isNotEmpty&& age.isNotEmpty)
        {
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return  element.type == 'Dog'  &&
                element.good_with_children == gwch &&
                element.size==size &&
                element.age==age;
          }).toList();
        }

        if(age.isNotEmpty)
        {
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return  element.type == 'Dog' &&
                element.good_with_children == gwch &&
                element.age==age;
          }).toList();
        }

        if(gender.isNotEmpty && age.isNotEmpty)
        {
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Dog' &&
                element.good_with_children == gwch &&
                element.age==age &&
                element.gender==gender;
          }).toList();
        }
        if(size.isNotEmpty)
        {
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return  element.type == 'Dog'  &&
                element.good_with_children == gwch &&
                element.size==size;

          }).toList();
        }

        if(gender.isNotEmpty){
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Dog' &&
                element.good_with_children == gwch &&
                element.gender==gender;
          }).toList();
        }

        if(gender.isNotEmpty && size.isNotEmpty){
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return  element.type == 'Dog'  &&
                element.good_with_children == gwch &&
                element.size==size &&
                element.gender==gender;
          }).toList();
        }
      }

      // only cat

      if(pets.contains(AppStrings.dog)==false && pets.contains(AppStrings.cat)
          && pets.contains(AppStrings.others)==false)
      {
        ///cats will be searched
        if(age.isNotEmpty && size.isNotEmpty && gender.isNotEmpty)
        {
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Cat' &&
                element.good_with_children == gwch &&
                element.size==size &&
                element.age==age &&
                element.gender==gender;
          }).toList();
        }

        if(age.isEmpty && size.isEmpty && gender.isEmpty)
        {
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Cat' &&
                element.good_with_children == gwch ;
          }).toList();
        }

        if(size.isNotEmpty&& age.isNotEmpty)
        {
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Cat' &&
                element.good_with_children == gwch &&
                element.size==size &&
                element.age==age;
          }).toList();
        }

        if(age.isNotEmpty)
        {
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Cat' &&
                element.good_with_children == gwch &&
                element.age==age;
          }).toList();
        }

        if(gender.isNotEmpty && age.isNotEmpty)
        {
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Cat'&&
                element.good_with_children == gwch &&
                element.age==age &&
                element.gender==gender;
          }).toList();
        }
        if(size.isNotEmpty)
        {
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Cat'   &&
                element.good_with_children == gwch &&
                element.size==size;

          }).toList();
        }

        if(gender.isNotEmpty){
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Cat'  &&
                element.good_with_children == gwch &&
                element.gender==gender;
          }).toList();
        }

        if(gender.isNotEmpty && size.isNotEmpty){
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Cat'  &&
                element.good_with_children == gwch &&
                element.size==size &&
                element.gender==gender;
          }).toList();
        }
      }

      // only other
      if(pets.contains(AppStrings.dog)==false && pets.contains(AppStrings.cat)==false
          && pets.contains(AppStrings.others))
      {
        ///others will be searched
        if(age.isNotEmpty && size.isNotEmpty && gender.isNotEmpty)
        {
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Others'&&
                element.good_with_children == gwch &&
                element.size==size &&
                element.age==age &&
                element.gender==gender;
          }).toList();
        }

        if(age.isEmpty && size.isEmpty && gender.isEmpty)
        {
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Others'&&
                element.good_with_children == gwch ;
          }).toList();
        }

        if(size.isNotEmpty&& age.isNotEmpty)
        {
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Others'&&
                element.good_with_children == gwch &&
                element.size==size &&
                element.age==age;
          }).toList();
        }

        if(age.isNotEmpty)
        {
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Others'&&
                element.good_with_children == gwch &&
                element.age==age;
          }).toList();
        }

        if(gender.isNotEmpty && age.isNotEmpty)
        {
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Others'&&
                element.good_with_children == gwch &&
                element.age==age &&
                element.gender==gender;
          }).toList();
        }
        if(size.isNotEmpty)
        {
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Others'&&
                element.good_with_children == gwch &&
                element.size==size;

          }).toList();
        }

        if(gender.isNotEmpty){
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Others'&&
                element.good_with_children == gwch &&
                element.gender==gender;
          }).toList();
        }

        if(gender.isNotEmpty && size.isNotEmpty){
          final recordSnapshots = await _petsStore.find(
            await _db,
          );

          return recordSnapshots.map((snapshot) {
            final fruit = PetsModel.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            fruit.id = snapshot.key;
            return fruit;
          }).where((element) {
            return element.type == 'Others'&&
                element.good_with_children == gwch &&
                element.size==size &&
                element.gender==gender;
          }).toList();
        }
      }
      }

  }
}
