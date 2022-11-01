///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Coragon_EXIT   (C_INFO)
{
	npc         = VLK_420_Coragon;
	nr          = 999;
	condition   = DIA_Coragon_EXIT_Condition;
	information = DIA_Coragon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Coragon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Coragon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Coragon_PICKPOCKET (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr			= 900;
	condition	= DIA_Coragon_PICKPOCKET_Condition;
	information	= DIA_Coragon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Coragon_PICKPOCKET_Condition()
{
	C_Beklauen (40, 45);
};
 
FUNC VOID DIA_Coragon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Coragon_PICKPOCKET);
	Info_AddChoice		(DIA_Coragon_PICKPOCKET, DIALOG_BACK 		,DIA_Coragon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Coragon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Coragon_PICKPOCKET_DoIt);
};

func void DIA_Coragon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Coragon_PICKPOCKET);
};
	
func void DIA_Coragon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Coragon_PICKPOCKET);
};

// *********************************************************
// 							Hallo
// *********************************************************
instance DIA_Coragon_HALLO		(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  2;
	condition	 = 	DIA_Coragon_HALLO_Condition;
	information	 = 	DIA_Coragon_HALLO_Info;
	permanent    =  FALSE;
	description	 = 	"Czy mogę kupić coś do picia?";
};

func int DIA_Coragon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Coragon_HALLO_15_00"); //Czy mogę kupić coś do picia?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_00"); //Możesz się tu najeść - o ile cię na to stać.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Jedzenie i napoje mogę kupić u właściciela gospody, Coragona.");
};

// *********************************************************
// 							Trade
// *********************************************************
instance DIA_Coragon_Trade		(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  2;
	condition	 = 	DIA_Coragon_Trade_Condition;
	information	 = 	DIA_Coragon_Trade_Info;
	permanent    =  TRUE;
	description	 = 	"Pokaż mi swoje towary.";
	trade 		 =  TRUE;
};
func int DIA_Coragon_Trade_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Trade_Info () //FIXME_FILER NOCH ESSEN IN INV
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Coragon_Trade_15_00"); //Pokaż mi swoje towary.
};

// *********************************************************
// 							WhatsUp
// *********************************************************
instance DIA_Coragon_WhatsUp	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  3;
	condition	 = 	DIA_Coragon_WhatsUp_Condition;
	information	 = 	DIA_Coragon_WhatsUp_Info;
	permanent    =  FALSE;
	description	 = 	"Jak idą interesy?";
	
};
func int DIA_Coragon_WhatsUp_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Coragon_WhatsUp_Info ()
{
	AI_Output (other, self, "DIA_Coragon_Gelaber_15_00"); //Jak idą interesy?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_01"); //Taa... Lord Andre rozdaje piwo za darmo na placu wisielców.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_02"); //Z tego powodu zachodzą do mnie ostatnio tylko bogacze z górnego miasta...
	AI_Output (other, self, "DIA_Coragon_Add_15_03"); //Coś z nimi nie tak?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_04"); //Niektórzy z nich naprawdę mogą cię zdenerwować...
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_05"); //Taki na przykład Valentino - nie mogę znieść faceta.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_06"); //Ale niestety nie mogę sobie wybierać klientów - potrzeba mi każdego szeląga.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_07"); //Ukradziono mi całe oszczędności, nawet moje srebro.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Coragon_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_420_Coragon;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Coragon_MissingPeople_Condition;
	information	 = 	DIA_Addon_Coragon_MissingPeople_Info;

	description	 = 	"Wiesz może coś o zaginionych mieszkańcach miasta?";
};

func int DIA_Addon_Coragon_MissingPeople_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Coragon_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Coragon_MissingPeople_15_00"); //Wiesz może coś o zaginionych mieszkańcach miasta?
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_01"); //Podobno to w większości mieszkańcy portu. Mało mnie to dziwi, biorąc pod uwagę reputację tego miejsca... 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_02"); //Nawet stolarz Thorben wspominał, że zaginął jego czeladnik.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_03"); //Jeden z kupców - gość imieniem Hakon - opowiedział mi ostatnio dziwną historię. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_04"); //Wspomniał, że był taki facet, którego widywał codziennie... Aż nagle przestał go widywać. Pytał się nawet o to członków straży. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_05"); //Większość mieszkańców miasta zaczęła panikować. Nie wiem, co o tym wszystkim sądzić, ale to chyba jakaś bzdura.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_06"); //Khorinis to niebezpieczne miejsce, a i za jego bramami czyha na człowieka wiele zagrożeń.   
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_07"); //Grasują tam dzikie bestie i bandyci. To proste...  
	
	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Hakon, kupiec z targowiska, i stolarz Thorben podobno wiedzą coś na temat zaginionych ludzi."); 
};

// *********************************************************
// 							Bestohlen
// *********************************************************
instance DIA_Coragon_Bestohlen	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  4;
	condition	 = 	DIA_Coragon_Bestohlen_Condition;
	information	 = 	DIA_Coragon_Bestohlen_Info;
	permanent    =  FALSE;
	description	 = 	"Obrabowano cię?";
	
};
func int DIA_Coragon_Bestohlen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};
func void DIA_Coragon_Bestohlen_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_08"); //Obrabowano cię?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_09"); //To było już jakiś czas temu - w gospodzie było pełno ludzi, a i ja nieźle wtedy popiłem.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_10"); //Nie było mnie za szynkwasem tylko przez chwilę, ale tym łobuzom to wystarczyło.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_11"); //Doniosłem o wszystkim straży, ale oni oczywiście nic nie znaleźli. Wypili za to dużo darmowego piwa 'na potrzeby śledztwa'.
	
	MIS_Coragon_Silber = LOG_RUNNING;
};


// **************
// B_Coragon_Bier
// **************

var int Coragon_Bier;
// ------------------	
	
func void B_Coragon_Bier()
{
	Coragon_Bier = Coragon_Bier + 1;
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_14"); //Oto nagroda.
	B_GiveInvItems (self, other, ItFo_CoragonsBeer, 1);
	
	if (Coragon_Bier < 2)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_21"); //To wyjątkowe piwo - ostatnia beczka, którą dysponuję.
	}
	else
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_22"); //To ostatni łyk!
	};
};

// *********************************************************
// 							Bestohlen
// *********************************************************
instance DIA_Coragon_BringSilber	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  5;
	condition	 = 	DIA_Coragon_BringSilber_Condition;
	information	 = 	DIA_Coragon_BringSilber_Info;
	permanent    =  FALSE;
	description	 = 	"Mam twoje srebra.";
	
};
func int DIA_Coragon_BringSilber_Condition ()
{	
	if (MIS_Coragon_Silber == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_CoragonsSilber) >= 8)
	{
		return TRUE;
	};
};
func void DIA_Coragon_BringSilber_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_12"); //Mam twoje srebra.
	
	if B_GiveInvItems (other, self, ItMi_CoragonsSilber, 8)
	{
		Npc_RemoveInvItems (self, ItMi_CoragonsSilber,8);
	};
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_13"); //Niemożliwe!
	B_GivePlayerXP (XP_CoragonsSilber);
	B_Coragon_Bier();
	
	MIS_Coragon_Silber = LOG_SUCCESS;
};

// *********************************************************
// 					Lehmars Schuldenbuch
// *********************************************************
instance DIA_Coragon_Schuldenbuch	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  6;
	condition	 = 	DIA_Coragon_Schuldenbuch_Condition;
	information	 = 	DIA_Coragon_Schuldenbuch_Info;
	permanent    =  FALSE;
	description	 = 	"Popatrz, co tutaj mam.";
	
};
func int DIA_Coragon_Schuldenbuch_Condition ()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Schuldenbuch_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_15"); //Popatrz, co tutaj mam.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_16"); //Hmm... To spis dłużników Lehmara!
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_17"); //Co masz zamiar z nim zrobić?
};


// *********************************************************
// 					Schuldenbuch geben
// *********************************************************
instance DIA_Coragon_GiveBook (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  7;
	condition	 = 	DIA_Coragon_GiveBook_Condition;
	information	 = 	DIA_Coragon_GiveBook_Info;
	permanent    =  FALSE;
	description	 = 	"Oto twoja księga.";
	
};
func int DIA_Coragon_GiveBook_Condition ()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_GiveBook_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_18"); //Oto twoja księga.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_19"); //Dzięki! Ratujesz mi życie - Lehmar bywa niebezpieczny, gdy w grę wchodzą jego pieniądze.
	B_GivePlayerXP (XP_Schuldenbuch);
	B_Coragon_Bier();
};


// *********************************************************
// 							ToOV
// *********************************************************
instance DIA_Coragon_ToOV (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  9;
	condition	 = 	DIA_Coragon_ToOV_Condition;
	information	 = 	DIA_Coragon_ToOV_Info;
	permanent    =  FALSE;
	description	 = 	"W jaki sposób mogę się dostać do górnego miasta?";
	
};
func int DIA_Coragon_ToOV_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	&& (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Coragon_ToOV_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_23"); //W jaki sposób mogę się dostać do górnego miasta?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_24"); //Musisz zostać obywatelem tego miasta. Znajdź jakąś pracę.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_25"); //Popytaj może robotników w dolnym mieście.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_26"); //Jeśli to nic nie da, możesz również skontaktować się z Lordem Andre - znajdziesz go w koszarach.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_27"); //Być może pozwoli ci dołączyć do straży - jej członkowie również mają wstęp do górnego miasta.
};


// *********************************************************
// 							Valentino
// *********************************************************
instance DIA_Coragon_Valentino (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  8;
	condition	 = 	DIA_Coragon_Valentino_Condition;
	information	 = 	DIA_Coragon_Valentino_Info;
	permanent    =  FALSE;
	description	 = 	"O co chodzi z tym Valentinem?";
	
};
func int DIA_Coragon_Valentino_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};
func void DIA_Coragon_Valentino_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_28"); //O co chodzi z tym Valentinem?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_29"); //Ma złota jak lodu i nie musi nic robić. Co więcej, chwali się tym na prawo i na lewo.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_30"); //Niezależnie od tego, czy ktoś chce go słuchać...
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_31"); //Sporo pije i zwykle siedzi aż do zamknięcia, po czym wytacza się nad ranem na ulice górnego miasta.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_32"); //I tak dzień w dzień...
	
	
};

// *********************************************************
// 						Zeche - Important
// *********************************************************
instance DIA_Coragon_News (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr 			= 1;
	condition	= DIA_Coragon_News_Condition;
	information	= DIA_Coragon_News_Info;
	permanent   = FALSE;
	important 	= TRUE;
	
};
func int DIA_Coragon_News_Condition ()
{	
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		if (Regis_Ring == TRUE)
		{	
			return TRUE;
		};
	};
};
func void DIA_Coragon_News_Info ()
{
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_33"); //Valentino nie był w stanie uregulować wczorajszego rachunku.
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_34"); //Bełkotał coś o tym, że go okradziono i że zapłaci później. Co za tupet!
	}
	else //Pickpocket OHNE Niederschlagen - AUSKOMMENTIERT
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_35"); //Wcześniej się puszył, ile to kasy on nie ma...
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_36"); //A nagle wkłada rękę do kieszeni, a jego twarz przybiera jeszcze głupszy wyraz niż zwykle. Za chwilę gada, że go okradziono.
	};
	
	AI_Output (other, self,"DIA_Coragon_Add_15_37"); //No... I co zrobiłeś?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_38"); //Porachowałem mu kości.
};

// *********************************************************
// 						Ring geben
// *********************************************************
instance DIA_Coragon_Ring (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr 			= 10;
	condition	= DIA_Coragon_Ring_Condition;
	information	= DIA_Coragon_Ring_Info;
	permanent   = FALSE;
	description = "Proszę - przyjmij ten pierścień.";
	
};
func int DIA_Coragon_Ring_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_News))
	&& (Npc_HasItems (other, ItRi_ValentinosRing) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Ring_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_39"); //Proszę - przyjmij ten pierścień.
	B_GiveInvItems (other, self, ItRi_ValentinosRing, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_40"); //Co? Nie rozumiem...
	AI_Output (other, self,"DIA_Coragon_Add_15_41"); //Należał do Valentina.
	AI_Output (other, self,"DIA_Coragon_Add_15_42"); //Zawsze możesz ofiarować ten pierścień komuś, kto zdoła go schwytać...

	B_GivePlayerXP (300);
	
	AI_StopProcessInfos (self);
};



























