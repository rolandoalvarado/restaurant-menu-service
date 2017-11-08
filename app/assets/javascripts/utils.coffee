jQuery ->
  Utils =
    name: 'Utils'

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

    enableObject: (buttonId) ->
      $('#'+buttonId).removeAttr('disabled')

    disableObject: (buttonId) ->
      $('#'+buttonId).attr('disabled', 'true')

    submitForm: (formId) ->
      $('#'+formId).submit()

    showProcessModal: (modalId) ->
      $('#'+modalId).modal('show')

  window.Utils = Utils
