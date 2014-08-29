class zoo{
    let animal:String
    let food :String
    
    init(animal:String,food:String){
         self.animal = animal
         self.food = food
        
    }
    
    func foodfood() -> [String:String]{
        var zoofood :Dictionary<String,String> = ["Elephant":"Herbivorous","Monkey ":"Bananas","Tiger":"Carnivorous"]
        return zoofood

    }
}
let show = zoo (animal: "Tiger", food: "Carnivorous")
 