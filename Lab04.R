library(ggplot2)
library(viridis)
library(RColorBrewer)
library(dplyr)
library(scales)

data("mpg")
# head(mpg)


#Analysis
cor(mpg[, c("cyl", "hwy")])
# Less cylinder more mileage

#ggplot(mtcars, aes(x = wt, y = mpg)) +
#  geom_point() +
 # geom_smooth(method = "lm", se = FALSE)

# Group by cylinder (drv)


# 1.a.
ggplot(mpg, aes(x = cyl, y = hwy, color = factor(drv))) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  scale_color_viridis(discrete = TRUE) +
  
  labs(
    title = "Highway Mileage vs. Number of Cylinders",
    x = "Number of Cylinders (cyl)",
    y = "Highway Mileage (hwy)",
    color = "Drive Type"
  )

# 1.b.
# Map cyl to color
ggplot(mpg, aes(x = displ, y = hwy, color = factor(cyl))) +
  geom_point() +
  scale_color_viridis(discrete = TRUE) +
  labs(
    title = "Highway Mileage vs. Engine Displacement",
    x = "Engine Displacement (displ)",
    y = "Highway Mileage (hwy)",
    color = "Number of Cylinders (cyl)"
  )

# Map cyl to shape
ggplot(mpg, aes(x = displ, y = hwy, shape = factor(cyl))) +
  geom_point() +
  labs(
    title = "Highway Mileage vs. Engine Displacement",
    x = "Engine Displacement (displ)",
    y = "Highway Mileage (hwy)",
    shape = "Number of Cylinders (cyl)"
  )

# Map cyl to size
ggplot(mpg, aes(x = displ, y = hwy, size = factor(cyl))) +
  geom_point() +
  labs(
    title = "Highway Mileage vs. Engine Displacement",
    x = "Engine Displacement (displ)",
    y = "Highway Mileage (hwy)",
    size = "Number of Cylinders (cyl)"
  )


# 1 c.
ggplot(mpg, aes(x = displ, y = hwy, color = factor(drv))) +
  geom_point() +
  stat_smooth() +
  labs(
    title = "Highway Mileage vs. Engine Displacement",
    x = "Engine Displacement (displ)",
    y = "Highway Mileage (hwy)",
    color = "Drive Type"
  )

# 1 d.
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point(size = 1) +
  facet_wrap(. ~ class, scales = "free") +
  theme_bw() +
  labs(
    title = "Highway Mileage vs. City Mileage by Class(Car)",
    x = "City Mileage (cty)",
    y = "Highway Mileage (hwy)"
  )



# 2. a
data("diamonds")


data(diamonds)

# Create the bar plot
ggplot(diamonds, aes(x = cut, fill = color)) +
  geom_bar(position = "dodge") +
  scale_fill_brewer(palette = "Set3") +
  theme_classic() +
  labs(title = "Count of Diamonds by Cut and Color",
       x = "Cut",
       y = "Count",
       fill = "Color")

# 2 b 
ggplot(diamonds, aes(x = cut, fill = color)) +
  geom_bar(position = "dodge") +
  scale_fill_viridis_d() +
  theme_minimal() +
  labs(title = "Count of Diamonds by Cut and Color",
       x = "Cut",
       y = "Count",
       fill = "Color")+
    coord_polar(start=0)

#2c

# Calculate the average price for each combination of cut and color
avg_price <- diamonds %>%
  group_by(cut, color) %>%
  summarize(avg_price = mean(price))

# Create the heatmap
ggplot(avg_price, aes(x = cut, y = color, fill = avg_price)) +
  geom_tile() +
  scale_fill_gradient(low ='white', high = "purple", name = "Average Price") +
  labs(
    title = "Average Price of Diamonds by Cut and Color",
    x = "Cut",
    y = "Color"
  ) +
  theme_light() +
  theme(legend.position = "bottom")


# 3.
ggplot(economics, aes(x = date)) + 
  geom_area(aes(y = psavert, fill = "psavert"), alpha = 0.6) +  # Add area for psavert
  geom_area(aes(y = uempmed, fill = "uempmed"), alpha = 0.6) +  # Add area for uempmed
  scale_x_date(labels = date_format("%Y-%m")) +  # Format the date axis
  scale_fill_brewer(palette = "Set1") +  # Apply a color palette from RColorBrewer
  theme_dark() +  # Apply dark theme
  labs(title = "Personal Savings Rate and Median Duration of Unemployment Over Time",
       x = "Date",
       y = "Values",
       fill = "Variables") # Label the axes and legend

