$ ->
  $('#user_avatar').on('change', ->
    $('#upload-file-info').val($(this).val())
    mostrarImagen(this)
  )

  mostrarImagen = (input) ->
    if(input.files && input.files[0])
      reader = new FileReader()
      reader.onload = (e) ->
        $('#img-destino').attr('src', e.target.result)
      reader.readAsDataURL(input.files[0])