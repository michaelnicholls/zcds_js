@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'carrier with popup'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zcarr_JAVASCRIPT as select from scarr
{
    @UI.lineItem: [{position: 10 }]
    key carrid as Carrid,
    @UI.lineItem: [{ position: 20 }]
    carrname as Carrname,
    concat(concat('javascript:window.open("',url),'","mypopup","popup")') as Url,
    @UI.lineItem: [{ position: 30, type: #WITH_URL, url: 'Url' }]
    'website' as Website,
    concat(concat('javascript:document.querySelectorAll("tr").forEach((el,i)=> {if(el.textContent.startsWith("',carrid),'")) {el.style.fontWeight="bold";}; })') as bold,
     @UI.lineItem: [{ position: 30, type: #WITH_URL, url: 'bold' }]
    'setbold' as setbold
}
