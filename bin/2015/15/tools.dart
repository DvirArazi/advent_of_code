library utils;

import 'package:advent_of_code/utils/list_of_list_ext.dart';

List<List<int>> getMixes(int ingredientsC, int spoonsC) {
  if(ingredientsC == 1) return [[spoonsC]];

  return List.generate(spoonsC+1, (spoonsFirstC) => 
    getMixes(ingredientsC - 1, spoonsC - spoonsFirstC).map((mix)=>
      [spoonsFirstC] + mix
    ).toList()
  ).combine();
}

int getMixScore(List<List<int>> ingredients, List<int> mix) {
  var propsSum = List.generate(4, (_) => 0);
  for (var propI = 0; propI < propsSum.length; propI++) {
    for (var spoonsI = 0; spoonsI < mix.length; spoonsI++) {
      propsSum[propI] += mix[spoonsI]*ingredients[spoonsI][propI];
    }
    if (propsSum[propI] <= 0) return 0;
  }

  var score = 1;
  for (final propSum in propsSum) {
    score *= propSum;
  }
  
  return score;
}