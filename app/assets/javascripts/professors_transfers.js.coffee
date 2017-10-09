# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#jQuery ->
  #faculty_from = $('#professors_transfer_faculty_from_id').html()
  #$('#professors_transfer_type_of_translate').change ->
  #type = $('#professors_transfer_type_of_translate :selected').text()
  #options = $(faculty_from).filter("optgroup[label='#{type}']").html()
  #if options
  #  $('#professors_transfer_faculty_from_id').html(options)
  #else 
  #  $('#professors_transfer_faculty_from_id').empty()

$(document).ready ->
  $(".type_selection").on "change", ->
    $.ajax
      url: "/professors_transfers/get_selections"
      type: "GET"
      dataType: "script"
      data:
        type_of_translate: $('.type_selection option:selected').val()

$(document).ready ->  
  $(".from_selection").on "change", ->
    $.ajax
      url: "/professors_transfers/get_to"
      type: "GET"
      dataType: "script"
      data:
        type_of_translate: $('.type_selection option:selected').val()
        faculty_from_id: $('.from_selection option:selected').val()

$(document).ready ->  
  $(".to_selection").on "change", ->
    $.ajax
      url: "/professors_transfers/get_froms"
      type: "GET"
      dataType: "script"
      data:
        type_of_translate: $('.type_selection option:selected').val()
        faculty_to_id: $('.to_selection option:selected').val()

$(document).ready ->
  $(".type_selection_dedication").on "change", ->
    $.ajax
      url: "/professors_transfers/get_selections_dedication"
      type: "GET"
      dataType: "script"
      data:
        type_of_translate: $('.type_selection_dedication option:selected').val()

      