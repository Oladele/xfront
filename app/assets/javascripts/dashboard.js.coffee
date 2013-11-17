#= require_self

cal = new CalHeatMap();
cal.init({
	domain: "month",
	subDomain: "day",
	cellSize: 20,
	subDomainTextFormat: "%d",
	range: 5,
	cellSize: 15,
	# cellRadius: 5,
	domainGutter: 20,
	displayLegend: false,
	nextSelector: "#domainDynamicDimension-next",
	previousSelector: "#domainDynamicDimension-previous"
});