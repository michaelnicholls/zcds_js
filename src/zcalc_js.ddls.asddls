@EndUserText.label: 'JS calculator'
@ObjectModel.query.implementedBy: 'ABAP:ZMN_JSCALC'
define custom entity ZCALC_JS
 with parameters pa_formula : zformula
{
@UI.hidden: true
  key line : abap.int4;
  @UI.lineItem: [{ position: 10 }]
  formula : zformula;
   @UI.lineItem: [{ position: 15 }]
   @EndUserText.label: 'Result'
  res: abap.char(30);
  formula_url : abap.char(300);
  @UI.lineItem: [{ position: 20 , type: #WITH_URL, url: 'formula_url'}]
  @EndUserText.label: 'Execute'
   runit: abap.char(30);
  
  
}
