# recipes_app

A project to showcase my flutter skills with BLOC

Clone the project & then:
- flutter pub get
- flutter run


For this project i used BLOC + Clean Architecture

Screen -> BLOC -> UseCases -> Repository -> DataAccessObject -> Model

There are 3 screens:

- Recipes
- Search Recipe
- Detail

And 2 BLOC's:

- RecipesBloc
- RecipeSearchBloc

I think search screen and recipes screen should be one screen, beacuse all functions can be gathered in one single bloc rather than 2 thats does mostly the same.

Made a simple navigation between the screen with the flutter navigator.

Used cached images to load the network images of the recipes

Limitations:

The API doesn't expose a method for fetching all meals. There are inneficient ways to do it, like fetch every letter and joining the recipes into a single lists. Had to create 29 isolates and then gather the results into one single list.

The values return for the API are in a terrible state, it has 20 posible ingredient keys instead of a list, same for measures

I had to reconvert the response into a usable dart class.

Some things i would improve is to have a custom backend made in right way, with methods to consume the list as it should be dispatched.

Also moving the search logic into the list logic, adding CRUD methods and favorite methods into the API.

Doing a better implementacion for multiple request like the one that joins the recipes

Adding more functionality like modify and create recipes.