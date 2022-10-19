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
	description	 = 	"Jak tam na s�u�bie?";
};

func int DIA_Wulfgar_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Wulfgar_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_Hallo_15_00"); //Jak tam na s�u�bie?
	AI_Output (self, other, "DIA_Wulfgar_Hallo_04_01"); //Ci ch�opcy machaj� mieczami jak cepem.
	AI_Output (self, other, "DIA_Wulfgar_Hallo_04_02"); //Ale kiedy z nimi sko�cz�, wszyscy, jak jeden m��, b�d� twardzi jak ska�a.
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
	description	 = 	"Chc� wst�pi� do stra�y.";
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
	AI_Output (other, self, "DIA_Wulfgar_WannaJoin_15_00"); //Chc� wst�pi� do stra�y.
	AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_01"); //Czy jeste� obywatelem miasta?
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (other, self, "DIA_Wulfgar_WannaJoin_15_02"); //Nie.
		AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_03"); //W takim razie Lord Andre ci� nie przyjmie.
		AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_04"); //Oczywi�cie, mo�esz z nim porozmawia� - ale w�tpi�, by zrobi� dla ciebie wyj�tek.
	}
	else
	{
		AI_Output (other, self, "DIA_Wulfgar_WannaJoin_15_05"); //Tak.
		AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_06"); //Porozmawiaj wi�c z Lordem Andre. To on jest odpowiedzialny za rekrutacj�.
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
	description	 = 	"Jak si� maj� sprawy w stra�y?";
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
	AI_Output (other, self, "DIA_Wulfgar_AboutMiliz_15_00"); //Jak si� maj� sprawy w stra�y?
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_01"); //Naszym kapitanem jest obecnie Lord Andre.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_02"); //Swego czasu stra� odpowiada�a przed gubernatorem. Ten cz�owiek nie mia� poj�cia, co si� tutaj naprawd� dzieje.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_03"); //Lord Andre, dla odmiany, wie, co robi. Potrafi odpowiednio zadba� o swoich ludzi.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_04"); //Wszyscy, kt�rzy zaczynaj� tu prac�, dostaj� przyzwoit� zbroj� i porz�dn� bro�.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_05"); //A je�li kto� dobrze pracuje, mo�e zawsze liczy� na premi�. Za ka�dego z�apanego przest�pc� czeka wysoka nagroda.
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
	description	 = 	"Czy mo�esz mnie trenowa� w walce mieczem?";
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
	AI_Output (other, self, "DIA_Wulfgar_CanYouTrain_15_00"); //Mo�esz mnie trenowa� w walce mieczem?
	AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_01"); //Lord Andre nakaza�, by�my trenowali wszystkich, kt�rzy s�u�� sprawie miasta.
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_02"); //Jest jednak pewien wyj�tek - najemnicy. Wynocha.
	}
	else
	{
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_03"); //Dotyczy to jednak tylko treningu bojowego. Wszystkie pozosta�e formy szkolenia s� zarezerwowane dla stra�y.
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_04"); //Wiesz chocia�, jak trzyma� bro�, kt�r� walczysz?
		AI_Output (other, self, "DIA_Wulfgar_CanYouTrain_15_05"); //Tak mi si� wydaje...
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_06"); //W porz�dku, zaczniemy, kiedy b�dziesz chcia�.
		Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
		B_LogEntry (Topic_CityTeacher, "Wulfgar, stra�nik miejski, mo�e mnie nauczy� walki or�em jedno- i dwur�cznym.");
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
	description	 = 	"Opowiedz mi prosz� o r�nicach mi�dzy broni� jednor�czn� i dwur�czn�.";
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
	AI_Output (other, self, "DIA_Wulfgar_Advantage_15_00"); //Opowiedz mi prosz� o r�nicach mi�dzy broni� jednor�czn� i dwur�czn�.
	AI_Output (self, other, "DIA_Wulfgar_Advantage_04_01"); //To proste. U�ywaj�c broni jednor�cznej, jeste� szybszy, to za� mo�e stanowi� o twej przewadze w walce.
	AI_Output (self, other, "DIA_Wulfgar_Advantage_04_02"); //Bro� dwur�czna spowalnia twoje ruchy i dlatego nale�y u�ywa� jej bardzo rozwa�nie. Jednak przy trafieniu zadaje znacznie wi�ksze obra�enia.
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
	description	 = 	"Od czego powinienem zacz��? Od broni jedno- czy dwur�cznych?";
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
	AI_Output (other, self, "DIA_Wulfgar_HowToBegin_15_00"); //Od czego powinienem zacz��? Od broni jedno- czy dwur�cznych?
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_01"); //To ju� zale�y od ciebie.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_02"); //Je�li specjalizujesz si� w jednym rodzaju broni, drugiego uczysz si� automatycznie w tym samym czasie.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_03"); //Na przyk�ad, je�li �wietnie walczysz mieczem jednor�cznym, za� je�li chodzi o dwur�czny - dopiero zaczynasz nauk�...
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_04"); //...Wtedy twoja umiej�tno�� walki mieczem dwur�cznym b�dzie zwi�ksza�a si� za ka�dym razem, gdy u�yjesz miecza jednor�cznego.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_05"); //W takim przypadku, trening jest bardziej wyczerpuj�cy.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_06"); //Tylko zacznij, a wkr�tce przekonasz si�, co mia�em na my�li.
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
	description = "Zacznijmy trening.";
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
	AI_Output (other,self ,"DIA_Wulfgar_Teach_15_00"); //Zacznijmy trening.
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Wulfgar_Add_04_00"); //Nie trenuj� najemnik�w!
	}
	else
	{
		if (other.guild == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Wulfgar_Add_04_01"); //Oczywi�cie, wielebny.
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
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_00"); //M�wisz wi�c, �e Lord Andre przyj�� ci� na s�u�b�!
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_01"); //Mam nadziej�, �e b�dziesz tu przychodzi� i trenowa� regularnie.
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_02"); //Ruga b�dzie twoim nauczycielem kusznictwa, natomiast Mortis poka�e ci, jak zwi�kszy� si��.
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_03"); //Jednak najwa�niejszym aspektem treningu jest porz�dne nauczenie si� machania mieczem.
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_04"); //Jeszcze b�dzie z ciebie niez�y wojownik, masz moje s�owo!
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
	AI_Output (self, other, "DIA_Wulfgar_Bonus_04_00"); //Tak wcze�nie na nogach. Z regu�y o tej porze nikt mnie nie odwiedza. No, ale skoro ju� tu jeste�, to mo�e warto ci� czego� nauczy�.
	AI_Output (self, other, "DIA_Wulfgar_Bonus_04_01"); //S�uchaj wi�c uwa�nie. Mo�esz wyprowadzi� swych przeciwnik�w w pole, unikaj�c ich cios�w i atakuj�c w odpowiednim momencie.
	AI_Output (self, other, "DIA_Wulfgar_Bonus_04_02"); //Pami�taj o tym podczas kolejnej walki.
	
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







