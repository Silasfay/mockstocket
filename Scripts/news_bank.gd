extends VBoxContainer

var newsFeedData = {
	01: {
		"Category" : "Resources",
		"Content" : "Global demand for electric vehicles increases sharply, driving up the need for lightweight aluminum components.",
		"Stock" : "Aluminum",
		"Impact" : 8
	},
	02: {
		"Category" : "Resources",
		"Content" : "A breakthrough in carbon-fiber technology reduces demand for aluminum in automotive manufacturing.",
		"Stock" : "Aluminum",
		"Impact" : -6
	},
	03: {
		"Category" : "Resources",
		"Content" : "A major aluminum smelter in China shuts down due to energy shortages, disrupting global supply.",
		"Stock" : "Aluminum",
		"Impact" : 7
	},
	04: {
		"Category" : "Resources",
		"Content" : "A viral social media trend encourages DIY aluminum foil hats to block government mind control, but the hats don’t work, and sales plummet.",
		"Stock" : "Aluminum",
		"Impact" : -5
	},
	05: {
		"Category" : "Resources",
		"Content" : "An unusually cold winter in Europe leads to a surge in coal demand for heating.",
		"Stock" : "Coal",
		"Impact" : 7
	},
	06: {
		"Category" : "Resources",
		"Content" : "A major country announces its complete phase-out of coal-based power plants.",
		"Stock" : "Coal",
		"Impact" : -10
	},
	07: {
		"Category" : "Resources",
		"Content" : "New government regulations significantly limit coal mining in the United States, reducing production.",
		"Stock" : "Coal",
		"Impact" : 5
	},
	08: {
		"Category" : "Resources",
		"Content" : "A coal company’s CEO accidentally livestreams himself grilling steaks over solar power, causing outrage among coal enthusiasts.",
		"Stock" : "Coal",
		"Impact" : -7
	},
	09: {
		"Category" : "Resources",
		"Content" : "New infrastructure projects in developing countries boost global copper demand.",
		"Stock" : "Copper",
		"Impact" : 9
	},
	10: {
		"Category" : "Resources",
		"Content" : "A massive strike at Chile’s largest copper mine halts production for weeks.",
		"Stock" : "Copper",
		"Impact" : 6
	},
	11: {
		"Category" : "Resources",
		"Content" : "Recycling rates for copper reach record highs, reducing the need for newly mined material.",
		"Stock" : "Copper",
		"Impact" : -4
	},
	12: {
		"Category" : "Resources",
		"Content" : "A reality TV star claims copper jewelry cures bad vibes, but scientists prove it just makes you look tacky.",
		"Stock" : "Copper",
		"Impact" : -4
	},
	13: {
		"Category" : "Resources",
		"Content" : "The construction boom in Asia increases demand for iron ore.",
		"Stock" : "Iron",
		"Impact" : 6
	},
	14: {
		"Category" : "Resources",
		"Content" : "Economic slowdowns in key markets reduce demand for steel production.",
		"Stock" : "Iron",
		"Impact" : -7
	},
	15: {
		"Category" : "Resources",
		"Content" : "India imposes export tariffs on iron ore, leading to global supply chain disruptions.",
		"Stock" : "Iron",
		"Impact" : 4
	},
	16: {
		"Category" : "Resources",
		"Content" : "A new study reveals that licking iron fences is not, in fact, an effective way to boost iron levels, causing confusion in the market.",
		"Stock" : "Iron",
		"Impact" : -6
	},
	17: {
		"Category" : "Resources",
		"Content" : "Luxury goods markets see a surge in demand for jade-based jewelry in China.",
		"Stock" : "Jade",
		"Impact" : 5
	},
	18: {
		"Category" : "Resources",
		"Content" : "Consumers shift to synthetic alternatives, reducing the appeal of natural jade.",
		"Stock" : "Jade",
		"Impact" : -3
	},
	19: {
		"Category" : "Resources",
		"Content" : "A rare discovery of high-grade jade deposits in Myanmar increases market supply unexpectedly.",
		"Stock" : "Jade",
		"Impact" : -8
	},
	20: {
		"Category" : "Resources",
		"Content" : "An eccentric billionaire builds a jade-themed space station, sparking a jade-buying frenzy among other billionaires.",
		"Stock" : "Jade",
		"Impact" : 9
	},
	21: {
		"Category" : "Resources",
		"Content" : "A surge in high-end real estate developments boosts demand for marble interiors.",
		"Stock" : "Marble",
		"Impact" : 4
	},
	22: {
		"Category" : "Resources",
		"Content" : "Prefabricated concrete products replace marble in new construction projects.",
		"Stock" : "Marble",
		"Impact" : -5
	},
	23: {
		"Category" : "Resources",
		"Content" : "Italy's marble quarries face environmental restrictions, limiting extraction and exports.",
		"Stock" : "Marble",
		"Impact" : 3
	},
	24: {
		"Category" : "Resources",
		"Content" : "Marble countertops fall out of fashion after influencers declare them 'basic,' preferring countertops made of recycled yogurt lids.",
		"Stock" : "Marble",
		"Impact" : -8
	},
	25: {
		"Category" : "Resources",
		"Content" : "Fertilizer demand soars after a global push for increased agricultural output.",
		"Stock" : "Niter",
		"Impact" : 10
	},
	26: {
		"Category" : "Resources",
		"Content" : "Advances in organic farming reduce reliance on chemical fertilizers.",
		"Stock" : "Niter",
		"Impact" : -8
	},
	27: {
		"Category" : "Resources",
		"Content" : "A niter processing plant explosion in Brazil raises global fertilizer prices due to reduced output.",
		"Stock" : "Niter",
		"Impact" : 10
	},
	28: {
		"Category" : "Resources",
		"Content" : "A major fertilizer producer accidentally mixes up niter with glitter, leading to sparkly but underperforming crops.",
		"Stock" : "Niter",
		"Impact" : -10
	},
	29: {
		"Category" : "Resources",
		"Content" : "Geopolitical tensions disrupt oil supplies in the Middle East, driving up prices.",
		"Stock" : "Oil",
		"Impact" : 15
	},
	30: {
		"Category" : "Resources",
		"Content" : "Breakthroughs in renewable energy technologies sharply reduce oil consumption.",
		"Stock" : "Oil",
		"Impact" : -12
	},
	31: {
		"Category" : "Resources",
		"Content" : "OPEC announces a major production cut, driving up crude oil prices.",
		"Stock" : "Oil",
		"Impact" : 12
	},
	32: {
		"Category" : "Resources",
		"Content" : "Oil prices tank after a viral meme campaign convinces everyone that walking is the new cool thing to do.",
		"Stock" : "Oil",
		"Impact" : -12
	},
	33: {
		"Category" : "Resources",
		"Content" : "A surge in home renovation projects increases demand for natural stone products.",
		"Stock" : "Stone",
		"Impact" : 7
	},
	34: {
		"Category" : "Resources",
		"Content" : "New synthetic alternatives undercut demand for natural stone materials.",
		"Stock" : "Stone",
		"Impact" : -6
	},	
	35: {
		"Category" : "Resources",
		"Content" : "A trade embargo on stone imports from a major supplier disrupts construction industries worldwide.",
		"Stock" : "Stone",
		"Impact" : 5
	},	
	36: {
		"Category" : "Resources",
		"Content" : "Sales of decorative stone plummet after a popular interior designer calls them 'soulless pebbles.'",
		"Stock" : "Stone",
		"Impact" : -7
	},
	37: {
		"Category" : "Livestock",
		"Content" : "A gourmet food trend increases global demand for premium crab dishes.",
		"Stock" : "Crabs",
		"Impact" : 8
	},
	38: {
		"Category" : "Livestock",
		"Content" : "Sustainability campaigns discourage consumption of overfished crab species.",
		"Stock" : "Crabs",
		"Impact" : -6
	},
	39: {
		"Category" : "Livestock",
		"Content" : "An algae bloom causes a significant drop in crab populations along the U.S. coast, increasing seafood prices.",
		"Stock" : "Crabs",
		"Impact" : 8
	},
	40: {
		"Category" : "Livestock",
		"Content" : "Crab sales collapse after an underwater documentary exposes crabs’ terrible dance moves, ruining their reputation as cool crustaceans.",
		"Stock" : "Crabs",
		"Impact" : -8
	},
	41: {
		"Category" : "Livestock",
		"Content" : "The popularity of venison as a lean protein alternative grows in high-income markets.",
		"Stock" : "Deer",
		"Impact" : 6
	},
	42: {
		"Category" : "Livestock",
		"Content" : "A major decline in hunting permits reduces demand for deer-related products.",
		"Stock" : "Deer",
		"Impact" : -4
	},
	43: {
		"Category" : "Livestock",
		"Content" : "A widespread outbreak of chronic wasting disease devastates deer populations, impacting hunting and wildlife tourism.",
		"Stock" : "Deer",
		"Impact" : -6
	},
	44: {
		"Category" : "Livestock",
		"Content" : "Deer stocks soar after a herd photobombs a celebrity’s outdoor wedding, becoming instant social media darlings.",
		"Stock" : "Deer",
		"Impact" : 6
	},
	45: {
		"Category" : "Livestock",
		"Content" : "Aquaculture innovations increase fish production, meeting growing global demand.",
		"Stock" : "Fish",
		"Impact" : 9
	},
	46: {
		"Category" : "Livestock",
		"Content" : "Consumer health concerns about microplastics in fish reduce seafood consumption.",
		"Stock" : "Fish",
		"Impact" : -7
	},
	47: {
		"Category" : "Livestock",
		"Content" : "Overfishing bans in key international waters sharply reduce fish supply for commercial markets.",
		"Stock" : "Fish",
		"Impact" : 7
	},
	48: {
		"Category" : "Livestock",
		"Content" : "Fish stocks nosedive after scientists confirm fish can recognize faces, making sushi lovers feel guilty.",
		"Stock" : "Fish",
		"Impact" : -7
	},
	49: {
		"Category" : "Livestock",
		"Content" : "Horse racing gains popularity globally, increasing demand for breeding stock.",
		"Stock" : "Horses",
		"Impact" : 5
	},
	50: {
		"Category" : "Livestock",
		"Content" : "Animal rights campaigns lead to a decline in horse racing attendance.",
		"Stock" : "Horses",
		"Impact" : -4
	},
	51: {
		"Category" : "Livestock",
		"Content" : "A viral equine disease spreads across Europe, affecting horse breeding and racing industries. ",
		"Stock" : "Horses",
		"Impact" : -5
	},
	52: {
		"Category" : "Livestock",
		"Content" : "Horses become a hot commodity after a billionaire launches a 'Horse-Uber' app, branding it as a nostalgic ride-sharing experience.",
		"Stock" : "Horses",
		"Impact" : 8
	},
	53: {
		"Category" : "Livestock",
		"Content" : "A rise in demand for organic wool products boosts sheep farming profitability.",
		"Stock" : "Sheep",
		"Impact" : 10
	},
	54: {
		"Category" : "Livestock",
		"Content" : "Synthetic fibers capture a larger market share, reducing demand for wool.",
		"Stock" : "Sheep",
		"Impact" : -8
	},
	55: {
		"Category" : "Livestock",
		"Content" : "A severe drought in Australia decimates sheep flocks, reducing wool and meat production.",
		"Stock" : "Sheep",
		"Impact" : 9
	},
	56: {
		"Category" : "Livestock",
		"Content" : "Sheep farmers face losses after a popular animated movie villainizes wool sweaters, dubbing them 'itchy atrocities.'",
		"Stock" : "Sheep",
		"Impact" : -9
	},
	57: {
		"Category" : "Agriculture",
		"Content" : "A viral social media trend increases coffee consumption among younger demographics.",
		"Stock" : "Coffee",
		"Impact" : 10
	},
	58: {
		"Category" : "Agriculture",
		"Content" : "Major coffee chains reduce purchases due to overstocking and shifting to tea alternatives.",
		"Stock" : "Coffee",
		"Impact" : -7
	},
	59: {
		"Category" : "Agriculture",
		"Content" : "A prolonged drought in Brazil, the world's largest coffee producer, severely impacts coffee bean harvests, driving up global coffee prices.",
		"Stock" : "Coffee",
		"Impact" : 12
	},
	60: {
		"Category" : "Agriculture",
		"Content" : "Coffee consumption plummets after a celebrity accidentally tweets 'I quit coffee forever' instead of 'I quit coffee for today.'",
		"Stock" : "Coffee",
		"Impact" : -6
	},
	61: {
		"Category" : "Agriculture",
		"Content" : "Global rice consumption rises as wheat prices soar, making rice a preferred staple.",
		"Stock" : "Rice",
		"Impact" : 12
	},
	62: {
		"Category" : "Agriculture",
		"Content" : "Advancements in wheat farming shift consumer preferences away from rice.",
		"Stock" : "Rice",
		"Impact" : -6
	},
	63: {
		"Category" : "Agriculture",
		"Content" : "Massive floods in Southeast Asia wipe out rice paddies, causing a sharp rise in global rice prices.",
		"Stock" : "Rice",
		"Impact" : 15
	},
	64: {
		"Category" : "Agriculture",
		"Content" : "Rice sales fall sharply when a viral video claims rice grains can be used as Wi-Fi antennas, leading to mass hoarding and confusion.",
		"Stock" : "Rice",
		"Impact" : -7
	},
	65: {
		"Category" : "Agriculture",
		"Content" : "Increased consumption of sugary beverages in emerging markets drives demand for sugar.",
		"Stock" : "Sugar",
		"Impact" : 7
	},
	66: {
		"Category" : "Agriculture",
		"Content" : "Global anti-sugar campaigns lead to reduced consumption of sugary foods and drinks.",
		"Stock" : "Sugar",
		"Impact" : -9
	},
	67: {
		"Category" : "Agriculture",
		"Content" : "Brazil, the world’s largest sugar producer, reduces sugarcane output due to extreme weather conditions.",
		"Stock" : "Sugar",
		"Impact" : 10
	},
	68: {
		"Category" : "Agriculture",
		"Content" : "Sugar stocks collapse after a health guru claims sugar makes your brain forget your middle name.",
		"Stock" : "Sugar",
		"Impact" : -8
	},
	69: {
		"Category" : "Agriculture",
		"Content" : "Poor weather conditions in competing regions lead to a drop in global wheat supply.",
		"Stock" : "Wheat",
		"Impact" : 15
	},
	70: {
		"Category" : "Agriculture",
		"Content" : "Record-breaking wheat harvests in multiple regions lead to an oversupply.",
		"Stock" : "Wheat",
		"Impact" : -11
	},
	71: {
		"Category" : "Agriculture",
		"Content" : "An ongoing war in a major wheat-producing country disrupts exports, spiking wheat prices worldwide.",
		"Stock" : "Wheat",
		"Impact" : 14
	},
	72: {
		"Category" : "Agriculture",
		"Content" : "Wheat markets crash when a misprinted cookbook instructs readers to 'boil wheat in orange soda,' ruining an entire generation of bread.",
		"Stock" : "Wheat",
		"Impact" : -11
	}
}

@export var mainNode : Node2D
@export var newsNode : PackedScene
var timer : float = 0.0
var timeToNext : float = 3.0
var validData : Array

func _ready():
	## Clears placeholder children.
	for each in get_children() : each.queue_free()
	
	## Sets the array of valid news data to pick from, then sets first news.
	for each in newsFeedData:
		validData.append(each)
	setNews()

func _process(delta):
	timer += delta
	if timer > timeToNext : 
		timer = 0.0
		setNews()
		
		# Sets next news timer randomly, weighted based on number of current active news.
		timeToNext = randf_range(2,3) * get_child_count()

func setNews():
	## Picks a random news from the pool and checks if it has a duplicate stock impact. Rerolls if so.
	## TODO: What if we run out??
	var activeTypes : Array
	var pickNews : int
	# Checks duplicate type; also failsafe if no posts.
	if get_child_count() > 0:
		for each in get_children():
			activeTypes.append(each.activeNewsType)
	# Rolls for news
	if validData.size(): 
		pickNews = randi_range(1, validData.size())
	# Compares rolled news to active news; rerolls if duplicate.
	while newsFeedData[validData[pickNews-1]].Stock in activeTypes:
		if validData.size:
			print("Rerolled, ", newsFeedData[validData[pickNews-1]])
			pickNews = randi_range(1, validData.size())
	
	## Once picked news is confirmed, sets news to news scene, removes from pool and adds to children. Sends impact information to main.
	var confirmedNews = newsFeedData[validData[pickNews-1]]
	validData.pop_at(pickNews-1)
	print(confirmedNews)
	var newsScene : News = newsNode.instantiate()
	newsScene.activeNewsContent = confirmedNews.Content
	newsScene.activeNewsType = confirmedNews.Stock
	if mainNode : mainNode.impactStocks(confirmedNews.Stock, confirmedNews.Impact)
	add_child(newsScene)
	move_child(newsScene,0)
