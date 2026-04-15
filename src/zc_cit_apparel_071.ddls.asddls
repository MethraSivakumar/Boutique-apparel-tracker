@EndUserText.label: 'Apparel Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define root view entity ZC_CIT_APPAREL_071
  provider contract transactional_query // <--- THIS MUST BE HERE
  as projection on ZI_CIT_APPAREL_071
{
  key design_uuid,
      design_id,
      description,
      category,
      collection_season,
      status,
      estimated_cost,
      currency_code,
      local_last_changed_at,
      
      /* ADD THESE THREE LINES TO FIX THE METADATA ERRORS */
      material_type,
      retail_price,
      target_delivery_date
}
