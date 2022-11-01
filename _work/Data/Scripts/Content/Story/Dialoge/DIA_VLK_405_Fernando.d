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
	description = "(Ukrást mu penęženku bude dost riskantní.)";
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
	description = "Jak jdou obchody?";
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
	AI_Output (other,self ,"DIA_Fernando_Hello_15_00"); //Jak jdou obchody?
	AI_Output (self ,other,"DIA_Fernando_Hello_14_01"); //Nic moc. Když ještę stála bariéra, byly to lepší časy.
	AI_Output (self ,other,"DIA_Fernando_Hello_14_02"); //Trestanci dodávali tuny a tuny rudy z dolů a mé lodę ji pak odvážely na pevninu.
	AI_Output (self ,other,"DIA_Fernando_Hello_14_03"); //A zpátky zase pâivážely potraviny a jiné zboží.
	AI_Output (self ,other,"DIA_Fernando_Hello_14_04"); //Ale teë jsme odâíznuti od pevniny a jsme se zásobami závislí na farmáâích.
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
	description = "Z čeho teë žiješ?";
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
	AI_Output (other,self ,"DIA_Fernando_Perm_15_00"); //Z čeho teë žiješ?

	if (Fernando_ImKnast == TRUE)
	{
		B_Say (self, other, "$NOTNOW");
	}
	else
	{
		if (Fernando_HatsZugegeben == TRUE)
		{
			AI_Output (self ,other,"DIA_Addon_Fernando_Perm_14_00"); //Nevím, ale v každým pâípadę už žádné čachry-machry. Aspoŕ to je jasný.
		}	
		else if (Npc_KnowsInfo (other,DIA_Fernando_Success) == FALSE)
		{
			AI_Output (self ,other,"DIA_Fernando_Perm_14_01"); //Zrovna teë žiju ze svých zásob. Ale jestli se zase nezačne obchodovat, dožiju se strašných časů.
		}
		else
		{
			AI_Output (self ,other,"DIA_Fernando_Perm_14_02"); //Je ze mę žebrák. Męl jsem poslechnout svého otce a držet se od toho hornického kšeftu dál.
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
	AI_Output (self ,other,"DIA_Fernando_Minental_14_00"); //Hej ty - počkej chvilku. Máš namíâeno do Hornického údolí, že ano?
	AI_Output (other ,self,"DIA_Fernando_Minental_15_01"); //A?
	AI_Output (self ,other,"DIA_Fernando_Minental_14_02"); //Mám pro tebe nabídku. Ty mi dáš vędęt, jak se to má s rudou, a já ti pak za to dám...
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Fernando_Minental_14_03"); //...runový kámen.
	}
	else
	{
		AI_Output (self ,other,"DIA_Fernando_Minental_14_04"); //...prsten, co posílí tvou životní energii.
	};
	AI_Output (other ,self,"DIA_Fernando_Minental_15_05"); //Uvidím, co se dá dęlat.
	
	B_NpcClearObsessionByDMT (self);
	Npc_ExchangeRoutine (self, "START");
	
	Log_CreateTopic (TOPIC_Fernando,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Fernando,LOG_RUNNING);
	B_LogEntry (TOPIC_Fernando,"Obchodník Fernando chce vędęt, co se v Hornickém údolí dęje s rudou.");
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

	description	 = 	"Prodával jsi banditům zbranę.";
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
	AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_00"); //Prodával jsi zbranę banditům.
	AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_01"); //(zmatenę) Ale... Jak jsi na to pâišel?

	B_LogEntry (TOPIC_Addon_BanditTrader,"Zámoâský obchodník Fernando se pâiznal, že prodával zbranę banditům."); 

	B_GivePlayerXP (XP_Addon_Fernando_HatsZugegeben);
	Fernando_HatsZugegeben = TRUE;

	if	((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
	{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_02"); //Na tomhle seznamu zboží, které jsem sebral jednomu banditovi, je TVŮJ podpis.
	};
	
	if (Npc_HasItems (other,ItRi_Addon_BanditTrader))
	{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_03"); //U banditů jsem našel tenhle prsten cizího obchodnického cechu Araxos. A ty jsi cizí obchodník.

		if	(Npc_HasItems (other,ItMw_Addon_BanditTrader))
		{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_04"); //A na tęch mečích, které banditi nosili, byly tvoje iniciály.
		};
	}
	else //nur (Npc_HasItems (other,ItMw_Addon_BanditTrader))
	{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_05"); //Na mečích, které banditi nosili, byly tvoje iniciály.
	};

	AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_06"); //Tak se pâiznej, odhalil jsem tę!

	if (Fernando_ImKnast == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_07"); //Tak tos byl TY! TY jsi mę zničil! To si šerednę odskáčeš!
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_08"); //Męl ses odsud dávno vypaâit, protože pochybuju, že tę teë nechají odejít.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_09"); //(rozzuâenę, pro sebe) Však můj čas jednou pâijde.
		B_NpcClearObsessionByDMT (self);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_10"); //(prosebnę) Já to nechtęl udęlat, vęâ mi.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_11"); //(prosebnę) Napâed po mnę chtęli jenom jídlo. Obchody vázly, a tak jsem se s nimi zapletl.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_12"); //(prosebnę) A pak začali chtít víc a víc, vyhrožovali mi, že mę zabijou, když jim neprodám i ty meče, které chtęli.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_13"); //(prosebnę) Já za to pâece nemůžu! Jsem obętí okolností!
		
		if (Fernando_ImKnast == FALSE)//Joly:zur Sicherheit
		{
			Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
			Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Kolik mi zaplatíš, když tę nechám jít?", DIA_Addon_Fernando_BanditTrader_preis );
			Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Domobrana si to s tebou vyâídí.", DIA_Addon_Fernando_BanditTrader_mil );
			Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Jen se z toho nerozbreč.", DIA_Addon_Fernando_BanditTrader_Uptown );
		};
	};
};
func void DIA_Addon_Fernando_BanditTrader_Uptown ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_Uptown_15_00"); //Jen mę nerozbreč. Na nękoho z horní čtvrti jsi pęknę nechutnej.
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_Uptown_15_01"); //Ty bys za hrst zlaăáků prodal i vlastní duši.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_Uptown_14_02"); //Mám taky velké výdaje! A když nebudu mít hotovost, ta lůza z pâístavní čtvrti mę sežere!
};
func void DIA_Addon_Fernando_BanditTrader_mil ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_mil_15_00"); //Domobrana už se s tebou vypoâádá.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_mil_14_01"); //To nemůžeš udęlat.
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_mil_15_02"); //Âekl bych, že můžu. Budeš se divit.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_mil_14_03"); //Pâi Innosovi! To je můj konec!
	B_NpcClearObsessionByDMT (self);
};
func void DIA_Addon_Fernando_BanditTrader_preis ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_preis_15_00"); //Kolik mi zaplatíš, když tę nechám jít?
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_01"); //Víš, že se mi teë nevede dobâe. Moc ti dát nemůžu.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_02"); //Ale zaplatím ti 200 zlaăáků a pâidám cenný prsten.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_03"); //To by męlo stačit. A dáš mi teë ten kompromitující materiál?

	Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
	Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Na to zapomeŕ. Tohohle se jen tak nevzdám.", DIA_Addon_Fernando_BanditTrader_nein );
	Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "No tak dobâe, jsme dohodnuti.", DIA_Addon_Fernando_BanditTrader_ja );
};
func void DIA_Addon_Fernando_BanditTrader_ja ()
{ 
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_ja_15_00"); //No dobâe, ujednáno.
	B_GivePlayerXP (XP_Ambient);
	Npc_RemoveInvItems	(hero ,ItMw_Addon_BanditTrader, Npc_HasItems (other,ItMw_Addon_BanditTrader));
	Npc_RemoveInvItem	(hero ,ItRi_Addon_BanditTrader);
	Npc_RemoveInvItem	(hero ,ItWr_Addon_BanditTrader);

	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_ja_14_01"); //Tak fajn, tady máš to zlato.

	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);		
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_ja_14_02"); //A prsten. Teë jsme vyrovnáni.
	CreateInvItems (self, ItRi_Prot_Point_01, 1);									
	B_GiveInvItems (self, other, ItRi_Prot_Point_01, 1);		
	Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
};
func void DIA_Addon_Fernando_BanditTrader_nein ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_nein_15_00"); //Ne, myslím, že si to radši ponechám.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_nein_14_01"); //Fajn, jen si to nech, ale będa ti, jestli mę práskneš!
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
	description	= "Byl jsem v Hornickém údolí.";
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
	AI_Output (other ,self,"DIA_Fernando_Success_15_00"); //Byl jsem v Hornickém údolí.
	
	if (Fernando_ImKnast == FALSE)
	{
		Fernando_Erz = TRUE;
		B_GivePlayerXP (XP_Ambient);
		
		AI_Output (self ,other,"DIA_Fernando_Success_14_01"); //A? Jak se to tam má?
		AI_Output (other ,self,"DIA_Fernando_Success_15_02"); //Všechny doly jsou vytęženy, je tam sotva pár truhel rudy. Nemá cenu tam vůbec kopat.
		AI_Output (self ,other,"DIA_Fernando_Success_14_03"); //To nemůže být pravda! To znamená, že je ze mę žebrák.
	
		if (Fernando_HatsZugegeben == FALSE)
		{
			AI_Output (other ,self,"DIA_Fernando_Success_15_04"); //Co naše dohoda?
			AI_Output (self ,other,"DIA_Fernando_Success_14_05"); //Teë k tvé odmęnę...
			
			if (other.guild == GIL_KDF)
			{
				AI_Output (self ,other,"DIA_Fernando_Minental_14_06"); //Tady, vezmi si ten runový kámen.
				B_GiveInvItems (self,other, ItmI_RuneBlank,1);
			}
			else
			{
				AI_Output (self ,other,"DIA_Fernando_Minental_14_07"); //Tady je tvůj prsten.
				B_GiveInvItems (self,other, ItRi_Hp_02,1);
			};
		};
	}
	else 
	{
		B_Say (self, other, "$NOTNOW");
		Log_SetTopicStatus (TOPIC_Fernando, LOG_OBSOLETE);
		B_LogEntry (TOPIC_Fernando,"Fernando už žádnou informaci nechce, takže mi ani nezaplatí.");
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

	description	 = 	"Jsi v poâádku?";
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

	description	 = 	"Ty jsi posedlý!";
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
	AI_Output			(other, self, "DIA_Fernando_Heilung_15_00"); //Ty jsi posedlý!
	AI_Output			(self, other, "DIA_Fernando_Heilung_14_01"); //Jdi pryč. Tak jdi už.
	B_NpcClearObsessionByDMT (self);
};







