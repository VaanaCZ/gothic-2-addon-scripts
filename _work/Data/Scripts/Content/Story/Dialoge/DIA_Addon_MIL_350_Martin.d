///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Martin_EXIT   (C_INFO)
{
	npc         = Mil_350_Addon_Martin;
	nr          = 999;
	condition   = DIA_Addon_Martin_EXIT_Condition;
	information = DIA_Addon_Martin_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Martin_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Martin_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Martin_PICKPOCKET (C_INFO)
{
	npc			= Mil_350_Addon_Martin;
	nr			= 900;
	condition	= DIA_Addon_Martin_PICKPOCKET_Condition;
	information	= DIA_Addon_Martin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Martin_PICKPOCKET_Condition()
{
	C_Beklauen (65, 77);
};
 
FUNC VOID DIA_Addon_Martin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Martin_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Martin_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Martin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Martin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Martin_PICKPOCKET_DoIt);
};

func void DIA_Addon_Martin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Martin_PICKPOCKET);
};
	
func void DIA_Addon_Martin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Martin_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info MeetingIsRunning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_MeetingIsRunning		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Martin_MeetingIsRunning_Condition;
	information	 = 	DIA_Addon_Martin_MeetingIsRunning_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Martin_MeetingIsRunning_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (RangerMeetingRunning == LOG_RUNNING)
		{
			return TRUE;
		};	
};
var int DIA_Addon_Martin_MeetingIsRunning_OneTime;
func void DIA_Addon_Martin_MeetingIsRunning_Info ()
{
	if (DIA_Addon_Martin_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_00"); //A wi�c to ty jeste� ten nowy? Witaj w�r�d nas, bracie Kr�gu.
		DIA_Addon_Martin_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_01"); //Id�, zobacz si� teraz z Vatrasem. Mo�e p�niej znajd� czas dla ciebie.
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Hallo		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Hallo_Condition;
	information	 = 	DIA_Addon_Martin_Hallo_Info;
	
	important	 = 	TRUE;
};

func int DIA_Addon_Martin_Hallo_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<1000)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (RangerMeetingRunning != LOG_SUCCESS)
	&& (SC_IsRanger == FALSE)
	&& (other.guild != GIL_MIL)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Martin_Hallo_07_00"); //Hej, ty! Nie masz tu czego szuka�. Mog� tu wchodzi� tylko paladyni i stra� miejska.
};


///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_WasMachstDu		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_WasMachstDu_Condition;
	information	 = 	DIA_Addon_Martin_WasMachstDu_Info;

	description	 = 	"Co to za miejsce?";
};

func int DIA_Addon_Martin_WasMachstDu_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<1000)
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_WasMachstDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_WasMachstDu_15_00"); //Co to za miejsce?
	AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_01"); //Jeste� w magazynie kr�lewskich paladyn�w.
	
	if (other.guild == GIL_NONE)
	&& (SC_IsRanger == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_02"); //Jestem tu kwatermistrzem i mam zadanie dopilnowa�, �eby z zapasu paladyn�w nic nie znik�o. A ty nie jeste� tu mile widziany.
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_03"); //Wi�c trzymaj r�ce przy sobie albo ci je obetn�.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_PreTrade		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_PreTrade_Condition;
	information	 = 	DIA_Addon_Martin_PreTrade_Info;

	description	 = 	"Nie mo�esz mi sprzeda� czego� z rzeczy paladyn�w?";
};

func int DIA_Addon_Martin_PreTrade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_PreTrade_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_00"); //Nie mo�esz mi sprzeda� czego� z rzeczy paladyn�w?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_01"); //Chcesz co� kupi�? Pozw�l, �e ujm� to w ten spos�b � je�li b�dziesz w stanie zrewan�owa� mi si� za k�opoty, kt�re b�d� mia�, gdy co� zginie, to mo�emy si� jako� dogada�.
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_02"); //Cz�sto si� zdarza, �e co� nagle znika?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_03"); //Nie, je�li kwatermistrz twierdzi, �e wszystko jest w porz�dku.
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_04"); //Rozumiem.
};

///////////////////////////////////////////////////////////////////////
//	Info Farim
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Farim		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Farim_Condition;
	information	 = 	DIA_Addon_Martin_Farim_Info;

	description	 = 	"Rybak Farim ma problemy ze stra�� miejsk�. ";
};

func int DIA_Addon_Martin_Farim_Condition ()
{
	if (MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_PreTrade))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_Farim_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_00"); //Rybak Farim ma problemy ze stra�� miejsk�. Ca�y czas go okradaj�.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_01"); //Czemu powinienem si� tym przejmowa�?
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_02"); //Cieszysz si� szacunkiem paladyn�w.
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_03"); //Farim potrzebuje twojej ochrony. Z ch�ci� odda ci w zamian cz�� tego, co wy�owi.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_04"); //Ju� wiem, o co ci chodzi.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_05"); //Ryby! Jakbym nie mia� do�� innych problem�w.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_06"); //Powiedz swojemu kole�ce, �eby si� ze mn� spotka�. Chc� dok�adnie wiedzie�, o co chodzi z t� stra�� miejsk�.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_07"); //Zajm� si� tym.
	
	B_LogEntry (TOPIC_Addon_FarimsFish,	"T� spraw� zajmie si� kwatermistrz Martin."); 

	Martin_KnowsFarim = TRUE;
	B_GivePlayerXP (XP_Addon_FarimSchutz);
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Trade		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	80;
	condition	 = 	DIA_Addon_Martin_Trade_Condition;
	information	 = 	DIA_Addon_Martin_Trade_Info;
	Trade		 = 	TRUE;
	permanent	 = 	TRUE;

	description	 = 	"Co masz do zaoferowania?";
};

func int DIA_Addon_Martin_Trade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_PreTrade))
		{
			return TRUE;
		};
};
var int DIA_Addon_Martin_Trade_OneTime;
func void DIA_Addon_Martin_Trade_Info ()
{
	if (DIA_Addon_Martin_Trade_OneTime == FALSE)
	{
		Log_CreateTopic	(TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader, LogText_Addon_MartinTrade); 
		DIA_Addon_Martin_Trade_OneTime = TRUE;
	};
	
	
	AI_Output	(other, self, "DIA_Addon_Martin_Trade_15_00"); //Co masz do zaoferowania?
	B_GiveTradeInv (self);
	AI_Output	(self, other, "DIA_Addon_Martin_Trade_07_01"); //Przyjrzyj si� bli�ej.
};


///////////////////////////////////////////////////////////////////////
//	Info Rangerhelp
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Rangerhelp		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_Rangerhelp_Condition;
	information	 = 	DIA_Addon_Martin_Rangerhelp_Info;

	description	 = 	"Przysy�a mnie Lares. ";
};

func int DIA_Addon_Martin_Rangerhelp_Condition ()
{
	if (RangerHelp_gildeMIL == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
	&& (hero.guild == GIL_NONE)
		{
			return TRUE;
		};		
};

func void DIA_Addon_Martin_Rangerhelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_00"); //Przysy�a mnie Lares. Powiedzia�, �e mo�esz mi pom�c.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_01"); //Czy�by? Wi�c przejd�my do rzeczy. Czego ode mnie chcesz?
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_02"); //Chc� wst�pi� do stra�y.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_03"); //Chcia�oby si�, co? Zwykle nie przyjmujemy takich szemranych typk�w. Chyba �e mamy dobry pow�d.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_04"); //Hmm, najpierw musia�by�...
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_05"); //Przesta� zrz�dzi�. Powiedz, co mam zrobi�, �eby� m�g� mnie przyj��.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_06"); //Dobra. Nadstaw uszu.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_07"); //Praca kwatermistrza to prawdziwe piek�o, uwierz mi. Ju� samo ustawianie tych wszystkich work�w jest dobijaj�ce.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_08"); //Na dodatek kto� majstruje przy skrzyniach, gdy wieczorkiem id� do karczmy Kardifa. Kiedy wracam rano, zawsze czego� brakuje.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_09"); //Co dziwne, paladyni nigdy nikogo nie zauwa�yli.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_10"); //Szlag mnie trafia. Przecie� nie b�d� tu sta� ca�� noc jak jaki� idiota, nie?
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_11"); //Ale ty...
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_12"); //Dobra, �api�. Mam tu sta� na warcie ca�� noc, podczas gdy ty b�dziesz si� zabawia� w karczmie.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_13"); //Bierzesz robot� albo nie.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Mam pilnowa� w nocy skrzy� kwatermistrza Martina. Je�li z�api� �obuza, kt�ry grzebie w zapasach, Martin pomo�e mi wst�pi� do stra�y."); 

}; 

///////////////////////////////////////////////////////////////////////
//	Info Auftrag
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Auftrag		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_Auftrag_Condition;
	information	 = 	DIA_Addon_Martin_Auftrag_Info;

	description	 = 	"Dobrze. Przypilnuj� dzi� w nocy twoich skrzy� z prowiantem.";
};

func int DIA_Addon_Martin_Auftrag_Condition ()
{
	if (RangerHelp_gildeMIL == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_Rangerhelp))
	&& (hero.guild == GIL_NONE)
		{
			return TRUE;
		};
};

var int MIS_Addon_Martin_GetRangar_Day;

func void DIA_Addon_Martin_Auftrag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Auftrag_15_00"); //Dobrze. Przypilnuj� dzi� w nocy twoich skrzy� z prowiantem.
	AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_01"); //�wietnie.
	
	if (Wld_IsTime (23,00,04,00))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_02"); //W takim razie id� do knajpy Kardifa. I �eby mi niczego nie brakowa�o, kiedy wr�c�!
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_03"); //Dobrze. Wr�� w nocy i przypilnuj ca�ego �adunku. B�d� siedzia� w knajpie Kardifa.
	};

	B_StartOtherRoutine	(MIL_321_Rangar,"PrePalCampKlau"); 

	Info_ClearChoices	(DIA_Addon_Martin_Auftrag);
	Info_AddChoice	(DIA_Addon_Martin_Auftrag, "(DALEJ)", DIA_Addon_Martin_Auftrag_weiter );

};

func void DIA_Addon_Martin_Auftrag_weiter ()
{
	MIS_Addon_Martin_GetRangar = LOG_RUNNING;
	MIS_Addon_Martin_GetRangar_Day = Wld_GetDay(); 
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	B_StartOtherRoutine	(MIL_321_Rangar,"PalCampKlau");
};



// ********************************************************************
// 							Banditen + Waffen
// ********************************************************************
///////////////////////////////////////////////////////////////////////
//	From Vatras
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_FromVatras (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_FromVatras_Condition;
	information	= DIA_Addon_Martin_FromVatras_Info;

	description	= "Szukasz cz�owieka, kt�ry sprzedaje bro� bandytom?";
};
func int DIA_Addon_Martin_FromVatras_Condition ()
{
	if (Vatras_ToMartin == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_FromVatras_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_00"); //Szukasz cz�owieka, kt�ry sprzedaje bro� bandytom?
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_01"); //A kto tak m�wi?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_02"); //Vatras.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_03"); //Co wiesz na ten temat?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_04"); //Niezbyt du�o, ale mog� dowiedzie� si� wi�cej.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_05"); //Widz�, do czego zmierzasz...
};	
///////////////////////////////////////////////////////////////////////
//	Tell Me
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_TellAll (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_TellAll_Condition;
	information	= DIA_Addon_Martin_TellAll_Info;

	description	= "Co wiesz na temat tego handlarza broni�?";
};
func int DIA_Addon_Martin_TellAll_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_FromVatras))
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_TellAll_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_TellAll_15_00"); //Co wiesz na temat tego handlarza broni�?
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_01"); //Dobra, s�uchaj. Wiemy, �e musi za tym sta� wp�ywowy obywatel g�rnego miasta.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_02"); //Powiadaj� nawet, �e cz�� broni pochodzi ze zbrojowni stra�y.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_03"); //Ale nie wiemy dok�adnie, kto poci�ga za sznurki.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_04"); //Je�li masz do�� odwagi, by poradzi� sobie z grup� co najmniej pi�ciu bandyt�w, to mo�e uda ci si� czego� dowiedzie�...
	B_LogEntry (TOPIC_Addon_BanditTrader,"Martin twierdzi, �e handlarz broni� jest wp�ywowym obywatelem z g�rnego miasta."); 
};	
///////////////////////////////////////////////////////////////////////
//	About Bandits
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_AboutBandits (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_AboutBandits_Condition;
	information	= DIA_Addon_Martin_AboutBandits_Info;

	description	= "O co chodzi z tymi bandytami?";
};
func int DIA_Addon_Martin_AboutBandits_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_TellAll))
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_AboutBandits_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_AboutBandits_15_00"); //O co chodzi z tymi bandytami?
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_01"); //Wiemy, �e zablokowali drogi pomi�dzy farmami i miastem.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_02"); //Wiem te�, �e w ci�gu kilku ostatnich dni otrzymali dostaw� broni.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_03"); //Mo�e w�r�d samych bandyt�w znajdziemy jakie� wskaz�wki, kt�re pomog� nam zdemaskowa� tego handlarza broni�.
	//AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_04"); //Ich werd sehen, was ich tun kann
	
	MIS_Martin_FindTheBanditTrader = LOG_RUNNING;
	B_LogEntry (TOPIC_Addon_BanditTrader,"Bandyci blokuj� drog� mi�dzy miastem portowym a gospodarstwami. By� mo�e dadz� mi wskaz�wk�, jak trafi� do handlarza broni�."); 
};	

///////////////////////////////////////////////////////////////////////
//	Info Fernando
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Fernando		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Fernando_Condition;
	information	 = 	DIA_Addon_Martin_Fernando_Info;
	permanent	 = 	TRUE;

	description	 = 	"Je�li chodzi o tego handlarza broni�...";
};

func int DIA_Addon_Martin_Fernando_Condition ()
{
	if (MIs_Martin_FindTheBanditTrader == LOG_RUNNING)
		{
			return TRUE;
		};
};

var int Martin_IrrlichtHint;

func void DIA_Addon_Martin_Fernando_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_00"); //Je�li chodzi o tego handlarza broni�...

	if 	(Npc_HasItems (other,ItMw_Addon_BanditTrader))
	||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
	||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
	||(Fernando_HatsZugegeben == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_01"); //Poka�, co tam masz.
	
		var int FernandoHints;
		FernandoHints = 0;
		
		if 	(
			(Npc_HasItems (other,ItMw_Addon_BanditTrader))
			||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
			||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
			)
			{
				
				if (Npc_HasItems (other,ItMw_Addon_BanditTrader))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_02"); //Ten pa�asz zabra�em bandytom. Na g�owicy wyci�to liter� F.
					FernandoHints = (FernandoHints + 1);
				};
				if (Npc_HasItems (other,ItRi_Addon_BanditTrader))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_03"); //To pier�cie� od jednego z bandyt�w. Nale�a� do zamorskiego kupca.
					FernandoHints = (FernandoHints + 1);
				};
				if ((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_04"); //Na li�cie broni i innych towar�w dostarczonych bandytom widnieje podpis niejakiego Fernando.
					FernandoHints = (FernandoHints + 3);
				};
			
				if (Fernando_HatsZugegeben == TRUE)
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_05"); //Fernando, kupiec z g�rnego miasta, przyzna� si� do robienia interes�w z bandytami.
					FernandoHints = (FernandoHints + 1);
				};
			}
			else
			{
				AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_06"); //Fernando przyzna� si� do dostarczania broni bandytom.
			};
			
		if (FernandoHints >= 3)
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_07"); //S�dz�, �e to wystarczy. A wi�c to Fernando. No to nie�le wpad�.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_08"); //W sumie to dziwne. Zawsze wydawa� si� takim praworz�dnym obywatelem.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_09"); //Przypilnuj�, �eby przez d�ugi czas nie wyszed� z wi�zienia.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_10"); //Naprawd� si� spisa�e�. Czapki z g��w.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_11"); //Vatras b�dzie zachwycony tymi wiadomo�ciami.
			B_StartOtherRoutine	(Fernando,"Prison");
			Fernando_ImKnast = TRUE;
			MIs_Martin_FindTheBanditTrader = LOG_SUCCESS;
			B_LogEntry (TOPIC_Addon_BanditTrader,"Martin przypilnuje, by Fernando zap�aci� za swoje grzechy. Musz� powiedzie� o tym Vatrasowi."); 

			B_GivePlayerXP (XP_Addon_FernandoMartin);
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_12"); //Co� jeszcze?
			AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_13"); //To wszystko.
		
			if (Fernando_HatsZugegeben == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_14"); //Mi�o z jego strony, �e tak powiedzia�, ale bez dowod�w nic nie mog� zrobi�.
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_15"); //Nie mam zamiaru si� o�mieszy� przed Lordem Hagenem. B�dziesz musia� dostarczy� wi�cej dowod�w.
			}
			else
			{
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_16"); //To nie wystarczy. To m�g�by by� niemal ka�dy z g�rnego miasta.
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_17"); //Wychodzi na to, �e trzeba b�dzie p�j�� troch� dalej �ladem bandyt�w i ich �up�w. A� dowiemy si�, kto za tym stoi.
				if (Martin_IrrlichtHint == FALSE)
				{
					AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_18"); //Mo�e zn�w powiniene� porozmawia� z Vatrasem.
					Martin_IrrlichtHint = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_19"); //Przypomnij, o co chodzi�o?
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_20"); //Musisz si� dowiedzie�, kto jest odpowiedzialny za dostawy broni dla bandyt�w, oraz przynie�� mi jaki� dow�d.
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_21"); //Musi to by� niepodwa�alny materia�, bo inaczej nie zdo�am niczego udowodni�.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Perm		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Martin_Perm_Condition;
	information	 = 	DIA_Addon_Martin_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"Skrzynie wci�� tu s�?";
};

func int DIA_Addon_Martin_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Perm_15_00"); //Skrzynie wci�� tu s�?
	
	if (MIS_Addon_Martin_GetRangar_Day <= (Wld_GetDay()-2))
	&&	(MIS_Addon_Martin_GetRangar == LOG_RUNNING)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_01"); //Ty sukinsynu! Mia�e� przecie� pilnowa� tych skrzy�. Teraz znik�o co� jeszcze.

		if (Wld_IsTime (24,00,03,00))
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_02"); //P�jdziesz do magazynu na nabrze�u i dorwiesz gnoja, kt�ry mnie okrad�.
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_03"); //Dzi� w nocy lepiej uwa�aj, kiedy mnie nie b�dzie, jasne?
		};	
	}	
	else if ((MIS_Addon_Martin_GetRangar != 0) || (hero.guild != GIL_NONE) || (Sc_IsRanger == TRUE))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_04"); //Tak, tak, �miej si�, ile chcesz. Ch�tnie bym zobaczy�, jak stoisz tu przez ca�y dzie�, pr�buj�c zapanowa� nad tym chaosem.
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_05"); //Paladyni przywie�li tyle z�omu, �e g�owa ma�a.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_06"); //Nie dotykaj niczego albo zawo�am stra�e. S�yszysz?
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GotRangar
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_GotRangar		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_GotRangar_Condition;
	information	 = 	DIA_Addon_Martin_GotRangar_Info;

	description	 = 	"Dowiedzia�em si�, kim jest z�odziej.";
};

func int DIA_Addon_Martin_GotRangar_Condition ()
{
	if (MIS_Addon_Martin_GetRangar == LOG_RUNNING)
	&& (SC_GotRangar == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_GotRangar_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_00"); //Dowiedzia�em si�, kim jest z�odziej.
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_01"); //To Rangar majstrowa� przy twoich rzeczach.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_02"); //W ko�cu. Przynajmniej wiem, na kogo teraz uwa�a�. Co za szuja. Dostanie niez�e baty, je�li z�api� go na gor�cym uczynku.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_03"); //Zastanawia�em si�, dlaczego �aden z paladyn�w nigdy nic nie zauwa�y�?
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_04"); //No? Dlaczego?
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_05"); //Czy to nie oczywiste? Ci durnie nie potrafi� odr�ni� nas od stra�nik�w. Dla nich wygl�damy tak samo.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_06"); //Dobra robota, kolego.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_07"); //Daj mi zna�, je�li mog� ci w czym� pom�c.

	MIS_Addon_Martin_GetRangar = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Martin_GotRangar_Report);
};

///////////////////////////////////////////////////////////////////////
//	Info GetMiliz
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_GetMiliz		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_GetMiliz_Condition;
	information	 = 	DIA_Addon_Martin_GetMiliz_Info;

	description	 = 	"Wiesz, czego chc�.";
};

func int DIA_Addon_Martin_GetMiliz_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_GotRangar))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_GetMiliz_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_GetMiliz_15_00"); //Wiesz, czego chc�.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_01"); //Tak, oczywi�cie. Chcia�e� wst�pi� do stra�y, prawda?
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_02"); //Ju� zademonstrowa�e� wyj�tkowe zdolno�ci.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_03"); //No dobra, ujm� to inaczej � wola�bym mie� ci� po naszej stronie.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_04"); //Dlatego ci pomagam. We� ten list polecaj�cy i poka� go Andre, naszemu g��wnodowodz�cemu paladynowi.
	CreateInvItems (self, ItWr_Martin_MilizEmpfehlung_Addon, 1);									
	B_GiveInvItems (self, other, ItWr_Martin_MilizEmpfehlung_Addon, 1);		
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_05"); //Znajdziesz go w koszarach. Jestem pewien, �e znajdzie zaj�cie dla kogo� takiego jak ty.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Martin da� mi list polecaj�cy do g��wnodowodz�cego paladyna, Andre, dzi�ki czemu zostan� przyj�ty do stra�y. Andre mo�na znale�� w koszarach."); 
};


