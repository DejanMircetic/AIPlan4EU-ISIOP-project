
df_tsb %>%
  filter(product_ID==params$ID) %>%
  #index_by(month = yearmonth(date)) %>%
  summarise(Consumption = sum(count)) %>%
  autoplot(Consumption)+
  ggtitle("Fig 2. Visualisation of product demand") +
  xlab("Date")+
  ylab("Demand")+
  theme_bw()
  
  
  df_tsb %>%
    filter(product_ID==params$ID) %>%
    index_by(month = yearmonth(date)) %>%
    summarise(Consumption = sum(count)) %>%
    gg_season(Consumption, labels = "both")+
    ggtitle("Fig 3. Seasonal product demand")+
    ylab("Demand")+
    theme_bw()
  

  df_tsb %>%
    filter(product_ID==params$ID) %>%
    index_by(month = yearmonth(date)) %>%
    summarise(Consumption = sum(count)) %>%
    gg_subseries(Consumption, labels = "both")+
    ggtitle("Fig 4. Summarized seasonal demand")+
    ylab("Demand")+
    theme_bw()
  
  

  pm <- ggpairs(measurments, columns = c("coeff_of_var", "trend_strength", "seasonal_strength_year", "seasonal_peak_year","seasonal_trough_year","acf1", "lambda_guerrero", "product_class"), mapping = aes(color = product_class), upper = list(continuous = "density"))
  pm + theme_bw()
