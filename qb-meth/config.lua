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
	MethField = {coords = vector3(-2664.6, 3262.0, 32.81), name = 'blip_PickupMeth', color = 25, sprite = 496, radius = 30.0},
	MethProcessing = {coords = vector3(-2642.28, 3277.23, 32.91), name = 'blip_ProcessMeth', color = 25, sprite = 496, radius = 100.0},
	DrugDealer = {coords = vector3(-2633.98, 3273.95, 32.99), name = 'blip_DrugDealer', color = 6, sprite = 378, radius = 25.0},
}
