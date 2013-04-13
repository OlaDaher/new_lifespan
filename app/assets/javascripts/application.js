// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//

//= require jquery
//= require bootstrap
//= require jquery_ujs
//= require jquery.YAPSM.min
//= require jquery.pwdcalc

function monthChanged() {
    var days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    var month = $('.month').val() - 1, year = +$('.year').val();
    var diff;

    // Check for leap year if Feb
    if (month == 1 && new Date(year, month, 29).getMonth() == 1) days[1]++;

    // Add/Remove options
    diff = $('.day option').length - (days[month] + 1);
    if (diff > 0) { // Remove
        $('.day option').slice(days[month] + 1).remove();
    } else if (diff < 0) { // Add
        for (var i = $('.day option').length; i <= days[month]; i++) {
            $('<option>').attr('value', i).text(i).appendTo('.day');
        }
    }
}

$(function () {
    monthChanged(); // On document ready
    $('.month').change(monthChanged); // On month change
    $('.year').change(monthChanged); // On year change (for leap years)
});