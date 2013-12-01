# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( "#accordion" ).accordion({
  collapsible: true,
  heightStyle: "content",
  active: false,
  icons: null
})

$('#new-workout').click(->
	$('#effect').show('slide',{direction:'up'}, 500)
	return false
	)

$('#save-workout').click(->
	$('#effect').hide('slide',{direction:'down'}, 500)
	return false
	)

$( "#datepicker" ).datepicker({
	dateFormat: "d.m.D",
	altField: "#date",
	altFormat: "yy-mm-ddT00:00:00.000Z"
})

$('#effect').hide()

today = new Date()
calStartDate = new Date(today.getUTCFullYear(), today.getUTCMonth()-4)


cal = new CalHeatMap();
cal.init({
	data: "/datas.json",
	start: calStartDate,
	domain: "month",
	subDomain: "day",
	cellSize: 20,
	subDomainTextFormat: "%d",
	range: 8,
	cellSize: 15,
	# cellRadius: 5,
	domainGutter: 20,
	legend: [1,2,3,4]
	displayLegend: true,
	legendVerticalPosition: "top",
	nextSelector: "#domainDynamicDimension-next",
	previousSelector: "#domainDynamicDimension-previous"
});