extends VBoxContainer

var newsFeedData = {
	00: {
		"Category" : "",
		"Content" : "",
		"Stock" : "Initial",
		"Impact" : 0
	},
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
		"Content" : "An unusually cold winter in Europe leads to a surge in coal demand for heating.",
		"Stock" : "Coal",
		"Impact" : 7
	},
	04: {
		"Category" : "Resources",
		"Content" : "A major country announces its complete phase-out of coal-based power plants.",
		"Stock" : "Coal",
		"Impact" : -10
	},
	05: {
		"Category" : "Resources",
		"Content" : "New infrastructure projects in developing countries boost global copper demand.",
		"Stock" : "Copper",
		"Impact" : 9
	},
	06: {
		"Category" : "Resources",
		"Content" : "Recycling rates for copper reach record highs, reducing the need for newly mined material.",
		"Stock" : "Copper",
		"Impact" : -4
	},
	07: {
		"Category" : "Resources",
		"Content" : "The construction boom in Asia increases demand for iron ore.",
		"Stock" : "Iron",
		"Impact" : 6
	},
	08: {
		"Category" : "Resources",
		"Content" : "Economic slowdowns in key markets reduce demand for steel production.",
		"Stock" : "Iron",
		"Impact" : -7
	},
	09: {
		"Category" : "Resources",
		"Content" : "Luxury goods markets see a surge in demand for jade-based jewelry in China.",
		"Stock" : "Jade",
		"Impact" : 5
	},
	10: {
		"Category" : "Resources",
		"Content" : "Consumers shift to synthetic alternatives, reducing the appeal of natural jade.",
		"Stock" : "Jade",
		"Impact" : -3
	},
	11: {
		"Category" : "Resources",
		"Content" : "A surge in high-end real estate developments boosts demand for marble interiors.",
		"Stock" : "Marble",
		"Impact" : 4
	},
	12: {
		"Category" : "Resources",
		"Content" : "Prefabricated concrete products replace marble in new construction projects.",
		"Stock" : "Marble",
		"Impact" : -5
	},
	13: {
		"Category" : "Resources",
		"Content" : "Fertilizer demand soars after a global push for increased agricultural output.",
		"Stock" : "Niter",
		"Impact" : 10
	},
	14: {
		"Category" : "Resources",
		"Content" : "Advances in organic farming reduce reliance on chemical fertilizers.",
		"Stock" : "Niter",
		"Impact" : -8
	},
	15: {
		"Category" : "Resources",
		"Content" : "Geopolitical tensions disrupt oil supplies in the Middle East, driving up prices.",
		"Stock" : "Oil",
		"Impact" : 15
	},
	16: {
		"Category" : "Resources",
		"Content" : "Breakthroughs in renewable energy technologies sharply reduce oil consumption.",
		"Stock" : "Oil",
		"Impact" : -12
	},
	17: {
		"Category" : "Resources",
		"Content" : "A surge in home renovation projects increases demand for natural stone products.",
		"Stock" : "Stone",
		"Impact" : 7
	},
	18: {
		"Category" : "Resources",
		"Content" : "New synthetic alternatives undercut demand for natural stone materials.",
		"Stock" : "Stone",
		"Impact" : -6
	},
	19: {
		"Category" : "Livestock",
		"Content" : "A gourmet food trend increases global demand for premium crab dishes.",
		"Stock" : "Crabs",
		"Impact" : 8
	},
	20: {
		"Category" : "Livestock",
		"Content" : "Sustainability campaigns discourage consumption of overfished crab species.",
		"Stock" : "Crabs",
		"Impact" : -6
	},
	21: {
		"Category" : "Livestock",
		"Content" : "The popularity of venison as a lean protein alternative grows in high-income markets.",
		"Stock" : "Deer",
		"Impact" : 6
	},
	22: {
		"Category" : "Livestock",
		"Content" : "A major decline in hunting permits reduces demand for deer-related products.",
		"Stock" : "Deer",
		"Impact" : -4
	},
	23: {
		"Category" : "Livestock",
		"Content" : "Aquaculture innovations increase fish production, meeting growing global demand.",
		"Stock" : "Fish",
		"Impact" : 9
	},
	24: {
		"Category" : "Livestock",
		"Content" : "Consumer health concerns about microplastics in fish reduce seafood consumption.",
		"Stock" : "Fish",
		"Impact" : -7
	},
	25: {
		"Category" : "Livestock",
		"Content" : "Horse racing gains popularity globally, increasing demand for breeding stock.",
		"Stock" : "Horses",
		"Impact" : 5
	},
	26: {
		"Category" : "Livestock",
		"Content" : "Animal rights campaigns lead to a decline in horse racing attendance.",
		"Stock" : "Horses",
		"Impact" : -4
	},
	27: {
		"Category" : "Livestock",
		"Content" : "A rise in demand for organic wool products boosts sheep farming profitability.",
		"Stock" : "Sheep",
		"Impact" : 10
	},
	28: {
		"Category" : "Livestock",
		"Content" : "Synthetic fibers capture a larger market share, reducing demand for wool.",
		"Stock" : "Sheep",
		"Impact" : -8
	},
	29: {
		"Category" : "Agriculture",
		"Content" : "Global rice consumption rises as wheat prices soar, making rice a preferred staple.",
		"Stock" : "Rice",
		"Impact" : 12
	},
	30: {
		"Category" : "Agriculture",
		"Content" : "Advancements in wheat farming shift consumer preferences away from rice.",
		"Stock" : "Rice",
		"Impact" : -6
	},
	31: {
		"Category" : "Agriculture",
		"Content" : "Increased consumption of sugary beverages in emerging markets drives demand for sugar.",
		"Stock" : "Sugar",
		"Impact" : 7
	},
	32: {
		"Category" : "Agriculture",
		"Content" : "Global anti-sugar campaigns lead to reduced consumption of sugary foods and drinks.",
		"Stock" : "Sugar",
		"Impact" : -9
	},
	33: {
		"Category" : "Agriculture",
		"Content" : "A viral social media trend increases coffee consumption among younger demographics.",
		"Stock" : "Coffee",
		"Impact" : 10
	},
	34: {
		"Category" : "Agriculture",
		"Content" : "Major coffee chains reduce purchases due to overstocking and shifting to tea alternatives.",
		"Stock" : "Coffee",
		"Impact" : -7
	},
	35: {
		"Category" : "Agriculture",
		"Content" : "Poor weather conditions in competing regions lead to a drop in global wheat supply.",
		"Stock" : "Wheat",
		"Impact" : 15
	},
	36: {
		"Category" : "Agriculture",
		"Content" : "Record-breaking wheat harvests in multiple regions lead to an oversupply.",
		"Stock" : "Wheat",
		"Impact" : -11
	},
	37: {
		"Category" : "Resources",
		"Content" : "A major aluminum smelter in China shuts down due to energy shortages, disrupting global supply.",
		"Stock" : "Aluminum",
		"Impact" : 7
	},
	38: {
		"Category" : "Resources",
		"Content" : "New government regulations significantly limit coal mining in the United States, reducing production.",
		"Stock" : "Coal",
		"Impact" : 5
	},
	39: {
		"Category" : "Resources",
		"Content" : "A massive strike at Chile’s largest copper mine halts production for weeks.",
		"Stock" : "Copper",
		"Impact" : 6
	},
	40: {
		"Category" : "Resources",
		"Content" : "India imposes export tariffs on iron ore, leading to global supply chain disruptions.",
		"Stock" : "Iron",
		"Impact" : 4
	},
	41: {
		"Category" : "Resources",
		"Content" : "A rare discovery of high-grade jade deposits in Myanmar increases market supply unexpectedly.",
		"Stock" : "Jade",
		"Impact" : -8
	},
	42: {
		"Category" : "Resources",
		"Content" : "Italy's marble quarries face environmental restrictions, limiting extraction and exports.",
		"Stock" : "Marble",
		"Impact" : 3
	},
	43: {
		"Category" : "Resources",
		"Content" : "A niter processing plant explosion in Brazil raises global fertilizer prices due to reduced output.",
		"Stock" : "Niter",
		"Impact" : 10
	},
	44: {
		"Category" : "Resources",
		"Content" : "OPEC announces a major production cut, driving up crude oil prices.",
		"Stock" : "Oil",
		"Impact" : 12
	},
	45: {
		"Category" : "Resources",
		"Content" : "A trade embargo on stone imports from a major supplier disrupts construction industries worldwide.",
		"Stock" : "Stone",
		"Impact" : 5
	},
	46: {
		"Category" : "Livestock",
		"Content" : "An algae bloom causes a significant drop in crab populations along the U.S. coast, increasing seafood prices.",
		"Stock" : "Crabs",
		"Impact" : 8
	},
	47: {
		"Category" : "Livestock",
		"Content" : "A widespread outbreak of chronic wasting disease devastates deer populations, impacting hunting and wildlife tourism.",
		"Stock" : "Deer",
		"Impact" : -6
	},
	48: {
		"Category" : "Livestock",
		"Content" : "Overfishing bans in key international waters sharply reduce fish supply for commercial markets.",
		"Stock" : "Fish",
		"Impact" : 7
	},
	49: {
		"Category" : "Livestock",
		"Content" : "A viral equine disease spreads across Europe, affecting horse breeding and racing industries. ",
		"Stock" : "Horses",
		"Impact" : -5
	},
	50: {
		"Category" : "Livestock",
		"Content" : "A severe drought in Australia decimates sheep flocks, reducing wool and meat production.",
		"Stock" : "Sheep",
		"Impact" : 9
	},
	51: {
		"Category" : "Agriculture",
		"Content" : "Massive floods in Southeast Asia wipe out rice paddies, causing a sharp rise in global rice prices.",
		"Stock" : "Rice",
		"Impact" : 15
	},
	52: {
		"Category" : "Agriculture",
		"Content" : "Brazil, the world’s largest sugar producer, reduces sugarcane output due to extreme weather conditions.",
		"Stock" : "Sugar",
		"Impact" : 10
	},
	53: {
		"Category" : "Agriculture",
		"Content" : "A prolonged drought in Brazil, the world's largest coffee producer, severely impacts coffee bean harvests, driving up global coffee prices.",
		"Stock" : "Coffee",
		"Impact" : 12
	},
	54: {
		"Category" : "Agriculture",
		"Content" : "An ongoing war in a major wheat-producing country disrupts exports, spiking wheat prices worldwide.",
		"Stock" : "Wheat",
		"Impact" : 14
	}
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
