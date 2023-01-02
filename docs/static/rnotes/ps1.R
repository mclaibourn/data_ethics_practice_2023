# Data Visualization in R
# Problem Set 1: working in R, using dplyr, making basic plots
# Due 2022-08-31


# 1. Install/load packages ----

# If you've never installed devtools, 
#   you'll need to run `install.packages("devtools")` initially,
#   then load the package with `library(devtools)`, 
#   then install the legos package: `install_github("seankross/lego")` once,
#   then load the package with `library(lego)`.
# The next time you open RStudio to work with legos, 
#   you only need to load the lego package.
#   Similarly, if you've never used skimr, install it the first time.

# install.packages("devtools")
# library(devtools)
# install_github("seankross/lego")
library(lego)  # Installed from https://github.com/seankross/lego
library(tidyverse)
# install.packages("skimr")
library(skimr)


# 2. Explore the data and some R functions ----

# The main thing in the lego package is the legoset dataframe. 
#   Have a look at it. Run each of the following commands 
#   and explain what it does in the comment that follows.

head(legosets) 
# Answer: 

?legosets 
# Answer: 

glimpse(legosets) 
# Answer: 

View(legosets) 
# Answer: 

summary(legosets) 
# Answer: 

skim(legosets) 
# Answer: 

legosets <- legosets
# Answer: 



# 3. Use filter, select, arrange, count ----

# Generate code that answers the following questions 
# using only functions from dplyr: 
#   filter, select, arrange, count (and the pipe).
# You don't need to create new dataframes here; 
#   just pipe legosets into the appropriate functions
#   to print the result/answer to the console.

# a. Show the prices and themes of the  10 most expensive (in USD) legosets? 


# b. Pick one of the themes identified in the above list; 
#    how many sets are in the chosen theme?


# c. Within the same theme as above, what are the names, 
#     number of pieces, and prices of the 10 most expensive 
#     sets in the theme



# 4. Use group_by, summarize, mutate ----

# Generate code that answers the following questions 
#   using only functions from dplyr: 
#   group_by, summarize, mutate,
#   and filter, select, arrange, count 

# a. Find the number of sets within each theme; 
#    show the 10 themes with the most distinct sets
#    in descending order.


# b. Find the average cost, median cost, and number of legosets 
#    by year; What year saw the highest average price? 
#    The highest median price? The most sets?
#    Hint: Here I would create a new gropued data frame 
#    that I could use to answer each question.


# c. Duplo sets are distinct lego sets designed for toddlers. 
#    Add a new indicator variable for duplo to the legosets data.
#    (Hint: use ifelse() inside a mutate command) 
#    Then find the average number of pieces in Duplo sets
#    versus other Lego sets.


# d. Create a new dataframe to store the number of sets by theme 
#   (call the datafame themes, and the variable for number of sets num_sets).
#   Mutate the resulting theme variable to turn it into a factor with 
#   the levels sorted by the number of legosets -- we didn't talk about
#   factors yet, but there are just labeled categorical variables -- 
#   by using the command: mutate(Theme = fct_reorder(Theme, num_sets))
# In the resulting data frame, which themes have more than 100 lego sets?



# 5. ggplot, bars ----

# a. Using the themes dataframe you created above, make a barplot of the 
#   number of sets. 
# Hint: type ?geom_bar or ?geom_col into the console to learn 
#   more about the options


# b. add a fill aesthetic to the graph above mapped to the number of sets;
#   filter the dataset to include only themes with more than 50 sets;
#   and add coord_flip() as a layer



# 6. ggplot, lines ----

# a. Generate a line plot of the average price of legosets by year 
#    You can either create this as a new data frame, or create it
#    on the fly and pipe it into ggplot.
# Add a figure title and axis labels to improve the graph;
#     type ?labs in the console to learn more about the function.


# b. Repeat the figure above, but creating separate lines 
#    for duplo and other (non-duplo) legosets.



# 7. ggplot, scatterplot ----

# a. Create a scatterplot of price of a set by number of pieces in the set.
#   Try playing with alpha inside geom_point() to make the points more transparent. 
#   Alpha ranges betwen 0 and 1 and represents the number of points that 
#   would need to be overlaid to produce a fully opaque point. 
#   e.g., alpha = 1/4 means four points would have to sit at the same 
#   spot to make that point fully opaque.


# b. Now add a color aesthetic to distinguish duplo sets from other sets;
#    then add a new geom, geom_smooth(method = "lm") to overlay a 
#    linear regression line. 
#    Try changing the default colors of the points/lines with
#    scale_color_manual(values = c("color1", "color2));
#    pick any colors you like - Here are some named colors R knows: 
#    http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

