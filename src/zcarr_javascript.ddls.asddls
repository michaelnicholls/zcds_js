@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'carrier with popup'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCARR_JAVASCRIPT as select from scarr
{
    @UI.lineItem: [{position: 10 }]
    key carrid as Carrid,
    @UI.hidden: true
    concat(concat('javascript:window.open("',url),'","mypopup","popup")') as Url,
    @UI.lineItem: [{ position: 30, type: #WITH_URL, url: 'Url' }]
   
    carrname as Carrname,
    @UI.hidden: true
    concat(concat('javascript:document.querySelectorAll("tr").forEach((el,i)=> {if(el.innerText.includes("\\t',carrid),'\\t")) {el.style.display="none";}; })') as hideurl,
     @UI.lineItem: [{ position:40, type: #WITH_URL, url: 'hideurl'  }]
    
    'Hide line' as hide,
    @UI.hidden: true
   concat(concat('javascript:document.querySelectorAll("tr").forEach((el,i)=> {if(el.innerText.includes("\\t',carrid),'\\t")) {el.style.fontWeight="bold";}; })') as boldurl,
 
     @UI.lineItem: [{ position: 50, type: #WITH_URL, url: 'boldurl'  }]
    'Set line to bold' as setbold
}
