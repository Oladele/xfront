# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

util = window.sample_data_util
days = 30
interval = -3
randMin = 1
randMax = 5
mydata = util.workoutDays(days, interval, "unix", randMin, randMax)
mydataJSON = JSON.stringify(mydata)

$('#datadiv').append '<ul></ul>'
$('#datadiv ul').append '<li>days: '+days+'</li>'
$('#datadiv ul').append '<li>interval: '+interval+'</li>'
$('#datadiv ul').append '<li>randMin: '+randMin+'</li>'
$('#datadiv ul').append '<li>randMax: '+randMax+'</li>'
$('#datatextarea').append mydataJSON