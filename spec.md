# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app -- used sinatra, corneal 
- [x] Use ActiveRecord for storing information in a database -- yes
- [x] Include more than one model class (e.g. User, Post, Category) -- Sword, Shield, User
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) -- User has many swords, User has many shields
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) -- Sword belongs to user, shield belongs to user
- [x] Include user accounts with unique login attribute (username or email) -- username cannot match any existing
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying -- both shields and swords do
- [x] Ensure that users can't modify content created by other users -- editing/deleting options not available if doesnt belong to user
- [x] Include user input validations -- if input is invalid does not accept 
- [-] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) -- did not attempt
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code -- it does

Confirm
- [x] You have a large number of small Git commits -- not as many as i should
- [x] Your commit messages are meaningful -- mostly
- [x] You made the changes in a commit that relate to the commit message -- mostly
- [x] You don't include changes in a commit that aren't related to the commit message -- mostly