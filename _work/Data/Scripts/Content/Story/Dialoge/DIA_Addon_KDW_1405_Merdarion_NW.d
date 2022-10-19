///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Merdarion_EXIT   (C_INFO)
{
	npc         = KDW_1405_Addon_Merdarion_NW;
	nr          = 999;
	condition   = DIA_Addon_Merdarion_EXIT_Condition;
	information = DIA_Addon_Merdarion_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Merdarion_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Merdarion_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Merdarion_NW_PICKPOCKET (C_INFO)
{
	npc			= KDW_1405_Addon_Merdarion_NW;
	nr			= 900;
	condition	= DIA_Addon_Merdarion_NW_PICKPOCKET_Condition;
	information	= DIA_Addon_Merdarion_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre schwierig seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Merdarion_NW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Merdarion_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Merdarion_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Merdarion_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Merdarion_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Merdarion_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Merdarion_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Merdarion_NW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		
		B_GiveInvItems (self, other, ItSc_ArmyOfDarkness, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Merdarion_NW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Merdarion_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Merdarion_NW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Hallo		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Hallo_Condition;
	information	 = 	DIA_Addon_Merdarion_Hallo_Info;

	description	 = 	"Máš práci?";
};

func int DIA_Addon_Merdarion_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Hallo_15_00"); //Máš práci?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_01"); //Tyhle hrobky jsou pro mê velkou záhadou. Jen têžko si dokážu pâedstavit, že je dosud nikdo nenašel.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_02"); //Vchod jsme objevili bez problémù.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_03"); //Lidé mêli vždycky tolik práce se starostmi všedních dní, že se na tuhle budovu nikdo nikdy blíže nepodíval.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Hallo_06_04"); //Mám pro to jiné vysvêtlení.
};
///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Aufgabe		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Aufgabe_Condition;
	information	 = 	DIA_Addon_Merdarion_Aufgabe_Info;

	description	 = 	"Co tady máš za úkol?";
};

func int DIA_Addon_Merdarion_Aufgabe_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Aufgabe_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Aufgabe_15_00"); //A jaký je tvùj úkol?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_01"); //Snažím se zjistit, kam vede tenhle kulatý portál.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_02"); //A krom toho pomáhám Nefariovi najít chybêjící ornament.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_03"); //Je jisté, že tento portál vede do èásti ostrova, o které jsme dosud nemêli ani tušení.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Aufgabe_06_04"); //(uvážlivê) Vùbec si nepamatuju, že bych o nêèem takovém kdy slyšel nebo èetl.
	
	Npc_ExchangeRoutine (self, "START");
	B_StartOtherRoutine (Cronos_NW, "START");
	
	if (Nefarius_NW.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		B_LogEntry (TOPIC_Addon_KDW,"Nefarius hledá nêjaký ztracený ornament."); 
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info DaDurch
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_DaDurch		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_DaDurch_Condition;
	information	 = 	DIA_Addon_Merdarion_DaDurch_Info;

	description	 = 	"To chceš opravdu projít tím portálem?";
};

func int DIA_Addon_Merdarion_DaDurch_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_DaDurch_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_DaDurch_15_00"); //Vážnê chcete projít portálem?
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_01"); //Samozâejmê. Pokud tedy najdeme ten ztracený ornament.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_02"); //Ale pâiznám se, že je to celé trochu riskantní.
	AI_Output	(self, other, "DIA_Addon_Merdarion_DaDurch_06_03"); //Ale rozhodnê musíme zjistit, co pùsobí ta neustálá zemêtâesení.
};
///////////////////////////////////////////////////////////////////////
//	Info Bedrohung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Bedrohung		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Bedrohung_Condition;
	information	 = 	DIA_Addon_Merdarion_Bedrohung_Info;

	description	 = 	"Co víš o têch zemêtâeseních?";
};

func int DIA_Addon_Merdarion_Bedrohung_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_DaDurch))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Bedrohung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Bedrohung_15_00"); //Co víš o têch zemêtâeseních?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_01"); //Ty zpùsobuje nêco na druhé stranê.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_02"); //A ten samý zdroj nejspíš probouzí i ty kamenné strážce.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Bedrohung_06_03"); //Ale to není moje práce – o tom ti víc poví Saturas a Cronos.
};

///////////////////////////////////////////////////////////////////////
//	Info Wasdahinter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Wasdahinter2		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Wasdahinter2_Condition;
	information	 = 	DIA_Addon_Merdarion_Wasdahinter2_Info;

	description	 = 	"Co si myslíš, že tam najdeš?";
};

func int DIA_Addon_Merdarion_Wasdahinter2_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Wasdahinter2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Wasdahinter2_15_00"); //Co si myslíš, že tu najdete?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_01"); //To opravdu nevím.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_02"); //Na druhou stranu ale poèítám, že tam budou podobné budovy jako tahle. A protêjšek k tomuto portálu.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_03"); //Všechno ostatní zjistíme, až se tam dostaneme.
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_PERM		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Merdarion_PERM_Condition;
	information	 = 	DIA_Addon_Merdarion_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Mùžeš mê nauèit nêjaké magii?";
};

func int DIA_Addon_Merdarion_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_PERM_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_PERM_15_00"); //Mùžeš mê nauèit nêjakou magii?
	AI_Output	(self, other, "DIA_Addon_Merdarion_PERM_06_01"); //Až tu skonèíme, budu ti k dispozici.
};

///////////////////////////////////////////////////////////////////////
//	Info Teleportstein
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Teleportstein		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_Teleportstein_Condition;
	information	 = 	DIA_Addon_Merdarion_Teleportstein_Info;

	description	 = 	"Jak se nejrychleji dostanu do mêsta?";
};

func int DIA_Addon_Merdarion_Teleportstein_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Aufgabe))
	&& (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_Teleportstein_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_00"); //Jak se nejrychleji dostanu do mêsta?
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_01"); //Doporuèuju jít stejnou cestou, jakou jsi pâišel.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_02"); //(rozmýšlí) Ale taky bys mohl... Ne, to by bylo moc nebezpeèné.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_03"); //Ven s tím.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_04"); //No, stavitelé têchto síní mêli vlastní metodu cestování.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_05"); //Pokud víme, tak se dokázali teleportovat.
	AI_Output	(other, self, "DIA_Addon_Merdarion_Teleportstein_15_06"); //To není nic výjimeèného.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_07"); //Teleportaèní kameny, které jsme našli v Khorinidu, jsou opravdu zvláštní.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_08"); //Zdejší teleportaèní kámen by mêl vést do pâístavního mêsta.
	AI_Output	(self, other, "DIA_Addon_Merdarion_Teleportstein_06_09"); //Ale nikdo z nás nemá odvahu to vyzkoušet na vlastní kùži.
	
	Info_ClearChoices	(DIA_Addon_Merdarion_Teleportstein);
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "A co kdybych to vyzkoušel?", DIA_Addon_Merdarion_Teleportstein_ich );
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Kde je ten teleportaèní kámen?", DIA_Addon_Merdarion_Teleportstein_wo );
};
func void DIA_Addon_Merdarion_Teleportstein_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_wo_15_00"); //Kde je ten teleportaèní kámen?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_wo_06_01"); //V místnosti s nádržkou jsou dveâe. Kámen je zamèený za nimi.
	Info_AddChoice	(DIA_Addon_Merdarion_Teleportstein, "Dej mi klíè, chci se na to podívat.", DIA_Addon_Merdarion_Teleportstein_key );
};
func void DIA_Addon_Merdarion_Teleportstein_ich ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_ich_15_00"); //A co když bych ho chtêl použít?
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_ich_06_01"); //Ani nápad. Víme o nêm pâíliš málo a je možné, že bys to nepâežil.
};
func void DIA_Addon_Merdarion_Teleportstein_key ()
{
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_00"); //Dej mi klíè, chtêl bych se na ten kámen podívat.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_01"); //(nejistê) Opravdu? Ale já za to nenesu žádnou zodpovêdnost.
	AI_Output			(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_02"); //Dej mi ho.
	AI_Output			(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_03"); //Když to âíkáš – tady je.
	CreateInvItems (self, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);									
	B_GiveInvItems (self, other, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);		

	SC_GotPORTALTEMPELWALKTHROUGHKey = TRUE;

	Log_CreateTopic (TOPIC_Addon_TeleportsNW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Merdarion mi dal klíè k zamèeným dveâím v hrobce u portálu. Za nimi jsem našel teleportaèní kámen, který mne pâenese zpátky do pâístavu."); 

	Info_ClearChoices	(DIA_Addon_Merdarion_Teleportstein);
};

///////////////////////////////////////////////////////////////////////
//	Info WHereOtherTeleports
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_WHereOtherTeleports		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_WHereOtherTeleports_Condition;
	information	 = 	DIA_Addon_Merdarion_WHereOtherTeleports_Info;

	description	 = 	"Kde jsou další teleportaèní kameny?";
};

func int DIA_Addon_Merdarion_WHereOtherTeleports_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Teleportstein))
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_WHereOtherTeleports_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Merdarion_WHereOtherTeleports_15_00"); //Kde jsou ostatní teleportaèní kameny?
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_01"); //Jeden jsme zatím našli kdesi uprostâed Khorinidu.
	AI_Output	(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_02"); //U hospody U Mrtvé harpyje.
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Další teleportaèní kámen by mêl být nêkde u hospody U Mrtvé harpyje."); 
};

///////////////////////////////////////////////////////////////////////
//	Info TeleportsteinSuccess
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_TeleportsteinSuccess		(C_INFO)
{
	npc		 = 	KDW_1405_Addon_Merdarion_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Merdarion_TeleportsteinSuccess_Condition;
	information	 = 	DIA_Addon_Merdarion_TeleportsteinSuccess_Info;

	description	 = 	"Teleportaèní kámen už hezky funguje.";
};

func int DIA_Addon_Merdarion_TeleportsteinSuccess_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Teleportstein))
	&& (SCUsed_NW_TELEPORTSTATION_MAYA == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Merdarion_TeleportsteinSuccess_Info ()
{
	B_GivePlayerXP (XP_Ambient);
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_00"); //Teleportaèní kameny fungují bez problémù.
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_01"); //Tys to opravdu udêlal? Použil jsi je?
	AI_Output	(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_02"); //Ano, a zjevnê jsou stále funkèní.
	AI_Output	(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_03"); //(fascinovanê) To je neuvêâitelné. Budu to pak muset blíže prozkoumat.
};


