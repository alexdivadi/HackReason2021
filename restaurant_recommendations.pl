%Find Element in List
contains(X, [X|_]).
contains(X, [Y|Z]) :- contains(X, Z).

%Functors
food(Name).
restaurant(Name, menu(T), Price).
menu([X|T]).

%Food attributes
american(X) :- not ethnic(X).
vegan(X) :- -contains_animal_products(X).
vegetarian(X) :- not contains_animal_products(X).
gourmet(X) :- -regular(X).
junk(X) :- -healthy(X).

%Restaurant attributes
cheap(restaurant(N,M,P)) :- restaurant(N,M,P), P =< 2.
fast_food(restaurant(N,M,P)):- cheap(restaurant(N,M,P)), contains(Food, M), junk(Food), not gourmet(Food).
expensive(restaurant(N,M,P)) :- restaurant(N,M,P), P > 3.
fancy(restaurant(N,M,P)) :- expensive(restaurant(N,M,P)), contains(Food, M), gourmet(Food).

%Foods
food(cheeseburger). contains_animal_products(cheeseburger).
food(pasta).
food(fries). junk(fries).
food(taco). contains_animal_products(taco).
food(burrito). contains_animal_products(burrito). ethnic(burrito).
food(pizza). contains_animal_products(pizza).
food(salad). vegan(salad). healthy(salad).
food(curry). ethnic(curry).
food(sushi). contains_animal_products(sushi). ethnic(sushi). gourmet(sushi).

%Restaurants
restaurant('The Spaghetti Factory', [pizza, pasta], 4).
restaurant('Bob\'s Bistro', [cheeseburger, salad, fries], 3).
restaurant('Torchy\'s',[taco, burrito, fries], 1).
restaurant('Taj Mahal',[curry, salad], 2).
restaurant('Sushi House',[sushi], 5).

%Queries
%?- fancy(_).
%?- restaurant(_, Menu, _), contains(Food, Menu), vegetarian(Food), american(Food).
%?- fast_food(restaurant(_, Menu, _)), contains(Food, Menu), ethnic(Food).
%?- cheap(restaurant(_, Menu, _)), contains(Food, Menu), vegan(Food).
