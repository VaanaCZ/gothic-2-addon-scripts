//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_EXIT   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 999;
	condition   = DIA_Addon_Huno_EXIT_Condition;
	information = DIA_Addon_Huno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Huno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Huno_PICKPOCKET (C_INFO)
{
	npc			= BDT_1099_Addon_Huno;
	nr			= 900;
	condition	= DIA_Addon_Huno_PICKPOCKET_Condition;
	information	= DIA_Addon_Huno_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       
FUNC INT DIA_Addon_Huno_PICKPOCKET_Condition()
{
	C_Beklauen (85, 102);
};
 
FUNC VOID DIA_Addon_Huno_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Huno_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Huno_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Huno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Huno_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
	
func void DIA_Addon_Huno_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Abwimmeln
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Abwimmeln (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Abwimmeln_Condition;
	information = DIA_Addon_Huno_Abwimmeln_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Huno_Abwimmeln_Condition()
{
	if (Huno_MEGA_Angepisst == TRUE)
	{
		return TRUE;
	};
	
	if (Huno_zuSnaf == TRUE)
	&& (!Npc_KnowsInfo (other, DIA_Addon_Fisk_Meeting))
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Abwimmeln_Info()
{	
	if (Huno_MEGA_Angepisst == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_00"); //Czego jeszcze chcesz? Spadaj!
	}
	else //schickt dich in die Kneipe
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_01"); //Na co czekasz? IdŸ siê napiæ!
	};
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
var int Knows_Flucht;
var int Huno_Angepisst;
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Hi   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Hi_Condition;
	information = DIA_Addon_Huno_Hi_Info;
	permanent   = FALSE;
	description = "Od razu widaæ, ¿e znasz siê na swoim fachu.";
};
FUNC INT DIA_Addon_Huno_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_00");//Od razu widaæ, ¿e znasz siê na swoim fachu.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_01");//Ju¿ to kiedyœ s³ysza³em... przynosisz stal?
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_02");//Stal? Nie, chyba mnie z kimœ pomyli³eœ....
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_03");//Hmm... wygl¹dasz znajomo. Spotkaliœmy siê wczeœniej?
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Oczywiœcie, w Starym Obozie.",DIA_Addon_Huno_Hi_JA);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Nie pamiêtam tego.",DIA_Addon_Huno_Hi_NO);
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Huno handluje wyrobami kowalskimi.");
};
FUNC VOID DIA_Addon_Huno_Hi_JA()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_00");//Oczywiœcie, w Starym Obozie.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_01");//W Starym Obozie... racja... to ty jesteœ tym wœcibskim goœciem... myœla³em, ¿e nie ¿yjesz.
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_02");//Có¿, wszyscy tak s¹dzili. Kto jeszcze prze¿y³?
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_03");//Paru ludzi. Niektórzy uciekli z Krukiem, tak jak ja. Wielu zginê³o w obozie.
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	
	Knows_Flucht = TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_NO()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_NO_15_00");//Nie pamiêtam tego.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_NO_06_01");//Hmm... Sam mam w g³owie mêtlik... Szlag by to trafi³...
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
};
//----------------------------------------------------------------------
//	Info Blitz
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Blitz   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 2;
	condition   = DIA_Addon_Huno_Blitz_Condition;
	information = DIA_Addon_Huno_Blitz_Info;
	permanent   = FALSE;
	description = "Opowiedz mi o ucieczce.";
};
FUNC INT DIA_Addon_Huno_Blitz_Condition()
{	
	if (Knows_Flucht == TRUE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Blitz_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_00");//Opowiedz mi o ucieczce.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_01");//Kiedy przesta³a istnieæ bariera, zapanowa³ chaos.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_02");//Niektórzy siê ukryli – inni uciekli, a wszystko zosta³o spl¹drowane.
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_03");//Co zrobi³eœ?
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_04");//Próbowa³em uciec z obozu, gdy nagle zrobi³o siê strasznie jasno i poczu³em straszliwy ból.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_05");//Trafi³ mnie cholerny piorun! Ci¹gle mi siê zdaje, ¿e go s³yszê...
	//AI_Output (self, other, "DIA_Blitz_06_07");//BLITZ
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_06");//PóŸniej dowiedzia³em siê, ¿e znalaz³ mnie Thorus i zabra³ ze sob¹.
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
var int Huno_ArmorPerm;
//----------------------------------------------------------
INSTANCE DIA_Addon_Huno_Armor   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Armor_Condition;
	information = DIA_Addon_Huno_Armor_Info;
	permanent   = TRUE;
	description = "Potrzebujê lepszej zbroi.";
};
FUNC INT DIA_Addon_Huno_Armor_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Huno_Hi))
	&& (Huno_ArmorPerm == FALSE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Armor_Info()
{	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
	
	AI_Output (other, self, "DIA_Addon_Huno_Armor_15_00"); //Potrzebujê lepszej zbroi.
	if (Huno_ArmorCheap == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_01"); //Có¿ – mo¿esz j¹ mieæ. To, ¿e jest taka droga, to wina Estebana.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_02"); //Ten parszywy pies œci¹ga haracz z ka¿dej sprzedanej przeze mnie zbroi.
		
		BDT_Armor_H_Value = 2100;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Kup ciê¿k¹ zbrojê bandytów. Ochrona (broñ i strza³y) 45, 2100 sztuk z³ota.", DIA_Addon_Huno_Armor_BUY);
	}
	else //CHEAP
	{
		AI_Output (other, self, "DIA_Addon_Huno_Armor_15_03"); //Fisk powiedzia³, ¿e sprzedasz mi j¹ po dobrej cenie.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_04"); //Fisk, powiadasz... Hmm, dobrze, jestem mu winien przys³ugê.
				
		BDT_Armor_H_Value = 1400;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Kup ciê¿k¹ zbrojê bandytów. Ochrona (broñ i strza³y) 45, 1400 sztuk z³ota.", DIA_Addon_Huno_Armor_BUY);
	};
};
func void DIA_Addon_Huno_Armor_Back()
{
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};
func void DIA_Addon_Huno_Armor_Buy()
{
	AI_Output (other, self, "DIA_Addon_Huno_Armor_Buy_15_00"); //Dobra, biorê zbrojê.
	
	if B_GiveInvItems (other, self, ItMi_Gold, BDT_Armor_H_Value)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_01"); //Wygl¹da nieŸle.
		
		B_GiveInvItems (self, other,ITAR_BDT_H,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_02"); //Nie ma z³ota, nie ma zbroi.
	};
	
	if (BDT_Armor_H_Value < 2100) //nur, wenn billliger!
	{
		Huno_ArmorPerm = TRUE;
	};
	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};

//----------------------------------------------------------------------
//	ATTENTAT
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Attentat   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_Attentat_Condition;
	information = DIA_Addon_Huno_Attentat_Info;
	permanent   = FALSE;
	description = "A co do próby zabójstwa Estebana...";
};
FUNC INT DIA_Addon_Huno_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Attentat_Info()
{	
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //Wegen des Attentast auf Esteban
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_00"); //Czego ode mnie chcesz?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_01"); //Szukam osoby, która zleci³a zabójstwo...
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_02"); //I przyszed³eœ z tym do mnie?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_03"); //Myœla³em, ¿e mo¿esz coœ wiedzieæ na ten temat.
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_04"); //Ale nie wiem!
};


//----------------------------------------------------------------------
//	Paar Dinge gehört
//----------------------------------------------------------------------
var int Huno_nochmal;
var int Huno_SomeThings_PERM;
var int Huno_Counter;
//-------------------------------------

	func void B_Addon_Huno_Stress()
	{
		AI_Output (self, other, "DIA_Addon_Huno_Stress_06_00"); //A teraz s³uchaj! Zabieraj st¹d swój ty³ek, zanim przestanê nad sob¹ panowaæ!
		Huno_Angepisst = TRUE;
	};

INSTANCE DIA_Addon_Huno_SomeThings (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_SomeThings_Condition;
	information = DIA_Addon_Huno_SomeThings_Info;
	permanent   = TRUE;
	description = "S³ysza³em trochê ciekawych rzeczy na twój temat...";
};
FUNC INT DIA_Addon_Huno_SomeThings_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Huno_Attentat))
	&& (Huno_SomeThings_PERM == FALSE)
	&& ( (Finn_TellAll == TRUE) || (Paul_TellAll == TRUE) || (Emilio_TellAll == TRUE) )
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_SomeThings_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_00"); //S³ysza³em trochê ciekawych rzeczy na twój temat...
	
	if (Huno_nochmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_01"); //Hê?
		Huno_nochmal = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_02"); //Znowu zaczynasz? Mam nadziejê, ¿e tym razem to coœ wa¿nego...
	};
	
	Huno_Counter = 0;

	if (Finn_TellAll == TRUE) 		
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_03"); //Podobno w momencie zamachu nie by³o ciê na stanowisku!
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_04"); //Tak?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Paul_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_05"); //Paul powiedzia³, ¿e nienawidzisz Estebana.
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_06"); //Czy¿by? Coœ jeszcze?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Emilio_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_07"); //Emilio zdradzi³ twoje imiê! Na pewno wiesz coœ na temat próby zabójstwa!
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_08"); //A wiêc porozmawia³eœ sobie ze starym Emiliem, co?
		
		if (Huno_Counter > 0)
		{
			AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_09"); //Nie tylko on ciebie podejrzewa.
			AI_PlayAni(self, "T_SEARCH");
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_10"); //Jak to?
			
			Huno_SomeThings_PERM = TRUE;
			Info_ClearChoices (DIA_Addon_Huno_SomeThings);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "Chcê siê dogadaæ ze zleceniodawc¹ zabójstwa!", DIA_Addon_Huno_SomeThings_Contra);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "Jeœli stoisz za t¹ prób¹ zabójstwa, to zap³acisz za to!", DIA_Addon_Huno_SomeThings_Pro);
			
			B_LogEntry (Topic_Addon_Esteban, "Wygl¹da na to, ¿e trzymam Huna w szachu.");
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_11"); //Mo¿e te¿ powinienem z nim porozmawiaæ. Jestem pewien, ¿e to pomo¿e mu zmieniæ zdanie!
			B_Addon_Huno_Stress();
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_12"); //Nic wiêcej...
		B_Addon_Huno_Stress();
		AI_StopProcessInfos (self);
	};
};

func void DIA_Addon_Huno_SomeThings_Pro()
{
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Pro_15_00"); //Jeœli stoisz za t¹ prób¹ zabójstwa, to zap³acisz za to!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_01"); //Jesteœ idiot¹! Naprawdê zamierzasz podlizywaæ siê Estebanowi?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_02"); //Spadaj st¹d!
	Huno_MEGA_Angepisst = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};	
	
func void DIA_Addon_Huno_SomeThings_Contra()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_00"); //Chcê siê dogadaæ ze zleceniodawc¹ zabójstwa!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_01"); //Wyst¹pisz przeciwko Estebanowi? Naprawdê? Wiêc to udowodnij!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_02"); //Zbyt d³ugo ju¿ czekam na dostawê stali od piratów.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_03"); //Domyœlam siê, ¿e przej¹³ j¹ Esteban. Chce sprzedaæ mi stal po wy¿szej cenie.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_04"); //Oczywiœcie sam nie brudzi sobie tym r¹k. Ma na us³ugach paru bandytów z bagna.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_05"); //Sk¹d o tym wiesz?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_06"); //Pijani bandyci du¿o mówi¹...
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_07"); //Ten gadatliwy bandyta ma jakieœ imiê?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_08"); //Nie powinno ciê to obchodziæ. Ale goœæ, którego SZUKASZ, nazywa siê Juan. Jednak od dawna nie widzia³em go w obozie.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_09"); //Bêdziesz musia³ poszukaæ go na bagnie.
	
	MIS_Huno_Stahl = LOG_RUNNING;
	Huno_Angepisst = FALSE;
	
	Log_CreateTopic (Topic_Addon_Huno,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Huno,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Huno,"Huno czeka na dostawê stali od piratów. S¹dzi, ¿e na rozkaz Estebana przechwyci³ j¹ niejaki Juan, który ukrywa siê gdzieœ na bagnie.");
	
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "Najpierw powiesz mi, kto zleci³ zabójstwo!", DIA_Addon_Huno_SomeThings_TellMeNow);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "W porz¹dku, zrobiê to dla ciebie!", DIA_Addon_Huno_SomeThings_Mission);
};

func void DIA_Addon_Huno_SomeThings_Mission()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Mission_15_00"); //W porz¹dku, zrobiê to dla ciebie!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Mission_06_01"); //Dobrze. Zobaczymy, czy mogê ci zaufaæ.
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};
func void DIA_Addon_Huno_SomeThings_TellMeNow()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_00"); //Najpierw powiesz mi, kto zleci³ zabójstwo!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_01"); //Nie. Nie ufam ci.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_02"); //Uwa¿aj. Nastêpn¹ rozmowê odbêdê albo z nim, albo z Estebanem.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_03"); //To zale¿y od ciebie.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_04"); //W takim razie dobrze! Zaaran¿ujê twoje spotkanie ze zleceniodawc¹. Ale na moich zasadach, zrozumiano?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_05"); //IdŸ do knajpy i porozmawiaj z ober¿yst¹. On powie ci, co robiæ dalej.
	Huno_zuSnaf = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
	
	B_LogEntry (Topic_Addon_Esteban, "Huno powiedzia³ mi, ¿ebym zamieni³ s³ówko ze Snafem.");
};

//----------------------------------------------------------------------
//	Info Paket
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Paket   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Paket_Condition;
	information = DIA_Addon_Huno_Paket_Info;
	permanent   = FALSE;
	description = "Mam stal.";
};
FUNC INT DIA_Addon_Huno_Paket_Condition()
{	
	if (MIS_Huno_Stahl == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_Addon_Steel_Paket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Paket_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_00");//Mam stal.
	B_GiveInvItems (other, self, ItMi_Addon_Steel_Paket,1);
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_01"); //I co? Juan te¿ tam by³?
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_02"); //Tak.
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_03"); //Wiedzia³em! Za wszystkim sta³ ten szczur, Esteban.
	
	if (Huno_zuSnaf == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_04"); //Jesteœ w porz¹dku. Jeœli mam byæ szczery, nie spodziewa³em siê tego.
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_05"); //Proszê, oto twoja nagroda.
		B_GiveInvItems (self, other, itmi_gold, 200);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_Paket_15_06"); //Co bêdzie teraz z nasz¹ umow¹?
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_07"); //Cz³owiek, którego szukasz, czeka na ciebie w knajpie. Porozmawiaj z ober¿yst¹.
		Huno_zuSnaf = TRUE;
	};
	
	B_LogEntry (Topic_Addon_Esteban, "Huno powiedzia³ mi, ¿ebym zamieni³ s³ówko ze Snafem.");
	MIS_Huno_Stahl = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HunoStahl);
};
//----------------------------------------------------------------------
//	Info Trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Trade  (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 888;
	condition   = DIA_Addon_Huno_Trade_Condition;
	information = DIA_Addon_Huno_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Huno_Trade_Condition()
{		
	if (Huno_Angepisst == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Trade_Info()
{	
	B_Say (other,self,"$TRADE_3");
	B_GiveTradeInv(self);
};






