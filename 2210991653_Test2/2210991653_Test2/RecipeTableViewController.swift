//
//  RecipeTableViewController.swift
//  2210991653_Test2
//
//  Created by student-2 on 23/11/24.
//

import UIKit

class RecipeTableViewController: UITableViewController {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var MainPageFoodName: UILabel!
    @IBOutlet weak var MainPageCalorieCount: UILabel!
    @IBOutlet weak var MainPagePreprationTime: UILabel!
    
    var foodTimes: [FoodTime] {
        let breakfastFoodDetail1 = FoodDetail(
            recipeName: "Vegan Avocado Toast",
            ingredients: ["Avocado", "Whole Wheat Bread", "Lemon", "Chili Flakes", "Olive Oil"],
            category: .vegan,
            recipeImage: UIImage(named: "avocado_toast.jpg") ?? UIImage(),
            preprationTime: 10,
            calorieCount: 350.0
        )

        let breakfastFoodDetail2 = FoodDetail(
            recipeName: "Oatmeal with Fruits",
            ingredients: ["Oats", "Banana", "Blueberries", "Almond Milk", "Honey"],
            category: .vegan,
            recipeImage: UIImage(named: "oatmeal_with_fruits.jpg") ?? UIImage(),
            preprationTime: 5,
            calorieCount: 250.0
        )

        let lunchFoodDetail1 = FoodDetail(
            recipeName: "Grilled Chicken Salad",
            ingredients: ["Chicken Breast", "Lettuce", "Tomatoes", "Cucumber", "Olive Oil", "Lemon Dressing"],
            category: .Non_vegetarian,
            recipeImage: UIImage(named: "grilled_chicken_salad.jpg") ?? UIImage(),
            preprationTime: 20,
            calorieCount: 450.0
        )

        let lunchFoodDetail2 = FoodDetail(
            recipeName: "Quinoa & Roasted Veggies",
            ingredients: ["Quinoa", "Zucchini", "Bell Pepper", "Olive Oil", "Garlic", "Lemon"],
            category: .vegan,
            recipeImage: UIImage(named: "quinoa_roasted_veggies.jpg") ?? UIImage(),
            preprationTime: 25,
            calorieCount: 400.0
        )


        let dinnerFoodDetail1 = FoodDetail(
            recipeName: "Spaghetti Bolognese",
            ingredients: ["Spaghetti", "Ground Beef", "Tomato Sauce", "Garlic", "Basil", "Olive Oil"],
            category: .Non_vegetarian,
            recipeImage: UIImage(named: "spaghetti_bolognese.jpg") ?? UIImage(),
            preprationTime: 30,
            calorieCount: 700.0
        )

        let dinnerFoodDetail2 = FoodDetail(
            recipeName: "Vegetarian Stir Fry",
            ingredients: ["Tofu", "Broccoli", "Carrot", "Soy Sauce", "Ginger", "Garlic", "Rice"],
            category: .vegetarian,
            recipeImage: UIImage(named: "vegetarian_stir_fry.jpg") ?? UIImage(),
            preprationTime: 20,
            calorieCount: 450.0
        )

        let breakfast = Food(foodName: "Breakfast", foodDetail: [breakfastFoodDetail1, breakfastFoodDetail2])
        let lunch = Food(foodName: "Lunch", foodDetail: [lunchFoodDetail1, lunchFoodDetail2])
        let dinner = Food(foodName: "Dinner", foodDetail: [dinnerFoodDetail1, dinnerFoodDetail2])

        // Creating FoodTime objects for each time of day
        let breakfastTime = FoodTime(foodTime: "Breakfast", food: [breakfast])
        let lunchTime = FoodTime(foodTime: "Lunch", food: [lunch])
        let dinnerTime = FoodTime(foodTime: "Dinner", food: [dinner])

        return [breakfastTime, lunchTime, dinnerTime]
    }
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return foodTimes.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodTimes[section].food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
        
            let foodTime = foodTimes[indexPath.section]
            let food = foodTime.food[indexPath.row]
            
            MainPageFoodName.text = food.foodName
            MainPageCalorieCount.text = "\(food.foodDetail[0].calorieCount) kcal"
            MainPagePreprationTime.text = "\(food.foodDetail[0].preprationTime) minutes"
            
            return cell

    }
    

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section : Int) -> String? {
        return foodTimes[section].foodTime
    }



}
