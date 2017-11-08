jQuery ->
  Utils =
    name: 'Utils'

    exportData: (buttonId) ->
      $.ajax '/files/csv/export',
      type: 'GET'
      dataType: 'text'
      data:
        place: $('select#place :selected').text()
        from: $('#from').val()
        to: $('#to').val()
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("jqXHR: #{jqXHR.responseText}")
        Utils.disableObject('export')
      success: (data, textStatus, jqXHR) ->
        console.log("Status : #{textStatus}")
        window.location.reload()
        return

    setupDatatable: (tableId) ->
      $('#'+tableId).dataTable
        'order': [ [
          0
          'desc'
        ] ]
        'responsive': true
        'bInfo': false
        'language': 'paginate':
          'previous': '<i class="fa fa-angle-left"></i>'
          'next': '<i class="fa fa-angle-right"></i>'

    setupDatePicker: (inputClass) ->
      $('.'+inputClass).datepicker($.datepicker.regional['en'])
      $('.'+inputClass).datepicker('option','dateFormat','yy-mm-dd')

    setupDropdown: (inputClass) ->
      $('.'+inputClass).dropdown()

    setupChosenSelect: (inputId) ->
      $('#'+inputId).chosen({width:'700px;', max_selected_options: 1})

    enableObject: (buttonId) ->
      $('#'+buttonId).removeAttr('disabled')

    disableObject: (buttonId) ->
      $('#'+buttonId).attr('disabled', 'true')

    submitForm: (formId) ->
      $('#'+formId).submit()

    showProcessModal: (modalId) ->
      $('#'+modalId).modal('show')

    hideProcessModal: (modalId) ->
      $('#'+modalId).modal('hide')

  window.Utils = Utils
