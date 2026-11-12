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
                 " make a null character
          DATA: lv_null_byte TYPE xstring VALUE '00',
                lv_null_char TYPE string.
          TRY.
              lv_null_char = cl_abap_conv_codepage=>create_in( )->convert( source = lv_null_byte ).
            CATCH cx_root.
          ENDTRY.
          IF lt_params IS NOT INITIAL.
            data(pa_formula) = lt_params[ parameter_name = 'PA_FORMULA' ]-value.
            if contains( val = pa_formula sub = 'while' ) or  contains( val = pa_formula sub = 'for' ).
              lt_data = value #( ( line = 10 formula = pa_formula
            res = 'No looping allowed'
            formula_url = 'javascript:alert("No looping allowed" )' runit = '' ) ).
            else.
            lt_data = value #( ( line = 10 formula = pa_formula
           " res = cl_abap_conv_in_ce=>uccp( '0000' ) && 'Use Execute'
            res = lv_null_char && 'Use Execute'
            formula_url = 'javascript:try { value=eval("' &&
            pa_formula && '"); } catch (error) {value=error.message;} ;' &&
            'document.querySelectorAll("span").forEach((el,i)=> {if(el.innerText.startsWith("\0")){el.innerText="\0"+value;}})'
         "   'document.querySelectorAll("td")[2].childNodes[0].textContent=value;'
            runit = 'Execute' ) ).
                endif.
           io_response->set_data( lt_data ).
          io_response->set_total_number_of_records( lines( lt_data ) ).
          endif.
          endif.
          endtry.

  endmethod.
ENDCLASS.
