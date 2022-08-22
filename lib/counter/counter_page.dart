
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';
class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);
  Widget counterNumber(
      CounterState state,
      BuildContext cont,
      ){
    return Container(
      color: darkMode?Colors.black:Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Text("$locationMessage\n\n\n",style: TextStyle(
              fontSize: 18,
              color: darkMode? Colors.green.shade900:Colors.blue
            ),),
            Text('You have pushed the button this many times : ',
            style: TextStyle(
                color: darkMode? Colors.grey:Colors.black
            ),),
            Text("$counter",
            style: TextStyle(
                color: darkMode? Colors.grey:Colors.black
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkMode? Colors.green.shade900:Colors.blue,
                  ),
                  onPressed: (){
                    BlocProvider.of<CounterCubit>(cont).getCurrentLocation();
                  },
                  child: Icon(Icons.cloud),
                ),
                SizedBox(width: 130,),
                if(counter<=10)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkMode? Colors.green.shade900:Colors.blue,
                  ),
                  onPressed: (){
                    BlocProvider.of<CounterCubit>(cont).upCount();
                  },
                  child: Icon(Icons.add),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkMode? Colors.green.shade900:Colors.blue,
                  ),

                  onPressed: (){
                    BlocProvider.of<CounterCubit>(cont).darkmode();
                  },
                  child: Icon(Icons.color_lens),
                ),
                SizedBox(width: 130,),
                if(counter>=1)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkMode? Colors.green.shade900:Colors.blue,
                  ),
                  onPressed: (){
                    BlocProvider.of<CounterCubit>(cont).downCount();
                  },
                  child: Icon(Icons.remove),
                ),

              ],
            ),
          ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Weather'),
      ),
      body: BlocProvider(
        create: (context) => CounterCubit(),
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            if(state is CounterInitial) {
              return counterNumber(state, context);
            } else if (state is CounterDown) {
              return counterNumber(state, context);
            }
            else if(state is Up){
              return counterNumber(state, context);
            }
            else if(state is LocationTake){
              return counterNumber(state, context);
            }
            else if(state is Color){
              return counterNumber(state, context);
            }
            else {
              return const Text("Error");
            }
          },
        ),
      ),
    );
  }
}