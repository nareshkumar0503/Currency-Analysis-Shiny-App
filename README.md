# Currency Analysis Shiny App

This Shiny app allows users to upload a CSV file containing currency exchange rate data and visualize it through line plots over time and a correlation heatmap.

## How to Use

1. **Upload Data**: Click on the "Choose CSV File" button and select the CSV file containing currency exchange rate data.

2. **View Currency Plot**: After uploading the file, a plot displaying the exchange rates of different currencies over time will be generated.

3. **View Correlation Heatmap**: Additionally, a correlation heatmap showing the correlation between different currencies will be displayed.

## Features

- **Dynamic Plotting**: The app dynamically generates plots based on the uploaded CSV file, allowing users to visualize currency trends and correlations.
- **Interactive**: Users can interact with the plots, such as zooming and panning, for closer examination of the data.
- **Customization**: The plots are customizable with different colors and themes for better visualization.

## Libraries Used

- `shiny`: For creating the interactive web application.
- `ggplot2`: For generating plots.
- `readr`: For reading CSV files.
- `reshape2`: For reshaping data frames.

## Getting Started

To run this Shiny app locally, you need to have R and the required packages installed. Follow these steps:

1. Clone this repository to your local machine.
2. Install the necessary R packages mentioned in the `library()` calls at the beginning of the `app.R` file.
3. Run the `app.R` script in RStudio or any R environment.

## Example Data Format

The CSV file should have the following format:

![image](https://github.com/nareshkumar0503/Currency-Analysis-Shiny-App/assets/127754159/f7380673-8dd0-4991-83e1-ffbef07090b1)


## Screenshot

![Screenshot 2024-05-08 234659](https://github.com/nareshkumar0503/Currency-Analysis-Shiny-App/assets/127754159/74d96ded-a03e-49e6-a3f5-35a753e44895)


