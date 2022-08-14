create database quiz_app;
use quiz_app;

create table user(
	user_id int auto_increment primary key,
    username varchar(50),
    password varchar(50)
);
truncate table user;
drop table user;

insert into user (username, password) values("John", "test"),("Bill","12345");
select * from user;

create table feedback(
	feedback_id int auto_increment primary key,
    stars int,
    feedback varchar(300)
);
truncate table feedback;
drop table feedback;

select * from feedback;

create table quiz(
	quiz_id int auto_increment primary key,
    quiz_name varchar(50)
);
truncate table quiz;
drop table quiz;

insert into quiz (quiz_name) values("Geography");
insert into quiz (quiz_name) values("Math");
insert into quiz (quiz_name) values("History");
select * from quiz;

create table question(
	question_id int auto_increment primary key,
    quiz_id int,
    question_description varchar(100),
    mc1 varchar(50),
    mc2 varchar(50),
    mc3 varchar(50),
    mc4 varchar(50),
    answer varchar(50),
    foreign key (quiz_id) references quiz (quiz_id)
);
truncate table question;
drop table question;

insert into question (quiz_id,question_description,mc1,mc2,mc3,mc4,answer) values
(1,"What is the largest contintent on Earth?", "Europe", "Asia", "Africa", "Australia", "Asia"), -- 1
(1,"What is the capital of France?", "Paris", "London", "Hamburg", "Madrid","Paris"), -- 2
(1,"What is the longest river in Africa?", "Niger", "Congo", "Kasai", "Nile","Nile"), -- 3
(1,"What is the largest country in the world?", "China", "Canada", "Russia", "India","Russia"), -- 4
(1,"How many states are in the US?", "50", "52", "55", "48", "50"), -- 5
(1,"What is the smallest country in the world?", "Vatican city", "Monaco", "Nauru", "Tuvalu","Vatican city"), -- 6
(1,"Which US state has the most active volcanoes?", "Alaska", "Idaho", "Montana", "Wyoming", "Alaska"), -- 7
(1,"What is the largest country in South America?", "Bolivia", "Chile", "Argentina", "Brazil","Brazil"), -- 8
(1,"Which continent contains the most freshwater?", "North America", "Asia", "Europe", "Antarctica","Antarctica"), -- 9
(1,"What is the largest state in the US?", "New York", "Alaska", "California", "Texas","Alaska"), -- 10
(1, "What is the largest sea in the world?", "Red", "Caribbean", "Caspian", "Arabian","Caspian"), -- 11
(1,"Which country has the most lakes?", "US", "Canada", "Australia", "Mexico","Canada"), -- 12
(1,"What is the coldest sea in the world?", "Caspian", "Red", "Dead", "White","White"), -- 13
(1,"How many great lakes are there in the US?", "4", "5", "6", "3","5"), -- 14
(1, "Which country has the most islands?", "Indonesia", "UK", "Sweden", "Phillipines","Sweden"), -- 15
(1, "Which US state has the cleanest water?", "New Jersey", "Florida", "Maine", "Rhode Island", "Rhode Island"), -- 16
(1, "Which great lake is entirely within US borders?", "Michigan", "Superior", "Erie", "Ontario", "Michigan"), -- 17
(1,"What is the longest river in the US?", "Mississippi", "Colorado", "Missouri", "Ohio", "Missouri"), -- 18
(1,"How many countries does the US share a border with?", "2", "3", "4", "1", "2"), -- 19
(1,"What is the smallest state in the US?", "New Jersey", "Connecticut", "Rhode Island", "Vermont", "Rhode Island"); -- 20
select * from question natural join quiz where quiz_name = "Geography";

insert into question (quiz_id,question_description,mc1,mc2,mc3,mc4,answer) values
(2,"2+2=?", "4", "7", "1", "4", "4"), -- 1
(2,"4*6=?", "25","28","24","30","24"), -- 2
(2,"30/5=?", "6", "7", "8", "9", "6"), -- 3
(2,"10+10/2=?", "37","19","15","18","15"), -- 4
(2,"8-2=?","2","9","5","6","6"), -- 5
(2,"9+4=?","16","13","14","17","13"), -- 6
(2,"7*8=?", "59","52","56","57","56"), -- 7
(2,"3*7=?","21","27","29","22","21"), -- 8
(2,"8*5/2=?","27","20","24","25","20"), -- 9
(2,"8*8=?", "64", "68","69","63", "64"), -- 10
(2,"10*9=?", "85","89","91","90","90"), -- 11
(2,"4*11=?","48","41","44","45","44"), -- 12
(2,"4+7=?","16","17","18","11","11"), -- 13
(2,"53-6=?", "42","48","46","47","47"), -- 14
(2,"46-5=?","41","43","42","44","41"), -- 15
(2,"42/2=?","25","24","21","20","21"), -- 16
(2,"9*6=?","52","59","54","56","54"), -- 17
(2,"3*8=?","24","21","25","26","24"), -- 18
(2,"4+10=?","15","17","14","13","14"), -- 19
(2,"8+2=?","12","9","10","11","10"); -- 20
select * from question natural join quiz where quiz_name = "Math";

insert into question (quiz_id,question_description,mc1,mc2,mc3,mc4,answer) values
(3,"Which of these countries did the Soviet Union NEVER invade?","Afghanistan","Finland","Poland","Sweden","Sweden"), -- 1
(3,"Who was the first person to orbit the Earth?","Neil Armstrong","Yuri Gagarin","John Glenn","Valentina Tereshkova","Yuri Gagarin"), -- 2
(3,"Which of these cities was NOT founded by the Romans?","Alexandria","Cologne","London","Rome","Alexandria"), -- 3
(3,"Where did Zoroastrianism originate?","India","Egypt","Persia","South America","Persia"), -- 4
(3,"Which of these writers was NOT English?","Jane Austen","Agatha Christie","Charles Dickens","Oscar Wilde","Oscar Wilde"), -- 5
(3,"In terms of weapons, what is a pike?","An IED","A spiked helmet","A trench knife","A very long spear","A very long spear"), -- 6
(3,"Why did whalers hunt sperm whales?","For meat","For oil","For skin","For sport","For oil"), -- 7
(3,"How many wives did Henry VIII have?","1","2","3","6","6"), -- 8
(3,"Which of the following was NOT originally invented in China?","Concrete","Gunpowder","Paper money","Silk","Concrete"), -- 9
(3,"What was the capital of the Byzantine Empire?","Rome","Jerusalem","Alexandria","Constantinople","Constantinople"), -- 10
(3,"Which came first?","Paleolithic","Bronze Age","Neolithic","Classical Antiquity","Paleolithic"), -- 11
(3,"Which of these crops DIDN'T come from the New World?","Tomatoes","Maize","Tobacco","Hemp","Hemp"), -- 12
(3,"Where did Karl Marx spend most of his adult life?","Moscow","London","Buenos Aires","Berlin","London"), -- 13
(3,"What country was formerly known as Southern Rhodesia?","Greece","Zimbabwe","Uruguay","Kenya","Zimbabwe"), -- 14
(3,"Where was the Metric System developed?","Greece","France","Italy","US","France"), -- 15
(3,"What style of architecture is exemplified by the Notre Dame cathedral in Paris?","Art Deco","Brutalist","Gothic","Neo-classical","Gothic"), -- 16
(3,"How long did Hitler envision his Third Reich lasting?","10 years","100 years","1000 years","1 million years","1000 years"), -- 17
(3,"When did WWII end?","1923","1931","1937","1945","1945"), -- 18
(3,"When was Lincoln assassinated?","1865","1881","1899","1910","1865"), -- 19
(3,"When did the Cuban Missile Crisis occur?", "1950","1962","1969","1977","1962"); -- 20

select * from question natural join quiz where quiz_name = "History";