jQuery ->
  $(document).ready ->
    Utils.setupDatatable('table-basic')
    Utils.disableObject('import')
    Utils.disableObject('export')
    Utils.setupDatePicker('datepicker')
    Utils.setupDropdown('dropdown-toggle')
    Utils.setupChosenSelect('place')

  $(document).on 'click', '#import', ->
    Utils.showProcessModal('modal-window')
    Utils.submitForm('form-import')
    Utils.disableObject($(this).attr('id'))

  $(document).on 'click', '.dropdown-toggle', ->
    Utils.setupDropdown($(this).attr('class'))

  $(document).on 'click', '#place', ->
    Utils.setupChosenSelect($(this).attr('id'))

  $(document).on 'click', '.datepicker', ->
    Utils.setupDatePicker($(this).attr('class'))

  $(document).on 'change', '#file', ->
    if $(this).val().length != 0
      Utils.enableObject('import')
    else
      Utils.disableObject('import')
    return

  $(document).on 'change', '.datepicker', ->
    if $(this).val().length != 0
      Utils.enableObject('export')
    else
      Utils.disableObject('export')
    return

  $(document).on 'click', '#export', ->
    Utils.showProcessModal('modal-window')
    Utils.exportData($(this).attr('id'))
    Utils.disableObject($(this).attr('id'))
