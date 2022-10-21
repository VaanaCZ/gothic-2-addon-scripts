	
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Sagitta_EXIT   (C_INFO)
{
	npc         = BAU_980_Sagitta;
	nr          = 999;
	condition   = DIA_Sagitta_EXIT_Condition;
	information = DIA_Sagitta_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sagitta_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Sagitta_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_HALLO		(C_INFO)
{
	npc		 = 	BAU_980_Sagitta;
	nr		 = 	4;
	condition	 = 	DIA_Sagitta_HALLO_Condition;
	information	 = 	DIA_Sagitta_HALLO_Info;

	description	 = 	"Tak sama, tady venku?";
};

func int DIA_Sagitta_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Sagitta_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Sagitta_HALLO_15_00"); //Co d�l� tak sama, tady venku?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_17_01"); //�ekni, co ode m� chce�, a pak vypadni. M�m pr�ci.

	Info_ClearChoices	(DIA_Sagitta_HALLO);
	Info_AddChoice	(DIA_Sagitta_HALLO, DIALOG_BACK, DIA_Sagitta_HALLO_ende );
	Info_AddChoice	(DIA_Sagitta_HALLO, "M��e� m� vyl��it?", DIA_Sagitta_HALLO_Heil );
	Info_AddChoice	(DIA_Sagitta_HALLO, "Co tady d�l�?", DIA_Sagitta_HALLO_was );
	Info_AddChoice	(DIA_Sagitta_HALLO, "Kdo jsi?", DIA_Sagitta_HALLO_wer );

};

func void DIA_Sagitta_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Sagitta_HALLO_wer_15_00"); //Kdo jsi?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_wer_17_01"); //Tak tys o mn� je�t� nesly�el?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_wer_17_02"); //Bylink��ka, alespo� se tomu tak ��k�. �arlat�nka, nebo tak n�jak m� naz�vaj�.
	AI_Output			(self, other, "DIA_Sagitta_HALLO_wer_17_03"); //Ale kdy� je jim zle, v�dycky je jim star� Sagitta se sv�mi l��iv�mi bylinkami dobr�.

};

func void DIA_Sagitta_HALLO_was ()
{
	AI_Output			(other, self, "DIA_Sagitta_HALLO_was_15_00"); //Co tady d�l�?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_was_17_01"); //�iju tady, co se pamatuju, a star�m se o svoje bylinky.
	AI_Output			(self, other, "DIA_Sagitta_HALLO_was_17_02"); //Les je m�m p��telem. D�v� mi v�echno, co pot�ebuju.

};

func void DIA_Sagitta_HALLO_Heil ()
{
	AI_Output			(other, self, "DIA_Sagitta_HALLO_Heil_15_00"); //M��e� m� vyl��it?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_Heil_17_01"); //To je ten d�vod, kv�li kter�mu jsi tady, co? Tak pov�dej, co je v nepo��dku.
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"U Sagitty za Sekobovou farmou si mohu nakoupit vybaven�.");
};

func void DIA_Sagitta_HALLO_ende ()
{
	Info_ClearChoices	(DIA_Sagitta_HALLO);
};

///////////////////////////////////////////////////////////////////////
//	Info TeachAlchemyRequest
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_TeachAlchemyRequest		(C_INFO)
{
	npc			 = 	BAU_980_Sagitta;
	nr          = 	6;	
	condition	 = 	DIA_Sagitta_TeachAlchemyRequest_Condition;
	information	 = 	DIA_Sagitta_TeachAlchemyRequest_Info;
	permanent	 = 	TRUE;

	description	 = 	"M��e� m� nau�it n�co o bylink�ch?";
};

func int DIA_Sagitta_TeachAlchemyRequest_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
	&& (MIS_Sagitta_Herb == FALSE)
		{
				return TRUE;
		};
};
var int DIA_Sagitta_TeachAlchemyRequest_OneTime;
func void DIA_Sagitta_TeachAlchemyRequest_Info ()
{
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_15_00"); //M��e� m� nau�it n�co o bylink�ch?

	if (DIA_Sagitta_TeachAlchemyRequest_OneTime ==FALSE)
	{
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_01"); //Jak zaj�mav�. O n�co takov�ho m� lid� ne��daj� zrovna �asto.
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_02"); //Tak�e ty by ses cht�l st�t m�m studentem? To bys m�l nejd��v prok�zat, �e to s t�m z�jmem mysl� v�n�.
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_03"); //Pr�v� p�ipravuju velmi vz�cn� lektvar, kter� vy�aduje vybran� bylinky a extrakty.
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_04"); //Kdy� mi se�ene� jednu ingredienci - velmi vz�cnou bylinu, kterou tady bohu�el nem�m - m��u t� n��emu nau�it.
		DIA_Sagitta_TeachAlchemyRequest_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_05"); //U� jsem ti �ekla, �e ano. A� mi p�inese� tu vz�cnou bylinu.
	};
	
	Info_ClearChoices	(DIA_Sagitta_TeachAlchemyRequest);
	Info_AddChoice	(DIA_Sagitta_TeachAlchemyRequest, "Promi�, nem�m z�jem.", DIA_Sagitta_TeachAlchemyRequest_nein );
	Info_AddChoice	(DIA_Sagitta_TeachAlchemyRequest, "A kde ji najdu?", DIA_Sagitta_TeachAlchemyRequest_wo );
	Info_AddChoice	(DIA_Sagitta_TeachAlchemyRequest, "A o jakou ingredienci se jedn�?", DIA_Sagitta_TeachAlchemyRequest_was );
	
};
func void DIA_Sagitta_TeachAlchemyRequest_was ()
{
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_was_15_00"); //A o jakou rostlinu se jedn�?
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_was_17_01"); //Je to nesm�rn� vz�cn� bylina - ��k� se j� slune�n� aloe. Pozn� ji podle pronikav� mandlov� v�n�.
	
};

func void DIA_Sagitta_TeachAlchemyRequest_wo ()
{
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_wo_15_00"); //A kde ji najdu?
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_17_01"); //Ta bylina, co pot�ebuju, roste jen na m�stech, kde m� v�echny pot�ebn� �iviny.
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_17_02"); //Ty se nach�zej� v exkrementech �ern�ho trola.
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_17_03"); //Co� je taky ten d�vod, pro� je pro m� tak obt�n� tu kytku z�skat.
	Info_AddChoice	(DIA_Sagitta_TeachAlchemyRequest, "Uvid�me, co se s t�m d� d�lat.", DIA_Sagitta_TeachAlchemyRequest_wo_ja );
};
func void DIA_Sagitta_TeachAlchemyRequest_wo_ja ()
{
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_wo_ja_15_00"); //Uvid�me, co se s t�m d� d�lat.
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_ja_17_01"); //Dobr� tedy. Tak hodn� �t�st� p�i hled�n�.
	Info_ClearChoices	(DIA_Sagitta_TeachAlchemyRequest);
	MIS_Sagitta_Herb = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_SagittaHerb,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SagittaHerb,LOG_RUNNING);
	B_LogEntry (TOPIC_SagittaHerb,"Sagitta pot�ebuje zvl�tn� rostlinu zvanou slune�n� aloe, kter� roste pouze na exkrementech �ern�ho trola.");

};


func void DIA_Sagitta_TeachAlchemyRequest_nein ()
{
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_nein_15_00"); //Promi�, nem�m z�jem.
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_nein_17_01"); //Tak p�esta� pl�tvat m�m �asem s t�mi tv�mi nesmysly.
	Info_ClearChoices	(DIA_Sagitta_TeachAlchemyRequest);
};

///////////////////////////////////////////////////////////////////////
//	Info Sagitta_Herb
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_Sagitta_Herb		(C_INFO)
{
	npc			 = 	BAU_980_Sagitta;
	nr          = 	3;	
	condition	 = 	DIA_Sagitta_Sagitta_Herb_Condition;
	information	 = 	DIA_Sagitta_Sagitta_Herb_Info;

	description	 = 	"Na�el jsem slune�n� aloi.";
};

func int DIA_Sagitta_Sagitta_Herb_Condition ()
{	
	if (Npc_HasItems (other,ItPl_Sagitta_Herb_MIS))
	&& (MIS_Sagitta_Herb == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
		{
				return TRUE;
		};
};
func void DIA_Sagitta_Sagitta_Herb_Info ()
{
	AI_Output			(other, self, "DIA_Sagitta_Sagitta_Herb_15_00"); //Na�el jsem slune�n� aloi.
	AI_Output			(self, other, "DIA_Sagitta_Sagitta_Herb_17_01"); //D�ky. A te� se m� ohledn� lektvar� m��e� pt�t, na co chce�.
	B_GiveInvItems (other,self,ItPl_Sagitta_Herb_MIS,1);
	Sagitta_TeachAlchemy = TRUE;	
	MIS_Sagitta_Herb = LOG_SUCCESS;
	B_GivePlayerXP (XP_Sagitta_Sonnenaloe);
};


///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Sagitta_Teach   (C_INFO)
{
	npc         = BAU_980_Sagitta;
	nr          = 2;
	condition   = DIA_Sagitta_Teach_Condition;
	information = DIA_Sagitta_Teach_Info;
	permanent   = TRUE;
	description = "Jak� lektvary m� m��e� nau�it p�ipravovat?";
};
//----------------------------------------
var int DIA_Sagitta_Teach_permanent;
//----------------------------------------

FUNC INT DIA_Sagitta_Teach_Condition()
{	
	if (DIA_Sagitta_Teach_permanent == FALSE)
	&& (Sagitta_TeachAlchemy == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sagitta_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output (other, self,"DIA_Sagitta_Teach_15_00");//Jak� lektvary m� m��e� nau�it p�ipravovat?

	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_ClearChoices (DIA_Sagitta_Teach);
		Info_AddChoice (DIA_Sagitta_Teach,DIALOG_BACK,DIA_Sagitta_Teach_BACK);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Esence hojiv� s�ly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)),DIA_Sagitta_Teach_Health_01);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Extrakt hojiv� s�ly", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)),DIA_Sagitta_Teach_Health_02);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Esence many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)),DIA_Sagitta_Teach_Mana_01);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Extrakt many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)),DIA_Sagitta_Teach_Mana_02);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Elix�r many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_03)),DIA_Sagitta_Teach_Mana_03);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Elix�r ducha", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)),DIA_Sagitta_Teach_Perm_Mana);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Elix�r obratnosti", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)),DIA_Sagitta_Teach_Perm_DEX);
		talente = (talente + 1);
	};

	if (talente > 0)
	{
		if (Alchemy_Explain != TRUE)
		{
			AI_Output (self, other,"DIA_Sagitta_Teach_17_01"); //P�edt�m, ne� t� nau��m n�co z m� alchymie, ti mus�m ��ct, co v�echno bude� na p��pravu lektvar� pot�ebovat.
			AI_Output (self, other,"DIA_Sagitta_Teach_17_02"); //Alchymistick� kolona slou�� jako kuchy� pro p��pravu lektvar�. Bude� pot�ebovat pr�zdn� laboratorn� ba�ky, ve kter�ch se lektvary uchov�vaj�.
			AI_Output (self, other,"DIA_Sagitta_Teach_17_03"); //Pak p�id� ingredience a m� po�adovan� lektvar.
			AI_Output (self, other,"DIA_Sagitta_Teach_17_04"); //Tomu se samoz�ejm� m��e� ode m� nau�it.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output (self, other,"DIA_Sagitta_Teach_17_05"); //Tak jak� lektvar by to m�l b�t?
		};
	}
	else 
	{
		AI_Output (self, other,"DIA_Sagitta_Teach_17_06"); //U� zn� v�e, co bych t� mohla nau�it.
		DIA_Sagitta_Teach_permanent = TRUE;
	};
};

FUNC VOID DIA_Sagitta_Teach_BACK ()
{
	Info_ClearChoices (DIA_Sagitta_Teach);
};

FUNC VOID DIA_Sagitta_Teach_Health_01 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01);
	Info_ClearChoices (DIA_Sagitta_Teach);
};
FUNC VOID DIA_Sagitta_Teach_Health_02 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02);
	Info_ClearChoices (DIA_Sagitta_Teach);
};

FUNC VOID DIA_Sagitta_Teach_Mana_01 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01);
	Info_ClearChoices (DIA_Sagitta_Teach);
};

FUNC VOID DIA_Sagitta_Teach_Mana_02 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02);
	Info_ClearChoices (DIA_Sagitta_Teach);
};

FUNC VOID DIA_Sagitta_Teach_Mana_03 ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_03);
	Info_ClearChoices (DIA_Sagitta_Teach);
};

FUNC VOID DIA_Sagitta_Teach_Perm_Mana ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Mana);
	Info_ClearChoices (DIA_Sagitta_Teach);
};

FUNC VOID DIA_Sagitta_Teach_Perm_Dex ()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_DEX);
	Info_ClearChoices (DIA_Sagitta_Teach);
};
	
///////////////////////////////////////////////////////////////////////
//	Info HEAL
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_HEAL		(C_INFO)
{
	npc			 = 	BAU_980_Sagitta;
	nr          = 	99;	//Joly: braucht ne hohe Nummer, denn wird in den sp�teren Kapiteln auch verwendet.
	condition	 = 	DIA_Sagitta_HEAL_Condition;
	information	 = 	DIA_Sagitta_HEAL_Info;
	permanent	 = 	TRUE;
	description	 = 	"Vyle� m�.";
};

func int DIA_Sagitta_HEAL_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
		{
				return TRUE;
		};
};
func void DIA_Sagitta_HEAL_Info ()
{
	AI_Output			(other, self, "DIA_Sagitta_HEAL_15_00"); //Vyle� m�.
	
	if hero.attribute [ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]
	{
		AI_Output			(self, other, "DIA_Sagitta_HEAL_17_01"); //Uka�, pod�v�m se. Mmh. Na ty nejhor�� zran�n� by m�la moje masti�ka sta�it.
		hero.attribute [ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
	}
	else 
	{	
		AI_Output			(self, other, "DIA_Sagitta_HEAL_17_02"); //V t�hle chv�li nepot�ebuje� ��dn� l��en�.
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_TRADE		(C_INFO)
{
	npc		 = 	BAU_980_Sagitta;
	condition	 = 	DIA_Sagitta_TRADE_Condition;
	information	 = 	DIA_Sagitta_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;

	description	 = 	"Jak� zbo�� mi m��e� nab�dnout?";
};

func int DIA_Sagitta_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Sagitta_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Sagitta_TRADE_15_00"); //Jak� zbo�� mi m��e� nab�dnout?
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Sagitta_TRADE_17_01"); //�ekni, co chce�.
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Sagitta_KAP3_EXIT(C_INFO)
{
	npc			= BAU_980_Sagitta;
	nr			= 999;
	condition	= DIA_Sagitta_KAP3_EXIT_Condition;
	information	= DIA_Sagitta_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sagitta_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sagitta_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_OBSESSION		(C_INFO)
{
	npc		 = 	BAU_980_Sagitta;
	nr		 = 	30;
	condition	 = 	DIA_Sagitta_OBSESSION_Condition;
	information	 = 	DIA_Sagitta_OBSESSION_Info;

	description	 = 	"M�m stra�n� pocity �zkosti, pot�ebuji pomoc.";
};

func int DIA_Sagitta_OBSESSION_Condition ()
{
	if (SC_IsObsessed == TRUE)
	&& (SC_ObsessionTimes < 1)
	&& (Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Sagitta_OBSESSION_Info ()
{
	AI_Output			(other, self, "DIA_Sagitta_OBSESSION_15_00"); //Trp�m pocity strachu. Pot�ebuju pomoc.
	AI_Output			(self, other, "DIA_Sagitta_OBSESSION_17_01"); //Vid�m, �e sp�nek by ti moc nepomohl. Byl jsi vystaven temn�mu pohledu P�tra��.
	AI_Output			(self, other, "DIA_Sagitta_OBSESSION_17_02"); //Zajdi za Pyrokarem, nejvy���m m�gem kl�tera. Moje skromn� mo�nosti na tohle nesta��.
};

///////////////////////////////////////////////////////////////////////
//	Info Thekla
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_Thekla		(C_INFO)
{
	npc		 = 	BAU_980_Sagitta;
	nr		 = 	3;
	condition	 = 	DIA_Sagitta_Thekla_Condition;
	information	 = 	DIA_Sagitta_Thekla_Info;

	description	 = 	"Thekla m� poslala pro n�jak� bal�k.";
};

func int DIA_Sagitta_Thekla_Condition ()
{
	if (MIS_Thekla_Paket == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Sagitta_Thekla_Info ()
{
	AI_Output			(other, self, "DIA_Sagitta_Thekla_15_00"); //Thekla m� poslala pro n�jak� bal�k.
	AI_Output			(self, other, "DIA_Sagitta_Thekla_17_01"); //Ach, ano. U� jsem ji o�ek�vala v�era.
	AI_Output			(self, other, "DIA_Sagitta_Thekla_17_02"); //Tady je ten bal�k. D�vej na n�j dobr� pozor!
	B_GivePlayerXP (XP_AmbientKap3);								
	B_GiveInvItems (self, other, ItMi_TheklasPaket, 1);					
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Sagitta_KAP4_EXIT(C_INFO)
{
	npc			= BAU_980_Sagitta;
	nr			= 999;
	condition	= DIA_Sagitta_KAP4_EXIT_Condition;
	information	= DIA_Sagitta_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sagitta_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sagitta_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HealRandolph
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_HEALRANDOLPH		(C_INFO)
{
	npc		 = 	BAU_980_Sagitta;
	nr		 = 	30;
	condition	 = 	DIA_Sagitta_HEALRANDOLPH_Condition;
	information	 = 	DIA_Sagitta_HEALRANDOLPH_Info;
	permanent	 = 	TRUE;

	description	 = 	"Randolph m� abs��k.";
};

var int DIA_Sagitta_HEALRANDOLPH_GotOne;
var int DIA_Sagitta_HEALRANDOLPH_KnowsPrice;

func int DIA_Sagitta_HEALRANDOLPH_Condition ()
{
	if (MIS_HealRandolph == LOG_RUNNING)
	&& (Npc_HasItems (other,ItPo_HealRandolph_MIS) == 0)
	&& (Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Sagitta_HEALRANDOLPH_Info ()
{
	AI_Output			(other, self, "DIA_Sagitta_HEALRANDOLPH_15_00"); //Randolph m� abs��k.

	if (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_01"); //Kdy u� se ten chlap kone�n� pou��?
			DIA_Sagitta_HEALRANDOLPH_KnowsPrice = TRUE;
		};
	
	if(DIA_Sagitta_HEALRANDOLPH_GotOne == TRUE)
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_02"); //U� jsem ti pro n�j p�ichystala medic�nu. Tak se s t�m nikde moc nepoflakuj.
		}
	else
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_03"); //D�m mu na to l�k. To mu bude na n�kolik dn� sta�it.
		};

	AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_04"); //Tak to p�ijde na 300 zlat�ch.

	if (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
	{
		AI_Output			(other, self, "DIA_Sagitta_HEALRANDOLPH_15_05"); //Co?
		AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_06"); //Jedin� v�c, kterou dostane� �pln� zadarmo, je smrt, chlap�e.
	};	

	Info_ClearChoices	(DIA_Sagitta_HEALRANDOLPH);
	Info_AddChoice	(DIA_Sagitta_HEALRANDOLPH, "Pff. Za takov� nesmysly utr�cet nebudu."	, DIA_Sagitta_HEALRANDOLPH_no );
	Info_AddChoice	(DIA_Sagitta_HEALRANDOLPH, "Tady jsou pen�ze."				, DIA_Sagitta_HEALRANDOLPH_geld );
};

func void DIA_Sagitta_HEALRANDOLPH_geld ()
{
	AI_Output			(other, self, "DIA_Sagitta_HEALRANDOLPH_geld_15_00"); //Tady jsou pen�ze.

	if (B_GiveInvItems (other, self, ItMi_Gold,300))
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_geld_17_01"); //V�born�. V�dycky ty pen�ze m��e� dostat zp�tky od n�j.
			CreateInvItems 		(self, ItPo_HealRandolph_MIS, 1);									
			B_GiveInvItems 		(self, other, ItPo_HealRandolph_MIS, 1);					
			DIA_Sagitta_HEALRANDOLPH_GotOne = TRUE;
		B_LogEntry (TOPIC_HealRandolph,"Sagitta mi dala l�k pro Randolpha."); 
		}
	else
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_geld_17_02"); //Dokud mi ned� pen�ze, nebude ��dnej obchod.
		};

	Info_ClearChoices	(DIA_Sagitta_HEALRANDOLPH);
};

func void DIA_Sagitta_HEALRANDOLPH_no ()
{
	AI_Output			(other, self, "DIA_Sagitta_HEALRANDOLPH_no_15_00"); //Pff. Za takov� nesmysly utr�cet nebudu.
	AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_no_17_01"); //(sm�ch) Nedal ti pen�ze, co? To je cel� on!
	Info_ClearChoices	(DIA_Sagitta_HEALRANDOLPH);
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Sagitta_KAP5_EXIT(C_INFO)
{
	npc			= BAU_980_Sagitta;
	nr			= 999;
	condition	= DIA_Sagitta_KAP5_EXIT_Condition;
	information	= DIA_Sagitta_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sagitta_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sagitta_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Sagitta_KAP6_EXIT(C_INFO)
{
	npc			= BAU_980_Sagitta;
	nr			= 999;
	condition	= DIA_Sagitta_KAP6_EXIT_Condition;
	information	= DIA_Sagitta_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Sagitta_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Sagitta_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sagitta_PICKPOCKET (C_INFO)
{
	npc			= BAU_980_Sagitta;
	nr			= 900;
	condition	= DIA_Sagitta_PICKPOCKET_Condition;
	information	= DIA_Sagitta_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120_Female;
};                       

FUNC INT DIA_Sagitta_PICKPOCKET_Condition()
{
	C_Beklauen (103, 360);
};
 
FUNC VOID DIA_Sagitta_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sagitta_PICKPOCKET);
	Info_AddChoice		(DIA_Sagitta_PICKPOCKET, DIALOG_BACK 		,DIA_Sagitta_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sagitta_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sagitta_PICKPOCKET_DoIt);
};

func void DIA_Sagitta_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sagitta_PICKPOCKET);
};
	
func void DIA_Sagitta_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sagitta_PICKPOCKET);
};




		























 


























