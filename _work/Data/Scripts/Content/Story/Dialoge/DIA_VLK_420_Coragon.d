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
	description	 = 	"Mohu tu dostat něco k pití?";
};

func int DIA_Coragon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Coragon_HALLO_15_00"); //Mohu tu dostat něco k pití?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_00"); //Jestli máš zlaťáky, klidně se tu můžeš i najíst.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Jídlo a pití můžu nakoupit u hostinského Coragona.");
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
	description	 = 	"Ukaž mi své zboží.";
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
	AI_Output (other, self, "DIA_Coragon_Trade_15_00"); //Ukaž mi své zboží.
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
	description	 = 	"Tak co, jak jdou kšefty?";
	
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
	AI_Output (other, self, "DIA_Coragon_Gelaber_15_00"); //Tak co, jak jdou kšefty?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_01"); //Ále, ani mi nepřipomínej. Lord Andre teď v šibeniční uličce servíruje pivo zdarma.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_02"); //Takže sem nepřijde dohromady nikdo. Až na boháče z horní čtvrti.
	AI_Output (other, self, "DIA_Coragon_Add_15_03"); //A co je s nimi?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_04"); //(směje se) Někteří z těch nabobů dokážou pěkně brnkat na nervy.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_05"); //Například tuhleten Valentino - nemůžu ho už ani vidět.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_06"); //Ale zákazníky si nemůžu vybírat, protože se mi hodí každý zlaťák.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_07"); //To málo, co jsem si ušetřil, mi ukradli, a taky všecko moje stříbro.
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

	description	 = 	"Můžeš mi povědět něco o těch pohřešovaných lidech?";
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
	AI_Output	(other, self, "DIA_Addon_Coragon_MissingPeople_15_00"); //Řekni mi o těch pohřešovaných lidech.
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_01"); //Slyšel jsem, že dost lidí zmizelo dole v přístavu. Ani se nedivím, tam dole se vždycky děly divný věci. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_02"); //Dokonce přitom přišel o učedníka i Thorben, tesař z dolní části města.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_03"); //Fakt divnou historku ti může vyprávět i Hakon, jeden z obchodníků na tržišti. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_04"); //Prý den co den narážel na jednoho chlápka, co se ale najednou ztratil z povrchu zemského. Dokonce tu věc ohlásil i domobraně. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_05"); //Lidi z města jsou z toho pěkně vyplašení. Nevím, co si o tom myslet, přijde mi to všecko jako pěkné nesmysly.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_06"); //Khorinis je drsné město, ale za jeho branami číhají ještě horší nebezpečí.   
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_07"); //Ti, co se zdržují za hradbami, obvykle padnou za oběť banditům nebo je sežere dravá zvěř. Je to jednoduché.  
	
	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"O pohřešovaných lidech by něco mohl vědět Hakon, obchodník na tržišti, a tesař Thorben."); 
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
	description	 = 	"Někdo tě okradl?";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_08"); //Cože, okradli tě?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_09"); //Ano, nedávno. Bylo tu tehdá pěkně nabito a já musel roznášet pivo.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_10"); //Nebyl jsem mimo bar dlouho, ale těm šmejdům to stačilo.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_11"); //Šel jsem kvůli tomu za domobranou, ale samozřejmě nenašli vůbec nic. Radši se budou nalejvat tím pivem zadarmo.
	
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
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_14"); //Tumáš - za odměnu si vezmi tohle.
	B_GiveInvItems (self, other, ItFo_CoragonsBeer, 1);
	
	if (Coragon_Bier < 2)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_21"); //Velmi zvláštní pivo. Tohle je můj poslední sud.
	}
	else
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_22"); //To byla poslední kapka!
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
	description	 = 	"Podařilo se mi získat tvoje stříbro.";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_12"); //Podařilo se mi získat tvoje stříbro.
	
	if B_GiveInvItems (other, self, ItMi_CoragonsSilber, 8)
	{
		Npc_RemoveInvItems (self, ItMi_CoragonsSilber,8);
	};
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_13"); //Vážně!
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
	description	 = 	"Podívej, co tady mám...";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_15"); //Podívej, co tady mám.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_16"); //Hmm? (překvapeně) Ale to je Lehmarova účetní kniha!
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_17"); //Co s ní chceš dělat?
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
	description	 = 	"Tady je ta kniha.";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_18"); //Tady máš svou knihu.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_19"); //Díky! Zachránils mi krk. Lehmar dokáže bejt pěkně hnusnej.
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
	description	 = 	"Co musím udělat, abych se dostal do horní čtvrti?";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_23"); //Co musím udělat, abych se dostal do horní čtvrti?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_24"); //Musíš se stát občanem města. Najdi si nějakou práci.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_25"); //Nejlépe u někoho z řemeslníků v dolní části města. Pak by ses měl stát občanem.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_26"); //No, a kdyby ti to nestačilo, promluv si v kasárnách s lordem Andremm.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_27"); //Možná tě přijme k městské stráži, a ta má přístup i do horní části města.
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
	description	 = 	"Co je s tím Valentinem?";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_28"); //Co je s tím Valentinem?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_29"); //Je nechutně bohatý, a tak nemusí makat. A každýmu se tím chlubí.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_30"); //Ať už to chceš slyšet, nebo ne.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_31"); //Pije jak duha a vždycky tu zůstává až do konce. A pak se brzo ráno potácí zpátky do horní čtvrti.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_32"); //Je to pořád stejný, den co den.
	
	
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
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_33"); //Včera večer ale neměl na zaplacení.
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_34"); //Blábolil něco o tom, že ho okradli a že mi zaplatí později. Fakt!
	}
	else //Pickpocket OHNE Niederschlagen - AUSKOMMENTIERT
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_35"); //A ještě chvilku předtím se chvástal, kolik má peněz.
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_36"); //Pak si sáhl do kapsy a protáhl ksicht. A prohlásil, že ho okradli.
	};
	
	AI_Output (other, self,"DIA_Coragon_Add_15_37"); //A jak ses zachoval ty?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_38"); //No, dal jsem mu pořádně na frak, co jinýho?
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
	description = "Tumáš - vezmi si tenhle prsten.";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_39"); //Tumáš - vezmi si tenhle prsten.
	B_GiveInvItems (other, self, ItRi_ValentinosRing, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_40"); //Cože? Nerozumím.
	AI_Output (other, self,"DIA_Coragon_Add_15_41"); //Předtím patřil Valentinovi.
	AI_Output (other, self,"DIA_Coragon_Add_15_42"); //Můžeš ho předat dalšímu, kdo mu trochu vypráší kožich.

	B_GivePlayerXP (300);
	
	AI_StopProcessInfos (self);
};



























