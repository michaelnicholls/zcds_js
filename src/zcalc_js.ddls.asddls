@EndUserText.label: 'JS calculator'
@ObjectModel.query.implementedBy: 'ABAP:ZMN_JSCALC'
define custom entity ZCALC_JS
 with parameters pa_formula : zformula
{
  key line : abap.int4;
  @UI.lineItem: [{ position: 10 }]
  formula : zformula;
  formula_url : abap.char(300);
  @UI.lineItem: [{ position: 20 , type: #WITH_URL, url: 'formula_url'}]
   runit: abap.char(30);
  
  
}
