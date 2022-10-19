///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fernando_EXIT   (C_INFO)
{
	npc         = VLK_405_Fernando;
	nr          = 999;
	condition   = DIA_Fernando_EXIT_Condition;
	information = DIA_Fernando_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fernando_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fernando_EXIT_Info()
{
	B_NpcClearObsessionByDMT (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fernando_PICKPOCKET (C_INFO)
{
	npc			= VLK_405_Fernando;
	nr			= 900;
	condition	= DIA_Fernando_PICKPOCKET_Condition;
	information	= DIA_Fernando_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Kradzie� tego mieszka b�dzie ryzykownym zadaniem)";
};                       

FUNC INT DIA_Fernando_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItSe_GoldPocket100) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (50 - Theftdiff))
	&& (NpcObsessedByDMT_Fernando == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Fernando_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fernando_PICKPOCKET);
	Info_AddChoice		(DIA_Fernando_PICKPOCKET, DIALOG_BACK 		,DIA_Fernando_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fernando_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fernando_PICKPOCKET_DoIt);
};

func void DIA_Fernando_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 50)
	{
		
		B_GiveInvItems (self, other, ItSe_GoldPocket100, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Fernando_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		B_NpcClearObsessionByDMT (self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Fernando_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fernando_PICKPOCKET);
};
//*********************************************************************
//	Info Na.
//*********************************************************************

INSTANCE DIA_Fernando_Hello   (C_INFO)
{
	npc         = VLK_405_Fernando;
	nr          = 5;
	condition   = DIA_Fernando_Hello_Condition;
	information = DIA_Fernando_Hello_Info;
	permanent   = FALSE;
	description = "Jak idzie interes?";
};

FUNC INT DIA_Fernando_Hello_Condition()
{
	if (NpcObsessedByDMT_Fernando == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Fernando_Hello_Info()
{
	AI_Output (other,self ,"DIA_Fernando_Hello_15_00"); //Jak interesy?
	AI_Output (self ,other,"DIA_Fernando_Hello_14_01"); //Nie za dobrze. Wszystko by�o du�o �atwiejsze, zanim znikn�a Bariera.
	AI_Output (self ,other,"DIA_Fernando_Hello_14_02"); //Wi�niowie wydobywali z kopalni ca�e tony rudy, kt�re moje statki przewozi�y na kontynent.
	AI_Output (self ,other,"DIA_Fernando_Hello_14_03"); //W drodze powrotnej przywozi�y jedzenie i inne towary.
	AI_Output (self ,other,"DIA_Fernando_Hello_14_04"); //Niestety, te czasy min�y. Zostali�my odci�ci od kontynentu, wi�c musimy zadowala� si� jedynie tym, co dostarczaj� nam nasi ch�opi.
};
//*********************************************************************
//	Info Perm
//*********************************************************************

INSTANCE DIA_Fernando_Perm   (C_INFO)
{
	npc         = VLK_405_Fernando;
	nr          = 850;
	condition   = DIA_Fernando_Perm_Condition;
	information = DIA_Fernando_Perm_Info;
	permanent   = TRUE;
	description = "Z czego si� teraz utrzymujesz?";
};

FUNC INT DIA_Fernando_Perm_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Fernando_Hello))
	&& (NpcObsessedByDMT_Fernando == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Fernando_Perm_Info()
{
	AI_Output (other,self ,"DIA_Fernando_Perm_15_00"); //Z czego si� teraz utrzymujesz?

	if (Fernando_ImKnast == TRUE)
	{
		B_Say (self, other, "$NOTNOW");
	}
	else
	{
		if (Fernando_HatsZugegeben == TRUE)
		{
			AI_Output (self ,other,"DIA_Addon_Fernando_Perm_14_00"); //Nie wiem. Na pewno nie b�d� ju� robi� szemranych interes�w.
		}	
		else if (Npc_KnowsInfo (other,DIA_Fernando_Success) == FALSE)
		{
			AI_Output (self ,other,"DIA_Fernando_Perm_14_01"); //Na razie �yj� z oszcz�dno�ci. Jednak je�li nie uda mi si� szybko stan�� na nogi, wkr�tce b�d� mia� powa�ne problemy finansowe.
		}
		else
		{
			AI_Output (self ,other,"DIA_Fernando_Perm_14_02"); //Jestem zrujnowany. Powinienem by� pos�ucha� ojca, kiedy mnie ostrzega�, �ebym trzyma� si� z daleka od g�rnictwa.
		};
	};
};
//*********************************************************************
//	Info Minental
//*********************************************************************
INSTANCE DIA_Fernando_Minental   (C_INFO)
{
	npc         = VLK_405_Fernando;
	nr          = 2;
	condition   = DIA_Fernando_Minental_Condition;
	information = DIA_Fernando_Minental_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Fernando_Minental_Condition()
{
	if (NpcObsessedByDMT_Fernando == FALSE)
	&& (MIS_OLDWORLD == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (EnterOW_Kapitel2 == FALSE)
	&& (Fernando_HatsZugegeben == FALSE)//ADDON
	&& (Fernando_ImKnast == FALSE) //HACK ADDON PATCH
	{
		return TRUE;
	};
};

FUNC VOID DIA_Fernando_Minental_Info()
{
	AI_Output (self ,other,"DIA_Fernando_Minental_14_00"); //Ej, ty - zaczekaj chwil�. Podr�ujesz do G�rniczej Doliny, prawda?
	AI_Output (other ,self,"DIA_Fernando_Minental_15_01"); //Co w zwi�zku z tym?
	AI_Output (self ,other,"DIA_Fernando_Minental_14_02"); //Zawrzyjmy umow�. Powiesz mi, co si� dzieje z rud�, a ja w zamian za to podaruj� ci...
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Fernando_Minental_14_03"); //...kamie� runiczny.
	}
	else
	{
		AI_Output (self ,other,"DIA_Fernando_Minental_14_04"); //...pier�cie�, kt�ry podniesie twoj� energi� �yciow�.
	};
	AI_Output (other ,self,"DIA_Fernando_Minental_15_05"); //Zobacz�, co da si� zrobi�.
	
	B_NpcClearObsessionByDMT (self);
	Npc_ExchangeRoutine (self, "START");
	
	Log_CreateTopic (TOPIC_Fernando,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Fernando,LOG_RUNNING);
	B_LogEntry (TOPIC_Fernando,"Kupiec Fernando chce wiedzie�, co dzieje si� z rud� w G�rniczej Dolinie.");
};

///////////////////////////////////////////////////////////////////////
//	Info BanditTrader
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Fernando_BanditTrader		(C_INFO)
{
	npc		 = 	VLK_405_Fernando;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Fernando_BanditTrader_Condition;
	information	 = 	DIA_Addon_Fernando_BanditTrader_Info;

	description	 = 	"Sprzedajesz bro� bandytom!";
};

func int DIA_Addon_Fernando_BanditTrader_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Fernando_Hello))
	&& (NpcObsessedByDMT_Fernando == FALSE)
	&& 	(
		(Npc_HasItems (other,ItMw_Addon_BanditTrader))
		||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
		||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
		)
		{
			return TRUE;
		};
};

func void DIA_Addon_Fernando_BanditTrader_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_00"); //Sprzedajesz bro� bandytom!
	AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_01"); //Eee? Sk�d ten pomys�?

	B_LogEntry (TOPIC_Addon_BanditTrader,"Fernando, zamorski kupiec, przyzna�, �e dostarcza� bro� bandytom."); 

	B_GivePlayerXP (XP_Addon_Fernando_HatsZugegeben);
	Fernando_HatsZugegeben = TRUE;

	if	((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
	{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_02"); //Oto lista towar�w, kt�r� uda�o mi si� u nich znale��. Widnieje na niej tw�j podpis.
	};
	
	if (Npc_HasItems (other,ItRi_Addon_BanditTrader))
	{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_03"); //Mam te� pier�cie� gildii kupc�w zamorskich Araxos - a ty jeste� przecie� kupcem zamorskim, prawda?

		if	(Npc_HasItems (other,ItMw_Addon_BanditTrader))
		{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_04"); //Nie m�wi�c ju� o tym, �e bandyckie miecze s� oznaczone twoimi inicja�ami.
		};
	}
	else //nur (Npc_HasItems (other,ItMw_Addon_BanditTrader))
	{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_05"); //Miecze, kt�rych u�ywali bandyci, by�y oznaczone twoimi inicja�ami.
	};

	AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_06"); //Nie pr�buj zaprzecza� - przejrza�em twoje machlojki.

	if (Fernando_ImKnast == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_07"); //Wi�c to ty... To ty mnie zdradzi�e�! Zap�acisz mi za to.
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_08"); //Najpierw musieliby ci� st�d wypu�ci�, a jako� nie s�dz�, aby do tego dosz�o.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_09"); //Nadejdzie jeszcze pora zemsty...
		B_NpcClearObsessionByDMT (self);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_10"); //Musisz mi uwierzy�! Nie chcia�em tego!
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_11"); //Na pocz�tku chcieli tylko �ywno�ci! Interes szed� s�abo, wi�c si� zgodzi�em.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_12"); //Z czasem chcieli coraz wi�cej... Zagrozili, �e mnie zabij�, je�li nie dostarcz� im mieczy!
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_13"); //Nie mo�esz mnie obwinia�! To ja jestem tutaj ofiar�!
		
		if (Fernando_ImKnast == FALSE)//Joly:zur Sicherheit
		{
			Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
			Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Ile mi zap�acisz, je�li nie b�d� ci przeszkadza� w ucieczce?", DIA_Addon_Fernando_BanditTrader_preis );
			Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Zajmie si� tob� stra�.", DIA_Addon_Fernando_BanditTrader_mil );
			Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Jaka to smutna historia.", DIA_Addon_Fernando_BanditTrader_Uptown );
		};
	};
};
func void DIA_Addon_Fernando_BanditTrader_Uptown ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_Uptown_15_00"); //Jaka to smutna historia... Jak na kogo� �yj�cego w g�rnym mie�cie jeste� wyj�tkowo odra�aj�cy.
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_Uptown_15_01"); //Sprzeda� dusz� za kilka uncji z�ota... Ech.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_Uptown_14_02"); //Musz� zarobi� na �ycie! Je�li nie b�dzie mnie sta� na pokrycie koszt�w, to wyrzuc� mnie z powrotem do portu! Mi�dzy tych obdartus�w!
};
func void DIA_Addon_Fernando_BanditTrader_mil ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_mil_15_00"); //Zajmie si� tob� stra�.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_mil_14_01"); //Tak nie mo�na!
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_mil_15_02"); //Ale� oczywi�cie, �e mo�na.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_mil_14_03"); //Na Innosa... Jestem zrujnowany.
	B_NpcClearObsessionByDMT (self);
};
func void DIA_Addon_Fernando_BanditTrader_preis ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_preis_15_00"); //Ile mi zap�acisz, je�li nie b�d� ci przeszkadza� w ucieczce?
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_01"); //Znasz moj� sytuacj�. Zbyt wiele nie mam.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_02"); //Mo�e 200 sztuk z�ota i cenny pier�cie�?
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_03"); //Wi�cej nie mog� da�... Dostan� teraz dowody?

	Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
	Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Nie, tego ci nie dam.", DIA_Addon_Fernando_BanditTrader_nein );
	Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Dobra, umowa stoi.", DIA_Addon_Fernando_BanditTrader_ja );
};
func void DIA_Addon_Fernando_BanditTrader_ja ()
{ 
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_ja_15_00"); //Dobra, umowa stoi.
	B_GivePlayerXP (XP_Ambient);
	Npc_RemoveInvItems	(hero ,ItMw_Addon_BanditTrader, Npc_HasItems (other,ItMw_Addon_BanditTrader));
	Npc_RemoveInvItem	(hero ,ItRi_Addon_BanditTrader);
	Npc_RemoveInvItem	(hero ,ItWr_Addon_BanditTrader);

	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_ja_14_01"); //�wietnie - oto z�oto.

	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);		
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_ja_14_02"); //Jeszcze pier�cie� i jeste�my kwita.
	CreateInvItems (self, ItRi_Prot_Point_01, 1);									
	B_GiveInvItems (self, other, ItRi_Prot_Point_01, 1);		
	Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
};
func void DIA_Addon_Fernando_BanditTrader_nein ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_nein_15_00"); //Nie, tego ci nie dam.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_nein_14_01"); //Dobra. Tylko nie wa� si� mnie zdradzi�!
	Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
};
//*********************************************************************
//	Info Success
//*********************************************************************
INSTANCE DIA_Fernando_Success   (C_INFO)
{
	npc         = VLK_405_Fernando;
	nr          = 5;
	condition   = DIA_Fernando_Success_Condition;
	information = DIA_Fernando_Success_Info;
	permanent   = FALSE;
	description	= "By�em w G�rniczej Dolinie.";
};
FUNC INT DIA_Fernando_Success_Condition()
{
	if (NpcObsessedByDMT_Fernando == FALSE)
	&& (Kapitel >= 3)
	&& (Npc_KnowsInfo (other, DIA_Fernando_Minental))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Fernando_Success_Info()
{
	AI_Output (other ,self,"DIA_Fernando_Success_15_00"); //By�em w G�rniczej Dolinie.
	
	if (Fernando_ImKnast == FALSE)
	{
		Fernando_Erz = TRUE;
		B_GivePlayerXP (XP_Ambient);
		
		AI_Output (self ,other,"DIA_Fernando_Success_14_01"); //I co? Jak wygl�da sytuacja?
		AI_Output (other ,self,"DIA_Fernando_Success_15_02"); //Z�o�a si� wyczerpa�y, nie warto prowadzi� prac dla kilku skrzy� rudy.
		AI_Output (self ,other,"DIA_Fernando_Success_14_03"); //To niemo�liwe! A wi�c jestem zrujnowany...
	
		if (Fernando_HatsZugegeben == FALSE)
		{
			AI_Output (other ,self,"DIA_Fernando_Success_15_04"); //Co z nasz� umow�?
			AI_Output (self ,other,"DIA_Fernando_Success_14_05"); //A teraz s��wko o twojej nagrodzie...
			
			if (other.guild == GIL_KDF)
			{
				AI_Output (self ,other,"DIA_Fernando_Minental_14_06"); //Prosz�, we� ten kamie� runiczny.
				B_GiveInvItems (self,other, ItmI_RuneBlank,1);
			}
			else
			{
				AI_Output (self ,other,"DIA_Fernando_Minental_14_07"); //Prosz�, we� ten pier�cie�.
				B_GiveInvItems (self,other, ItRi_Hp_02,1);
			};
		};
	}
	else 
	{
		B_Say (self, other, "$NOTNOW");
		Log_SetTopicStatus (TOPIC_Fernando, LOG_OBSOLETE);
		B_LogEntry (TOPIC_Fernando,"Fernando nie chce kolejnych informacji. A ja nie chc� kolejnej zap�aty.");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Fernando_Obsession		(C_INFO)
{
	npc		 = 	VLK_405_Fernando;
	nr		 = 	30;
	condition	 = 	DIA_Fernando_Obsession_Condition;
	information	 = 	DIA_Fernando_Obsession_Info;

	description	 = 	"Wszystko w porz�dku?";
};

func int DIA_Fernando_Obsession_Condition ()
{
	if (Kapitel >= 3)
	&& (NpcObsessedByDMT_Fernando == FALSE)
	&& (hero.guild == GIL_KDF)
		{
				return TRUE;
		};
};

func void DIA_Fernando_Obsession_Info ()
{
	B_NpcObsessedByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Fernando_Heilung		(C_INFO)
{
	npc		 = 	VLK_405_Fernando;
	nr		 = 	55;
	condition	 = 	DIA_Fernando_Heilung_Condition;
	information	 = 	DIA_Fernando_Heilung_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jeste� op�tany!";
};

func int DIA_Fernando_Heilung_Condition ()
{
 	if (NpcObsessedByDMT_Fernando == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	 {
				return TRUE;
	 };
};

func void DIA_Fernando_Heilung_Info ()
{
	AI_Output			(other, self, "DIA_Fernando_Heilung_15_00"); //Jeste� op�tany!
	AI_Output			(self, other, "DIA_Fernando_Heilung_14_01"); //Id�. No id� wreszcie!
	B_NpcClearObsessionByDMT (self);
};







