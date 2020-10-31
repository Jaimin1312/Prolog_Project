domains
Name,Company,Category,Sub_Category,Sel_Item=symbol
Price=integer

database
itemdatabase(Name,Company,Category,Sub_Category,Price) 

predicates
items(Name,Company,Category,Sub_Category,Price)
start
sameprice(symbol)
samecategory(symbol)
allcompanyitems(symbol)
option(symbol,integer)
project(integer)
cmp(symbol,symbol)
Subcategoryoption(integer)
PricesubOption(integer)
add(char,integer)
max(integer,integer,integer)
min(integer,integer,integer)
list(integer)

clauses
start:-write("----Options----"),nl,
write("1.Suggestions for your item"),nl,
write("2.Total of each (Sub Category)"),nl,
write("3.find item according to your price "),nl,
write("4. Add item to cart"),nl,
write("5. Maximum and Minimum total selling of all item from 2017 to 2019"),nl,
write("6. compound object used here"),nl,
write("7. Perform in Database operation"),nl,
readint(X),project(X).


project(1):-write("Enter Particular Item:-"),readln(Sel_Item),nl,
write("1.Items within price for a Particular Item"),nl,
write("2.Items of same Sub_Category of Particular Item"),nl,
write("3.All Items of Same Company"),nl,
write("Select Option:-"),readint(Option),nl,items(Sel_Item,X,Y,Z,W),
write("Details of your selected item:-"),nl,
write("Name:-'"),write(Sel_Item),write("',Company:-'"),write(X),
write("',Category:-'"),write(Y),write("',Sub_Category:-'"),write(Z),
write("',Price:-'"),write(W),write("'"),nl,nl,
write("Here are suggestions based on your Item:-"),
option(Sel_Item,Option),nl.

project(2):-
write("Enter Particular Sub category"),nl,
write("1.Noodles"),nl,
write("2.Biscuit"),nl,
readint(Suboption),nl,Subcategoryoption(Suboption).

project(3):-write("1. find item under your price and particular category"),nl,
write("2. find more costly price item"),nl,
readint(Priceop),PricesubOption(Priceop).

project(7):-write("1. Enter new Product Details"),nl,
write("2. Delete a Product Details"),nl,
write("3. Display All Product Details"),nl,
write("4. Display list of all Procuct :"),nl,
write("Enter choice : "),
readInt(In),
list(In).

project(5):-write("Enter total selling price in 2017:"),readint(Q1),
write("Enter total selling price in year 2018 :"),readint(Q2),
write("Enter total selling price in year 2019:"),readint(Q3),
write("Maximum total selling price from 2017 to 2019 is"),max(Q1,Q2,Q3),
write("Minimum total selling price from 2017 to 2019 is"),min(Q1,Q2,Q3),nl.

project(4):-write("You can start adding item to cart"),nl,add('y',0).
add('n',F):-write("-----CART-----"),nl,write("Total amount of your cart item price:",F),nl.
add('y',B):-write("enter name of your item: "),readln(C),nl,
items(C,_,_,_,D),T=B+D,write("Continue??(y/n): "),readchar(E),nl,add(E,T). 




Subcategoryoption(1):-write("Maggie price 15"),nl,
write("YiPPee price 15"),nl,
write("Schezwan price 50"),nl,
write("Maggie Enter Quantity"),readint(M1),nl,
write("YiPPee Enter Quantity"),readint(M2),nl,
write("Schezwan Enter Quantity"),readint(M3),nl,
Total = (M1 * 15) + (M2 * 15) + (M3 * 50),
write("Total Price: "),write(Total),nl,
X1=10/100,DC1=Total*X1,nl,
write("Total Discount Price: "),write(DC1),nl.

Subcategoryoption(2):-write("Aero Milk price 20"),nl,
write("Holidays price 25"),nl,
write("Bounnce price 15"),nl,
write("DarkFantasy price 50"),nl,
write("Aero Milk Enter Quantity"),readint(M1),nl,
write("Holidays Enter Quantity"),readint(M2),nl,
write("Bounnce Enter Quantity"),readint(M3),nl,
write("DarkFantasy Enter Quantity"),readint(M4),nl,
Total = (M1 * 20) + (M2 * 25) + (M3 * 15) + (M4 * 50),nl,
write("Total Price: "),write(Total),nl,
X2=10/100,DC2=Total*X2,nl,
write("Total Discount Price: "),write(DC2),nl.



PricesubOption(1):-write("Enter price and Sub-category"),nl,readint(P1),nl,readln(Categoryname),nl,
items(A,B1,C,Categoryname,D),not(P1<D),write(A, ":",D,"rs."),nl,fail.

PricesubOption(2):-write("Enter names of item"),nl,readln(F),nl,readln(G),cmp(F,G),nl.
cmp(F,G):-items(F,_,_,_,H),items(G,_,_,_,I),
H>I,!,nl,write("costly:",F," ",H,"rs");
items(G,_,_,_,I),nl,write("costly:",G,"",I,"rs").

max(Q1,Q2,Q3):-Q1>=Q2,Q1>=Q3,write(Q1,"is maximum "),nl.
max(Q1,Q2,Q3):-Q2>=Q1,Q2>=Q3,write(Q2,"is maximum"),nl.
max(Q1,Q2,Q3):-Q3>=Q1,Q3>=Q2,write(Q3,"is maximum"),nl.
min(Q1,Q2,Q3):-Q1<=Q2,Q1<=Q3,write(Q1,"is minimum"),nl.
min(Q1,Q2,Q3):-Q2<=Q3,Q2<=Q1,write(Q2,"is minimum"),nl.
min(Q1,Q2,Q3):-Q3<=Q1,Q3<=Q2,write(Q3,"is minimum"),nl.

list(1):-write("Enter Item Name : "),readln(Nameitem),
write("Enter Company Name : "),readln(Company_name),
write("Enter Category Name : "),readln(Category_name),
write("Enter Sub Category Name : "),readln(Subcategory_name),
write("Enter Price : "),readint(Price),
assert(itemdatabase(Nameitem,Company_name,Category_name,Subcategory_name,Price)),save("Item.txt").


list(2):-write("Enter Item Name : "),readln(Nameofitem),
consult("Item.txt"),
retract(itemdatabase(Nameofitem,_,_,_,_)),
save("Item.txt").

list(3):-write("Enter Item Name : "),readln(Nameit),
consult("Item.txt"),
itemdatabase(Nameit,X,Y,Z,W),
write("Name : ",Nameit," Company : ",X," Category : ",Y," Sub_Category : ",Z," price : ",W),nl.

list(4):-consult("Item.txt"),itemdatabase(K,A,B,C,D),
write("Name : ",K," Company : ",A," Category : ",B," Sub_Category : ",C," price : ",D),nl.

option(X,1):-nl,sameprice(X).
option(X,2):-nl,samecategory(X).
option(X,3):-nl,allcompanyitems(X).

sameprice(X):-items(X,_,A,B,P),items(Z,Y,A,B,W),not(Z=X),W<=P,
write("Item:-'"),write(Z),write("',Company:-'"),write(Y),
write("',Category:-'"),write(A),write("',Sub_Category:-'"),write(B),write("',Price:-'"),write(W),write("'"),nl.

samecategory(X):-items(X,_,Y,Q,_),items(Z,V,Y,Q,P),not(Z=X),
write("Item:-'"),write(Z),write("',Company:-'"),write(V),
write("',Category:-'"),write(Y),write("',Sub_Category:-'"),write(Q),write("',Price:-'"),write(P),write("'"),nl.

allcompanyitems(X):-items(X,Y,_,_,_),items(A,B,C,D,E),Y=B,write("Item:-'"),write(A),write("',Company:-'"),write(B),
write("',Category:-'"),write(C),write("',Sub_Category:-'"),write(D),write("',Price:-'"),write(E),write("'"),nl.


items("Maggie","Nestle","Food","Noodles",15).
items("YiPPee","Sunfeast","Food","Noodles",15).
items("Schezwan","Ching's","Food","Noodles",50).
items("Aero Milk","Nestle","Food","Biscuit",20).
items("Holidays","Nestle","Food","Biscuit",25).
items("Bounnce","Sunfeast","Food","Biscuit",15).
items("DarkFantasy","Sunfeast","Food","Biscuit",50).
items("cheeses","Amul","Food","Dairy",50).
items("eggs","Himalay","Food","Dairy",90).
items("milk","Amul","Food","Dairy",18).
items("yogurt","Amul","Food","Dairy",30).
items("butter","Amul","Food","Dairy",50).
