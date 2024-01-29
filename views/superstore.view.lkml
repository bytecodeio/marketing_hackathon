
view: superstore {
  sql_table_name: `bytecode-marketing-analytics.superstore_marketing.superstore` ;;
  drill_fields: [customer_id]
  ## This data is from a phone marketing campaign of a superstore.
  ## https://www.kaggle.com/datasets/ahsan81/superstore-marketing-campaign-dataset

  dimension: age {
    description: "Calculated age based off of yob of customer."
    type: number
    sql: extract(year from current_datetime()) - ${birth_year} ;;
  }

  dimension: birth_year {
    description: "The year of birth of the customer."
    type: number
    sql: ${TABLE}.Year_Birth ;;
    hidden: yes
  }

  dimension: complain {
    description: "If a customer has ever complained in the last 2 years this column shows a 1."
    type: number
    sql: ${TABLE}.Complain ;;
    hidden: yes
  }

  dimension_group: customer_enrollment {
    description: "The customer's enrollment date with the company."
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Dt_Customer ;;
  }

  dimension: customer_id {
    description: "Unique identifier of each customer."
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: education {
    description: "Highest degree of education of the customer."
    type: string
    sql: ${TABLE}.Education ;;
  }

  dimension: has_complained {
    description: "Yes/No field to replace base table field."
    type: yesno
    sql: If(${complain} = 1,true ,false);;
  }

  dimension: income {
    description: "The customer's yearly household income."
    type: number
    sql: ${TABLE}.Income ;;
    value_format_name: usd
  }

  dimension: income_bucket {
    description: "The bucket of income customer belongs to."
    type: tier
    tiers: [0,50000,80000,110000]
    style: relational
    sql: ${income} ;;
    value_format_name: usd
  }

  dimension: kidhome {
    description: "The number of small children in customer's household."
    type: number
    sql: ${TABLE}.Kidhome ;;
  }

  dimension: marital_status {
    description: "The customer's marital status."
    type: string
    sql: ${TABLE}.Marital_Status ;;
  }

  dimension: mnt_fish_products {
    description: "The amount spent on fish products over the last 2 years."
    type: number
    sql: ${TABLE}.MntFishProducts ;;
    value_format_name: usd
  }

  dimension: mnt_fruits {
    description: "The amount spent on fruit products over the last 2 years."
    type: number
    sql: ${TABLE}.MntFruits ;;
    value_format_name: usd
  }

  dimension: mnt_gold_prods {
    description: "The amount spent on Gold (member exclusive deal) products over the last 2 years."
    type: number
    sql: ${TABLE}.MntGoldProds ;;
    value_format_name: usd
  }

  dimension: mnt_meat_products {
    description: "The amount spent on meat products over the last 2 years."
    type: number
    sql: ${TABLE}.MntMeatProducts ;;
    value_format_name: usd
  }

  dimension: mnt_sweet_products {
    description: "The amount spent on sweet products over the last 2 years."
    type: number
    sql: ${TABLE}.MntSweetProducts ;;
    value_format_name: usd
  }

  dimension: mnt_wines {
    description: "The amount spent on wine products over the last 2 years."
    type: number
    sql: ${TABLE}.MntWines ;;
    value_format_name: usd
  }

  dimension: num_catalog_purchases {
    description: "The number of purchases made using the catalog that will be shipped to the customer."
    type: number
    sql: ${TABLE}.NumCatalogPurchases ;;
  }

  dimension: num_deals_purchases {
    description: "The number of purchases the customer made with a discount."
    type: number
    sql: ${TABLE}.NumDealsPurchases ;;
  }

  dimension: num_store_purchases {
    description: "The number of purchases the customer made in the physical store."
    type: number
    sql: ${TABLE}.NumStorePurchases ;;
  }

  dimension: num_web_purchases {
    description: "The number of purchases the customer made through the company website."
    type: number
    sql: ${TABLE}.NumWebPurchases ;;
  }

  dimension: num_web_visits_month {
    description: "The number of visits to the company's website in the last month."
    type: number
    sql: ${TABLE}.NumWebVisitsMonth ;;
  }

  dimension: previous_campaign {
    description: "Whether or not the customer had accepted the offer in the previous campaign (1 if yes, 0 if no)."
    type: number
    sql: ${TABLE}.Response ;;
    hidden: yes
  }

  dimension: previous_campaign_response {
    description: "Yes/No field based off of the base field from the table."
    type: yesno
    sql: if(${previous_campaign} = 1, true, false) ;;
  }

  dimension: since_last_purchase {
    description: "The number of days since the last purchase."
    type: number
    sql: ${TABLE}.Recency ;;
  }

  dimension: teenhome {
    description: "The number of teens the customer has in their household."
    type: number
    sql: ${TABLE}.Teenhome ;;
  }

  ## Measures ##

  measure: avg_age {
    description: "Average age of customer base"
    type: average
    sql: ${age} ;;
    value_format: "#"
  }

  measure: catalog_purchases {
    description: "The number of purchases a customer has made through the catalog."
    type: sum
    sql: ${TABLE}.NumCatalogPurchases ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_id]
  }

  measure: deals_purchases {
    description: "The number of purchases with a discount a customer has made."
    type: sum
    sql: ${TABLE}.NumDealsPurchases ;;
  }

  measure: fish_spend {
    description: "The total amount spent on fish products over the last 2 years."
    type: sum
    sql: ${TABLE}.MntFishProducts ;;
    value_format_name: usd
  }

  measure: fruits_spend {
    description: "The total amount spent on fruit products over the last 2 years"
    type: sum
    sql: ${TABLE}.MntFruits ;;
    value_format_name: usd
  }

  measure: gold_spend {
    description: "The total amount spent on Gold (member exclusive deals) products over the last 2 years."
    type: sum
    sql: ${TABLE}.MntGoldProds ;;
    value_format_name: usd
  }

  measure: meat_spend {
    description: "The total amount spent on meat products over the last 2 years."
    type: sum
    sql: ${TABLE}.MntMeatProducts ;;
    value_format_name: usd
  }

  measure: previous_response_acceptance_rate {
    description: "Rate of acceptance of previous campaign"
    type: number
    sql: ${total_customers_accepted}/${total_customers} ;;
    value_format: "0.00%"
  }

  measure: store_purchases {
    description: "The number of purchases a customer has made in the physical store."
    type: sum
    sql: ${TABLE}.NumStorePurchases ;;
  }

  measure: sweet_spend {
    description: "The total amount spent on sweet products over the last 2 years."
    type: sum
    sql: ${TABLE}.MntSweetProducts ;;
    value_format_name: usd
  }

  measure: total_customers {
    description: "The total count of customers."
    type: count_distinct
    sql: ${customer_id} ;;
  }

  measure: total_customers_accepted {
    type: count_distinct
    sql: ${customer_id} ;;
    filters: [previous_campaign_response: "yes"]
  }

  measure: total_customers_declined {
    type: count_distinct
    sql: ${customer_id} ;;
    filters: [previous_campaign_response: "no"]
  }

  measure: total_num_purchases {
    description: "The total number of purchases a customer has made."
    type: sum
    sql: (${TABLE}.NumDealsPurchases + ${TABLE}.NumCatalogPurchases + ${TABLE}.NumStorePurchases + ${TABLE}.NumWebPurchases) ;;
  }

  measure: total_spend_amount {
    description: "The total amount a customer has spent over the last two years"
    type: sum
    sql: ${TABLE}.MntWines + ${TABLE}.MntSweetProducts + ${TABLE}.MntGoldProds + ${TABLE}.MntFruits + ${TABLE}.MntFishProducts + ${TABLE}.MntMeatProducts;;
    value_format_name: usd
  }

  measure: web_visits_month {
    description: "The number of visits to the company's website in the last month."
    type: sum
    sql: ${TABLE}.NumWebVisitsMonth ;;
  }

  measure: web_purchases {
    description: "The number of purchases a customer has made through the website."
    type: sum
    sql: ${TABLE}.NumWebPurchases ;;
  }

  measure: wines_spend {
    description: "The total amount spent on wine products over the last 2 years."
    type: sum
    sql: ${TABLE}.MntWines ;;
    value_format_name: usd
  }

}
