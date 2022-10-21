//EVT_UNDEADDRAGON_TRAP_XX_FUNC	(Traps beim Undeaddragon)

//****************************
// 	EVT_UNDEADDRAGON_TRAP_01_FUNC 
//****************************
var int EVT_UNDEADDRAGON_TRAP_01_FUNC_COUNT;
var int EVT_UNDEADDRAGON_TRAP_01_FUNC_COUNT_NoMore;
func void EVT_UNDEADDRAGON_TRAP_01_FUNC ()
{
	if (EVT_UNDEADDRAGON_TRAP_01_FUNC_COUNT_NoMore < 10)//Joly:kein Exploid
	{
		if (EVT_UNDEADDRAGON_TRAP_01_FUNC_COUNT < 2)
		&& (EVT_UNDEADDRAGON_TRAP_01_FUNC_COUNT != 0)	//Joly: beim ersten Öffnen -> Kein Ork, denn es gibt schon einen ersten per Startup
		{
			Wld_InsertNpc	(UndeadOrcWarrior,	"DI_UNDEADDRAGON_TRAP_01");
		};
		EVT_UNDEADDRAGON_TRAP_01_FUNC_COUNT = (EVT_UNDEADDRAGON_TRAP_01_FUNC_COUNT + 1);
		
		if (EVT_UNDEADDRAGON_TRAP_01_FUNC_COUNT > 2) //Joly:jedes 2. Öffnen macht einen Ork
		{
			EVT_UNDEADDRAGON_TRAP_01_FUNC_COUNT = 1;
		};
		
	EVT_UNDEADDRAGON_TRAP_01_FUNC_COUNT_NoMore = (EVT_UNDEADDRAGON_TRAP_01_FUNC_COUNT_NoMore + 1);
	};
};

//****************************
// 	EVT_UNDEADDRAGON_TRAP_02_FUNC 
//****************************
var int EVT_UNDEADDRAGON_TRAP_02_FUNC_COUNT;
var int EVT_UNDEADDRAGON_TRAP_02_FUNC_COUNT_NoMore;
func void EVT_UNDEADDRAGON_TRAP_02_FUNC ()
{
	if (EVT_UNDEADDRAGON_TRAP_02_FUNC_COUNT_NoMore < 10)//Joly:kein Exploid
	{
		if (EVT_UNDEADDRAGON_TRAP_02_FUNC_COUNT < 2)
		&& (EVT_UNDEADDRAGON_TRAP_02_FUNC_COUNT != 0)	//Joly: beim ersten Öffnen -> Kein Ork, denn es gibt schon einen ersten per Startup
		{
			Wld_InsertNpc	(UndeadOrcWarrior,	"DI_UNDEADDRAGON_TRAP_02");
		};
		EVT_UNDEADDRAGON_TRAP_02_FUNC_COUNT = (EVT_UNDEADDRAGON_TRAP_02_FUNC_COUNT + 1);
		
		if (EVT_UNDEADDRAGON_TRAP_02_FUNC_COUNT > 2) //Joly:jedes 2. Öffnen macht einen Ork
		{
			EVT_UNDEADDRAGON_TRAP_02_FUNC_COUNT = 1;
		};
		
	EVT_UNDEADDRAGON_TRAP_02_FUNC_COUNT_NoMore = (EVT_UNDEADDRAGON_TRAP_02_FUNC_COUNT_NoMore + 1);
	};
};

//****************************
// 	EVT_UNDEADDRAGON_TRAP_03_FUNC 
//****************************
var int EVT_UNDEADDRAGON_TRAP_03_FUNC_COUNT;
var int EVT_UNDEADDRAGON_TRAP_03_FUNC_COUNT_NoMore;
func void EVT_UNDEADDRAGON_TRAP_03_FUNC ()
{
	if (EVT_UNDEADDRAGON_TRAP_03_FUNC_COUNT_NoMore < 10)//Joly:kein Exploid
	{
		if (EVT_UNDEADDRAGON_TRAP_03_FUNC_COUNT < 2)
		&& (EVT_UNDEADDRAGON_TRAP_03_FUNC_COUNT != 0)	//Joly: beim ersten Öffnen -> Kein Ork, denn es gibt schon einen ersten per Startup
		{
			Wld_InsertNpc	(UndeadOrcWarrior,	"DI_UNDEADDRAGON_TRAP_03");
		};
		EVT_UNDEADDRAGON_TRAP_03_FUNC_COUNT = (EVT_UNDEADDRAGON_TRAP_03_FUNC_COUNT + 1);
		
		if (EVT_UNDEADDRAGON_TRAP_03_FUNC_COUNT > 2) //Joly:jedes 2. Öffnen macht einen Ork
		{
			EVT_UNDEADDRAGON_TRAP_03_FUNC_COUNT = 1;
		};
		
	EVT_UNDEADDRAGON_TRAP_03_FUNC_COUNT_NoMore = (EVT_UNDEADDRAGON_TRAP_03_FUNC_COUNT_NoMore + 1);
	};
};
