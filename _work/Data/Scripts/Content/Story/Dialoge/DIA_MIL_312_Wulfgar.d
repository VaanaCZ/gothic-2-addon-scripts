// *************************************************
// 						EXIT
// *************************************************
INSTANCE DIA_Wulfgar_EXIT   (C_INFO)
{
	npc         = Mil_312_Wulfgar;
	nr          = 999;
	condition   = DIA_Wulfgar_EXIT_Condition;
	information = DIA_Wulfgar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Wulfgar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wulfgar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// *************************************************
// 						Hallo
// *************************************************
instance DIA_Wulfgar_Hallo		(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	1;
	condition	 = 	DIA_Wulfgar_Hallo_Condition;
	information	 = 	DIA_Wulfgar_Hallo_Info;
	permanent	 = 	FALSE;
	description	 = 	"Jak jde služba?";
};

func int DIA_Wulfgar_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Wulfgar_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_Hallo_15_00"); //Jak jde služba?
	AI_Output (self, other, "DIA_Wulfgar_Hallo_04_01"); //(pohrdavě) Tihle hoši máchají meči jako nějací farmáři.
	AI_Output (self, other, "DIA_Wulfgar_Hallo_04_02"); //(rozhodně) Ale až s nimi skončím, každý z nich bude tvrdý, pevný parchant.
};

// *************************************************
// 						WannaJoin
// *************************************************
instance DIA_Wulfgar_WannaJoin		(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	2;
	condition	 = 	DIA_Wulfgar_WannaJoin_Condition;
	information	 = 	DIA_Wulfgar_WannaJoin_Info;
	permanent	 = 	FALSE;
	description	 = 	"Chci se přidat k domobraně!";
};

func int DIA_Wulfgar_WannaJoin_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Wulfgar_Hallo))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_WannaJoin_15_00"); //Chci se přidat k domobraně!
	AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_01"); //No a? Jsi občanem města?
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (other, self, "DIA_Wulfgar_WannaJoin_15_02"); //Ne.
		AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_03"); //V tom případě tě lord Andre nepřijme.
		AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_04"); //Samozřejmě že si s ním můžeš promluvit - ale neřekl bych, že u tebe učiní výjimku.
	}
	else
	{
		AI_Output (other, self, "DIA_Wulfgar_WannaJoin_15_05"); //Ano.
		AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_06"); //V tom případě si promluv s lordem Andrem. On rozhoduje, koho přijmout a koho ne.
	};
};

// *************************************************
// 						AboutMiliz
// *************************************************
instance DIA_Wulfgar_AboutMiliz		(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	3;
	condition	 = 	DIA_Wulfgar_AboutMiliz_Condition;
	information	 = 	DIA_Wulfgar_AboutMiliz_Info;
	permanent	 = 	FALSE;
	description	 = 	"Jak to vypadá v domobraně?";
};

func int DIA_Wulfgar_AboutMiliz_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Wulfgar_Hallo))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_AboutMiliz_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_AboutMiliz_15_00"); //Jak to vypadá v domobraně?
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_01"); //Naším velitelem je teď lord Andre.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_02"); //Domobrana se dřív zodpovídala místodržícímu. (směje se) Ten neměl ponětí, co tady děláme.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_03"); //Ale lord Andre dobře ví, co dělá. O chlapy se stará vážně dobře.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_04"); //Každý, kdo tady začíná, dostane slušnou zbroj a dobrou zbraň.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_05"); //A když odvádíš dobrou práci, dostaneš něco navíc. Za každého lapeného kriminálníka dostaneš odměnu.
};

// *************************************************
// 						CanYouTrain
// *************************************************
instance DIA_Wulfgar_CanYouTrain		(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	4;
	condition	 = 	DIA_Wulfgar_CanYouTrain_Condition;
	information	 = 	DIA_Wulfgar_CanYouTrain_Info;
	permanent	 = 	FALSE;
	description	 = 	"Můžeš učit v boji s mečem i mě?";
};

func int DIA_Wulfgar_CanYouTrain_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Wulfgar_Hallo))
	&& (other.guild != GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_CanYouTrain_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_CanYouTrain_15_00"); //Můžeš učit boji s mečem i mě?
	AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_01"); //Lord Andre mi přikázal, abych cvičil každého, kdo by mohl být schopen bránit město.
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_02"); //To ovšem neplatí pro žoldáky. Zmiz.
	}
	else
	{
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_03"); //To ovšem platí jen pro bojový výcvik. Všechny ostatní druhy výcviku jsou vyhrazeny domobraně.
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_04"); //Umíš aspoň trochu ovládat zbraň?
		AI_Output (other, self, "DIA_Wulfgar_CanYouTrain_15_05"); //Řekl bych, že ano.
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_06"); //(povzdychne si) Dobrá - můžeme začít, až se na to budeš cítit.
		Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
		B_LogEntry (Topic_CityTeacher, "Wulfgar, člen městské gardy, mě může vycvičit v jednoručním i obouručním boji.");
		Wulfgar_Teach1H = TRUE;	
	};
};

// *************************************************
// 						Advantage
// *************************************************
instance DIA_Wulfgar_Advantage		(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	5;
	condition	 = 	DIA_Wulfgar_Advantage_Condition;
	information	 = 	DIA_Wulfgar_Advantage_Info;
	permanent	 = 	FALSE;
	description	 = 	"Jaké jsou výhody jednoručních a obouručních zbraní?";
};

func int DIA_Wulfgar_Advantage_Condition ()
{
	if (Wulfgar_Teach1H == TRUE)
	|| (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Advantage_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_Advantage_15_00"); //Jaké jsou výhody jednoručních a obouručních zbraní?
	AI_Output (self, other, "DIA_Wulfgar_Advantage_04_01"); //Je to prosté. S jednoruční zbraní jsi rychlejší. To může být v bitvě poměrně značná výhoda.
	AI_Output (self, other, "DIA_Wulfgar_Advantage_04_02"); //Obouruční zbraně jsou těžkopádnější. Musíš bojovat obezřetně - při zásahu však způsobíš mnohem větší zranění.
};

// *************************************************
// 						HowToBegin
// *************************************************
instance DIA_Wulfgar_HowToBegin	(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	6;
	condition	 = 	DIA_Wulfgar_HowToBegin_Condition;
	information	 = 	DIA_Wulfgar_HowToBegin_Info;
	permanent	 = 	FALSE;
	description	 = 	"U čeho mám začít? U jednoručních, nebo obouručních zbraní?";
};

func int DIA_Wulfgar_HowToBegin_Condition ()
{
	if (Wulfgar_Teach1H == TRUE)
	|| (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_HowToBegin_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_HowToBegin_15_00"); //U čeho mám začít? U jednoručních, nebo obouručních zbraní?
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_01"); //To je jen a pouze na tobě.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_02"); //Pokud se zaměříš jen na jeden typ zbraní, budeš se zároveň učit i ten druhý.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_03"); //Jestliže jsi například dobrý v boji s jednoručními meči, ale jsi stále začátečník v boji s obouručními zbraněmi...
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_04"); //...tvé dovednosti s obouručními zbraněmi se zvýší, i když trénuješ s jednoruční zbraní.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_05"); //V takovém případě je výcvik náročnější, než když se učíš s oběma typy zbraní.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_06"); //Začněme a brzy sám zjistíš, o čem to mluvím.
};

// *************************************************
// 						TRAIN
// *************************************************
INSTANCE DIA_Wulfgar_Teach(C_INFO)
{
	npc			= Mil_312_Wulfgar;
	nr			= 7;
	condition	= DIA_Wulfgar_Teach_Condition;
	information	= DIA_Wulfgar_Teach_Info;
	permanent	= TRUE;
	description = "Začněme s výcvikem.";
};                       

FUNC INT DIA_Wulfgar_Teach_Condition()
{
	if (Wulfgar_Teach1H == TRUE)
	|| (other.guild == GIL_MIL)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Wulfgar_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Wulfgar_Teach_15_00"); //Začněme s výcvikem.
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Wulfgar_Add_04_00"); //Žoldáky necvičím!
	}
	else
	{
		if (other.guild == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Wulfgar_Add_04_01"); //Jistě, ctihodnosti.
		};
		
		Info_ClearChoices 	(DIA_Wulfgar_Teach);
		Info_AddChoice 		(DIA_Wulfgar_Teach,	DIALOG_BACK		,DIA_Wulfgar_Teach_Back);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))		,DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Wulfgar_Teach_1H_5);
	};
};

FUNC VOID DIA_Wulfgar_Teach_Back ()
{
	Info_ClearChoices (DIA_Wulfgar_Teach);
};

FUNC VOID DIA_Wulfgar_Teach_1H_1 ()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 75)
	{
		Info_ClearChoices 	(DIA_Wulfgar_Teach);
		Info_AddChoice 		(DIA_Wulfgar_Teach,	DIALOG_BACK		,DIA_Wulfgar_Teach_Back);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))		,DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))		,DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Wulfgar_Teach_1H_5);
	};
};
FUNC VOID DIA_Wulfgar_Teach_1H_5 ()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 75)
	{
		Info_ClearChoices 	(DIA_Wulfgar_Teach);
		Info_AddChoice 		(DIA_Wulfgar_Teach,	DIALOG_BACK		,DIA_Wulfgar_Teach_Back);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Wulfgar_Teach_1H_5);
	};	
};

FUNC VOID DIA_Wulfgar_Teach_2H_1 ()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 75)
	{
		Info_ClearChoices 	(DIA_Wulfgar_Teach);
		Info_AddChoice 		(DIA_Wulfgar_Teach,	DIALOG_BACK		,DIA_Wulfgar_Teach_Back);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Wulfgar_Teach_1H_5);
	};
};
FUNC VOID DIA_Wulfgar_Teach_2H_5 ()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 75)
	{
		Info_ClearChoices 	(DIA_Wulfgar_Teach);
		Info_AddChoice 		(DIA_Wulfgar_Teach,	DIALOG_BACK		,DIA_Wulfgar_Teach_Back);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice		(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Wulfgar_Teach_1H_5);
	};	
};

// ************************************************************
// 			  				Als Miliz
// ************************************************************

INSTANCE DIA_Wulfgar_AlsMil (C_INFO)
{
	npc			= Mil_312_Wulfgar;
	nr			= 1;
	condition	= DIA_Wulfgar_AlsMil_Condition;
	information	= DIA_Wulfgar_AlsMil_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Wulfgar_AlsMil_Condition()
{
	if (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Wulfgar_AlsMil_Info()
{	
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_00"); //Takže tě lord Andre přijal!
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_01"); //Předpokládám, že sem budeš chodit cvičit pravidelně.
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_02"); //Ruga tě bude učit v umění střelby z kuše a Mortis ti pomůže zvýšit sílu.
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_03"); //Ale nejdůležitější pro tebe je pořádně se naučit zacházet s mečem.
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_04"); //Ještě z tebe udělám dobrého bijce!
};

///////////////////////////////////////////////////////////////////////
//	Info Bonus
///////////////////////////////////////////////////////////////////////
instance DIA_Wulfgar_Bonus		(C_INFO)
{
	npc			 = 	Mil_312_Wulfgar;
	nr			 = 	2;
	condition	 = 	DIA_Wulfgar_Bonus_Condition;
	information	 = 	DIA_Wulfgar_Bonus_Info;
	permanent	 = 	FALSE;
	important	 = 	TRUE;
};

func int DIA_Wulfgar_Bonus_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (Wld_IsTime (05,02,06,54))
	{
		return TRUE;
	};
};
func void DIA_Wulfgar_Bonus_Info ()
{
	AI_Output (self, other, "DIA_Wulfgar_Bonus_04_00"); //Tak brzy a již na nohou? V tuhle denní dobu tady bývám většinou sám. Ale když už jsi tady, můžeš se něčemu přiučit.
	AI_Output (self, other, "DIA_Wulfgar_Bonus_04_01"); //Tak dávej pozor. Některé protivníky můžeš zmást, když se jejich úderům vyhneš a pak v pravou chvíli udeříš.
	AI_Output (self, other, "DIA_Wulfgar_Bonus_04_02"); //Pamatuj na to ve svém příštím boji!
	
	B_RaiseFightTalent (other, NPC_TALENT_1H, 2);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Wulfgar_PICKPOCKET (C_INFO)
{
	npc			= Mil_312_Wulfgar;
	nr			= 900;
	condition	= DIA_Wulfgar_PICKPOCKET_Condition;
	information	= DIA_Wulfgar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Wulfgar_PICKPOCKET_Condition()
{
	C_Beklauen (58, 80);
};
 
FUNC VOID DIA_Wulfgar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Wulfgar_PICKPOCKET);
	Info_AddChoice		(DIA_Wulfgar_PICKPOCKET, DIALOG_BACK 		,DIA_Wulfgar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Wulfgar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Wulfgar_PICKPOCKET_DoIt);
};

func void DIA_Wulfgar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Wulfgar_PICKPOCKET);
};
	
func void DIA_Wulfgar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Wulfgar_PICKPOCKET);
};







