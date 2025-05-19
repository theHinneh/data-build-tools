{$ set old_etl_relation = ref('customer_orders') $}
{$ set new_etl_relation = ref('fct_customer_orders') $}

{{
  audit_helper.compare_and_classify_query_results(
    old_query,
    new_query,
    primary_key_columns=['order_id']
  )
}}`