var shoppingListExplicit = [String]()
shoppingListExplicit = ["Eggs","Milk"]
//var shoppingListExplicit: [String]= ["Eggs","Milk"]

var shoppingList = ["Eggs","Milk"]
print("The shopping list contains \(shoppingList.count) items.")
shoppingList.append("Flour")
shoppingList += "Baking Powder"
shoppingList += ["Chocolate Spread","Cheese","Butter"]
var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"
//shoppingList[0...3] = ["bannanas","Apples"]
shoppingList

shoppingList += ["Baking Powder"]
//shoppingList now contains 4 items
shoppingList += ["Chocolate Spread","Cheese","Butter"]
//shoppingList now contains 7 items

shoppingList.insert("Maple", atIndex: 0)
//shoppingList now contains 7 items
//"Maple Syrup" is now the frist iem in the list

shoppingList.append("Flour")
//shoppingList now contains 3 items,and someone is making pancakes

shoppingList += ["Baking Powder"]

var FirstItem = shoppingList[0]
//firstItem is equal to "Eggs"

shoppingList [4...6] = ["bannanas","Apples"]
shoppingList now contains 6 items

let array :Array<Int> = [1,2,3,4]
let dictionary : Dictionary<String,Int> = ["dog":1,"elephant":2]


var airports: [String: String] = ["TYO": "Tokyo" ,"DUB": "Dublin"]
if airports.isEmpty{
   println("The airpornts dictionary is empty.")
} else{
   println("The airpornts dictionary is noy empty.")
}
//pronts "The airpornts dictionary is empty."

println("The airpornts dictionary contains  \(airports.count) items.")
//println"The airpornts dictionary contains 2 items.")

airports["LHR"] = "London"
//the airports dictionary now contains 3 items


airports["LHR"] = "London Heathorw"
// the value for "LHR" has been changed to "London Heathorw"

if let oldvalue = airports.updateValue("Dublin International", forKey: "DUB"){
     println("The old value for DUB was \(oldvalue).")
}
//println "The old value for DUB was Dublin."

airports["APL"] ="Apple International"
//"Apple International" is not the veal airport for APL , so delete it 
airports["APL"] = nil









