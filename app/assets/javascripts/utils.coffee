jQuery ->
  Utils =
    name: 'Utils'

    setupDatatable: (tableId) ->
      $(tableId).dataTable
        'order': [ [
          0
          'desc'
        ] ]
        'responsive': true
        'bInfo': false
        'language': 'paginate':
          'previous': '<i class="fa fa-angle-left"></i>'
          'next': '<i class="fa fa-angle-right"></i>'

  window.Utils = Utils
