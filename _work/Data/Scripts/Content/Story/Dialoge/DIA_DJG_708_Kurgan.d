
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Kurgan_EXIT   (C_INFO)
{
	npc         = DJG_708_Kurgan;
	nr          = 999;
	condition   = DIA_Kurgan_EXIT_Condition;
	information = DIA_Kurgan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kurgan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kurgan_EXIT_Info()
{
	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (Biff,400);	//Joly: Damit Biff nicht sofort am Anfang Kohle einfordert.
};

//************************************************************************
//	Hello
//************************************************************************
instance DIA_Kurgan_HELLO		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_HELLO_Condition;
	information	= 	DIA_Kurgan_HELLO_Info;

	important	= 	TRUE;
};

func int DIA_Kurgan_HELLO_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_HELLO_Info ()
{
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_00"); //Hej, ty! Chlápci jako ty by si mìli dávat pozor, kam šlapou.
	AI_Output			(other,self , "DIA_Kurgan_HELLO_15_01"); //Co se mi to pokoušíš øíct?
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_02"); //Chtìl jsem tím øíct, že zdejší ovzduší není prospìšné tvému zdraví. Tahle oblast je teï prolezlá skøety a dalšíma zrùdama.
	AI_Output			(self ,other, "DIA_Kurgan_HELLO_01_03"); //A to nepoèítám draky. Ber to jen jako dobøe mínìnou radu.
	B_LogEntry (TOPIC_Dragonhunter,"U vchodu do Hornického údolí mì pøivítala skupina drakobijcù. Byli tìžce ozbrojení, ale obávám se, že na draky tím moc velký dojem neudìlají.");
};

//**************************************************************************
//	Was sonst noch?
//**************************************************************************

instance DIA_Kurgan_ELSE		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_ELSE_Condition;
	information	= 	DIA_Kurgan_ELSE_Info;
	description	= 	"Mùžeš mi øíct nìco, co už bych dávno nevìdìl?";

};

func int DIA_Kurgan_ELSE_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_ELSE_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_ELSE_15_00"); //Mùžeš mi øíct nìco, co už bych dávno nevìdìl?
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_01"); //Mùžu ti dát dobrou radu, a to dokonce zdarma.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_02"); //Nemùžem tu potøebovat nikoho, kdo se složí ze slabouèkýho draèího prdnutí.
	AI_Output			(self ,other, "DIA_Kurgan_ELSE_01_03"); //Jdi domù, tohle je práce pro opravdový chlapy.
	
};

//**************************************************************************
//	Bist du hier der Anführer?
//**************************************************************************

instance DIA_Kurgan_Leader		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_Leader_Condition;
	information	= 	DIA_Kurgan_Leader_Info;
	description	= 	"Ty jsi tady šéf?";

};

func int DIA_Kurgan_Leader_Condition ()
{
	return TRUE;
};

func void DIA_Kurgan_Leader_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_Leader_15_00"); //Ty jsi tady šéf?
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_01"); //Vypadám tak? Jasnì že ne. Nepotøebujeme žádnýho nafoukanýho blba, co by nám nìco rozkazoval.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_02"); //Když se Sylvio snažil chovat jako náš šéf, ukázali jsme mu i tìm jeho kámošùm, co si o tom myslíme.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_03"); //Pohádali jsme se. Nakonec sami odešli.
	AI_Output			(self ,other, "DIA_Kurgan_Leader_01_04"); //Doufám, že Sylvio skonèil v kotli s polívkou nìjakýho skøeta.
};

//**************************************************************************
//	Wolltet ihr nicht ein paar Drachen töten?
//**************************************************************************

instance DIA_Kurgan_KillDragon		(C_INFO)
{
	npc		 	= 	DJG_708_Kurgan;
	condition	= 	DIA_Kurgan_KillDragon_Condition;
	information	= 	DIA_Kurgan_KillDragon_Info;
	description	= 	"Takže ty chceš zabíjet draky?";

};

func int DIA_Kurgan_KillDragon_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kurgan_Leader))
		{
				return TRUE;
		};
};
var int Kurgan_KillDragon_Day;
func void DIA_Kurgan_KillDragon_Info ()
{
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_00"); //(posmìšnì) Tak ty chceš zabít draky?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_01"); //Bláznivej osle. Tak ty víš, jak složit draka?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_02"); //To si myslíš, že ta bestie si prostì bude jen tak klidnì sedìt ve svym doupìti a èekat, až jí usekneš hlavu?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_03"); //Nìco takovýho vyžaduje dobrej plán a ráznou akci.
	AI_Output			(other,self , "DIA_Kurgan_KillDragon_15_04"); //Já vím. A jak se s tím hodláte vypoøádat vy?
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_05"); //Nejdøív musíme zjistit, kde tu bestii najdeme.
	AI_Output			(self ,other, "DIA_Kurgan_KillDragon_01_06"); //Teprve pak si mùžeme promyslet, jak tu potvoru zabít.

	
	Kurgan_KillDragon_Day = Wld_GetDay(); 

	Info_AddChoice	(DIA_Kurgan_KillDragon, "To bych chtìl vidìt, ale musím se starat o své vìci.", DIA_Kurgan_KillDragon_weg );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "Jak se chcete dostat pøes skøety?"					, DIA_Kurgan_KillDragon_orks );
	Info_AddChoice	(DIA_Kurgan_KillDragon, "Mám dojem, že nenajdeš ani slepou ovci.", DIA_Kurgan_KillDragon_spott );


};
func void DIA_Kurgan_KillDragon_spott ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_spott_15_00"); //Mám dojem, že nenajdeš ani slepou ovci.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_spott_01_01"); //Co? To chceš, abych ti nìjakou vrazil?
	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};

func void DIA_Kurgan_KillDragon_orks ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_orks_15_00"); //Jak se chcete dostat pøes skøety?
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_orks_01_01"); //Na tyhle vìci je ještì dost èasu.

};

func void DIA_Kurgan_KillDragon_weg ()
{
	AI_Output			(other, self, "DIA_Kurgan_KillDragon_weg_15_00"); //To bych chtìl vidìt, ale musím se starat o své vìci.
	AI_Output			(self, other, "DIA_Kurgan_KillDragon_weg_01_01"); //Mìl by ses odsud rychle vytratit. Jinak se ti mùže stát, že pøijdeš o hnátu, možná o dvì.

	AI_StopProcessInfos (self);
};
	
///////////////////////////////////////////////////////////////////////
//	Info SEENDRAGON
///////////////////////////////////////////////////////////////////////
instance DIA_Kurgan_SEENDRAGON		(C_INFO)
{
	npc		 = 	DJG_708_Kurgan;
	condition	 = 	DIA_Kurgan_SEENDRAGON_Condition;
	information	 = 	DIA_Kurgan_SEENDRAGON_Info;
	permanent	 = 	TRUE;

	description	 = 	"Už jsi nìkdy vidìl draka?";
};

func int DIA_Kurgan_SEENDRAGON_Condition ()
{
	if (Kurgan_KillDragon_Day<=(Wld_GetDay()-2))
		{
				return TRUE;
		};
};

func void DIA_Kurgan_SEENDRAGON_Info ()
{
	AI_Output			(other, self, "DIA_Kurgan_SEENDRAGON_15_00"); //Už jsi nìkdy toho draka vidìl?
	AI_Output			(self, other, "DIA_Kurgan_SEENDRAGON_01_01"); //Zatím ne. Ale ta bestie se nemùže schovávat vìènì.
};

//*********************************************************************
//	AllDragonsDead 
//*********************************************************************
INSTANCE DIA_Kurgan_AllDragonsDead   (C_INFO)
{
	npc         = DJG_708_Kurgan;
	nr          = 5;
	condition   = DIA_Kurgan_AllDragonsDead_Condition;
	information = DIA_Kurgan_AllDragonsDead_Info;
	permanent   = FALSE;
	description	= "Draci jsou mrtví.";
				
};

FUNC INT DIA_Kurgan_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Kurgan_AllDragonsDead_Info()
{
	AI_Output	(other,self ,"DIA_Kurgan_AllDragonsDead_15_00"); //Draci jsou mrtví.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_01"); //Ha, a kdo je jako mìl zabít? Paladinové?
	AI_Output 	(other,self ,"DIA_Kurgan_AllDragonsDead_15_02"); //Já.
	AI_Output 	(self ,other,"DIA_Kurgan_AllDragonsDead_01_03"); //(smích) Ha. Tomu sám nevìøíš. Pøestaò si ze mì utahovat.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kurgan_PICKPOCKET (C_INFO)
{
	npc			= DJG_708_Kurgan;
	nr			= 900;
	condition	= DIA_Kurgan_PICKPOCKET_Condition;
	information	= DIA_Kurgan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Kurgan_PICKPOCKET_Condition()
{
	C_Beklauen (34, 120);
};
 
FUNC VOID DIA_Kurgan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kurgan_PICKPOCKET);
	Info_AddChoice		(DIA_Kurgan_PICKPOCKET, DIALOG_BACK 		,DIA_Kurgan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kurgan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kurgan_PICKPOCKET_DoIt);
};

func void DIA_Kurgan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kurgan_PICKPOCKET);
};
	
func void DIA_Kurgan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kurgan_PICKPOCKET);
};




