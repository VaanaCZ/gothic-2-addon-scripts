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
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_00"); //A więc to ty jesteś ten nowy? Witaj wśród nas, bracie Kręgu.
		DIA_Addon_Martin_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_01"); //Idź, zobacz się teraz z Vatrasem. Może później znajdę czas dla ciebie.
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
	AI_Output	(self, other, "DIA_Addon_Martin_Hallo_07_00"); //Hej, ty! Nie masz tu czego szukać. Mogą tu wchodzić tylko paladyni i straż miejska.
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
	AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_01"); //Jesteś w magazynie królewskich paladynów.
	
	if (other.guild == GIL_NONE)
	&& (SC_IsRanger == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_02"); //Jestem tu kwatermistrzem i mam zadanie dopilnować, żeby z zapasu paladynów nic nie znikło. A ty nie jesteś tu mile widziany.
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_03"); //Więc trzymaj ręce przy sobie albo ci je obetnę.
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

	description	 = 	"Nie możesz mi sprzedać czegoś z rzeczy paladynów?";
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
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_00"); //Nie możesz mi sprzedać czegoś z rzeczy paladynów?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_01"); //Chcesz coś kupić? Pozwól, że ujmę to w ten sposób – jeśli będziesz w stanie zrewanżować mi się za kłopoty, które będę miał, gdy coś zginie, to możemy się jakoś dogadać.
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_02"); //Często się zdarza, że coś nagle znika?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_03"); //Nie, jeśli kwatermistrz twierdzi, że wszystko jest w porządku.
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

	description	 = 	"Rybak Farim ma problemy ze strażą miejską. ";
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
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_00"); //Rybak Farim ma problemy ze strażą miejską. Cały czas go okradają.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_01"); //Czemu powinienem się tym przejmować?
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_02"); //Cieszysz się szacunkiem paladynów.
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_03"); //Farim potrzebuje twojej ochrony. Z chęcią odda ci w zamian część tego, co wyłowi.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_04"); //Już wiem, o co ci chodzi.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_05"); //Ryby! Jakbym nie miał dość innych problemów.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_06"); //Powiedz swojemu koleżce, żeby się ze mną spotkał. Chcę dokładnie wiedzieć, o co chodzi z tą strażą miejską.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_07"); //Zajmę się tym.
	
	B_LogEntry (TOPIC_Addon_FarimsFish,	"Tą sprawą zajmie się kwatermistrz Martin."); 

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
	AI_Output	(self, other, "DIA_Addon_Martin_Trade_07_01"); //Przyjrzyj się bliżej.
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

	description	 = 	"Przysyła mnie Lares. ";
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
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_00"); //Przysyła mnie Lares. Powiedział, że możesz mi pomóc.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_01"); //Czyżby? Więc przejdźmy do rzeczy. Czego ode mnie chcesz?
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_02"); //Chcę wstąpić do straży.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_03"); //Chciałoby się, co? Zwykle nie przyjmujemy takich szemranych typków. Chyba że mamy dobry powód.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_04"); //Hmm, najpierw musiałbyś...
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_05"); //Przestań zrzędzić. Powiedz, co mam zrobić, żebyś mógł mnie przyjąć.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_06"); //Dobra. Nadstaw uszu.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_07"); //Praca kwatermistrza to prawdziwe piekło, uwierz mi. Już samo ustawianie tych wszystkich worków jest dobijające.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_08"); //Na dodatek ktoś majstruje przy skrzyniach, gdy wieczorkiem idę do karczmy Kardifa. Kiedy wracam rano, zawsze czegoś brakuje.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_09"); //Co dziwne, paladyni nigdy nikogo nie zauważyli.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_10"); //Szlag mnie trafia. Przecież nie będę tu stał całą noc jak jakiś idiota, nie?
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_11"); //Ale ty...
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_12"); //Dobra, łapię. Mam tu stać na warcie całą noc, podczas gdy ty będziesz się zabawiał w karczmie.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_13"); //Bierzesz robotę albo nie.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Mam pilnować w nocy skrzyń kwatermistrza Martina. Jeśli złapię łobuza, który grzebie w zapasach, Martin pomoże mi wstąpić do straży."); 

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

	description	 = 	"Dobrze. Przypilnuję dziś w nocy twoich skrzyń z prowiantem.";
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
	AI_Output	(other, self, "DIA_Addon_Martin_Auftrag_15_00"); //Dobrze. Przypilnuję dziś w nocy twoich skrzyń z prowiantem.
	AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_01"); //Świetnie.
	
	if (Wld_IsTime (23,00,04,00))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_02"); //W takim razie idę do knajpy Kardifa. I żeby mi niczego nie brakowało, kiedy wrócę!
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_03"); //Dobrze. Wróć w nocy i przypilnuj całego ładunku. Będę siedział w knajpie Kardifa.
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

	description	= "Szukasz człowieka, który sprzedaje broń bandytom?";
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
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_00"); //Szukasz człowieka, który sprzedaje broń bandytom?
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_01"); //A kto tak mówi?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_02"); //Vatras.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_03"); //Co wiesz na ten temat?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_04"); //Niezbyt dużo, ale mogę dowiedzieć się więcej.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_05"); //Widzę, do czego zmierzasz...
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

	description	= "Co wiesz na temat tego handlarza bronią?";
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
	AI_Output (other, self, "DIA_Addon_Martin_TellAll_15_00"); //Co wiesz na temat tego handlarza bronią?
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_01"); //Dobra, słuchaj. Wiemy, że musi za tym stać wpływowy obywatel górnego miasta.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_02"); //Powiadają nawet, że część broni pochodzi ze zbrojowni straży.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_03"); //Ale nie wiemy dokładnie, kto pociąga za sznurki.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_04"); //Jeśli masz dość odwagi, by poradzić sobie z grupą co najmniej pięciu bandytów, to może uda ci się czegoś dowiedzieć...
	B_LogEntry (TOPIC_Addon_BanditTrader,"Martin twierdzi, że handlarz bronią jest wpływowym obywatelem z górnego miasta."); 
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
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_01"); //Wiemy, że zablokowali drogi pomiędzy farmami i miastem.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_02"); //Wiem też, że w ciągu kilku ostatnich dni otrzymali dostawę broni.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_03"); //Może wśród samych bandytów znajdziemy jakieś wskazówki, które pomogą nam zdemaskować tego handlarza bronią.
	//AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_04"); //Ich werd sehen, was ich tun kann
	
	MIS_Martin_FindTheBanditTrader = LOG_RUNNING;
	B_LogEntry (TOPIC_Addon_BanditTrader,"Bandyci blokują drogę między miastem portowym a gospodarstwami. Być może dadzą mi wskazówkę, jak trafić do handlarza bronią."); 
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

	description	 = 	"Jeśli chodzi o tego handlarza bronią...";
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
	AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_00"); //Jeśli chodzi o tego handlarza bronią...

	if 	(Npc_HasItems (other,ItMw_Addon_BanditTrader))
	||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
	||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
	||(Fernando_HatsZugegeben == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_01"); //Pokaż, co tam masz.
	
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
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_02"); //Ten pałasz zabrałem bandytom. Na głowicy wycięto literę F.
					FernandoHints = (FernandoHints + 1);
				};
				if (Npc_HasItems (other,ItRi_Addon_BanditTrader))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_03"); //To pierścień od jednego z bandytów. Należał do zamorskiego kupca.
					FernandoHints = (FernandoHints + 1);
				};
				if ((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_04"); //Na liście broni i innych towarów dostarczonych bandytom widnieje podpis niejakiego Fernando.
					FernandoHints = (FernandoHints + 3);
				};
			
				if (Fernando_HatsZugegeben == TRUE)
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_05"); //Fernando, kupiec z górnego miasta, przyznał się do robienia interesów z bandytami.
					FernandoHints = (FernandoHints + 1);
				};
			}
			else
			{
				AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_06"); //Fernando przyznał się do dostarczania broni bandytom.
			};
			
		if (FernandoHints >= 3)
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_07"); //Sądzę, że to wystarczy. A więc to Fernando. No to nieźle wpadł.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_08"); //W sumie to dziwne. Zawsze wydawał się takim praworządnym obywatelem.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_09"); //Przypilnuję, żeby przez długi czas nie wyszedł z więzienia.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_10"); //Naprawdę się spisałeś. Czapki z głów.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_11"); //Vatras będzie zachwycony tymi wiadomościami.
			B_StartOtherRoutine	(Fernando,"Prison");
			Fernando_ImKnast = TRUE;
			MIs_Martin_FindTheBanditTrader = LOG_SUCCESS;
			B_LogEntry (TOPIC_Addon_BanditTrader,"Martin przypilnuje, by Fernando zapłacił za swoje grzechy. Muszę powiedzieć o tym Vatrasowi."); 

			B_GivePlayerXP (XP_Addon_FernandoMartin);
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_12"); //Coś jeszcze?
			AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_13"); //To wszystko.
		
			if (Fernando_HatsZugegeben == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_14"); //Miło z jego strony, że tak powiedział, ale bez dowodów nic nie mogę zrobić.
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_15"); //Nie mam zamiaru się ośmieszyć przed Lordem Hagenem. Będziesz musiał dostarczyć więcej dowodów.
			}
			else
			{
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_16"); //To nie wystarczy. To mógłby być niemal każdy z górnego miasta.
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_17"); //Wychodzi na to, że trzeba będzie pójść trochę dalej śladem bandytów i ich łupów. Aż dowiemy się, kto za tym stoi.
				if (Martin_IrrlichtHint == FALSE)
				{
					AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_18"); //Może znów powinieneś porozmawiać z Vatrasem.
					Martin_IrrlichtHint = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_19"); //Przypomnij, o co chodziło?
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_20"); //Musisz się dowiedzieć, kto jest odpowiedzialny za dostawy broni dla bandytów, oraz przynieść mi jakiś dowód.
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_21"); //Musi to być niepodważalny materiał, bo inaczej nie zdołam niczego udowodnić.
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

	description	 = 	"Skrzynie wciąż tu są?";
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
	AI_Output	(other, self, "DIA_Addon_Martin_Perm_15_00"); //Skrzynie wciąż tu są?
	
	if (MIS_Addon_Martin_GetRangar_Day <= (Wld_GetDay()-2))
	&&	(MIS_Addon_Martin_GetRangar == LOG_RUNNING)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_01"); //Ty sukinsynu! Miałeś przecież pilnować tych skrzyń. Teraz znikło coś jeszcze.

		if (Wld_IsTime (24,00,03,00))
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_02"); //Pójdziesz do magazynu na nabrzeżu i dorwiesz gnoja, który mnie okradł.
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_03"); //Dziś w nocy lepiej uważaj, kiedy mnie nie będzie, jasne?
		};	
	}	
	else if ((MIS_Addon_Martin_GetRangar != 0) || (hero.guild != GIL_NONE) || (Sc_IsRanger == TRUE))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_04"); //Tak, tak, śmiej się, ile chcesz. Chętnie bym zobaczył, jak stoisz tu przez cały dzień, próbując zapanować nad tym chaosem.
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_05"); //Paladyni przywieźli tyle złomu, że głowa mała.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_06"); //Nie dotykaj niczego albo zawołam straże. Słyszysz?
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

	description	 = 	"Dowiedziałem się, kim jest złodziej.";
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
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_00"); //Dowiedziałem się, kim jest złodziej.
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_01"); //To Rangar majstrował przy twoich rzeczach.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_02"); //W końcu. Przynajmniej wiem, na kogo teraz uważać. Co za szuja. Dostanie niezłe baty, jeśli złapię go na gorącym uczynku.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_03"); //Zastanawiałem się, dlaczego żaden z paladynów nigdy nic nie zauważył?
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_04"); //No? Dlaczego?
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_05"); //Czy to nie oczywiste? Ci durnie nie potrafią odróżnić nas od strażników. Dla nich wyglądamy tak samo.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_06"); //Dobra robota, kolego.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_07"); //Daj mi znać, jeśli mogę ci w czymś pomóc.

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

	description	 = 	"Wiesz, czego chcę.";
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
	AI_Output	(other, self, "DIA_Addon_Martin_GetMiliz_15_00"); //Wiesz, czego chcę.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_01"); //Tak, oczywiście. Chciałeś wstąpić do straży, prawda?
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_02"); //Już zademonstrowałeś wyjątkowe zdolności.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_03"); //No dobra, ujmę to inaczej – wolałbym mieć cię po naszej stronie.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_04"); //Dlatego ci pomagam. Weź ten list polecający i pokaż go Andre, naszemu głównodowodzącemu paladynowi.
	CreateInvItems (self, ItWr_Martin_MilizEmpfehlung_Addon, 1);									
	B_GiveInvItems (self, other, ItWr_Martin_MilizEmpfehlung_Addon, 1);		
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_05"); //Znajdziesz go w koszarach. Jestem pewien, że znajdzie zajęcie dla kogoś takiego jak ty.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Martin dał mi list polecający do głównodowodzącego paladyna, Andre, dzięki czemu zostanę przyjęty do straży. Andre można znaleźć w koszarach."); 
};


