Config = {}

Config.Locale = 'en'

Config.Delays = {
	ProcessMeth = 1000 * 1
}

Config.Pricesell = 800

Config.MinPiecesWed = 1



Config.DrugDealerItems = {
	plastic_baggie = 91
}

Config.LicenseEnable = false -- enable processing licenses? The player will be required to buy a license in order to process drugs. 



Config.GiveBlack = false -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
	PickupMeth = {coords = vector3(4825.76, -5029.92, 29.60), name = 'blip_PickupMeth', color = 25, sprite = 496, radius = 30.0},
	ProcessMeth = {coords = vector3(5127.62, -4619.56, -4.67), name = 'blip_ProcessMeth', color = 25, sprite = 496, radius = 100.0},
	DrugDealer = {coords = vector3(5138.67, -4621.93, -4.07), name = 'blip_DrugDealer', color = 6, sprite = 378, radius = 25.0},
}