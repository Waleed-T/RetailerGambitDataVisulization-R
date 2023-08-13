# Load required packages
library(ggplot2)
library(data.table)

# Set the working directory
setwd("D:/DU/visualisation/assignment-viz/project1/")  # Specify the correct directory

# Read data from a CSV file
viz <- fread('home_assignment_data_pricing.csv')

# Subset data for Xbox 360 category
viz_xbox360 <- subset(viz, category == "Xbox 360")

# Convert store_id to character type
viz_xbox360$store_id <- as.character(viz_xbox360$store_id)

# Subset data for selected store IDs
selected_store_ids <- c("18761", "428", "2151", "127", "236", "164", "578", "112", "12377")
viz_xbox360_storeid <- viz_xbox360[viz_xbox360$store_id %in% selected_store_ids,]

# Write the subset data to a CSV file
write.table(viz_xbox360_storeid, file = 'xbox_bnf.csv', sep = ",")

# Subset data for a specific product ID
specific_product_id <- "1341635"
viz_xbox360_storeid_pd <- viz_xbox360_storeid[viz_xbox360_storeid$product_id == specific_product_id,]

# Create visualizations for the selected data

# Violin plot
ggplot(viz_xbox360_storeid_pd, aes(store_id, price)) +
  geom_violin() +
  ggtitle("Comparing Xbox 360 Price Ranges Among 9 Stores")

# Boxplot
ggplot(viz_xbox360_storeid_pd, aes(store_id, price)) +
  geom_boxplot() +
  ggtitle("Comparing Xbox 360 Price Ranges Among 9 Stores")

# Path plot
ggplot(viz_xbox360_storeid_pd, aes(date, price, color = store_id)) +
  geom_path() +
  ggtitle("Comparing Stores' Competing Prices for Product 1341635")
