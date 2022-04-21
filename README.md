# Final Project
- Name : Alfian Badrul Isnan
- ID : KM_G2BE4072

# Rails on Replit

This is a template to get you started with Rails on Replit. It's ready to go so you can just hit run and start coding!

This template was generated using `rails new` (after you install the `rails` gem from the packager sidebar) so you can always do that if you prefer to set it up from scratch. The only had two make config changes we had to make to run it on Replit:

- bind the app on `0.0.0.0` instead of `localhost` (see `.replit`)
- allow `*.repl.co` hosts (see `config/environments/development.rb`)
- allow the app to be iframed on `replit.com` (see `config/application.rb`)

## Running the app

Simple hit run! You can edit the run command from the `.replit` file.

## Running commands

Start every command with `bundle exec` so that it runs in the context of the installed gems environment. The console pane will give you output from the server but you can run arbitrary command from the shell without stopping the server.

## Database

SQLite would work in development but we don't recommend running it in production. Instead look into using the built-in [Replit database](http://docs.replit.com/misc/database). Otherwise you are welcome to connect databases from your favorite provider. 

## Help

If you need help you might be able to find an answer on our [docs](https://docs.replit.com) page. Alternatively you can [ask in the community](https://replit.com/talk/ask). Feel free to report bugs [here](https://replit.com/bugs) and give us feedback [here](https://Replit/feedback).

## Sprint Task
### SPRINT 1 : Initializing
### SPRINT 2 : Designing Database Relation

Diagram : https://dbdiagram.io/d/626132991072ae0b6ac3800f
[Entity Relational Diagram](https://raw.githubusercontent.com/alfianisnan26/gigih-final-project/main/dbdiagram.png)

<!-- - Default : created_at, modified_at, created_by

- User : name, email, password, phone, address, is_admin
- Category : name, description
- Tags : name
- Menu : name, price, stock, FK:Category, description
- TagRelation : FK:Menu, FK:Tags
- Voucher : min_subtotal, max_discount, discount, name, code, description, is_active, stock, valid_thru
- Invoice : customer:FK:User, waiter:FK:User, subtotal, voucher, total, charge, return, paid_at, sent_at, done_at
- Order : FK:Menu, real_price, quantity, FK:Invoice -->
  
### SPRINT 3 : Models Coding Implementation
### SPRINT 4 : Controller Coding Implementation
### SPRINT 5 : Integrating with Twilio
### SPIRNT 6 : User Management and Administrator
### SPRINT 7 : User Interface
### SPRINT 8 : Wrapping Up