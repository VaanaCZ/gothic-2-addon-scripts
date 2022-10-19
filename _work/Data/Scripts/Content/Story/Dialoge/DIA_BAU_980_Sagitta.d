	
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

	description	 = 	"Ganz alleine hier draußen?";
};

func int DIA_Sagitta_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Sagitta_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Sagitta_HALLO_15_00"); //Ganz alleine hier draußen?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_17_01"); //Sag, was du von mir willst und dann geh wieder. Ich habe zu tun.

	Info_ClearChoices	(DIA_Sagitta_HALLO);
	Info_AddChoice	(DIA_Sagitta_HALLO, DIALOG_BACK, DIA_Sagitta_HALLO_ende );
	Info_AddChoice	(DIA_Sagitta_HALLO, "Kannst du mich heilen?", DIA_Sagitta_HALLO_Heil );
	Info_AddChoice	(DIA_Sagitta_HALLO, "Was machst du hier draußen?", DIA_Sagitta_HALLO_was );
	Info_AddChoice	(DIA_Sagitta_HALLO, "Wer bist du?", DIA_Sagitta_HALLO_wer );

};

func void DIA_Sagitta_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Sagitta_HALLO_wer_15_00"); //Wer bist du?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_wer_17_01"); //Du hast noch nicht von mir gehört?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_wer_17_02"); //Kräuterhexe sagen sie. Giftmischerin sagen sie.
	AI_Output			(self, other, "DIA_Sagitta_HALLO_wer_17_03"); //Doch wenn es ihnen dreckig geht, erinnern sich alle an die gute Sagitta mit ihren heilenden Kräutern.

};

func void DIA_Sagitta_HALLO_was ()
{
	AI_Output			(other, self, "DIA_Sagitta_HALLO_was_15_00"); //Was machst du hier draußen?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_was_17_01"); //Ich lebe hier, seit ich denken kann, und widme mich meinen Kräutern.
	AI_Output			(self, other, "DIA_Sagitta_HALLO_was_17_02"); //Der Wald ist mein Freund. Er bietet mir alles, was ich brauche.

};

func void DIA_Sagitta_HALLO_Heil ()
{
	AI_Output			(other, self, "DIA_Sagitta_HALLO_Heil_15_00"); //Kannst du mich heilen?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_Heil_17_01"); //Deswegen bist du doch gekommen, oder? Du musst es mir nur sagen, wenn dir etwas fehlt.
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Sagitta verkauft Waren, hinter Sekobs Hof.");
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

	description	 = 	"Kannst du mir deine Kräuterkunst beibringen?";
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
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_15_00"); //Kannst du mir deine Kräuterkunst beibringen?

	if (DIA_Sagitta_TeachAlchemyRequest_OneTime ==FALSE)
	{
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_01"); //Interessant. Bisher hat mich selten jemand danach gefragt.
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_02"); //Du willst also mein Schüler sein? Dann wirst du erst den Ernst deines Anliegens unter Beweis stellen müssen.
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_03"); //Ich arbeite zurzeit an einem sehr seltenen Trank aus erlesenen Kräutern und Säften.
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_04"); //Wenn du mir eine Zutat, ein äußerst seltenes Kraut, das ich nicht hier habe, besorgen kannst, werde ich dich ausbilden.
		DIA_Sagitta_TeachAlchemyRequest_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_05"); //Das sagte ich bereits. Erst wenn du mir diese seltene Zutat besorgen kannst.
	};
	
	Info_ClearChoices	(DIA_Sagitta_TeachAlchemyRequest);
	Info_AddChoice	(DIA_Sagitta_TeachAlchemyRequest, "Kein Interesse.", DIA_Sagitta_TeachAlchemyRequest_nein );
	Info_AddChoice	(DIA_Sagitta_TeachAlchemyRequest, "Wo werde ich diese Zutat finden?", DIA_Sagitta_TeachAlchemyRequest_wo );
	Info_AddChoice	(DIA_Sagitta_TeachAlchemyRequest, "Was für eine Zutat ist das?", DIA_Sagitta_TeachAlchemyRequest_was );
	
};
func void DIA_Sagitta_TeachAlchemyRequest_was ()
{
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_was_15_00"); //Was für eine Zutat ist das?
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_was_17_01"); //Es handelt sich um eine sehr seltene Pflanze. Das Kraut nennt sich Sonnenaloe. Du erkennst es an seinem intensiven mandelartigen Geruch.
	
};

func void DIA_Sagitta_TeachAlchemyRequest_wo ()
{
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_wo_15_00"); //Wo werde ich diese Zutat finden?
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_17_01"); //Das Kraut, das ich brauche, gedeiht nur an den Stellen, an dem es die richtigen Nährstoffe bekommt.
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_17_02"); //Diese befinden sich in den Exkrementen eines schwarzen Trolls.
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_17_03"); //Deshalb ist es für mich auch so schwierig, an das Kraut zu kommen, verstehst du?
	Info_AddChoice	(DIA_Sagitta_TeachAlchemyRequest, "Mal sehen, ob ich es irgendwo auftreiben kann.", DIA_Sagitta_TeachAlchemyRequest_wo_ja );
};
func void DIA_Sagitta_TeachAlchemyRequest_wo_ja ()
{
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_wo_ja_15_00"); //Mal sehen, ob ich es irgendwo auftreiben kann.
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_ja_17_01"); //Na dann, viel Glück bei deiner Suche.
	Info_ClearChoices	(DIA_Sagitta_TeachAlchemyRequest);
	MIS_Sagitta_Herb = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_SagittaHerb,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SagittaHerb,LOG_RUNNING);
	B_LogEntry (TOPIC_SagittaHerb,"Sagitta braucht ein seltenes Kraut. Ein Sonnenaloe, die nur auf den Exkrementen eines schwarzen Trolls wächst.");

};


func void DIA_Sagitta_TeachAlchemyRequest_nein ()
{
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_nein_15_00"); //Kein Interesse.
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_nein_17_01"); //Dann verschwende nicht weiter meine Zeit mit deinem Unsinn.
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

	description	 = 	"Ich habe das Sonnenaloe gefunden.";
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
	AI_Output			(other, self, "DIA_Sagitta_Sagitta_Herb_15_00"); //Ich habe das Sonnenaloe gefunden.
	AI_Output			(self, other, "DIA_Sagitta_Sagitta_Herb_17_01"); //Ich danke dir. Und nun frag mich, was du über das Tränkebrauen wissen willst.
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
	description = "Welche Tränke kann ich bei dir Brauen lernen?";
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
	AI_Output (other, self,"DIA_Sagitta_Teach_15_00");//Welche Tränke kann ich bei dir brauen lernen?

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
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Essenz der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)),DIA_Sagitta_Teach_Health_01);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Extrakt der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)),DIA_Sagitta_Teach_Health_02);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Mana Essenz", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)),DIA_Sagitta_Teach_Mana_01);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Mana Extrakt", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)),DIA_Sagitta_Teach_Mana_02);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Mana Elixier", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_03)),DIA_Sagitta_Teach_Mana_03);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Elixier des Geistes", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)),DIA_Sagitta_Teach_Perm_Mana);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Elixier der Geschicklichkeit", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)),DIA_Sagitta_Teach_Perm_DEX);
		talente = (talente + 1);
	};

	if (talente > 0)
	{
		if (Alchemy_Explain != TRUE)
		{
			AI_Output (self, other,"DIA_Sagitta_Teach_17_01"); //Bevor ich dir meine Alchemiekunst beibringe, werde ich dir erst unterbreiten, was du zum Tränkebrauen alles benötigst.
			AI_Output (self, other,"DIA_Sagitta_Teach_17_02"); //Die Küche der Tränkebrauerei ist der Alchemietisch. Du brauchst dazu eine leere Laborwasserflasche, um den gebrauten Trank darin aufzubewahren.
			AI_Output (self, other,"DIA_Sagitta_Teach_17_03"); //Dann fügst du die gebrauchten Ingredienzien hinzu, und fertig ist der Trank.
			AI_Output (self, other,"DIA_Sagitta_Teach_17_04"); //Dieses Wissen kannst du natürlich bei mir lernen.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output (self, other,"DIA_Sagitta_Teach_17_05"); //Welcher Trank soll's denn nun sein?
		};
	}
	else 
	{
		AI_Output (self, other,"DIA_Sagitta_Teach_17_06"); //Du weißt schon alles, was ich dir beibringen könnte.
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
	nr          = 	99;	//Joly: braucht ne hohe Nummer, denn wird in den späteren Kapiteln auch verwendet.
	condition	 = 	DIA_Sagitta_HEAL_Condition;
	information	 = 	DIA_Sagitta_HEAL_Info;
	permanent	 = 	TRUE;
	description	 = 	"Heile mich.";
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
	AI_Output			(other, self, "DIA_Sagitta_HEAL_15_00"); //Heile mich.
	
	if hero.attribute [ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]
	{
		AI_Output			(self, other, "DIA_Sagitta_HEAL_17_01"); //Lass mich sehen. Mmh. Meine Salbe lindert deine schlimmsten Wunden.
		hero.attribute [ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
	}
	else 
	{	
		AI_Output			(self, other, "DIA_Sagitta_HEAL_17_02"); //Du bedarfst zurzeit keiner Heilung.
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

	description	 = 	"Welche Ware hast du anzubieten?";
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
	AI_Output			(other, self, "DIA_Sagitta_TRADE_15_00"); //Welche Ware hast du anzubieten?
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Sagitta_TRADE_17_01"); //Sag mir, was du willst.
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

	description	 = 	"Ich habe so ein beklemmendes Gefühl.";
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
	AI_Output			(other, self, "DIA_Sagitta_OBSESSION_15_00"); //Ich habe so ein beklemmendes Gefühl. Ich brauche Hilfe.
	AI_Output			(self, other, "DIA_Sagitta_OBSESSION_17_01"); //Ich sehe dir an, dass der Schlaf dir keine Erholung bringen wird. Du warst dem schwarzen Blick der Suchenden zu lange ausgesetzt.
	AI_Output			(self, other, "DIA_Sagitta_OBSESSION_17_02"); //Gehe zu Pyrokar, dem obersten Magier des Klosters. Meine bescheidenen Mittel reichen da nicht aus.
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

	description	 = 	"Thekla hat mich geschickt, ein Päckchen für sie abzuholen.";
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
	AI_Output			(other, self, "DIA_Sagitta_Thekla_15_00"); //Thekla hat mich geschickt, ein Päckchen für sie abzuholen.
	AI_Output			(self, other, "DIA_Sagitta_Thekla_17_01"); //Ah, ja. Ich hatte sie eigentlich schon vor Tagen hier erwartet.
	AI_Output			(self, other, "DIA_Sagitta_Thekla_17_02"); //Hier hast du das Päckchen. Pass gut darauf auf!
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

	description	 = 	"Randolph hat Entzugserscheinungen.";
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
	AI_Output			(other, self, "DIA_Sagitta_HEALRANDOLPH_15_00"); //Randolph hat Entzugserscheinungen.

	if (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_01"); //Der Junge hat es immer noch nicht gelernt, was?
			DIA_Sagitta_HEALRANDOLPH_KnowsPrice = TRUE;
		};
	
	if(DIA_Sagitta_HEALRANDOLPH_GotOne == TRUE)
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_02"); //Du hast schon eine Portion für ihn von mir bekommen. Mach mir damit bloß keinen Unsinn.
		}
	else
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_03"); //Ich werde ihm ein Mittel geben. Das wird ihm über die nächsten Tage hinweg helfen.
		};

	AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_04"); //Es kostet dich 300 Goldmünzen.

	if (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
	{
		AI_Output			(other, self, "DIA_Sagitta_HEALRANDOLPH_15_05"); //Was?
		AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_06"); //Umsonst ist der Tod, Kleiner.
	};	

	Info_ClearChoices	(DIA_Sagitta_HEALRANDOLPH);
	Info_AddChoice	(DIA_Sagitta_HEALRANDOLPH, "Nö. Nicht für so einen Quatsch."	, DIA_Sagitta_HEALRANDOLPH_no );
	Info_AddChoice	(DIA_Sagitta_HEALRANDOLPH, "Hier hast du das Geld."				, DIA_Sagitta_HEALRANDOLPH_geld );
};

func void DIA_Sagitta_HEALRANDOLPH_geld ()
{
	AI_Output			(other, self, "DIA_Sagitta_HEALRANDOLPH_geld_15_00"); //Hier hast du das Geld.

	if (B_GiveInvItems (other, self, ItMi_Gold,300))
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_geld_17_01"); //Sehr gut. Du kannst dir das Geld vom ihm ja wiederholen.
			CreateInvItems 		(self, ItPo_HealRandolph_MIS, 1);									
			B_GiveInvItems 		(self, other, ItPo_HealRandolph_MIS, 1);					
			DIA_Sagitta_HEALRANDOLPH_GotOne = TRUE;
		B_LogEntry (TOPIC_HealRandolph,"Sagitta gab mir das Mittel für Randolph."); 
		}
	else
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_geld_17_02"); //Erst, wenn du das Geld hast, kommen wir ins Geschäft.
		};

	Info_ClearChoices	(DIA_Sagitta_HEALRANDOLPH);
};

func void DIA_Sagitta_HEALRANDOLPH_no ()
{
	AI_Output			(other, self, "DIA_Sagitta_HEALRANDOLPH_no_15_00"); //Nö. Nicht für so einen Quatsch.
	AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_no_17_01"); //(lacht) Hat er dir kein Geld gegeben? Das sieht ihm ähnlich.
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




		























 


























