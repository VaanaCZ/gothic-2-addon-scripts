///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Balthasar_EXIT   (C_INFO)
{
	npc         = BAU_932_Balthasar;
	nr          = 999;
	condition   = DIA_Balthasar_EXIT_Condition;
	information = DIA_Balthasar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Balthasar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Balthasar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_HALLO		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	3;
	condition	 = 	DIA_Balthasar_HALLO_Condition;
	information	 = 	DIA_Balthasar_HALLO_Info;

	description	 = 	"Jak leci?";
};

func int DIA_Balthasar_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Balthasar_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_HALLO_15_00"); //Co słychać?
	AI_Output			(self, other, "DIA_Balthasar_HALLO_05_01"); //O, nowy w gospodarstwie! Czyżby stary sknera w końcu załatwił mi pomocnika?
	AI_Output			(other, self, "DIA_Balthasar_HALLO_15_02"); //Nie jestem pomocnikiem.
	AI_Output			(self, other, "DIA_Balthasar_HALLO_05_03"); //Och. Rozumiem. Nie jestem już taki młody, wiesz? Od lat czekam na następcę.
	AI_Output			(self, other, "DIA_Balthasar_HALLO_05_04"); //Chyba nie przyszedłeś tu dlatego, że sąsiedzi się zdenerwowali, co?
	

};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	4;
	condition	 = 	DIA_Balthasar_WASMACHSTDU_Condition;
	information	 = 	DIA_Balthasar_WASMACHSTDU_Info;

	description	 = 	"Na czym polega twoja praca?";
};

func int DIA_Balthasar_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Balthasar_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Balthasar_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_WASMACHSTDU_15_00"); //Na czym polega twoja praca?
	AI_Output			(self, other, "DIA_Balthasar_WASMACHSTDU_05_01"); //Och, pilnuję owiec. Robię to, odkąd pamiętam.
	AI_Output			(self, other, "DIA_Balthasar_WASMACHSTDU_05_02"); //Zwierzaki są bardzo mądre i wierne, wiesz. Jeśli je dobrze traktujesz, będą cię słuchać przez całe życie.

};

///////////////////////////////////////////////////////////////////////
//	Info Rangerbandits
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Balthasar_Rangerbandits		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Balthasar_Rangerbandits_Condition;
	information	 = 	DIA_Addon_Balthasar_Rangerbandits_Info;

	description	 = 	"Widziałeś może bandytów w okolicy?";
};

func int DIA_Addon_Balthasar_Rangerbandits_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Balthasar_HALLO))
	&& (
		(MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)		
		||(SC_KnowsLuciaCaughtByBandits == TRUE)
		)
		{
			return TRUE;
		};
};

func void DIA_Addon_Balthasar_Rangerbandits_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Balthasar_Rangerbandits_15_00"); //Widziałeś może bandytów w okolicy?
	AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_01"); //Pewnie. Przechodzili przez pole w pobliżu farmy Sekoba, a potem zaszyli się w lesie.
	
	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)	
	{
		AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_02"); //Mieli ze sobą dużo broni. Wyglądali, jakby chcieli wygrać wojnę z orkami na własną rękę.
	};
	
	if (SC_KnowsLuciaCaughtByBandits == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_03"); //Wydawało mi się, że prowadzili ze sobą dziewczynę, ale nie dam za to głowy.
		AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_04"); //Mam nadzieję, że jej nie skrzywdzili.
	};
	B_GivePlayerXP (XP_Ambient);
	AI_Output	(self, other, "DIA_Addon_Balthasar_Rangerbandits_05_05"); //Cieszę się, że ominęli naszą farmę.
};

///////////////////////////////////////////////////////////////////////
//	Info aergermitnachbarn
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_AERGERMITNACHBARN		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	5;
	condition	 = 	DIA_Balthasar_AERGERMITNACHBARN_Condition;
	information	 = 	DIA_Balthasar_AERGERMITNACHBARN_Info;

	description	 = 	"Masz jakieś kłopoty z sąsiadami?";
};

func int DIA_Balthasar_AERGERMITNACHBARN_Condition ()
{
	if (
		(Npc_KnowsInfo(other, DIA_Balthasar_WASMACHSTDU))
		&& ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		&& 	(
			((Npc_IsDead(BalthasarSheep1))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep2))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep3))== FALSE)
			)
		)
			{
					return TRUE;
			};
};

func void DIA_Balthasar_AERGERMITNACHBARN_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_AERGERMITNACHBARN_15_00"); //Masz jakieś kłopoty z sąsiadami?
	AI_Output			(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_01"); //Trawa po tej stronie wielkiego pola jest zawsze wysuszona i rzadka. Więc zazwyczaj chodzę na pastwiska innych farmerów.
	AI_Output			(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_02"); //Onarowi to wszystko jedno, ale Bengar, do którego należą pastwiska na płaskowyżu, zawsze robi wielką aferę, kiedy wyprowadzam tam zwierzęta.
	AI_Output			(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_03"); //Mówi, że Sekob winien mu zapłacić, skoro zwierzęta pasą się na jego ziemi.
	AI_Output			(self, other, "DIA_Balthasar_AERGERMITNACHBARN_05_04"); //Ale Sekob nie wyda na to ani grosza, więc nie mogę już chodzić na płaskowyż.
};

///////////////////////////////////////////////////////////////////////
//	Info woBengar
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_WOBENGAR		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	10;
	condition	 = 	DIA_Balthasar_WOBENGAR_Condition;
	information	 = 	DIA_Balthasar_WOBENGAR_Info;

	description	 = 	"Gdzie mogę znaleźć te pastwiska i gospodarstwo Bengara?";
};

func int DIA_Balthasar_WOBENGAR_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Balthasar_AERGERMITNACHBARN))
		&& ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
			{
				return TRUE;
			};
};

func void DIA_Balthasar_WOBENGAR_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_WOBENGAR_15_00"); //Gdzie mogę znaleźć te pastwiska i gospodarstwo Bengara?
	AI_Output			(self, other, "DIA_Balthasar_WOBENGAR_05_01"); //Idź tą ścieżką i przejdź przez duże rozstaje.
	AI_Output			(self, other, "DIA_Balthasar_WOBENGAR_05_02"); //Jeśli skręcisz w prawo, zobaczysz wielką skałę. Za nią, na prawo, są pastwiska na płaskowyżu i przełęcz.
};


///////////////////////////////////////////////////////////////////////
//	Info talktoBengar
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_TALKTOBENGAR		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	6;
	condition	 = 	DIA_Balthasar_TALKTOBENGAR_Condition;
	information	 = 	DIA_Balthasar_TALKTOBENGAR_Info;

	description	 = 	"Może powinienem pomówić z Bengarem.";
};

func int DIA_Balthasar_TALKTOBENGAR_Condition ()
{
	if (
		(Npc_KnowsInfo(other, DIA_Balthasar_AERGERMITNACHBARN))
		&& ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		&& 	(
			((Npc_IsDead(BalthasarSheep1))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep2))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep3))== FALSE)
			)
		)
			{
					return TRUE;
			};
};

func void DIA_Balthasar_TALKTOBENGAR_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_TALKTOBENGAR_15_00"); //Może powinienem pomówić z Bengarem.
	AI_Output			(self, other, "DIA_Balthasar_TALKTOBENGAR_05_01"); //Zrobisz to dla mnie? A co mu powiesz? To znaczy, wiesz, nie chcę żadnych kłopotów.
	AI_Output			(other, self, "DIA_Balthasar_TALKTOBENGAR_15_02"); //Zobaczymy.

	Log_CreateTopic (TOPIC_BalthasarsSchafe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BalthasarsSchafe, LOG_RUNNING);
	B_LogEntry (TOPIC_BalthasarsSchafe,"Farmer Bengar zabronił pasterzowi Balthasarowi zabierać owce na płaskowyż."); 
	MIS_Balthasar_BengarsWeide = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info Bengarueberredet
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_BENGARUEBERREDET		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	8;
	condition	 = 	DIA_Balthasar_BENGARUEBERREDET_Condition;
	information	 = 	DIA_Balthasar_BENGARUEBERREDET_Info;

	description	 = 	"Możesz znowu wyprowadzać owce na pastwiska Bengara.";
};

func int DIA_Balthasar_BENGARUEBERREDET_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Balthasar_TALKTOBENGAR))
		&& (MIS_Balthasar_BengarsWeide == LOG_SUCCESS)
		&& ((hero.guild == GIL_NONE)||(hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		&& 	(
			((Npc_IsDead(BalthasarSheep1))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep2))== FALSE)
			|| ((Npc_IsDead(BalthasarSheep3))== FALSE)
			)
		)
			{
					return TRUE;
			};
};

func void DIA_Balthasar_BENGARUEBERREDET_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_BENGARUEBERREDET_15_00"); //Możesz znowu wprowadzić owce na pastwiska Bengara. Rozmawiałem z nim.
	AI_Output			(self, other, "DIA_Balthasar_BENGARUEBERREDET_05_01"); //Dziękuję! Od razu ruszam w drogę.
	AI_Output			(self, other, "DIA_Balthasar_BENGARUEBERREDET_05_02"); //A ty weź w podzięce za pomoc te baranie skóry.

	B_GiveInvItems (self, other, ItAt_SheepFur, 10);  

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"BengarsWeide"); 	

	B_GivePlayerXP (XP_Balthasar_BengarsWeide);

	//Joly: "NW_BIGMILL_FARM3_BALTHASAR"
	
	Wld_InsertNpc	(Sheep,"NW_BIGMILL_FARM3_BALTHASAR"); 
	Wld_InsertNpc	(Sheep,"NW_BIGMILL_FARM3_BALTHASAR"); 
	Wld_InsertNpc	(Hammel,"NW_BIGMILL_FARM3_BALTHASAR"); 

	BalthasarSheep1 = Hlp_GetNpc (Balthasar_Sheep1); 

	if (Hlp_IsValidNpc(BalthasarSheep1))
	&& (!Npc_IsDead(BalthasarSheep1))
		{
			AI_StartState (BalthasarSheep1, ZS_MM_Rtn_Follow_Sheep_Balthasar, 1, "");
		};
	BalthasarSheep2 = Hlp_GetNpc (Balthasar_Sheep2); 

	if (Hlp_IsValidNpc(BalthasarSheep2))
	&& (!Npc_IsDead(BalthasarSheep2))
		{
			AI_StartState (BalthasarSheep2, ZS_MM_Rtn_Follow_Sheep_Balthasar, 1, "");
		};	
	BalthasarSheep3 = Hlp_GetNpc (Balthasar_Sheep3); 

	if (Hlp_IsValidNpc(BalthasarSheep3))
	&& (!Npc_IsDead(BalthasarSheep3))
		{
			AI_StartState (BalthasarSheep3, ZS_MM_Rtn_Follow_Sheep_Balthasar, 1, "");
		};
};

///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Balthasar_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_932_Balthasar;
	nr		 = 	70;
	condition	 = 	DIA_Balthasar_PERMKAP1_Condition;
	information	 = 	DIA_Balthasar_PERMKAP1_Info;
	permanent	 = 	TRUE;

	description	 = 	"Oprócz tego, wszystko w porządku?";
};

func int DIA_Balthasar_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Balthasar_WASMACHSTDU)) 
		{
				return TRUE;
		};
};

func void DIA_Balthasar_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Balthasar_PERMKAP1_15_00"); //A poza tym, wszystko w porządku?
	
	Npc_PerceiveAll(self);
	if 	(
				(
					( Wld_DetectNpc(self,Balthasar_Sheep1,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
					||( Wld_DetectNpc(self,Balthasar_Sheep2,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
					||( Wld_DetectNpc(self,Balthasar_Sheep3,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
					||( Wld_DetectNpc(self,Sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
					||( Wld_DetectNpc(self,Hammel,NOFUNC,-1) && (Npc_GetDistToNpc(self, other)<2000) )
				)
		)
			
				{
					AI_Output			(self, hero, "DIA_Balthasar_PERMKAP1_05_01"); //Nie mogę narzekać. Dziękuję za troskę.
					AI_StopProcessInfos (self);
				}
	else
			{
				AI_Output			(self, hero, "DIA_Balthasar_PERMKAP1_05_02"); //Czasy są ciężkie. Nie mogę znaleźć moich owiec!
				if (Npc_IsDead(Sekob)== FALSE)
				{
					AI_Output			(self, hero, "DIA_Balthasar_PERMKAP1_05_03"); //Chyba muszę się wyspowiadać Sekobowi.
				};
				AI_StopProcessInfos (self);
				Npc_ExchangeRoutine	(self,"Start"); //Joly: falls er auf der 2. Weide bei Bengar ist.
			};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Balthasar_PICKPOCKET (C_INFO)
{
	npc			= BAU_932_Balthasar;
	nr			= 900;
	condition	= DIA_Balthasar_PICKPOCKET_Condition;
	information	= DIA_Balthasar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Balthasar_PICKPOCKET_Condition()
{
	C_Beklauen (10, 10);
};
 
FUNC VOID DIA_Balthasar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Balthasar_PICKPOCKET);
	Info_AddChoice		(DIA_Balthasar_PICKPOCKET, DIALOG_BACK 		,DIA_Balthasar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Balthasar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Balthasar_PICKPOCKET_DoIt);
};

func void DIA_Balthasar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Balthasar_PICKPOCKET);
};
	
func void DIA_Balthasar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Balthasar_PICKPOCKET);
};
















