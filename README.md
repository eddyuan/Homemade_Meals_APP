# Multi level association

## Modify UserModel

Include `received_ratings` and define `cook_rating` method

```rb
# user.rb
...

# Because we used :reviews symbol already for reviews that are
# create by the user, we should now define another name for
# the reviews that are received by the user through meals
has_many :received_reviews, # new name
           class_name: "Review", # define the class
           through: :meals, # through :meals that are belong to the user
           source: :reviews # :reviews that are in the :meals defined above
...

# define a public function
# make sure the size is > 0
def cook_rating
    self.received_reviews.count > 0 ? self.received_reviews.average(:rating) : 0
end
```

## MealsController implementation

```rb
# meals_controller.rb
...
def index
  @meals = Meal.order(updated_at: :desc)
  cooks = User.where(is_cook: :true)
  @cooks = cooks.sort_by(&:cook_rating).reverse[0...10]
end
...
```

## We can also define `average_rating` for meal

```rb
def average_rating
  self.reviews.count > 0 ? self.reviews.average(:rating) : 0
end
```

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
