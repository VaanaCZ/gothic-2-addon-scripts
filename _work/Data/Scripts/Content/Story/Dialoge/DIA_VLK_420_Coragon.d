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
	description	 = 	"Czy mog� kupi� co� do picia?";
};

func int DIA_Coragon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Coragon_HALLO_15_00"); //Czy mog� kupi� co� do picia?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_00"); //Mo�esz si� tu naje�� - o ile ci� na to sta�.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Jedzenie i napoje mog� kupi� u w�a�ciciela gospody, Coragona.");
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
	description	 = 	"Poka� mi swoje towary.";
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
	AI_Output (other, self, "DIA_Coragon_Trade_15_00"); //Poka� mi swoje towary.
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
	description	 = 	"Jak id� interesy?";
	
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
	AI_Output (other, self, "DIA_Coragon_Gelaber_15_00"); //Jak id� interesy?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_01"); //Taa... Lord Andre rozdaje piwo za darmo na placu wisielc�w.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_02"); //Z tego powodu zachodz� do mnie ostatnio tylko bogacze z g�rnego miasta...
	AI_Output (other, self, "DIA_Coragon_Add_15_03"); //Co� z nimi nie tak?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_04"); //Niekt�rzy z nich naprawd� mog� ci� zdenerwowa�...
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_05"); //Taki na przyk�ad Valentino - nie mog� znie�� faceta.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_06"); //Ale niestety nie mog� sobie wybiera� klient�w - potrzeba mi ka�dego szel�ga.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_07"); //Ukradziono mi ca�e oszcz�dno�ci, nawet moje srebro.
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

	description	 = 	"Wiesz mo�e co� o zaginionych mieszka�cach miasta?";
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
	AI_Output	(other, self, "DIA_Addon_Coragon_MissingPeople_15_00"); //Wiesz mo�e co� o zaginionych mieszka�cach miasta?
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_01"); //Podobno to w wi�kszo�ci mieszka�cy portu. Ma�o mnie to dziwi, bior�c pod uwag� reputacj� tego miejsca... 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_02"); //Nawet stolarz Thorben wspomina�, �e zagin�� jego czeladnik.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_03"); //Jeden z kupc�w - go�� imieniem Hakon - opowiedzia� mi ostatnio dziwn� histori�. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_04"); //Wspomnia�, �e by� taki facet, kt�rego widywa� codziennie... A� nagle przesta� go widywa�. Pyta� si� nawet o to cz�onk�w stra�y. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_05"); //Wi�kszo�� mieszka�c�w miasta zacz�a panikowa�. Nie wiem, co o tym wszystkim s�dzi�, ale to chyba jaka� bzdura.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_06"); //Khorinis to niebezpieczne miejsce, a i za jego bramami czyha na cz�owieka wiele zagro�e�.   
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_07"); //Grasuj� tam dzikie bestie i bandyci. To proste...  
	
	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Hakon, kupiec z targowiska, i stolarz Thorben podobno wiedz� co� na temat zaginionych ludzi."); 
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
	description	 = 	"Obrabowano ci�?";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_08"); //Obrabowano ci�?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_09"); //To by�o ju� jaki� czas temu - w gospodzie by�o pe�no ludzi, a i ja nie�le wtedy popi�em.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_10"); //Nie by�o mnie za szynkwasem tylko przez chwil�, ale tym �obuzom to wystarczy�o.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_11"); //Donios�em o wszystkim stra�y, ale oni oczywi�cie nic nie znale�li. Wypili za to du�o darmowego piwa 'na potrzeby �ledztwa'.
	
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
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_21"); //To wyj�tkowe piwo - ostatnia beczka, kt�r� dysponuj�.
	}
	else
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_22"); //To ostatni �yk!
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
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_13"); //Niemo�liwe!
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
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_16"); //Hmm... To spis d�u�nik�w Lehmara!
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_17"); //Co masz zamiar z nim zrobi�?
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
	description	 = 	"Oto twoja ksi�ga.";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_18"); //Oto twoja ksi�ga.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_19"); //Dzi�ki! Ratujesz mi �ycie - Lehmar bywa niebezpieczny, gdy w gr� wchodz� jego pieni�dze.
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
	description	 = 	"W jaki spos�b mog� si� dosta� do g�rnego miasta?";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_23"); //W jaki spos�b mog� si� dosta� do g�rnego miasta?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_24"); //Musisz zosta� obywatelem tego miasta. Znajd� jak�� prac�.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_25"); //Popytaj mo�e robotnik�w w dolnym mie�cie.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_26"); //Je�li to nic nie da, mo�esz r�wnie� skontaktowa� si� z Lordem Andre - znajdziesz go w koszarach.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_27"); //By� mo�e pozwoli ci do��czy� do stra�y - jej cz�onkowie r�wnie� maj� wst�p do g�rnego miasta.
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
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_29"); //Ma z�ota jak lodu i nie musi nic robi�. Co wi�cej, chwali si� tym na prawo i na lewo.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_30"); //Niezale�nie od tego, czy kto� chce go s�ucha�...
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_31"); //Sporo pije i zwykle siedzi a� do zamkni�cia, po czym wytacza si� nad ranem na ulice g�rnego miasta.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_32"); //I tak dzie� w dzie�...
	
	
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
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_33"); //Valentino nie by� w stanie uregulowa� wczorajszego rachunku.
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_34"); //Be�kota� co� o tym, �e go okradziono i �e zap�aci p�niej. Co za tupet!
	}
	else //Pickpocket OHNE Niederschlagen - AUSKOMMENTIERT
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_35"); //Wcze�niej si� puszy�, ile to kasy on nie ma...
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_36"); //A nagle wk�ada r�k� do kieszeni, a jego twarz przybiera jeszcze g�upszy wyraz ni� zwykle. Za chwil� gada, �e go okradziono.
	};
	
	AI_Output (other, self,"DIA_Coragon_Add_15_37"); //No... I co zrobi�e�?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_38"); //Porachowa�em mu ko�ci.
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
	description = "Prosz� - przyjmij ten pier�cie�.";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_39"); //Prosz� - przyjmij ten pier�cie�.
	B_GiveInvItems (other, self, ItRi_ValentinosRing, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_40"); //Co? Nie rozumiem...
	AI_Output (other, self,"DIA_Coragon_Add_15_41"); //Nale�a� do Valentina.
	AI_Output (other, self,"DIA_Coragon_Add_15_42"); //Zawsze mo�esz ofiarowa� ten pier�cie� komu�, kto zdo�a go schwyta�...

	B_GivePlayerXP (300);
	
	AI_StopProcessInfos (self);
};



























