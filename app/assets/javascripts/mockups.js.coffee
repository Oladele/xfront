# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$( "#accordion" ).accordion({
  collapsible: true,
  heightStyle: "content",
  active: false,
  icons: null
})

runEffect = ->
	options = {direction: 'up'}
	# $('#effect').show('scale', options, 500, callback)
	$('#effect').show('slide', options, 500)

# callback = ->
#   setTimeout (->
#     $("#effect:visible").removeAttr("style").fadeOut()
#     ), 1000

$('#new-workout').click(->
	runEffect()
	return false
	)

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