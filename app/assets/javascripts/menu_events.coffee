jQuery ->
  $(document).ready ->
    Utils.setupDatatable('table-basic')
    Utils.disableObject('import')
    Utils.setupDatePicker('datepicker')

  $(document).on 'click', '#import', ->
    Utils.showProcessModal('modal-window')
    Utils.submitForm('form-import')
    Utils.disableObject($(this).attr('id'))

  $(document).on 'change', '#file', ->
    if $(this).val().length != 0
      Utils.enableObject('import')
    else
      Utils.disableObject('import')
    return
