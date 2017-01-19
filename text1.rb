assignment 2
# 
# Start a new project (the name of the project should be 'dojo_ninjas')
# Create appropriate tables/models using "rails generate model", "rake db:create", and "rake db:migrate"
# Using ruby console
# Create 3 dojos (insert some blank entries just to make sure it's allowing you to insert empty entries
# Change your models so that it does the following validations
# For the dojo, require the presence of the name, city, and state; also require the state to be two characters long
# For the ninja, require the presence of the first name and last name
# Make sure that your ninja model belongs to the dojo (specify this in the model for both the dojo and the ninja)
# Using ruby console
# Delete the three dojos you created (e.g. Dojo.find(1).destroy; also look up destroy_all method)
# Create 3 additional dojos by using Dojo.new().
# Try to create a few more dojos but without specifying some of the required fields. Make sure that the validation works and generates the errors.
# Create 3 ninjas that belong to the first dojo you created
# Create 3 more ninjas and have them belong to the second dojo you created
# Create 3 more ninjas and have them belong to the third dojo you created
# Make sure you understand how to get all of the ninjas for any dojo (e.g. get all the ninjas for the first dojo, second dojo, etc)
# Delete the second dojo.  How could you adjust your model so that it automatically removes all of the ninjas associated with that dojo?
# How would you only retrieve the first_names of the ninja that belongs to the second dojo and order the result by created_at DESC order?

1. rails new dojo_ninjas -d mysql
2. rails g model dojo name:string city:string state:string
   rails g model ninja first_name:string last_name:string dojos:references
   rake db:create
   rake db:migrate
3. Dojo.new().save
   Dojo.new(:name => "CodingDojo Silicon Valley", :city => "Mountain View", :state => "CA").save
   Dojo.new(:name => "CodingDojo New York", :city => "New York", :state => "NY").save
4. class Dojos < ActiveRecord::Base

   	validates :name, :city, :state, :presence => true
   	validates :state, :length => { :is => 2 }

   	has_many :ninjas, :dependent => :destroy
   end
5. class Ninjas < ActiveRecord::Base
     belongs_to :dojo

     validates :first_name, :last_name, :presence => true

   end      
6.1 Dojo.find(1).destroy
    Dojo.destroy_all
6.2 Dojo.new(:name => "CodingDojo Silicon Valley", :city => "Mountain View", :state => "CA").save
    Dojo.new(:name => "CodingDojo New York", :city => "New York", :state => "NY").save
    Dojo.new(:name => "CodingDojo Seattle", :city => "Seattle", :state => "WA").save
6.4 p = Dojo.find(5)
    p.ninjas.create(:first_name => "Jane", :last_name => "Harris")    
    p.ninjas.create(:first_name => "Jamie", :last_name => "Fonda")
    p.ninjas.create(:first_name => "John", :last_name => "Doe")
6.5 Changed p to different Dojo id
6.6 Changed p to different Dojo id
6.7 Ninja.all.where(dojo_id: 7)
6.8 p = Dojo.find(6).destroy
    Ninjas are destroyed too, as defined in the Dojo class (has_many :ninjas, :dependent => :destroy)
