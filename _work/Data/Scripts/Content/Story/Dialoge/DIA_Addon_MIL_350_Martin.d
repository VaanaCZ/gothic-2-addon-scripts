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
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_00"); //A wiêc to ty jesteœ ten nowy? Witaj wœród nas, bracie Krêgu.
		DIA_Addon_Martin_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_01"); //IdŸ, zobacz siê teraz z Vatrasem. Mo¿e póŸniej znajdê czas dla ciebie.
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
	AI_Output	(self, other, "DIA_Addon_Martin_Hallo_07_00"); //Hej, ty! Nie masz tu czego szukaæ. Mog¹ tu wchodziæ tylko paladyni i stra¿ miejska.
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
	AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_01"); //Jesteœ w magazynie królewskich paladynów.
	
	if (other.guild == GIL_NONE)
	&& (SC_IsRanger == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_02"); //Jestem tu kwatermistrzem i mam zadanie dopilnowaæ, ¿eby z zapasu paladynów nic nie znik³o. A ty nie jesteœ tu mile widziany.
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_03"); //Wiêc trzymaj rêce przy sobie albo ci je obetnê.
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

	description	 = 	"Nie mo¿esz mi sprzedaæ czegoœ z rzeczy paladynów?";
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
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_00"); //Nie mo¿esz mi sprzedaæ czegoœ z rzeczy paladynów?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_01"); //Chcesz coœ kupiæ? Pozwól, ¿e ujmê to w ten sposób – jeœli bêdziesz w stanie zrewan¿owaæ mi siê za k³opoty, które bêdê mia³, gdy coœ zginie, to mo¿emy siê jakoœ dogadaæ.
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_02"); //Czêsto siê zdarza, ¿e coœ nagle znika?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_03"); //Nie, jeœli kwatermistrz twierdzi, ¿e wszystko jest w porz¹dku.
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

	description	 = 	"Rybak Farim ma problemy ze stra¿¹ miejsk¹. ";
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
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_00"); //Rybak Farim ma problemy ze stra¿¹ miejsk¹. Ca³y czas go okradaj¹.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_01"); //Czemu powinienem siê tym przejmowaæ?
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_02"); //Cieszysz siê szacunkiem paladynów.
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_03"); //Farim potrzebuje twojej ochrony. Z chêci¹ odda ci w zamian czêœæ tego, co wy³owi.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_04"); //Ju¿ wiem, o co ci chodzi.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_05"); //Ryby! Jakbym nie mia³ doœæ innych problemów.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_06"); //Powiedz swojemu kole¿ce, ¿eby siê ze mn¹ spotka³. Chcê dok³adnie wiedzieæ, o co chodzi z t¹ stra¿¹ miejsk¹.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_07"); //Zajmê siê tym.
	
	B_LogEntry (TOPIC_Addon_FarimsFish,	"T¹ spraw¹ zajmie siê kwatermistrz Martin."); 

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
	AI_Output	(self, other, "DIA_Addon_Martin_Trade_07_01"); //Przyjrzyj siê bli¿ej.
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

	description	 = 	"Przysy³a mnie Lares. ";
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
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_00"); //Przysy³a mnie Lares. Powiedzia³, ¿e mo¿esz mi pomóc.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_01"); //Czy¿by? Wiêc przejdŸmy do rzeczy. Czego ode mnie chcesz?
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_02"); //Chcê wst¹piæ do stra¿y.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_03"); //Chcia³oby siê, co? Zwykle nie przyjmujemy takich szemranych typków. Chyba ¿e mamy dobry powód.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_04"); //Hmm, najpierw musia³byœ...
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_05"); //Przestañ zrzêdziæ. Powiedz, co mam zrobiæ, ¿ebyœ móg³ mnie przyj¹æ.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_06"); //Dobra. Nadstaw uszu.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_07"); //Praca kwatermistrza to prawdziwe piek³o, uwierz mi. Ju¿ samo ustawianie tych wszystkich worków jest dobijaj¹ce.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_08"); //Na dodatek ktoœ majstruje przy skrzyniach, gdy wieczorkiem idê do karczmy Kardifa. Kiedy wracam rano, zawsze czegoœ brakuje.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_09"); //Co dziwne, paladyni nigdy nikogo nie zauwa¿yli.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_10"); //Szlag mnie trafia. Przecie¿ nie bêdê tu sta³ ca³¹ noc jak jakiœ idiota, nie?
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_11"); //Ale ty...
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_12"); //Dobra, ³apiê. Mam tu staæ na warcie ca³¹ noc, podczas gdy ty bêdziesz siê zabawia³ w karczmie.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_13"); //Bierzesz robotê albo nie.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Mam pilnowaæ w nocy skrzyñ kwatermistrza Martina. Jeœli z³apiê ³obuza, który grzebie w zapasach, Martin pomo¿e mi wst¹piæ do stra¿y."); 

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

	description	 = 	"Dobrze. Przypilnujê dziœ w nocy twoich skrzyñ z prowiantem.";
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
	AI_Output	(other, self, "DIA_Addon_Martin_Auftrag_15_00"); //Dobrze. Przypilnujê dziœ w nocy twoich skrzyñ z prowiantem.
	AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_01"); //Œwietnie.
	
	if (Wld_IsTime (23,00,04,00))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_02"); //W takim razie idê do knajpy Kardifa. I ¿eby mi niczego nie brakowa³o, kiedy wrócê!
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_03"); //Dobrze. Wróæ w nocy i przypilnuj ca³ego ³adunku. Bêdê siedzia³ w knajpie Kardifa.
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

	description	= "Szukasz cz³owieka, który sprzedaje broñ bandytom?";
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
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_00"); //Szukasz cz³owieka, który sprzedaje broñ bandytom?
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_01"); //A kto tak mówi?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_02"); //Vatras.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_03"); //Co wiesz na ten temat?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_04"); //Niezbyt du¿o, ale mogê dowiedzieæ siê wiêcej.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_05"); //Widzê, do czego zmierzasz...
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

	description	= "Co wiesz na temat tego handlarza broni¹?";
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
	AI_Output (other, self, "DIA_Addon_Martin_TellAll_15_00"); //Co wiesz na temat tego handlarza broni¹?
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_01"); //Dobra, s³uchaj. Wiemy, ¿e musi za tym staæ wp³ywowy obywatel górnego miasta.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_02"); //Powiadaj¹ nawet, ¿e czêœæ broni pochodzi ze zbrojowni stra¿y.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_03"); //Ale nie wiemy dok³adnie, kto poci¹ga za sznurki.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_04"); //Jeœli masz doœæ odwagi, by poradziæ sobie z grup¹ co najmniej piêciu bandytów, to mo¿e uda ci siê czegoœ dowiedzieæ...
	B_LogEntry (TOPIC_Addon_BanditTrader,"Martin twierdzi, ¿e handlarz broni¹ jest wp³ywowym obywatelem z górnego miasta."); 
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
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_01"); //Wiemy, ¿e zablokowali drogi pomiêdzy farmami i miastem.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_02"); //Wiem te¿, ¿e w ci¹gu kilku ostatnich dni otrzymali dostawê broni.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_03"); //Mo¿e wœród samych bandytów znajdziemy jakieœ wskazówki, które pomog¹ nam zdemaskowaæ tego handlarza broni¹.
	//AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_04"); //Ich werd sehen, was ich tun kann
	
	MIS_Martin_FindTheBanditTrader = LOG_RUNNING;
	B_LogEntry (TOPIC_Addon_BanditTrader,"Bandyci blokuj¹ drogê miêdzy miastem portowym a gospodarstwami. Byæ mo¿e dadz¹ mi wskazówkê, jak trafiæ do handlarza broni¹."); 
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

	description	 = 	"Jeœli chodzi o tego handlarza broni¹...";
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
	AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_00"); //Jeœli chodzi o tego handlarza broni¹...

	if 	(Npc_HasItems (other,ItMw_Addon_BanditTrader))
	||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
	||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
	||(Fernando_HatsZugegeben == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_01"); //Poka¿, co tam masz.
	
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
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_02"); //Ten pa³asz zabra³em bandytom. Na g³owicy wyciêto literê F.
					FernandoHints = (FernandoHints + 1);
				};
				if (Npc_HasItems (other,ItRi_Addon_BanditTrader))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_03"); //To pierœcieñ od jednego z bandytów. Nale¿a³ do zamorskiego kupca.
					FernandoHints = (FernandoHints + 1);
				};
				if ((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_04"); //Na liœcie broni i innych towarów dostarczonych bandytom widnieje podpis niejakiego Fernando.
					FernandoHints = (FernandoHints + 3);
				};
			
				if (Fernando_HatsZugegeben == TRUE)
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_05"); //Fernando, kupiec z górnego miasta, przyzna³ siê do robienia interesów z bandytami.
					FernandoHints = (FernandoHints + 1);
				};
			}
			else
			{
				AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_06"); //Fernando przyzna³ siê do dostarczania broni bandytom.
			};
			
		if (FernandoHints >= 3)
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_07"); //S¹dzê, ¿e to wystarczy. A wiêc to Fernando. No to nieŸle wpad³.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_08"); //W sumie to dziwne. Zawsze wydawa³ siê takim praworz¹dnym obywatelem.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_09"); //Przypilnujê, ¿eby przez d³ugi czas nie wyszed³ z wiêzienia.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_10"); //Naprawdê siê spisa³eœ. Czapki z g³ów.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_11"); //Vatras bêdzie zachwycony tymi wiadomoœciami.
			B_StartOtherRoutine	(Fernando,"Prison");
			Fernando_ImKnast = TRUE;
			MIs_Martin_FindTheBanditTrader = LOG_SUCCESS;
			B_LogEntry (TOPIC_Addon_BanditTrader,"Martin przypilnuje, by Fernando zap³aci³ za swoje grzechy. Muszê powiedzieæ o tym Vatrasowi."); 

			B_GivePlayerXP (XP_Addon_FernandoMartin);
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_12"); //Coœ jeszcze?
			AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_13"); //To wszystko.
		
			if (Fernando_HatsZugegeben == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_14"); //Mi³o z jego strony, ¿e tak powiedzia³, ale bez dowodów nic nie mogê zrobiæ.
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_15"); //Nie mam zamiaru siê oœmieszyæ przed Lordem Hagenem. Bêdziesz musia³ dostarczyæ wiêcej dowodów.
			}
			else
			{
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_16"); //To nie wystarczy. To móg³by byæ niemal ka¿dy z górnego miasta.
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_17"); //Wychodzi na to, ¿e trzeba bêdzie pójœæ trochê dalej œladem bandytów i ich ³upów. A¿ dowiemy siê, kto za tym stoi.
				if (Martin_IrrlichtHint == FALSE)
				{
					AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_18"); //Mo¿e znów powinieneœ porozmawiaæ z Vatrasem.
					Martin_IrrlichtHint = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_19"); //Przypomnij, o co chodzi³o?
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_20"); //Musisz siê dowiedzieæ, kto jest odpowiedzialny za dostawy broni dla bandytów, oraz przynieœæ mi jakiœ dowód.
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_21"); //Musi to byæ niepodwa¿alny materia³, bo inaczej nie zdo³am niczego udowodniæ.
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

	description	 = 	"Skrzynie wci¹¿ tu s¹?";
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
	AI_Output	(other, self, "DIA_Addon_Martin_Perm_15_00"); //Skrzynie wci¹¿ tu s¹?
	
	if (MIS_Addon_Martin_GetRangar_Day <= (Wld_GetDay()-2))
	&&	(MIS_Addon_Martin_GetRangar == LOG_RUNNING)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_01"); //Ty sukinsynu! Mia³eœ przecie¿ pilnowaæ tych skrzyñ. Teraz znik³o coœ jeszcze.

		if (Wld_IsTime (24,00,03,00))
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_02"); //Pójdziesz do magazynu na nabrze¿u i dorwiesz gnoja, który mnie okrad³.
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_03"); //Dziœ w nocy lepiej uwa¿aj, kiedy mnie nie bêdzie, jasne?
		};	
	}	
	else if ((MIS_Addon_Martin_GetRangar != 0) || (hero.guild != GIL_NONE) || (Sc_IsRanger == TRUE))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_04"); //Tak, tak, œmiej siê, ile chcesz. Chêtnie bym zobaczy³, jak stoisz tu przez ca³y dzieñ, próbuj¹c zapanowaæ nad tym chaosem.
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_05"); //Paladyni przywieŸli tyle z³omu, ¿e g³owa ma³a.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_06"); //Nie dotykaj niczego albo zawo³am stra¿e. S³yszysz?
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

	description	 = 	"Dowiedzia³em siê, kim jest z³odziej.";
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
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_00"); //Dowiedzia³em siê, kim jest z³odziej.
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_01"); //To Rangar majstrowa³ przy twoich rzeczach.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_02"); //W koñcu. Przynajmniej wiem, na kogo teraz uwa¿aæ. Co za szuja. Dostanie niez³e baty, jeœli z³apiê go na gor¹cym uczynku.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_03"); //Zastanawia³em siê, dlaczego ¿aden z paladynów nigdy nic nie zauwa¿y³?
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_04"); //No? Dlaczego?
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_05"); //Czy to nie oczywiste? Ci durnie nie potrafi¹ odró¿niæ nas od stra¿ników. Dla nich wygl¹damy tak samo.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_06"); //Dobra robota, kolego.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_07"); //Daj mi znaæ, jeœli mogê ci w czymœ pomóc.

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

	description	 = 	"Wiesz, czego chcê.";
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
	AI_Output	(other, self, "DIA_Addon_Martin_GetMiliz_15_00"); //Wiesz, czego chcê.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_01"); //Tak, oczywiœcie. Chcia³eœ wst¹piæ do stra¿y, prawda?
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_02"); //Ju¿ zademonstrowa³eœ wyj¹tkowe zdolnoœci.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_03"); //No dobra, ujmê to inaczej – wola³bym mieæ ciê po naszej stronie.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_04"); //Dlatego ci pomagam. WeŸ ten list polecaj¹cy i poka¿ go Andre, naszemu g³ównodowodz¹cemu paladynowi.
	CreateInvItems (self, ItWr_Martin_MilizEmpfehlung_Addon, 1);									
	B_GiveInvItems (self, other, ItWr_Martin_MilizEmpfehlung_Addon, 1);		
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_05"); //Znajdziesz go w koszarach. Jestem pewien, ¿e znajdzie zajêcie dla kogoœ takiego jak ty.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Martin da³ mi list polecaj¹cy do g³ównodowodz¹cego paladyna, Andre, dziêki czemu zostanê przyjêty do stra¿y. Andre mo¿na znaleŸæ w koszarach."); 
};


