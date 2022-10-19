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
	description	 = 	"Mohu tu dostat nÏco k pitÌ?";
};

func int DIA_Coragon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Coragon_HALLO_15_00"); //Mohu tu dostat nÏco k pitÌ?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_00"); //Jestli m·ö zlaù·ky, klidnÏ se tu m˘ûeö i najÌst.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"JÌdlo a pitÌ m˘ûu nakoupit u hostinskÈho Coragona.");
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
	description	 = 	"Ukaû mi svÈ zboûÌ.";
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
	AI_Output (other, self, "DIA_Coragon_Trade_15_00"); //Ukaû mi svÈ zboûÌ.
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
	description	 = 	"Tak co, jak jdou köefty?";
	
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
	AI_Output (other, self, "DIA_Coragon_Gelaber_15_00"); //Tak co, jak jdou köefty?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_01"); //¡le, ani mi nep¯ipomÌnej. Lord Andre teÔ v öibeniËnÌ uliËce servÌruje pivo zdarma.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_02"); //Takûe sem nep¯ijde dohromady nikdo. Aû na boh·Ëe z hornÌ Ëtvrti.
	AI_Output (other, self, "DIA_Coragon_Add_15_03"); //A co je s nimi?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_04"); //(smÏje se) NÏkte¯Ì z tÏch nabob˘ dok·ûou pÏknÏ brnkat na nervy.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_05"); //Nap¯Ìklad tuhleten Valentino - nem˘ûu ho uû ani vidÏt.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_06"); //Ale z·kaznÌky si nem˘ûu vybÌrat, protoûe se mi hodÌ kaûd˝ zlaù·k.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_07"); //To m·lo, co jsem si uöet¯il, mi ukradli, a taky vöecko moje st¯Ìbro.
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

	description	 = 	"M˘ûeö mi povÏdÏt nÏco o tÏch poh¯eöovan˝ch lidech?";
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
	AI_Output	(other, self, "DIA_Addon_Coragon_MissingPeople_15_00"); //ÿekni mi o tÏch poh¯eöovan˝ch lidech.
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_01"); //Slyöel jsem, ûe dost lidÌ zmizelo dole v p¯Ìstavu. Ani se nedivÌm, tam dole se vûdycky dÏly divn˝ vÏci. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_02"); //Dokonce p¯itom p¯iöel o uËednÌka i Thorben, tesa¯ z dolnÌ Ë·sti mÏsta.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_03"); //Fakt divnou historku ti m˘ûe vypr·vÏt i Hakon, jeden z obchodnÌk˘ na trûiöti. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_04"); //Pr˝ den co den nar·ûel na jednoho chl·pka, co se ale najednou ztratil z povrchu zemskÈho. Dokonce tu vÏc ohl·sil i domobranÏ. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_05"); //Lidi z mÏsta jsou z toho pÏknÏ vyplaöenÌ. NevÌm, co si o tom myslet, p¯ijde mi to vöecko jako pÏknÈ nesmysly.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_06"); //Khorinis je drsnÈ mÏsto, ale za jeho branami ËÌhajÌ jeötÏ horöÌ nebezpeËÌ.   
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_07"); //Ti, co se zdrûujÌ za hradbami, obvykle padnou za obÏù bandit˘m nebo je seûere drav· zvÏ¯. Je to jednoduchÈ.  
	
	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"O poh¯eöovan˝ch lidech by nÏco mohl vÏdÏt Hakon, obchodnÌk na trûiöti, a tesa¯ Thorben."); 
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
	description	 = 	"NÏkdo tÏ okradl?";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_08"); //Coûe, okradli tÏ?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_09"); //Ano, ned·vno. Bylo tu tehd· pÏknÏ nabito a j· musel rozn·öet pivo.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_10"); //Nebyl jsem mimo bar dlouho, ale tÏm ömejd˘m to staËilo.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_11"); //äel jsem kv˘li tomu za domobranou, ale samoz¯ejmÏ nenaöli v˘bec nic. Radöi se budou nalejvat tÌm pivem zadarmo.
	
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
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_14"); //Tum·ö - za odmÏnu si vezmi tohle.
	B_GiveInvItems (self, other, ItFo_CoragonsBeer, 1);
	
	if (Coragon_Bier < 2)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_21"); //Velmi zvl·ötnÌ pivo. Tohle je m˘j poslednÌ sud.
	}
	else
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_22"); //To byla poslednÌ kapka!
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
	description	 = 	"Poda¯ilo se mi zÌskat tvoje st¯Ìbro.";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_12"); //Poda¯ilo se mi zÌskat tvoje st¯Ìbro.
	
	if B_GiveInvItems (other, self, ItMi_CoragonsSilber, 8)
	{
		Npc_RemoveInvItems (self, ItMi_CoragonsSilber,8);
	};
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_13"); //V·ûnÏ!
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
	description	 = 	"PodÌvej, co tady m·m...";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_15"); //PodÌvej, co tady m·m.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_16"); //Hmm? (p¯ekvapenÏ) Ale to je Lehmarova ˙ËetnÌ kniha!
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_17"); //Co s nÌ chceö dÏlat?
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
	AI_Output (other, self,"DIA_Coragon_Add_15_18"); //Tady m·ö svou knihu.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_19"); //DÌky! Zachr·nils mi krk. Lehmar dok·ûe bejt pÏknÏ hnusnej.
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
	description	 = 	"Co musÌm udÏlat, abych se dostal do hornÌ Ëtvrti?";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_23"); //Co musÌm udÏlat, abych se dostal do hornÌ Ëtvrti?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_24"); //MusÌö se st·t obËanem mÏsta. Najdi si nÏjakou pr·ci.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_25"); //NejlÈpe u nÏkoho z ¯emeslnÌk˘ v dolnÌ Ë·sti mÏsta. Pak by ses mÏl st·t obËanem.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_26"); //No, a kdyby ti to nestaËilo, promluv si v kas·rn·ch s lordem Andremm.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_27"); //Moûn· tÏ p¯ijme k mÏstskÈ str·ûi, a ta m· p¯Ìstup i do hornÌ Ë·sti mÏsta.
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
	description	 = 	"Co je s tÌm Valentinem?";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_28"); //Co je s tÌm Valentinem?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_29"); //Je nechutnÏ bohat˝, a tak nemusÌ makat. A kaûd˝mu se tÌm chlubÌ.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_30"); //Aù uû to chceö slyöet, nebo ne.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_31"); //Pije jak duha a vûdycky tu z˘st·v· aû do konce. A pak se brzo r·no pot·cÌ zp·tky do hornÌ Ëtvrti.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_32"); //Je to po¯·d stejn˝, den co den.
	
	
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
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_33"); //VËera veËer ale nemÏl na zaplacenÌ.
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_34"); //Bl·bolil nÏco o tom, ûe ho okradli a ûe mi zaplatÌ pozdÏji. Fakt!
	}
	else //Pickpocket OHNE Niederschlagen - AUSKOMMENTIERT
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_35"); //A jeötÏ chvilku p¯edtÌm se chv·stal, kolik m· penÏz.
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_36"); //Pak si s·hl do kapsy a prot·hl ksicht. A prohl·sil, ûe ho okradli.
	};
	
	AI_Output (other, self,"DIA_Coragon_Add_15_37"); //A jak ses zachoval ty?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_38"); //No, dal jsem mu po¯·dnÏ na frak, co jin˝ho?
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
	description = "Tum·ö - vezmi si tenhle prsten.";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_39"); //Tum·ö - vezmi si tenhle prsten.
	B_GiveInvItems (other, self, ItRi_ValentinosRing, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_40"); //Coûe? NerozumÌm.
	AI_Output (other, self,"DIA_Coragon_Add_15_41"); //P¯edtÌm pat¯il Valentinovi.
	AI_Output (other, self,"DIA_Coragon_Add_15_42"); //M˘ûeö ho p¯edat dalöÌmu, kdo mu trochu vypr·öÌ koûich.

	B_GivePlayerXP (300);
	
	AI_StopProcessInfos (self);
};



























