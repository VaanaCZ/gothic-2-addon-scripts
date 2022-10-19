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
	description	 = 	"Mohu tu dostat n�co k pit�?";
};

func int DIA_Coragon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Coragon_HALLO_15_00"); //Mohu tu dostat n�co k pit�?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_00"); //Jestli m� zla��ky, klidn� se tu m��e� i naj�st.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"J�dlo a pit� m��u nakoupit u hostinsk�ho Coragona.");
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
	description	 = 	"Uka� mi sv� zbo��.";
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
	AI_Output (other, self, "DIA_Coragon_Trade_15_00"); //Uka� mi sv� zbo��.
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
	description	 = 	"Tak co, jak jdou k�efty?";
	
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
	AI_Output (other, self, "DIA_Coragon_Gelaber_15_00"); //Tak co, jak jdou k�efty?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_01"); //�le, ani mi nep�ipom�nej. Lord Andre te� v �ibeni�n� uli�ce serv�ruje pivo zdarma.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_02"); //Tak�e sem nep�ijde dohromady nikdo. A� na boh��e z horn� �tvrti.
	AI_Output (other, self, "DIA_Coragon_Add_15_03"); //A co je s nimi?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_04"); //(sm�je se) N�kte�� z t�ch nabob� dok�ou p�kn� brnkat na nervy.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_05"); //Nap��klad tuhleten Valentino - nem��u ho u� ani vid�t.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_06"); //Ale z�kazn�ky si nem��u vyb�rat, proto�e se mi hod� ka�d� zla��k.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_07"); //To m�lo, co jsem si u�et�il, mi ukradli, a taky v�ecko moje st��bro.
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

	description	 = 	"M��e� mi pov�d�t n�co o t�ch poh�e�ovan�ch lidech?";
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
	AI_Output	(other, self, "DIA_Addon_Coragon_MissingPeople_15_00"); //�ekni mi o t�ch poh�e�ovan�ch lidech.
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_01"); //Sly�el jsem, �e dost lid� zmizelo dole v p��stavu. Ani se nediv�m, tam dole se v�dycky d�ly divn� v�ci. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_02"); //Dokonce p�itom p�i�el o u�edn�ka i Thorben, tesa� z doln� ��sti m�sta.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_03"); //Fakt divnou historku ti m��e vypr�v�t i Hakon, jeden z obchodn�k� na tr�i�ti. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_04"); //Pr� den co den nar�el na jednoho chl�pka, co se ale najednou ztratil z povrchu zemsk�ho. Dokonce tu v�c ohl�sil i domobran�. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_05"); //Lidi z m�sta jsou z toho p�kn� vypla�en�. Nev�m, co si o tom myslet, p�ijde mi to v�ecko jako p�kn� nesmysly.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_06"); //Khorinis je drsn� m�sto, ale za jeho branami ��haj� je�t� hor�� nebezpe��.   
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_07"); //Ti, co se zdr�uj� za hradbami, obvykle padnou za ob� bandit�m nebo je se�ere drav� zv��. Je to jednoduch�.  
	
	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"O poh�e�ovan�ch lidech by n�co mohl v�d�t Hakon, obchodn�k na tr�i�ti, a tesa� Thorben."); 
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
	description	 = 	"N�kdo t� okradl?";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_08"); //Co�e, okradli t�?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_09"); //Ano, ned�vno. Bylo tu tehd� p�kn� nabito a j� musel rozn�et pivo.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_10"); //Nebyl jsem mimo bar dlouho, ale t�m �mejd�m to sta�ilo.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_11"); //�el jsem kv�li tomu za domobranou, ale samoz�ejm� nena�li v�bec nic. Rad�i se budou nalejvat t�m pivem zadarmo.
	
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
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_14"); //Tum� - za odm�nu si vezmi tohle.
	B_GiveInvItems (self, other, ItFo_CoragonsBeer, 1);
	
	if (Coragon_Bier < 2)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_21"); //Velmi zvl�tn� pivo. Tohle je m�j posledn� sud.
	}
	else
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_22"); //To byla posledn� kapka!
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
	description	 = 	"Poda�ilo se mi z�skat tvoje st��bro.";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_12"); //Poda�ilo se mi z�skat tvoje st��bro.
	
	if B_GiveInvItems (other, self, ItMi_CoragonsSilber, 8)
	{
		Npc_RemoveInvItems (self, ItMi_CoragonsSilber,8);
	};
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_13"); //V�n�!
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
	description	 = 	"Pod�vej, co tady m�m...";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_15"); //Pod�vej, co tady m�m.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_16"); //Hmm? (p�ekvapen�) Ale to je Lehmarova ��etn� kniha!
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_17"); //Co s n� chce� d�lat?
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
	AI_Output (other, self,"DIA_Coragon_Add_15_18"); //Tady m� svou knihu.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_19"); //D�ky! Zachr�nils mi krk. Lehmar dok�e bejt p�kn� hnusnej.
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
	description	 = 	"Co mus�m ud�lat, abych se dostal do horn� �tvrti?";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_23"); //Co mus�m ud�lat, abych se dostal do horn� �tvrti?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_24"); //Mus� se st�t ob�anem m�sta. Najdi si n�jakou pr�ci.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_25"); //Nejl�pe u n�koho z �emesln�k� v doln� ��sti m�sta. Pak by ses m�l st�t ob�anem.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_26"); //No, a kdyby ti to nesta�ilo, promluv si v kas�rn�ch s lordem Andremm.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_27"); //Mo�n� t� p�ijme k m�stsk� str�i, a ta m� p��stup i do horn� ��sti m�sta.
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
	description	 = 	"Co je s t�m Valentinem?";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_28"); //Co je s t�m Valentinem?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_29"); //Je nechutn� bohat�, a tak nemus� makat. A ka�d�mu se t�m chlub�.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_30"); //A� u� to chce� sly�et, nebo ne.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_31"); //Pije jak duha a v�dycky tu z�st�v� a� do konce. A pak se brzo r�no pot�c� zp�tky do horn� �tvrti.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_32"); //Je to po��d stejn�, den co den.
	
	
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
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_33"); //V�era ve�er ale nem�l na zaplacen�.
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_34"); //Bl�bolil n�co o tom, �e ho okradli a �e mi zaplat� pozd�ji. Fakt!
	}
	else //Pickpocket OHNE Niederschlagen - AUSKOMMENTIERT
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_35"); //A je�t� chvilku p�edt�m se chv�stal, kolik m� pen�z.
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_36"); //Pak si s�hl do kapsy a prot�hl ksicht. A prohl�sil, �e ho okradli.
	};
	
	AI_Output (other, self,"DIA_Coragon_Add_15_37"); //A jak ses zachoval ty?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_38"); //No, dal jsem mu po��dn� na frak, co jin�ho?
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
	description = "Tum� - vezmi si tenhle prsten.";
	
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
	AI_Output (other, self,"DIA_Coragon_Add_15_39"); //Tum� - vezmi si tenhle prsten.
	B_GiveInvItems (other, self, ItRi_ValentinosRing, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_40"); //Co�e? Nerozum�m.
	AI_Output (other, self,"DIA_Coragon_Add_15_41"); //P�edt�m pat�il Valentinovi.
	AI_Output (other, self,"DIA_Coragon_Add_15_42"); //M��e� ho p�edat dal��mu, kdo mu trochu vypr�� ko�ich.

	B_GivePlayerXP (300);
	
	AI_StopProcessInfos (self);
};



























