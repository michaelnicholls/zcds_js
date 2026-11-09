class ZMN_JSCALC definition
  public
  final
  create public .

public section.

  interfaces IF_RAP_QUERY_PROVIDER .
protected section.
private section.
ENDCLASS.



CLASS ZMN_JSCALC IMPLEMENTATION.


  method IF_RAP_QUERY_PROVIDER~SELECT.
      DATA lt_data TYPE TABLE OF zcalc_js.
    TRY.
        IF io_request->is_data_requested(  ).

          DATA(lo_filter) = io_request->get_filter(  ).
          DATA(lt_params) = io_request->get_parameters(  ).
          DATA(lt_sort_elements)  = io_request->get_sort_elements(  ).

          DATA(lo_paging) = io_request->get_paging(  ).
          DATA(lv_offset) = lo_paging->get_offset(  ).
          DATA(lv_page_size) = lo_paging->get_page_size(  ).
          DATA(linecounter) = 0.
          IF lt_params IS NOT INITIAL.
            data(pa_formula) = lt_params[ parameter_name = 'PA_FORMULA' ]-value.
            lt_data = value #( ( line = 10 formula = pa_formula
            res = 'Use Execute'
            formula_url = 'javascript:try { value=eval("' &&
            pa_formula && '"); } catch (error) {value=error.message;} ;' &&
         "   'document.querySelectorAll("span").forEach((el,i)=> {if(el.innerText=="Use Execute"){el.innerText=value;}})'
            'document.querySelectorAll("td")[2].childNodes[0].textContent=value;'
            runit = 'Execute' ) ).
           io_response->set_data( lt_data ).
          io_response->set_total_number_of_records( lines( lt_data ) ).
          endif.
          endif.
          endtry.

  endmethod.
ENDCLASS.
