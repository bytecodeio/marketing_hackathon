# The name of this view in Looker is "Superstore"
view: superstore {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bytecode-marketing-analytics.superstore_marketing.superstore` ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Complain" in Explore.

  dimension: complain {
    type: number
    sql: ${TABLE}.Complain ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_complain {
    type: sum
    sql: ${complain} ;;  }
  measure: average_complain {
    type: average
    sql: ${complain} ;;  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: dt_customer {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Dt_Customer ;;
  }

  dimension: education {
    type: string
    sql: ${TABLE}.Education ;;
  }

  dimension: income {
    type: number
    sql: ${TABLE}.Income ;;
  }

  dimension: kidhome {
    type: number
    sql: ${TABLE}.Kidhome ;;
  }

  dimension: marital_status {
    type: string
    sql: ${TABLE}.Marital_Status ;;
  }

  dimension: mnt_fish_products {
    type: number
    sql: ${TABLE}.MntFishProducts ;;
  }

  dimension: mnt_fruits {
    type: number
    sql: ${TABLE}.MntFruits ;;
  }

  dimension: mnt_gold_prods {
    type: number
    sql: ${TABLE}.MntGoldProds ;;
  }

  dimension: mnt_meat_products {
    type: number
    sql: ${TABLE}.MntMeatProducts ;;
  }

  dimension: mnt_sweet_products {
    type: number
    sql: ${TABLE}.MntSweetProducts ;;
  }

  dimension: mnt_wines {
    type: number
    sql: ${TABLE}.MntWines ;;
  }

  dimension: num_catalog_purchases {
    type: number
    sql: ${TABLE}.NumCatalogPurchases ;;
  }

  dimension: num_deals_purchases {
    type: number
    sql: ${TABLE}.NumDealsPurchases ;;
  }

  dimension: num_store_purchases {
    type: number
    sql: ${TABLE}.NumStorePurchases ;;
  }

  dimension: num_web_purchases {
    type: number
    sql: ${TABLE}.NumWebPurchases ;;
  }

  dimension: num_web_visits_month {
    type: number
    sql: ${TABLE}.NumWebVisitsMonth ;;
  }

  dimension: recency {
    type: number
    sql: ${TABLE}.Recency ;;
  }

  dimension: response {
    type: number
    sql: ${TABLE}.Response ;;
  }

  dimension: teenhome {
    type: number
    sql: ${TABLE}.Teenhome ;;
  }

  dimension: year_birth {
    type: number
    sql: ${TABLE}.Year_Birth ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
