	
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

	description	 = 	"Nie czujesz siê trochê samotna?";
};

func int DIA_Sagitta_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Sagitta_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Sagitta_HALLO_15_00"); //Nie czujesz siê trochê samotna?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_17_01"); //Gadaj, co masz powiedzieæ i spadaj. Jestem zajêta.

	Info_ClearChoices	(DIA_Sagitta_HALLO);
	Info_AddChoice	(DIA_Sagitta_HALLO, DIALOG_BACK, DIA_Sagitta_HALLO_ende );
	Info_AddChoice	(DIA_Sagitta_HALLO, "Mo¿esz mnie uzdrowiæ?", DIA_Sagitta_HALLO_Heil );
	Info_AddChoice	(DIA_Sagitta_HALLO, "Co tutaj robisz?", DIA_Sagitta_HALLO_was );
	Info_AddChoice	(DIA_Sagitta_HALLO, "Kim jesteœ?", DIA_Sagitta_HALLO_wer );

};

func void DIA_Sagitta_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Sagitta_HALLO_wer_15_00"); //Kim jesteœ?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_wer_17_01"); //Widzê, ¿eœ o mnie nie s³ysza³?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_wer_17_02"); //Nazywaj¹ mnie zielark¹, szarlatanem w spódnicy.
	AI_Output			(self, other, "DIA_Sagitta_HALLO_wer_17_03"); //Jednak kiedy poczuj¹ siê gorzej, od razu przypominaj¹ sobie o starej, dobrej Sagicie i jej leczniczych zio³ach.

};

func void DIA_Sagitta_HALLO_was ()
{
	AI_Output			(other, self, "DIA_Sagitta_HALLO_was_15_00"); //Czym siê zajmujesz?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_was_17_01"); //Mieszkam tu i hodujê zio³a, odk¹d tylko pamiêtam.
	AI_Output			(self, other, "DIA_Sagitta_HALLO_was_17_02"); //Las jest moim przyjacielem. Wœród jego darów znajdujê wszystko, co jest mi potrzebne.

};

func void DIA_Sagitta_HALLO_Heil ()
{
	AI_Output			(other, self, "DIA_Sagitta_HALLO_Heil_15_00"); //Czy mog³abyœ mnie uzdrowiæ?
	AI_Output			(self, other, "DIA_Sagitta_HALLO_Heil_17_01"); //Po to w³aœnie przyszed³eœ, prawda? Daj mi znaæ, je¿eli bêdziesz potrzebowa³ pomocy.
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Sagitta sprzedaje swoje towary za farm¹ Sekoba.");
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

	description	 = 	"Czy mog³abyœ przekazaæ mi sw¹ wiedzê o zio³ach?";
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
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_15_00"); //Czy mog³abyœ przekazaæ mi swoj¹ wiedzê o zio³ach?

	if (DIA_Sagitta_TeachAlchemyRequest_OneTime ==FALSE)
	{
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_01"); //Interesuj¹ce. Ludzie nieczêsto mnie o to prosz¹.
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_02"); //Chcesz wiêc zostaæ moim uczniem? Jeœli tak, bêdziesz musia³ dowieœæ uczciwoœci swoich intencji.
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_03"); //Od jakiegoœ czasu pracujê nad bardzo rzadk¹ mikstur¹ z unikalnych zió³ i soków.
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_04"); //Jeœli zdobêdziesz dla mnie brakuj¹cy sk³adnik mikstury, zostanê twoj¹ nauczycielk¹.
		DIA_Sagitta_TeachAlchemyRequest_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_05"); //Ju¿ przecie¿ mówi³am: tak, jednak najpierw musisz mi przynieœæ brakuj¹cy sk³adnik.
	};
	
	Info_ClearChoices	(DIA_Sagitta_TeachAlchemyRequest);
	Info_AddChoice	(DIA_Sagitta_TeachAlchemyRequest, "Przykro mi, nie jestem zainteresowany.", DIA_Sagitta_TeachAlchemyRequest_nein );
	Info_AddChoice	(DIA_Sagitta_TeachAlchemyRequest, "Gdzie mogê znaleŸæ ten sk³adnik?", DIA_Sagitta_TeachAlchemyRequest_wo );
	Info_AddChoice	(DIA_Sagitta_TeachAlchemyRequest, "Co to za sk³adnik?", DIA_Sagitta_TeachAlchemyRequest_was );
	
};
func void DIA_Sagitta_TeachAlchemyRequest_was ()
{
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_was_15_00"); //Co to za sk³adnik?
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_was_17_01"); //To niebywale rzadka roœlina - ziele, zwane s³onecznym aloesem. Poznasz je po intensywnym zapachu migda³ów.
	
};

func void DIA_Sagitta_TeachAlchemyRequest_wo ()
{
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_wo_15_00"); //Gdzie mogê znaleŸæ ten sk³adnik?
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_17_01"); //Ziele, o którym mówiê, mo¿na znaleŸæ tylko tam, gdzie s¹ odpowiednie warunki.
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_17_02"); //Odpowiednie gleby powstaj¹ jedynie na bazie odchodów czarnych trolli.
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_17_03"); //Dlatego w³aœnie zdobycie tego sk³adnika jest dla mnie tak trudne, rozumiesz chyba?
	Info_AddChoice	(DIA_Sagitta_TeachAlchemyRequest, "W tej sytuacji nie pozostaje mi nic innego, jak siê za nim rozejrzeæ.", DIA_Sagitta_TeachAlchemyRequest_wo_ja );
};
func void DIA_Sagitta_TeachAlchemyRequest_wo_ja ()
{
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_wo_ja_15_00"); //W tej sytuacji nie pozostaje mi nic innego, jak siê za nim rozejrzeæ.
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_ja_17_01"); //Có¿, ¿yczê powodzenia w poszukiwaniach.
	Info_ClearChoices	(DIA_Sagitta_TeachAlchemyRequest);
	MIS_Sagitta_Herb = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_SagittaHerb,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SagittaHerb,LOG_RUNNING);
	B_LogEntry (TOPIC_SagittaHerb,"Sagitta prosi³a mnie o dziwne ziele, zwane s³onecznym aloesem. Roœnie ono tylko na odchodach czarnego trolla.");

};


func void DIA_Sagitta_TeachAlchemyRequest_nein ()
{
	AI_Output			(other, self, "DIA_Sagitta_TeachAlchemyRequest_nein_15_00"); //Przykro mi, nie jestem zainteresowany.
	AI_Output			(self, other, "DIA_Sagitta_TeachAlchemyRequest_nein_17_01"); //Nie marnuj wiêc mojego cennego czasu.
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

	description	 = 	"Znalaz³em s³oneczny aloes.";
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
	AI_Output			(other, self, "DIA_Sagitta_Sagitta_Herb_15_00"); //Znalaz³em s³oneczny aloes.
	AI_Output			(self, other, "DIA_Sagitta_Sagitta_Herb_17_01"); //Dziêkujê. Mo¿esz mnie pytaæ, o co tylko zechcesz.
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
	description = "Jakie mikstury mo¿esz mnie nauczyæ przyrz¹dzaæ?";
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
	AI_Output (other, self,"DIA_Sagitta_Teach_15_00");//Jakie mikstury mo¿esz mnie nauczyæ przyrz¹dzaæ?

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
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Esencja lecznicza", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)),DIA_Sagitta_Teach_Health_01);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Ekstrakt leczniczy", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)),DIA_Sagitta_Teach_Health_02);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Esencja many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)),DIA_Sagitta_Teach_Mana_01);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Ekstrakt many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)),DIA_Sagitta_Teach_Mana_02);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Eliksir many", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_03)),DIA_Sagitta_Teach_Mana_03);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Eliksir ducha", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)),DIA_Sagitta_Teach_Perm_Mana);
		talente = (talente + 1);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice (DIA_Sagitta_Teach,B_BuildLearnString ("Eliksir zrêcznoœci", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)),DIA_Sagitta_Teach_Perm_DEX);
		talente = (talente + 1);
	};

	if (talente > 0)
	{
		if (Alchemy_Explain != TRUE)
		{
			AI_Output (self, other,"DIA_Sagitta_Teach_17_01"); //Nim nauczê ciê trudnej sztuki alchemii, powiem ci, co jest potrzebne do sporz¹dzania mikstur.
			AI_Output (self, other,"DIA_Sagitta_Teach_17_02"); //Stó³ alchemika s³u¿y jako swego rodzaju kuchnia dla sporz¹dzania mikstur. Bêdziesz tak¿e potrzebowa³ pustego flakonu, by przechowywaæ w nim gotow¹ miksturê.
			AI_Output (self, other,"DIA_Sagitta_Teach_17_03"); //Nastêpnie wystarczy po³¹czyæ odpowiednie sk³adniki i mikstura gotowa.
			AI_Output (self, other,"DIA_Sagitta_Teach_17_04"); //Tej wiedzy nauczysz siê jedynie ode mnie.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output (self, other,"DIA_Sagitta_Teach_17_05"); //O której z mikstur chcesz pos³uchaæ?
		};
	}
	else 
	{
		AI_Output (self, other,"DIA_Sagitta_Teach_17_06"); //Wiesz ju¿ wszystko, czego mog³abym ciê nauczyæ.
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
	description	 = 	"Ulecz moje rany.";
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
	AI_Output			(other, self, "DIA_Sagitta_HEAL_15_00"); //Wylecz mnie.
	
	if hero.attribute [ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]
	{
		AI_Output			(self, other, "DIA_Sagitta_HEAL_17_01"); //Chwileczkê. Mmm. Moja maœæ powinna wyleczyæ najgorsze z twoich ran.
		hero.attribute [ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
	}
	else 
	{	
		AI_Output			(self, other, "DIA_Sagitta_HEAL_17_02"); //W tej chwili nie potrzebujesz leczenia.
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

	description	 = 	"Co mo¿esz mi zaoferowaæ?";
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
	AI_Output			(other, self, "DIA_Sagitta_TRADE_15_00"); //Jakie towary masz do zaoferowania?
	B_GiveTradeInv (self);
	AI_Output			(self, other, "DIA_Sagitta_TRADE_17_01"); //Powiedz, co ciê interesuje.
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

	description	 = 	"Chyba mam dreszcze.";
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
	AI_Output			(other, self, "DIA_Sagitta_OBSESSION_15_00"); //Od jakiegoœ czasu cierpiê na dziwaczne drgawki. Potrzebujê pomocy.
	AI_Output			(self, other, "DIA_Sagitta_OBSESSION_17_01"); //Widzê, ¿e w twoim przypadku sen nie bêdzie wystarczaj¹cym lekarstwem. Narazi³eœ siê na czarne spojrzenie Poszukiwaczy.
	AI_Output			(self, other, "DIA_Sagitta_OBSESSION_17_02"); //Udaj siê do Pyrokara, do klasztoru. Moje skromne leki nie wystarcz¹.
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

	description	 = 	"Thekla przysy³a mnie po odbiór przesy³ki.";
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
	AI_Output			(other, self, "DIA_Sagitta_Thekla_15_00"); //Thekla przysy³a mnie po odbiór przesy³ki.
	AI_Output			(self, other, "DIA_Sagitta_Thekla_17_01"); //Ach, tak. W³aœciwie spodziewa³am siê jej ju¿ kilka dni temu.
	AI_Output			(self, other, "DIA_Sagitta_Thekla_17_02"); //Oto paczka, dbaj o ni¹!
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

	description	 = 	"Randolph cierpi na syndrom odstawienia alkoholu.";
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
	AI_Output			(other, self, "DIA_Sagitta_HEALRANDOLPH_15_00"); //Randolph Ÿle siê czuje, odk¹d przesta³ piæ.

	if (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_01"); //Kiedy ten cz³owiek w koñcu zm¹drzeje?
			DIA_Sagitta_HEALRANDOLPH_KnowsPrice = TRUE;
		};
	
	if(DIA_Sagitta_HEALRANDOLPH_GotOne == TRUE)
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_02"); //Da³am ci ju¿ odpowiedni¹ dawkê dla niego. Lepiej b¹dŸ ostro¿ny.
		}
	else
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_03"); //Dam ci pewne remedium. W ci¹gu kilu dni powinno go postawiæ na nogi.
		};

	AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_04"); //Bêdzie ciê to kosztowaæ 300 sztuk z³ota.

	if (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
	{
		AI_Output			(other, self, "DIA_Sagitta_HEALRANDOLPH_15_05"); //Ile?
		AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_17_06"); //Jedyna rzecz, jak¹ mo¿esz dostaæ za darmo, to œmieræ.
	};	

	Info_ClearChoices	(DIA_Sagitta_HEALRANDOLPH);
	Info_AddChoice	(DIA_Sagitta_HEALRANDOLPH, "Nie za tak¹ bzdurê."	, DIA_Sagitta_HEALRANDOLPH_no );
	Info_AddChoice	(DIA_Sagitta_HEALRANDOLPH, "Oto twoje pieni¹dze."				, DIA_Sagitta_HEALRANDOLPH_geld );
};

func void DIA_Sagitta_HEALRANDOLPH_geld ()
{
	AI_Output			(other, self, "DIA_Sagitta_HEALRANDOLPH_geld_15_00"); //Oto twoje pieni¹dze.

	if (B_GiveInvItems (other, self, ItMi_Gold,300))
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_geld_17_01"); //Doskonale. Zawsze mo¿esz poprosiæ go o ich zwrot.
			CreateInvItems 		(self, ItPo_HealRandolph_MIS, 1);									
			B_GiveInvItems 		(self, other, ItPo_HealRandolph_MIS, 1);					
			DIA_Sagitta_HEALRANDOLPH_GotOne = TRUE;
		B_LogEntry (TOPIC_HealRandolph,"Sagitta da³a mi lekarstwo dla Randolpha."); 
		}
	else
		{
			AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_geld_17_02"); //Dopóki nie bêdziesz mia³ pieniêdzy - nici z interesów.
		};

	Info_ClearChoices	(DIA_Sagitta_HEALRANDOLPH);
};

func void DIA_Sagitta_HEALRANDOLPH_no ()
{
	AI_Output			(other, self, "DIA_Sagitta_HEALRANDOLPH_no_15_00"); //Nie za tak¹ bzdurê.
	AI_Output			(self, other, "DIA_Sagitta_HEALRANDOLPH_no_17_01"); //Nie da³ ci pieniêdzy? To ca³y Randolph!
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




		























 


























