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
	description	 = 	"Czy mogê kupiæ coœ do picia?";
};

func int DIA_Coragon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Coragon_HALLO_15_00"); //Czy mogê kupiæ coœ do picia?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_00"); //Mo¿esz siê tu najeœæ - o ile ciê na to staæ.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Jedzenie i napoje mogê kupiæ u w³aœciciela gospody, Coragona.");
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
	description	 = 	"Poka¿ mi swoje towary.";
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
	AI_Output (other, self, "DIA_Coragon_Trade_15_00"); //Poka¿ mi swoje towary.
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
	description	 = 	"Jak id¹ interesy?";
	
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
	AI_Output (other, self, "DIA_Coragon_Gelaber_15_00"); //Jak id¹ interesy?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_01"); //Taa... Lord Andre rozdaje piwo za darmo na placu wisielców.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_02"); //Z tego powodu zachodz¹ do mnie ostatnio tylko bogacze z górnego miasta...
	AI_Output (other, self, "DIA_Coragon_Add_15_03"); //Coœ z nimi nie tak?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_04"); //Niektórzy z nich naprawdê mog¹ ciê zdenerwowaæ...
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_05"); //Taki na przyk³ad Valentino - nie mogê znieœæ faceta.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_06"); //Ale niestety nie mogê sobie wybieraæ klientów - potrzeba mi ka¿dego szel¹ga.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_07"); //Ukradziono mi ca³e oszczêdnoœci, nawet moje srebro.
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

	description	 = 	"Wiesz mo¿e coœ o zaginionych mieszkañcach miasta?";
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
	AI_Output	(other, self, "DIA_Addon_Coragon_MissingPeople_15_00"); //Wiesz mo¿e coœ o zaginionych mieszkañcach miasta?
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_01"); //Podobno to w wiêkszoœci mieszkañcy portu. Ma³o mnie to dziwi, bior¹c pod uwagê reputacjê tego miejsca... 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_02"); //Nawet stolarz Thorben wspomina³, ¿e zagin¹³ jego czeladnik.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_03"); //Jeden z kupców - goœæ imieniem Hakon - opowiedzia³ mi ostatnio dziwn¹ historiê. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_04"); //Wspomnia³, ¿e by³ taki facet, którego widywa³ codziennie... A¿ nagle przesta³ go widywaæ. Pyta³ siê nawet o to cz³onków stra¿y. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_05"); //Wiêkszoœæ mieszkañców miasta zaczê³a panikowaæ. Nie wiem, co o tym wszystkim s¹dziæ, ale to chyba jakaœ bzdura.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_06"); //Khorinis to niebezpieczne miejsce, a i za jego bramami czyha na cz³owieka wiele zagro¿eñ.   
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_07"); //Grasuj¹ tam dzikie bestie i bandyci. To proste...  
	
	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Hakon, kupiec z targowiska, i stolarz Thorben podobno wiedz¹ coœ na temat zaginionych ludzi."); 
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
	description	 = 	"Obrabowano ciê?";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_08"); //Obrabowano ciê?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_09"); //To by³o ju¿ jakiœ czas temu - w gospodzie by³o pe³no ludzi, a i ja nieŸle wtedy popi³em.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_10"); //Nie by³o mnie za szynkwasem tylko przez chwilê, ale tym ³obuzom to wystarczy³o.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_11"); //Donios³em o wszystkim stra¿y, ale oni oczywiœcie nic nie znaleŸli. Wypili za to du¿o darmowego piwa 'na potrzeby œledztwa'.
	
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
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_21"); //To wyj¹tkowe piwo - ostatnia beczka, któr¹ dysponujê.
	}
	else
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_22"); //To ostatni ³yk!
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
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_13"); //Niemo¿liwe!
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
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_16"); //Hmm... To spis d³u¿ników Lehmara!
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_17"); //Co masz zamiar z nim zrobiæ?
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
	description	 = 	"Oto twoja ksiêga.";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_18"); //Oto twoja ksiêga.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_19"); //Dziêki! Ratujesz mi ¿ycie - Lehmar bywa niebezpieczny, gdy w grê wchodz¹ jego pieni¹dze.
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
	description	 = 	"W jaki sposób mogê siê dostaæ do górnego miasta?";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_23"); //W jaki sposób mogê siê dostaæ do górnego miasta?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_24"); //Musisz zostaæ obywatelem tego miasta. ZnajdŸ jak¹œ pracê.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_25"); //Popytaj mo¿e robotników w dolnym mieœcie.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_26"); //Jeœli to nic nie da, mo¿esz równie¿ skontaktowaæ siê z Lordem Andre - znajdziesz go w koszarach.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_27"); //Byæ mo¿e pozwoli ci do³¹czyæ do stra¿y - jej cz³onkowie równie¿ maj¹ wstêp do górnego miasta.
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
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_29"); //Ma z³ota jak lodu i nie musi nic robiæ. Co wiêcej, chwali siê tym na prawo i na lewo.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_30"); //Niezale¿nie od tego, czy ktoœ chce go s³uchaæ...
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_31"); //Sporo pije i zwykle siedzi a¿ do zamkniêcia, po czym wytacza siê nad ranem na ulice górnego miasta.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_32"); //I tak dzieñ w dzieñ...
	
	
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
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_33"); //Valentino nie by³ w stanie uregulowaæ wczorajszego rachunku.
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_34"); //Be³kota³ coœ o tym, ¿e go okradziono i ¿e zap³aci póŸniej. Co za tupet!
	}
	else //Pickpocket OHNE Niederschlagen - AUSKOMMENTIERT
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_35"); //Wczeœniej siê puszy³, ile to kasy on nie ma...
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_36"); //A nagle wk³ada rêkê do kieszeni, a jego twarz przybiera jeszcze g³upszy wyraz ni¿ zwykle. Za chwilê gada, ¿e go okradziono.
	};
	
	AI_Output (other, self,"DIA_Coragon_Add_15_37"); //No... I co zrobi³eœ?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_38"); //Porachowa³em mu koœci.
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
	description = "Proszê - przyjmij ten pierœcieñ.";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_39"); //Proszê - przyjmij ten pierœcieñ.
	B_GiveInvItems (other, self, ItRi_ValentinosRing, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_40"); //Co? Nie rozumiem...
	AI_Output (other, self,"DIA_Coragon_Add_15_41"); //Nale¿a³ do Valentina.
	AI_Output (other, self,"DIA_Coragon_Add_15_42"); //Zawsze mo¿esz ofiarowaæ ten pierœcieñ komuœ, kto zdo³a go schwytaæ...

	B_GivePlayerXP (300);
	
	AI_StopProcessInfos (self);
};



























