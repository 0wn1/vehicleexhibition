Config = {

	-- JESTER5
    {
		Model			=		`jester5`, 									-- [Required] Vehicle model hash or name
        Coords			=		vector4(-966.0, -2990.0, 14.0, 51.0), 		-- [Required] Spawn coordinates: vector4(x, y, z, heading)
		
        Rotate			=		true, 										-- [Optional] Enable vehicle rotation (default: false)
        Headlights		=		true, 										-- [Optional] Enable headlights (default: false)
		EngineOn		= 		true, 										-- [Optional] Keep engine running (default: false)
		Collision		= 		true, 										-- [Optional] Enable collision (default: true)
		Projector		=		true, 										-- [Optional] Enable spotlight projection (default: false)
		
		Suspension		= 		0.0, 										-- [Optional] Suspension height: Positive values lower (1.0), negative values raise (-1.0) - (Default: 0.0)
		DirtLevel		=		0.0, 										-- [Optional] Dirt/dust level: From (0.0) clean to (15.0) very dirty
		RotationSpeed	= 		0.10, 										-- [Optional] Rotation speed in degrees per tick (Default: 0.10)

		Plate			= 		'PDMSPORT', 								-- [Optional] Custom license plate text (max 8 characters)
		
		-- Note: 'Headlights' and 'EngineOn' must be enabled for Neon and Xenon to work properly
		
		Livery			=		1, 											-- [Optional] Livery index if vehicle supports liveries (starts at 1)
        PrimaryColor	= 		{0, 0, 0}, 									-- [Optional] Primary color in RGB format (R, G, B)
        SecondaryColor	= 		{0, 0, 0}, 									-- [Optional] Secondary color in RGB format (R, G, B)

		-- [Optional] Available Colors: Default, White, Blue, ElectricBlue, MintGreen, LimeGreen, Yellow, Golden, Orange, Red, PonyPink, HotPink, Purple, Blacklight
		XenonColor		=		'Golden',									-- [Optional] Xenon headlight color
        NeonColor		=		'Golden'									-- [Optional] Neon underglow color
    },

	-- BALLER7
	{
		Model			=		`baller7`,
        Coords			=		vector4(-970.0, -2995.0, 14.0, 51.0),
		
        Rotate			=		true,
		Projector		=		true,
		Headlights		=		true,
		
		Suspension		= 		0.12,										-- Slightly lowered suspension
		DirtLevel		= 		15.0,										-- Maximum dirt level for realistic look
		Plate			= 		'PDMSPORT',
		
		PrimaryColor	= 		{255, 255, 255},							-- White
        SecondaryColor	= 		{255, 255, 255}								-- White
    },
	
	-- COQUETTE4
	{
		Model			=		`coquette4`,
        Coords			=		vector4(-974.0, -3000.0, 14.0, 51.0),
		
        Rotate			=		true,
        Headlights		=		true,
		EngineOn		= 		true,
		Projector		=		true,

		Plate			= 		'PDMSPORT',

        PrimaryColor	= 		{191, 214, 65},								-- Lime yellow-green
        SecondaryColor	= 		{125, 218, 88},								-- Light green
		
		XenonColor		=		'Yellow',
        NeonColor		=		'Yellow'
    },
	
	-- LUXOR2
	{
		Model			=		`luxor2`,
        Coords			=		vector4(-978.0, -3015.0, 14.0, 51.0),
		Collision		= 		false,										-- No collision for aircraft
		Projector		=		true,
        PrimaryColor	= 		{226, 234, 244},							-- Light blue-grey
        SecondaryColor	= 		{226, 234, 244}								-- Light blue-grey
    }
}
