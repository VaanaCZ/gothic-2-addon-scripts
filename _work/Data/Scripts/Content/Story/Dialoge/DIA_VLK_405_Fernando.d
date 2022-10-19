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
	description = "(Ukr�st mu pen�enku bude dost riskantn�.)";
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
	AI_Output (self ,other,"DIA_Fernando_Hello_14_01"); //Nic moc. Kdy� je�t� st�la bari�ra, byly to lep�� �asy.
	AI_Output (self ,other,"DIA_Fernando_Hello_14_02"); //Trestanci dod�vali tuny a tuny rudy z dol� a m� lod� ji pak odv�ely na pevninu.
	AI_Output (self ,other,"DIA_Fernando_Hello_14_03"); //A zp�tky zase p�iv�ely potraviny a jin� zbo��.
	AI_Output (self ,other,"DIA_Fernando_Hello_14_04"); //Ale te� jsme od��znuti od pevniny a jsme se z�sobami z�visl� na farm���ch.
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
	description = "Z �eho te� �ije�?";
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
	AI_Output (other,self ,"DIA_Fernando_Perm_15_00"); //Z �eho te� �ije�?

	if (Fernando_ImKnast == TRUE)
	{
		B_Say (self, other, "$NOTNOW");
	}
	else
	{
		if (Fernando_HatsZugegeben == TRUE)
		{
			AI_Output (self ,other,"DIA_Addon_Fernando_Perm_14_00"); //Nev�m, ale v ka�d�m p��pad� u� ��dn� �achry-machry. Aspo� to je jasn�.
		}	
		else if (Npc_KnowsInfo (other,DIA_Fernando_Success) == FALSE)
		{
			AI_Output (self ,other,"DIA_Fernando_Perm_14_01"); //Zrovna te� �iju ze sv�ch z�sob. Ale jestli se zase neza�ne obchodovat, do�iju se stra�n�ch �as�.
		}
		else
		{
			AI_Output (self ,other,"DIA_Fernando_Perm_14_02"); //Je ze m� �ebr�k. M�l jsem poslechnout sv�ho otce a dr�et se od toho hornick�ho k�eftu d�l.
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
	AI_Output (self ,other,"DIA_Fernando_Minental_14_00"); //Hej ty - po�kej chvilku. M� nam��eno do Hornick�ho �dol�, �e ano?
	AI_Output (other ,self,"DIA_Fernando_Minental_15_01"); //A?
	AI_Output (self ,other,"DIA_Fernando_Minental_14_02"); //M�m pro tebe nab�dku. Ty mi d� v�d�t, jak se to m� s rudou, a j� ti pak za to d�m...
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Fernando_Minental_14_03"); //...runov� k�men.
	}
	else
	{
		AI_Output (self ,other,"DIA_Fernando_Minental_14_04"); //...prsten, co pos�l� tvou �ivotn� energii.
	};
	AI_Output (other ,self,"DIA_Fernando_Minental_15_05"); //Uvid�m, co se d� d�lat.
	
	B_NpcClearObsessionByDMT (self);
	Npc_ExchangeRoutine (self, "START");
	
	Log_CreateTopic (TOPIC_Fernando,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Fernando,LOG_RUNNING);
	B_LogEntry (TOPIC_Fernando,"Obchodn�k Fernando chce v�d�t, co se v Hornick�m �dol� d�je s rudou.");
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

	description	 = 	"Prod�val jsi bandit�m zbran�.";
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
	AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_00"); //Prod�val jsi zbran� bandit�m.
	AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_01"); //(zmaten�) Ale... Jak jsi na to p�i�el?

	B_LogEntry (TOPIC_Addon_BanditTrader,"Z�mo�sk� obchodn�k Fernando se p�iznal, �e prod�val zbran� bandit�m."); 

	B_GivePlayerXP (XP_Addon_Fernando_HatsZugegeben);
	Fernando_HatsZugegeben = TRUE;

	if	((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
	{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_02"); //Na tomhle seznamu zbo��, kter� jsem sebral jednomu banditovi, je TV�J podpis.
	};
	
	if (Npc_HasItems (other,ItRi_Addon_BanditTrader))
	{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_03"); //U bandit� jsem na�el tenhle prsten ciz�ho obchodnick�ho cechu Araxos. A ty jsi ciz� obchodn�k.

		if	(Npc_HasItems (other,ItMw_Addon_BanditTrader))
		{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_04"); //A na t�ch me��ch, kter� banditi nosili, byly tvoje inici�ly.
		};
	}
	else //nur (Npc_HasItems (other,ItMw_Addon_BanditTrader))
	{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_05"); //Na me��ch, kter� banditi nosili, byly tvoje inici�ly.
	};

	AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_06"); //Tak se p�iznej, odhalil jsem t�!

	if (Fernando_ImKnast == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_07"); //Tak tos byl TY! TY jsi m� zni�il! To si �eredn� odsk��e�!
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_08"); //M�l ses odsud d�vno vypa�it, proto�e pochybuju, �e t� te� nechaj� odej�t.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_09"); //(rozzu�en�, pro sebe) V�ak m�j �as jednou p�ijde.
		B_NpcClearObsessionByDMT (self);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_10"); //(prosebn�) J� to necht�l ud�lat, v�� mi.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_11"); //(prosebn�) Nap�ed po mn� cht�li jenom j�dlo. Obchody v�zly, a tak jsem se s nimi zapletl.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_12"); //(prosebn�) A pak za�ali cht�t v�c a v�c, vyhro�ovali mi, �e m� zabijou, kdy� jim neprod�m i ty me�e, kter� cht�li.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_13"); //(prosebn�) J� za to p�ece nem��u! Jsem ob�t� okolnost�!
		
		if (Fernando_ImKnast == FALSE)//Joly:zur Sicherheit
		{
			Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
			Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Kolik mi zaplat�, kdy� t� nech�m j�t?", DIA_Addon_Fernando_BanditTrader_preis );
			Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Domobrana si to s tebou vy��d�.", DIA_Addon_Fernando_BanditTrader_mil );
			Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Jen se z toho nerozbre�.", DIA_Addon_Fernando_BanditTrader_Uptown );
		};
	};
};
func void DIA_Addon_Fernando_BanditTrader_Uptown ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_Uptown_15_00"); //Jen m� nerozbre�. Na n�koho z horn� �tvrti jsi p�kn� nechutnej.
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_Uptown_15_01"); //Ty bys za hrst zla��k� prodal i vlastn� du�i.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_Uptown_14_02"); //M�m taky velk� v�daje! A kdy� nebudu m�t hotovost, ta l�za z p��stavn� �tvrti m� se�ere!
};
func void DIA_Addon_Fernando_BanditTrader_mil ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_mil_15_00"); //Domobrana u� se s tebou vypo��d�.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_mil_14_01"); //To nem��e� ud�lat.
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_mil_15_02"); //�ekl bych, �e m��u. Bude� se divit.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_mil_14_03"); //P�i Innosovi! To je m�j konec!
	B_NpcClearObsessionByDMT (self);
};
func void DIA_Addon_Fernando_BanditTrader_preis ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_preis_15_00"); //Kolik mi zaplat�, kdy� t� nech�m j�t?
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_01"); //V�, �e se mi te� nevede dob�e. Moc ti d�t nem��u.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_02"); //Ale zaplat�m ti 200 zla��k� a p�id�m cenn� prsten.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_03"); //To by m�lo sta�it. A d� mi te� ten kompromituj�c� materi�l?

	Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
	Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Na to zapome�. Tohohle se jen tak nevzd�m.", DIA_Addon_Fernando_BanditTrader_nein );
	Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "No tak dob�e, jsme dohodnuti.", DIA_Addon_Fernando_BanditTrader_ja );
};
func void DIA_Addon_Fernando_BanditTrader_ja ()
{ 
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_ja_15_00"); //No dob�e, ujedn�no.
	B_GivePlayerXP (XP_Ambient);
	Npc_RemoveInvItems	(hero ,ItMw_Addon_BanditTrader, Npc_HasItems (other,ItMw_Addon_BanditTrader));
	Npc_RemoveInvItem	(hero ,ItRi_Addon_BanditTrader);
	Npc_RemoveInvItem	(hero ,ItWr_Addon_BanditTrader);

	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_ja_14_01"); //Tak fajn, tady m� to zlato.

	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);		
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_ja_14_02"); //A prsten. Te� jsme vyrovn�ni.
	CreateInvItems (self, ItRi_Prot_Point_01, 1);									
	B_GiveInvItems (self, other, ItRi_Prot_Point_01, 1);		
	Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
};
func void DIA_Addon_Fernando_BanditTrader_nein ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_nein_15_00"); //Ne, mysl�m, �e si to rad�i ponech�m.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_nein_14_01"); //Fajn, jen si to nech, ale b�da ti, jestli m� pr�skne�!
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
	description	= "Byl jsem v Hornick�m �dol�.";
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
	AI_Output (other ,self,"DIA_Fernando_Success_15_00"); //Byl jsem v Hornick�m �dol�.
	
	if (Fernando_ImKnast == FALSE)
	{
		Fernando_Erz = TRUE;
		B_GivePlayerXP (XP_Ambient);
		
		AI_Output (self ,other,"DIA_Fernando_Success_14_01"); //A? Jak se to tam m�?
		AI_Output (other ,self,"DIA_Fernando_Success_15_02"); //V�echny doly jsou vyt�eny, je tam sotva p�r truhel rudy. Nem� cenu tam v�bec kopat.
		AI_Output (self ,other,"DIA_Fernando_Success_14_03"); //To nem��e b�t pravda! To znamen�, �e je ze m� �ebr�k.
	
		if (Fernando_HatsZugegeben == FALSE)
		{
			AI_Output (other ,self,"DIA_Fernando_Success_15_04"); //Co na�e dohoda?
			AI_Output (self ,other,"DIA_Fernando_Success_14_05"); //Te� k tv� odm�n�...
			
			if (other.guild == GIL_KDF)
			{
				AI_Output (self ,other,"DIA_Fernando_Minental_14_06"); //Tady, vezmi si ten runov� k�men.
				B_GiveInvItems (self,other, ItmI_RuneBlank,1);
			}
			else
			{
				AI_Output (self ,other,"DIA_Fernando_Minental_14_07"); //Tady je tv�j prsten.
				B_GiveInvItems (self,other, ItRi_Hp_02,1);
			};
		};
	}
	else 
	{
		B_Say (self, other, "$NOTNOW");
		Log_SetTopicStatus (TOPIC_Fernando, LOG_OBSOLETE);
		B_LogEntry (TOPIC_Fernando,"Fernando u� ��dnou informaci nechce, tak�e mi ani nezaplat�.");
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

	description	 = 	"Jsi v po��dku?";
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

	description	 = 	"Ty jsi posedl�!";
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
	AI_Output			(other, self, "DIA_Fernando_Heilung_15_00"); //Ty jsi posedl�!
	AI_Output			(self, other, "DIA_Fernando_Heilung_14_01"); //Jdi pry�. Tak jdi u�.
	B_NpcClearObsessionByDMT (self);
};







