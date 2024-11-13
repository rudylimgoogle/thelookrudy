# If necessary, uncomment the line below to include explore_source.

# include: "thelook.model.lkml"

view: basket {
  derived_table: {
    explore_source: order_items {
      column: total_sale_price {}
      column: order_id {}
      column: count {}
      filters: {
        field: order_items.order_id
        value: "NOT NULL"
      }
    }
  }
  dimension: total_sale_price {
    description: "Total revenue from order items"
    value_format: "$#,##0.00"
    type: number
  }
  dimension: order_id {
    description: "Order number associated with the item"
    value_format: "00000"
    type: number
  }
  dimension: count {
    description: "Number of order items"
    type: number
  }
}
