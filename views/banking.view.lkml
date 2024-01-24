
view: banking {
  sql_table_name: `bytecode-marketing-analytics.bank_marketing.banking` ;;
  ## This data comes from a Portuguese banking institution. The data encompases campaigns across different platforms such as email, ads, telephone, and digital.
  ## https://www.kaggle.com/datasets/prakharrathi25/banking-dataset-marketing-targets

  dimension: age {
    description: "The numeric age of the customer."
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: balance {
    description: " Customers avg. yearly balance in euros."
    type: number
    sql: ${TABLE}.balance ;;
  }

  dimension: contact_type {
    description: "Type of communication"
    type: string
    sql: ${TABLE}.contact ;;
  }

  dimension: credit_default {
    description: "Whether or not a customer's credit is in default."
    type: yesno
    sql: ${TABLE}.`default` ;;
  }

  dimension: desired_outcome {
    description: "Has the client subscribed to a term deposit?"
    type: yesno
    sql: ${TABLE}.y ;;
  }

  dimension: education {
    description: "Highest education level the customer reached."
    type: string
    sql: ${TABLE}.education ;;
  }

  dimension: has_housing_loan {
    description: "Whether or not the customer has a housing loan."
    type: yesno
    sql: ${TABLE}.housing ;;
  }

  dimension: has_personal_loan {
    description: "Whether or not the customer has a personal loan."
    type: yesno
    sql: ${TABLE}.loan ;;
  }

  dimension: job {
    description: "The type of job the customer works in."
    type: string
    sql: ${TABLE}.job ;;
  }

  dimension: last_contact_day {
    description: "Last day of the month that contact was made with the customer."
    type: number
    sql: ${TABLE}.day ;;
  }

  dimension: last_contact_duration {
    description: "Duration (in seconds) of most recent contact with customer."
    type: number
    sql: ${TABLE}.duration ;;
  }

  dimension: last_contact_month {
    description: "The month in which the most recent contact was made with the customer."
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: marital_status {
    description: "What the marital status is of the customer."
    type: string
    sql: ${TABLE}.marital ;;
  }

  dimension: number_of_contacts {
    description: "Number of contacts performed per client during campaign (includes most recent contact)."
    type: number
    sql: ${TABLE}.campaign ;;
  }

  dimension: pdays {
    description: "The number of days that passed by after the client was last contacted from a previous campaign (-1 means client was not previously contacted)."
    type: number
    sql: ${TABLE}.pdays ;;
  }

  dimension: poutcome {
    description: "The outcome of the previous campaign on the specific customer."
    type: string
    sql: ${TABLE}.poutcome ;;
  }

  dimension: previous {
    description: "The number of contacts performed before this campaign for the specific customer."
    type: number
    sql: ${TABLE}.previous ;;
  }

  # Measures #

  measure: count {
    type: count
  }

}
