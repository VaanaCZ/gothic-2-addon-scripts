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
	description = "(Kradzie¿ tego mieszka bêdzie ryzykownym zadaniem)";
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
	AI_Output (self ,other,"DIA_Fernando_Hello_14_01"); //Nie za dobrze. Wszystko by³o du¿o ³atwiejsze, zanim zniknê³a Bariera.
	AI_Output (self ,other,"DIA_Fernando_Hello_14_02"); //WiêŸniowie wydobywali z kopalni ca³e tony rudy, które moje statki przewozi³y na kontynent.
	AI_Output (self ,other,"DIA_Fernando_Hello_14_03"); //W drodze powrotnej przywozi³y jedzenie i inne towary.
	AI_Output (self ,other,"DIA_Fernando_Hello_14_04"); //Niestety, te czasy minê³y. Zostaliœmy odciêci od kontynentu, wiêc musimy zadowalaæ siê jedynie tym, co dostarczaj¹ nam nasi ch³opi.
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
	description = "Z czego siê teraz utrzymujesz?";
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
	AI_Output (other,self ,"DIA_Fernando_Perm_15_00"); //Z czego siê teraz utrzymujesz?

	if (Fernando_ImKnast == TRUE)
	{
		B_Say (self, other, "$NOTNOW");
	}
	else
	{
		if (Fernando_HatsZugegeben == TRUE)
		{
			AI_Output (self ,other,"DIA_Addon_Fernando_Perm_14_00"); //Nie wiem. Na pewno nie bêdê ju¿ robiæ szemranych interesów.
		}	
		else if (Npc_KnowsInfo (other,DIA_Fernando_Success) == FALSE)
		{
			AI_Output (self ,other,"DIA_Fernando_Perm_14_01"); //Na razie ¿yjê z oszczêdnoœci. Jednak jeœli nie uda mi siê szybko stan¹æ na nogi, wkrótce bêdê mia³ powa¿ne problemy finansowe.
		}
		else
		{
			AI_Output (self ,other,"DIA_Fernando_Perm_14_02"); //Jestem zrujnowany. Powinienem by³ pos³uchaæ ojca, kiedy mnie ostrzega³, ¿ebym trzyma³ siê z daleka od górnictwa.
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
	AI_Output (self ,other,"DIA_Fernando_Minental_14_00"); //Ej, ty - zaczekaj chwilê. Podró¿ujesz do Górniczej Doliny, prawda?
	AI_Output (other ,self,"DIA_Fernando_Minental_15_01"); //Co w zwi¹zku z tym?
	AI_Output (self ,other,"DIA_Fernando_Minental_14_02"); //Zawrzyjmy umowê. Powiesz mi, co siê dzieje z rud¹, a ja w zamian za to podarujê ci...
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Fernando_Minental_14_03"); //...kamieñ runiczny.
	}
	else
	{
		AI_Output (self ,other,"DIA_Fernando_Minental_14_04"); //...pierœcieñ, który podniesie twoj¹ energiê ¿yciow¹.
	};
	AI_Output (other ,self,"DIA_Fernando_Minental_15_05"); //Zobaczê, co da siê zrobiæ.
	
	B_NpcClearObsessionByDMT (self);
	Npc_ExchangeRoutine (self, "START");
	
	Log_CreateTopic (TOPIC_Fernando,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Fernando,LOG_RUNNING);
	B_LogEntry (TOPIC_Fernando,"Kupiec Fernando chce wiedzieæ, co dzieje siê z rud¹ w Górniczej Dolinie.");
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

	description	 = 	"Sprzedajesz broñ bandytom!";
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
	AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_00"); //Sprzedajesz broñ bandytom!
	AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_01"); //Eee? Sk¹d ten pomys³?

	B_LogEntry (TOPIC_Addon_BanditTrader,"Fernando, zamorski kupiec, przyzna³, ¿e dostarcza³ broñ bandytom."); 

	B_GivePlayerXP (XP_Addon_Fernando_HatsZugegeben);
	Fernando_HatsZugegeben = TRUE;

	if	((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
	{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_02"); //Oto lista towarów, któr¹ uda³o mi siê u nich znaleŸæ. Widnieje na niej twój podpis.
	};
	
	if (Npc_HasItems (other,ItRi_Addon_BanditTrader))
	{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_03"); //Mam te¿ pierœcieñ gildii kupców zamorskich Araxos - a ty jesteœ przecie¿ kupcem zamorskim, prawda?

		if	(Npc_HasItems (other,ItMw_Addon_BanditTrader))
		{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_04"); //Nie mówi¹c ju¿ o tym, ¿e bandyckie miecze s¹ oznaczone twoimi inicja³ami.
		};
	}
	else //nur (Npc_HasItems (other,ItMw_Addon_BanditTrader))
	{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_05"); //Miecze, których u¿ywali bandyci, by³y oznaczone twoimi inicja³ami.
	};

	AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_06"); //Nie próbuj zaprzeczaæ - przejrza³em twoje machlojki.

	if (Fernando_ImKnast == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_07"); //Wiêc to ty... To ty mnie zdradzi³eœ! Zap³acisz mi za to.
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_08"); //Najpierw musieliby ciê st¹d wypuœciæ, a jakoœ nie s¹dzê, aby do tego dosz³o.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_09"); //Nadejdzie jeszcze pora zemsty...
		B_NpcClearObsessionByDMT (self);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_10"); //Musisz mi uwierzyæ! Nie chcia³em tego!
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_11"); //Na pocz¹tku chcieli tylko ¿ywnoœci! Interes szed³ s³abo, wiêc siê zgodzi³em.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_12"); //Z czasem chcieli coraz wiêcej... Zagrozili, ¿e mnie zabij¹, jeœli nie dostarczê im mieczy!
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_13"); //Nie mo¿esz mnie obwiniaæ! To ja jestem tutaj ofiar¹!
		
		if (Fernando_ImKnast == FALSE)//Joly:zur Sicherheit
		{
			Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
			Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Ile mi zap³acisz, jeœli nie bêdê ci przeszkadzaæ w ucieczce?", DIA_Addon_Fernando_BanditTrader_preis );
			Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Zajmie siê tob¹ stra¿.", DIA_Addon_Fernando_BanditTrader_mil );
			Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Jaka to smutna historia.", DIA_Addon_Fernando_BanditTrader_Uptown );
		};
	};
};
func void DIA_Addon_Fernando_BanditTrader_Uptown ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_Uptown_15_00"); //Jaka to smutna historia... Jak na kogoœ ¿yj¹cego w górnym mieœcie jesteœ wyj¹tkowo odra¿aj¹cy.
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_Uptown_15_01"); //Sprzedaæ duszê za kilka uncji z³ota... Ech.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_Uptown_14_02"); //Muszê zarobiæ na ¿ycie! Jeœli nie bêdzie mnie staæ na pokrycie kosztów, to wyrzuc¹ mnie z powrotem do portu! Miêdzy tych obdartusów!
};
func void DIA_Addon_Fernando_BanditTrader_mil ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_mil_15_00"); //Zajmie siê tob¹ stra¿.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_mil_14_01"); //Tak nie mo¿na!
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_mil_15_02"); //Ale¿ oczywiœcie, ¿e mo¿na.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_mil_14_03"); //Na Innosa... Jestem zrujnowany.
	B_NpcClearObsessionByDMT (self);
};
func void DIA_Addon_Fernando_BanditTrader_preis ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_preis_15_00"); //Ile mi zap³acisz, jeœli nie bêdê ci przeszkadzaæ w ucieczce?
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_01"); //Znasz moj¹ sytuacjê. Zbyt wiele nie mam.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_02"); //Mo¿e 200 sztuk z³ota i cenny pierœcieñ?
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_03"); //Wiêcej nie mogê daæ... Dostanê teraz dowody?

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

	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_ja_14_01"); //Œwietnie - oto z³oto.

	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);		
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_ja_14_02"); //Jeszcze pierœcieñ i jesteœmy kwita.
	CreateInvItems (self, ItRi_Prot_Point_01, 1);									
	B_GiveInvItems (self, other, ItRi_Prot_Point_01, 1);		
	Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
};
func void DIA_Addon_Fernando_BanditTrader_nein ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_nein_15_00"); //Nie, tego ci nie dam.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_nein_14_01"); //Dobra. Tylko nie wa¿ siê mnie zdradziæ!
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
	description	= "By³em w Górniczej Dolinie.";
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
	AI_Output (other ,self,"DIA_Fernando_Success_15_00"); //By³em w Górniczej Dolinie.
	
	if (Fernando_ImKnast == FALSE)
	{
		Fernando_Erz = TRUE;
		B_GivePlayerXP (XP_Ambient);
		
		AI_Output (self ,other,"DIA_Fernando_Success_14_01"); //I co? Jak wygl¹da sytuacja?
		AI_Output (other ,self,"DIA_Fernando_Success_15_02"); //Z³o¿a siê wyczerpa³y, nie warto prowadziæ prac dla kilku skrzyñ rudy.
		AI_Output (self ,other,"DIA_Fernando_Success_14_03"); //To niemo¿liwe! A wiêc jestem zrujnowany...
	
		if (Fernando_HatsZugegeben == FALSE)
		{
			AI_Output (other ,self,"DIA_Fernando_Success_15_04"); //Co z nasz¹ umow¹?
			AI_Output (self ,other,"DIA_Fernando_Success_14_05"); //A teraz s³ówko o twojej nagrodzie...
			
			if (other.guild == GIL_KDF)
			{
				AI_Output (self ,other,"DIA_Fernando_Minental_14_06"); //Proszê, weŸ ten kamieñ runiczny.
				B_GiveInvItems (self,other, ItmI_RuneBlank,1);
			}
			else
			{
				AI_Output (self ,other,"DIA_Fernando_Minental_14_07"); //Proszê, weŸ ten pierœcieñ.
				B_GiveInvItems (self,other, ItRi_Hp_02,1);
			};
		};
	}
	else 
	{
		B_Say (self, other, "$NOTNOW");
		Log_SetTopicStatus (TOPIC_Fernando, LOG_OBSOLETE);
		B_LogEntry (TOPIC_Fernando,"Fernando nie chce kolejnych informacji. A ja nie chcê kolejnej zap³aty.");
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

	description	 = 	"Wszystko w porz¹dku?";
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

	description	 = 	"Jesteœ opêtany!";
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
	AI_Output			(other, self, "DIA_Fernando_Heilung_15_00"); //Jesteœ opêtany!
	AI_Output			(self, other, "DIA_Fernando_Heilung_14_01"); //IdŸ. No idŸ wreszcie!
	B_NpcClearObsessionByDMT (self);
};







