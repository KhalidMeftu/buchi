import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/model/pets_model.dart';
import '../dao.dart';


part 'fruits_event.dart';
part 'fruits_state.dart';

class PetsLocalDbBloc extends Bloc<PetsLocalDbEvent, PetsLocalDbState> {
  final PetsDAO _petsDAO = PetsDAO();

  PetsLocalDbBloc() : super(FruitsInitial()) {

    on<LoadFruitsWithSearch>((event, emit) async {
      // TODO: implement event handler
      emit(LocalDbPetsLoading());
      final fruits = await _petsDAO.getAllSortedByName2(event.selectedPets, event.gwc,event.age, event.gender, event.size).whenComplete((){
      });
      // response can be null sometimes
      print('Fruits Response');
      print(fruits);
      // create another state for empty response
      emit(PetsLocalDBLoaded(fruits));
    });

    on<LoadFruits>((event, emit) async {
      // TODO: implement event handler
      emit(LocalDbPetsLoading());
      final fruits = await _petsDAO.getAllSortedByName().whenComplete((){


      });

      emit(PetsLocalDBLoaded(fruits));
      // Yielding a state bundled with the Fruits from the database.
    });

    /*on<AddRandomFruit>((event, emit)async {
      // TODO: implement event handler
      //await _fruitDao.insert(RandomFruitGenerator.getRandomFruit());
     // List<Leaves> leavesList =[Leaves(id: "1", name: "leaveOne"),Leaves(id: "2", name: "leaveTwo"),Leaves(id: "3", name: "leaveThree")];
      //List<Leaf> leavesList =[({'id': "1", 'name': "leaveOne"}),
      //  ({'id': "2", 'name': "leaveTwo"}),({'id': "3", 'name': "leaveThree"})];
      List<Photo> leavesList =[];
      leavesList.add(Leaf(id: 1,name: 'name'));
      leavesList.add(Leaf(id: 2,name: 'name2'));
      leavesList.add(Leaf(id: 3,name: 'name3'));

      var fruit = TestModel( name: "Apple", isSweet: true, leaves: leavesList);
      _fruitDao.insert(fruit);


      final fruits = await _fruitDao.getAllSortedByName().whenComplete((){


      });

      emit(FruitsLoaded(fruits));
    });

    */


    on<UpdateWithRandomFruit>((event, emit) async{
      // TODO: implement event handler
      //final newFruit = RandomFruitGenerator.getRandomFruit();
      // Keeping the ID of the Fruit the same
      //newFruit.id = event.updatedFruit.id;
      //await _fruitDao.update(newFruit);
      //final fruits = await _fruitDao.getAllSortedByName().whenComplete((){


      //});

     // emit(FruitsLoaded(fruits));
    });


    on<DeleteFruit>((event, emit)async{
      await _petsDAO.delete(event.fruit);
      final fruits = await _petsDAO.getAllSortedByName().whenComplete((){


      });

      emit(PetsLocalDBLoaded(fruits));
    });
  }

    _reloadFruits(Emitter<PetsLocalDbState> emit) async{
    final fruits = await _petsDAO.getAllSortedByName();
    // Yielding a state bundled with the Fruits from the database.
    emit(PetsLocalDBLoaded(fruits));
  }



}
/*
class RandomFruitGenerator {


  static final _fruits = [
    Fruit(name: 'Banana', isSweet: true, leaves: leavesList),
    Fruit(name: 'Strawberry', isSweet: true),
    Fruit(name: 'Kiwi', isSweet: false),
    Fruit(name: 'Apple', isSweet: true),
    Fruit(name: 'Pear', isSweet: true),
    Fruit(name: 'Lemon', isSweet: false),
  ];

  static Fruit getRandomFruit() {
    return _fruits[Random().nextInt(_fruits.length)];
  }
}

*/