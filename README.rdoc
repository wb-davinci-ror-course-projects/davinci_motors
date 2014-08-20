== README

#### This is a Ruby on Rails application I wrote for the Building
#### the Toolbelt of a RoR Developer at the DaVinci Institute.

#### ruby-2.1.2
#### rails-4.1.4

#### Write a query to find the following:

>### How many female students have red hair?

#### Student.where(hair_color: "red”).count


#####(0.3ms)  SELECT COUNT(*) FROM "students"  WHERE "students"."hair_color" = 'red'
### => 126

>### How many male students are > 56 inches tall?

#### Student.where("height > 56”).count

##### (27.9ms)  SELECT COUNT(*) FROM "students"  WHERE (height > 56)
### => 288

>### How many students were born on December 25th? None

#### Student.where("strftime('%d', date_of_birth) + 0 = ?", 25).where("strftime('%m', date_of_birth) + 0 = ?", 12)

##### (0.6ms)  SELECT COUNT(*) FROM "students"  WHERE (strftime('%d', date_of_birth) + 0 = 25) AND (strftime('%m', date_of_birth) + 0 = 12)
### => 0

double checked with:

#### Student.where("strftime('%d', date_of_birth) + 0 = ?", 25).where("strftime('%m', date_of_birth) + 0 = ?", 8)

##### (0.6ms)  SELECT COUNT(*) FROM "students"  WHERE (strftime('%d', date_of_birth) + 0 = 25) AND (strftime('%m', date_of_birth) + 0 = 8)
###  => 1

>### How many students have a birthday today?

#### Student.where("strftime('%m', date_of_birth) + 0 = ? ", Time.now.month).where("strftime('%d', date_of_birth) + 0 = ? ", Time.now.day).count

##### (0.6ms)  SELECT COUNT(*) FROM "students"  WHERE (strftime('%m', date_of_birth) + 0 = 8 ) AND (strftime('%d', date_of_birth) + 0 = 19 )
### => 4





