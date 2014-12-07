## This is a manifest file that'll be compiled into application.js, which will include all the files
## listed below.
##
## Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
## or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
##
## It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
## compiled file.
##
## Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
## about supported directives.
##
#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require turbolinks
#= require_tree .
#= require jquery.turbolinks

$(document).on "ajax:success", "form#sign_up_user", (e, data, status, xhr) ->
    if data.success
    	$('#sign_up').modal('hide')
    	$('#sign_up_button').hide()
    	$('#submit_comment').slideToggle(1000, "easeOutBack" )
    	location.href = "/dashboard"

$(document).on "ajax:success", "form#sign_in_user", (e, data, status, xhr) ->
    if data.success
    	$('#sign_in').modal('hide')
    	$('#sign_in_button').hide()
    	$('#submit_comment').slideToggle(1000, "easeOutBack" )
    	location.href = "/dashboard"
    


