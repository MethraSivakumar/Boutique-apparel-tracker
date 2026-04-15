@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_CIT_APPAREL_071
  as select from zcit_apparel_071
{
  key design_uuid,
      design_id,
      description,
      category,
      collection_season,
      material_type,
      color_code,
      size_range,
      pattern_type,
      status,
      priority,
      @Semantics.amount.currencyCode: 'currency_code'
      estimated_cost,
      @Semantics.amount.currencyCode: 'currency_code'
      retail_price,
      currency_code,
      target_delivery_date,
      
      /* Administrative Fields - Required for Managed Scenario */
      created_by,
      created_at,
      last_changed_by,
      last_changed_at,
      local_last_changed_at
}
