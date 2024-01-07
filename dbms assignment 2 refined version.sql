create table restaurants(
restaurantid varchar(10) primary key not null,
restaurant_name varchar(30) not null,
restaurant_location text not null,
restaurant_phone varchar(11)
);

create table food(
foodid varchar(10) primary key not null,
food_name varchar(30) not null,
food_description text not null,
food_price double not null,
img varchar(255) not null
);


create table category(
category_id varchar(10) primary key not null,
category_name enum('veg','non-veg') not null
);


create table food_category(
food_category_id varchar(10) primary key not null,
food_category_name varchar(30) not null
);

create table deliveryperson(
delivery_person_id varchar(10) primary key not null,
delivery_person_name varchar(30) not null,
delivery_person_address text not null,
delivery_person_contact varchar(11) not null,
delivery_person_bloodgroup varchar(20) not null
);


create table customer(
customer_id varchar(10) primary key not null,
customer_name varchar(30) not null,
customer_address text not null,
customer_contact varchar(11) not null,
customer_email varchar(50) not null
);

create table role(
role_id varchar(10) primary key not null,
role_name varchar(30) not null
);


create table user_table(
user_id varchar(10) primary key not null,
username varchar(10),
password varchar(255)
);

create table user_role(
user_role_id varchar(10) primary key not null,
user_id varchar(10),
role_id varchar(10),
foreign key(user_id) references user_table(user_id),
foreign key(role_id) references role(role_id)
);

create table customer_user(
cust_user_id varchar(10) primary key not null,
user_id varchar(10),
customer_id varchar(10),
foreign key(user_id) references user_table(user_id),
foreign key(customer_id) references customer(customer_id)
);


create table restaurant_user(
rest_user_id varchar(10) primary key not null,
user_id varchar(10),
restaurantid varchar(10),
foreign key(user_id) references user_table(user_id),
foreign key(restaurantid) references restaurants(restaurantid)
);

create table delivery_user(
delivery_user_id varchar(10) primary key not null,
user_id varchar(10),
delivery_person_id varchar(10),
foreign key(user_id) references user_table(user_id),
foreign key(delivery_person_id) references deliveryperson(delivery_person_id)
);

create table food_category_mapping(
food_category_id varchar(10) primary key not null,
foodid varchar(10),
category_id varchar(10),
sub_category_id varchar(10),
foreign key(foodid) references food(foodid),
foreign key(category_id) references category(category_id),
foreign key(sub_category_id) references food_category(food_category_id)
);

create table customer_cart_details(
cart_id varchar(10) primary key not null,
customer_id varchar(10),
date_of_order datetime,
foreign key(customer_id) references customer(customer_id)
);

create table orders(
cart_details_id varchar(10),
delivery_user_id varchar(10),
restaurant_user_id varchar(10),
foreign key(cart_details_id) references cart_details(cart_id),
foreign key(delivery_user_id) references delivery_user(delivery_user_id),
foreign key(restaurant_user_id) references restaurant_user(rest_user_id)	
);

create table cart_details(
cart_details_id varchar(10) primary key not null,
cart_id varchar(10),
foodid varchar(10),
quantity int,
total_price double not null,
foreign key(cart_id) references customer_cart_details(cart_id),
foreign key(foodid) references food(foodid)
);


create table offers(
offercode varchar(10) primary key not null,
foodid varchar(10),
restaurantid varchar(10),
offer_price double not null,
offer_description text not null,
foreign key(foodid) references food(foodid),
foreign key(restaurantid) references restaurants(restaurantid)
);

show tables;
