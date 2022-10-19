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
	description	 = 	"Jak tam na s³u¿bie?";
};

func int DIA_Wulfgar_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Wulfgar_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Wulfgar_Hallo_15_00"); //Jak tam na s³u¿bie?
	AI_Output (self, other, "DIA_Wulfgar_Hallo_04_01"); //Ci ch³opcy machaj¹ mieczami jak cepem.
	AI_Output (self, other, "DIA_Wulfgar_Hallo_04_02"); //Ale kiedy z nimi skoñczê, wszyscy, jak jeden m¹¿, bêd¹ twardzi jak ska³a.
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
	description	 = 	"Chcê wst¹piæ do stra¿y.";
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
	AI_Output (other, self, "DIA_Wulfgar_WannaJoin_15_00"); //Chcê wst¹piæ do stra¿y.
	AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_01"); //Czy jesteœ obywatelem miasta?
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output (other, self, "DIA_Wulfgar_WannaJoin_15_02"); //Nie.
		AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_03"); //W takim razie Lord Andre ciê nie przyjmie.
		AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_04"); //Oczywiœcie, mo¿esz z nim porozmawiaæ - ale w¹tpiê, by zrobi³ dla ciebie wyj¹tek.
	}
	else
	{
		AI_Output (other, self, "DIA_Wulfgar_WannaJoin_15_05"); //Tak.
		AI_Output (self, other, "DIA_Wulfgar_WannaJoin_04_06"); //Porozmawiaj wiêc z Lordem Andre. To on jest odpowiedzialny za rekrutacjê.
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
	description	 = 	"Jak siê maj¹ sprawy w stra¿y?";
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
	AI_Output (other, self, "DIA_Wulfgar_AboutMiliz_15_00"); //Jak siê maj¹ sprawy w stra¿y?
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_01"); //Naszym kapitanem jest obecnie Lord Andre.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_02"); //Swego czasu stra¿ odpowiada³a przed gubernatorem. Ten cz³owiek nie mia³ pojêcia, co siê tutaj naprawdê dzieje.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_03"); //Lord Andre, dla odmiany, wie, co robi. Potrafi odpowiednio zadbaæ o swoich ludzi.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_04"); //Wszyscy, którzy zaczynaj¹ tu pracê, dostaj¹ przyzwoit¹ zbrojê i porz¹dn¹ broñ.
	AI_Output (self, other, "DIA_Wulfgar_AboutMiliz_04_05"); //A jeœli ktoœ dobrze pracuje, mo¿e zawsze liczyæ na premiê. Za ka¿dego z³apanego przestêpcê czeka wysoka nagroda.
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
	description	 = 	"Czy mo¿esz mnie trenowaæ w walce mieczem?";
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
	AI_Output (other, self, "DIA_Wulfgar_CanYouTrain_15_00"); //Mo¿esz mnie trenowaæ w walce mieczem?
	AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_01"); //Lord Andre nakaza³, byœmy trenowali wszystkich, którzy s³u¿¹ sprawie miasta.
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_02"); //Jest jednak pewien wyj¹tek - najemnicy. Wynocha.
	}
	else
	{
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_03"); //Dotyczy to jednak tylko treningu bojowego. Wszystkie pozosta³e formy szkolenia s¹ zarezerwowane dla stra¿y.
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_04"); //Wiesz chocia¿, jak trzymaæ broñ, któr¹ walczysz?
		AI_Output (other, self, "DIA_Wulfgar_CanYouTrain_15_05"); //Tak mi siê wydaje...
		AI_Output (self, other, "DIA_Wulfgar_CanYouTrain_04_06"); //W porz¹dku, zaczniemy, kiedy bêdziesz chcia³.
		Log_CreateTopic (Topic_CityTeacher, LOG_NOTE);
		B_LogEntry (Topic_CityTeacher, "Wulfgar, stra¿nik miejski, mo¿e mnie nauczyæ walki orê¿em jedno- i dwurêcznym.");
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
	description	 = 	"Opowiedz mi proszê o ró¿nicach miêdzy broni¹ jednorêczn¹ i dwurêczn¹.";
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
	AI_Output (other, self, "DIA_Wulfgar_Advantage_15_00"); //Opowiedz mi proszê o ró¿nicach miêdzy broni¹ jednorêczn¹ i dwurêczn¹.
	AI_Output (self, other, "DIA_Wulfgar_Advantage_04_01"); //To proste. U¿ywaj¹c broni jednorêcznej, jesteœ szybszy, to zaœ mo¿e stanowiæ o twej przewadze w walce.
	AI_Output (self, other, "DIA_Wulfgar_Advantage_04_02"); //Broñ dwurêczna spowalnia twoje ruchy i dlatego nale¿y u¿ywaæ jej bardzo rozwa¿nie. Jednak przy trafieniu zadaje znacznie wiêksze obra¿enia.
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
	description	 = 	"Od czego powinienem zacz¹æ? Od broni jedno- czy dwurêcznych?";
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
	AI_Output (other, self, "DIA_Wulfgar_HowToBegin_15_00"); //Od czego powinienem zacz¹æ? Od broni jedno- czy dwurêcznych?
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_01"); //To ju¿ zale¿y od ciebie.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_02"); //Jeœli specjalizujesz siê w jednym rodzaju broni, drugiego uczysz siê automatycznie w tym samym czasie.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_03"); //Na przyk³ad, jeœli œwietnie walczysz mieczem jednorêcznym, zaœ jeœli chodzi o dwurêczny - dopiero zaczynasz naukê...
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_04"); //...Wtedy twoja umiejêtnoœæ walki mieczem dwurêcznym bêdzie zwiêksza³a siê za ka¿dym razem, gdy u¿yjesz miecza jednorêcznego.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_05"); //W takim przypadku, trening jest bardziej wyczerpuj¹cy.
	AI_Output (self, other, "DIA_Wulfgar_HowToBegin_04_06"); //Tylko zacznij, a wkrótce przekonasz siê, co mia³em na myœli.
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
		AI_Output (self, other, "DIA_Wulfgar_Add_04_00"); //Nie trenujê najemników!
	}
	else
	{
		if (other.guild == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Wulfgar_Add_04_01"); //Oczywiœcie, wielebny.
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
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_00"); //Mówisz wiêc, ¿e Lord Andre przyj¹³ ciê na s³u¿bê!
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_01"); //Mam nadziejê, ¿e bêdziesz tu przychodzi³ i trenowa³ regularnie.
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_02"); //Ruga bêdzie twoim nauczycielem kusznictwa, natomiast Mortis poka¿e ci, jak zwiêkszyæ si³ê.
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_03"); //Jednak najwa¿niejszym aspektem treningu jest porz¹dne nauczenie siê machania mieczem.
	AI_Output (self, other, "DIA_Wulfgar_AlsMil_04_04"); //Jeszcze bêdzie z ciebie niez³y wojownik, masz moje s³owo!
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
	AI_Output (self, other, "DIA_Wulfgar_Bonus_04_00"); //Tak wczeœnie na nogach. Z regu³y o tej porze nikt mnie nie odwiedza. No, ale skoro ju¿ tu jesteœ, to mo¿e warto ciê czegoœ nauczyæ.
	AI_Output (self, other, "DIA_Wulfgar_Bonus_04_01"); //S³uchaj wiêc uwa¿nie. Mo¿esz wyprowadziæ swych przeciwników w pole, unikaj¹c ich ciosów i atakuj¹c w odpowiednim momencie.
	AI_Output (self, other, "DIA_Wulfgar_Bonus_04_02"); //Pamiêtaj o tym podczas kolejnej walki.
	
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







