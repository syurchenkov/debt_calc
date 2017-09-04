$(document).on('turbolinks:load', -> 
  $('#calc-calculate').click -> 
    amount = +$('#calc-input-amount').val()
    period = +$('#calc-input-period').val()
    $('#calc-output').text(amount + amount * 0.3 / 12 * period))
