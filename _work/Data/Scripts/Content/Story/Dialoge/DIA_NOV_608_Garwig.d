//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Garwig_EXIT   (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 999;
	condition   = DIA_Garwig_EXIT_Condition;
	information = DIA_Garwig_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Garwig_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Garwig_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Garwig_Wurst(C_INFO)
{
	npc         = Nov_608_Garwig;
	nr			= 3;
	condition	= DIA_Garwig_Wurst_Condition;
	information	= DIA_Garwig_Wurst_Info;
	permanent	= FALSE;
	description = "Chcesz spróbować kiełbasy?";
};                       

FUNC INT DIA_Garwig_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Garwig_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Garwig_Wurst_15_00"); //Chcesz spróbować kiełbasy?
	AI_Output (self, other, "DIA_Garwig_Wurst_06_01"); //Jest pyszna. Bardzo dziękuję, Bracie.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
//**************************************************************************
//	Info Hello 
//**************************************************************************
INSTANCE DIA_Garwig_Hello   (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 3;
	condition   = DIA_Garwig_Hello_Condition;
	information = DIA_Garwig_Hello_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Garwig_Hello_Condition()
{	
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garwig_Hello_Info()
{
	AI_Output (self ,other,"DIA_Garwig_Hello_06_00"); //Niech Innos będzie z tobą. Nie znam cię, jesteś tu nowy?
	AI_Output (other ,self,"DIA_Garwig_Hello_15_01"); //Tak, dopiero się do was przyłączyłem.
	AI_Output (self ,other,"DIA_Garwig_Hello_06_02"); //W takim wypadku mam nadzieję, że prędko się tutaj zadomowisz. Daj mi znać, jeśli będę mógł ci w czymś pomóc.
};
//**************************************************************************
//	Info Hello 
//**************************************************************************
INSTANCE DIA_Garwig_Room   (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 5;
	condition   = DIA_Garwig_Room_Condition;
	information = DIA_Garwig_Room_Info;
	permanent   = FALSE;
	description	= "Co to za pomieszczenie?";
};
FUNC INT DIA_Garwig_Room_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Garwig_Room_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Room_15_00"); //Co to za pomieszczenie?
	AI_Output (self ,other,"DIA_Garwig_Room_06_01"); //Tutaj przechowywane są klasztorne relikwie.
	AI_Output (other,self ,"DIA_Garwig_Room_15_02"); //Jakie relikwie?
	AI_Output (self ,other,"DIA_Garwig_Room_06_03"); //Tu spoczywa Młot Innosa oraz Tarcza Ognia, najważniejsze relikwie Kościoła Innosa poza stolicą królestwa.
};
//**************************************************************************
//	Info Hammer 
//**************************************************************************
INSTANCE DIA_Garwig_Hammer  (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 99;
	condition   = DIA_Garwig_Hammer_Condition;
	information = DIA_Garwig_Hammer_Info;
	permanent   = TRUE;
	description	= "Opowiedz mi o tym Młocie.";
};
FUNC INT DIA_Garwig_Hammer_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Garwig_Room))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garwig_Hammer_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Hammer_15_00"); //Opowiedz mi o tym Młocie.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_01"); //Oto święty Młot Innosa. To właśnie nim Święty Rhobar zabił Kamiennego Strażnika.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_02"); //Święte Pisma twierdzą, że Kamienny Strażnik był niezniszczalny. Broń wyszczerbiała się na jego kamiennej skórze, nie czyniąc mu żadnej krzywdy.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_03"); //Z imieniem Innosa na ustach Rhobar rzucił się na potwora i zmiażdżył go jednym potężnym ciosem młota.
};
//**************************************************************************
//	Info Schild 
//**************************************************************************
INSTANCE DIA_Garwig_Shield  (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 98;
	condition   = DIA_Garwig_Shield_Condition;
	information = DIA_Garwig_Shield_Info;
	permanent   = FALSE;
	description	= "Opowiedz mi o tej Tarczy.";
};
FUNC INT DIA_Garwig_Shield_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Garwig_Room))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garwig_Shield_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Shield_15_00"); //Opowiedz mi o tej Tarczy.
	AI_Output (self ,other,"DIA_Garwig_Shield_06_01"); //Tarcza Ognia została użyta przez Dominique w czasie bitwy na Południowych Wyspach.
	AI_Output (self ,other,"DIA_Garwig_Shield_06_02"); //Nikt nie ma prawa korzystać z jej mocy - dlatego przybiliśmy ją do ściany.
};
//**************************************************************************
//	Info Auge Innos
//**************************************************************************
INSTANCE DIA_Garwig_Auge  (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 4;
	condition   = DIA_Garwig_Auge_Condition;
	information = DIA_Garwig_Auge_Info;
	permanent   = FALSE;
	description	= "Czy znajduje się tutaj także Oko Innosa?";
};
FUNC INT DIA_Garwig_Auge_Condition()
{
	if Npc_KnowsInfo (other,DIA_Garwig_Room)
	&& (Kapitel <= 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garwig_Auge_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Auge_15_00"); //Czy znajduje się tutaj także Oko Innosa?
	AI_Output (self ,other,"DIA_Garwig_Auge_06_01"); //Oczywiście, że nie. Co za dziwaczny pomysł. Nikt nie wie, gdzie się znajduje najświętszy artefakt.
};
///////////////////////////////////////////////////////////////////////
//	Info SLEEP
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_SLEEP		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	23;
	condition	 = 	DIA_Garwig_SLEEP_Condition;
	information	 = 	DIA_Garwig_SLEEP_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co tu porabiasz?";
};
func int DIA_Garwig_SLEEP_Condition ()
{
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
func void DIA_Garwig_SLEEP_Info ()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_15_00"); //Czym się tu zajmujesz?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_06_01"); //Jestem strażnikiem świętych artefaktów.
	
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
	Info_AddChoice 		(DIA_Garwig_SLEEP,DIALOG_BACK,DIA_Garwig_SLEEP_BACK);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"Chcesz, żebym na moment cię zastąpił?",DIA_Garwig_SLEEP_EXCHANGE);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"Czemu te artefakty są tak pilnie strzeżone?",DIA_Garwig_SLEEP_THIEF);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"Czy ty nigdy nie sypiasz?",DIA_Garwig_SLEEP_NEVER);
};
FUNC VOID DIA_Garwig_SLEEP_BACK()
{
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
};
FUNC VOID DIA_Garwig_SLEEP_EXCHANGE()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_EXCHANGE_15_00"); //Chcesz, żebym na moment cię zastąpił?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_EXCHANGE_06_01"); //Czy to jakaś próba? Magowie cię tu przysłali, abyś wystawił mnie na próbę, prawda? Och - wiedziałem od początku!
	AI_Output			(self, other, "DIA_Garwig_SLEEP_EXCHANGE_06_02"); //Ale ja się nie ugnę. Powiedz swoim magom, że stoję tu na straży niewzruszony niczym kamienny posąg, opierając się wszelkim pokusom, albowiem jestem godny tej zaszczytnej misji.
};
FUNC VOID DIA_Garwig_SLEEP_THIEF()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_THIEF_15_00"); //Czemu te artefakty są tak pilnie strzeżone? Czy istnieje jakieś niebezpieczeństwo, że ktoś chciałby je ukraść?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_THIEF_06_01"); //Co za niezwykły pomysł. Czemu ktoś miałby je ukraść?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_THIEF_06_02"); //Tylko słudzy Innosa mają wstęp do klasztoru. Zapewniam cię, że żaden wyznawca nie odważyłby się na takie świętokradztwo.
};
FUNC VOID DIA_Garwig_SLEEP_NEVER()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_NEVER_15_00"); //Nigdy nie śpisz?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_NEVER_06_01"); //Co za dziwne pytanie. Oczywiście, że nigdy nie sypiam. Innos sprawia, że nie potrzebuję snu.
	AI_Output			(self, other, "DIA_Garwig_SLEEP_NEVER_06_02"); //Jak inaczej mógłbym pełnić moje święte powołanie strażnika?
	
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
	Info_AddChoice (DIA_Garwig_SLEEP,"Naprawdę NIGDY nie sypiasz?",DIA_Garwig_SLEEP_AGAIN);
};
FUNC VOID DIA_Garwig_SLEEP_AGAIN()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_AGAIN_15_00"); //Naprawdę NIGDY nie sypiasz?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_AGAIN_06_01"); //Nie. Jeśli strażnik zapada w sen, oznacza to jego całkowitą porażkę.
	AI_Output			(self, other, "DIA_Garwig_SLEEP_AGAIN_06_02"); //Ale ja nie zawiodę, albowiem Innos zapewnia mi siłę i wytrwałość, abym mógł wiecznie trwać na posterunku.
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info THIEF Der Hammer ist nicht mehr da
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_THIEF		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	2;
	condition	 = 	DIA_Garwig_THIEF_Condition;
	information	 = 	DIA_Garwig_THIEF_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Garwig_THIEF_Condition ()
{	
	if  (Npc_IsInState (self, ZS_Talk))
	&&  (Npc_HasItems (hero, Holy_Hammer_MIS) == 1)
	{
		return TRUE;
	};
};
func void DIA_Garwig_THIEF_Info ()
{		
					
	if (Hammer_Taken == TRUE) 
	{ 
		AI_Output (self, other, "DIA_Garwig_THIEF_06_00"); //Złodzieju! Znieważyłeś nie tylko mnie i siebie, lecz również cały ten klasztor!
		AI_Output (self, other, "DIA_Garwig_THIEF_06_01"); //Odpokutujesz za to świętokradztwo. Ale przede wszystkim - ODDAJ MI TEN MŁOT!!!
		
	}
	else
	{
		AI_Output (self, other, "DIA_Garwig_THIEF_06_02"); //Młot zniknął - jak to się mogło stać?
		AI_Output (self, other, "DIA_Garwig_THIEF_06_03"); //Zawiodłem, i kara Innosa mnie nie ominie!
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Hammer zurückbringen (immer wenn Spieler den Hammer hat)
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_Abgeben		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	2;
	condition	 = 	DIA_Garwig_Abgeben_Condition;
	information	 = 	DIA_Garwig_Abgeben_Info;
	permanent	 = 	TRUE;
	description	 =  "Przyszedłem oddać ci twój Młot.";
};
func int DIA_Garwig_Abgeben_Condition ()
{	
	if (Npc_HasItems (other, Holy_Hammer_MIS) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Garwig_Abgeben_Info ()
{
	AI_Output (other, self, "DIA_Garwig_Abgeben_15_00"); //Przyszedłem oddać ci twój Młot.
	
	if (Hammer_Taken == TRUE)
	{
		AI_Output (self, other, "DIA_Garwig_Abgeben_06_01"); //Ty wstrętny złodzieju!
	}
	else
	{
		AI_Output (self, other, "DIA_Garwig_Abgeben_06_02"); //A więc to ty mnie okradłeś...
	};
	AI_Output (self, other, "DIA_Garwig_Abgeben_06_03"); //Jednak nie mnie sądzić twoje czyny. Innos będzie twym sędzią i ześle na ciebie sprawiedliwą karę!
	
	B_GiveInvItems (other,self, Holy_Hammer_MIS,1);
	Hammer_Taken = FALSE;
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Garwig_PICKPOCKET (C_INFO)
{
	npc			= Nov_608_Garwig;
	nr			= 900;
	condition	= DIA_Garwig_PICKPOCKET_Condition;
	information	= DIA_Garwig_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Garwig_PICKPOCKET_Condition()
{
	C_Beklauen (52, 80);
};
 
FUNC VOID DIA_Garwig_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Garwig_PICKPOCKET);
	Info_AddChoice		(DIA_Garwig_PICKPOCKET, DIALOG_BACK 		,DIA_Garwig_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Garwig_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Garwig_PICKPOCKET_DoIt);
};

func void DIA_Garwig_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Garwig_PICKPOCKET);
};
	
func void DIA_Garwig_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Garwig_PICKPOCKET);
};















