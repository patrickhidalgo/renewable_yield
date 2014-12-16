# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$(document).on
jQuery ->
  $('#investment_maturity_date').datepicker
    dateFormat: 'yy-mm-dd'
jQuery ->
  $('#investment_issue_date').datepicker
    dateFormat: 'yy-mm-dd'
jQuery ->
  $('#investment_offer_start_period').datepicker
    dateFormat: 'yy-mm-dd'
jQuery ->
  $('#investment_offer_end_period').datepicker
    dateFormat: 'yy-mm-dd'
