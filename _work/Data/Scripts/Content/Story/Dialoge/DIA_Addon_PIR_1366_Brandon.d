// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Brandon_EXIT(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 999;
	condition	= DIA_Addon_Brandon_EXIT_Condition;
	information	= DIA_Addon_Brandon_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Brandon_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Brandon_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo 
// ************************************************************
INSTANCE DIA_Addon_Brandon_Hello(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 1;
	condition	= DIA_Addon_Brandon_Hello_Condition;
	information	= DIA_Addon_Brandon_Hello_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Brandon_Hello_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Brandon_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Brandon_Hello_04_00"); //A heleme se. Ňákej zelenáč.
	AI_Output (self ,other,"DIA_Addon_Brandon_Hello_04_01"); //A ještě k tomu suchozemská krysa!
	AI_Output (self ,other,"DIA_Addon_Brandon_Hello_04_02"); //Na piráta seš krapet hubenej.
};

// ************************************************************
// 							PERM 
// ************************************************************
INSTANCE DIA_Addon_Brandon_AnyNews(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 99;
	condition	= DIA_Addon_Brandon_AnyNews_Condition;
	information	= DIA_Addon_Brandon_AnyNews_Info;
	permanent	= TRUE;
	description = "Něco nového?";
};                       
FUNC INT DIA_Addon_Brandon_AnyNews_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Brandon_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Brandon_AnyNews_15_00"); //Něco nového?
	
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output (self ,other,"DIA_Addon_Brandon_Alright_04_01"); //To bych řek. Jsem zraněnej, nemáš nějakej léčivej lektvar?
		}
		else
		{
			if (C_AllCanyonRazorDead() == FALSE)
			{
				AI_Output (self ,other,"DIA_Addon_Brandon_Alright_04_02"); //Co teď? Půjdem na ty potvory, nebo ne?
			}
			else //alle platt
			{
				AI_Output (self ,other,"DIA_Addon_Brandon_Alright_04_03"); //Že se ptáš! Myslím, že v tom zatraceným kaňonu už nezůstala ani jedna z těch potvor břitváckejch.
			};
		};
	}
	else if (GregIsBack == TRUE)
	&& (!Npc_IsDead(Greg))
	&& (MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_AnyNews_04_04"); //Ne, ale co se vrátil Greg, určitě se to změní. Aspoň doufám.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_AnyNews_04_06"); //(spiklenecky) Momentíček.
		AI_PlayAni (self, "T_SEARCH");
		AI_Output (self ,other,"DIA_Addon_Brandon_AnyNews_04_07"); //(směje se) Ne, pokud vidím. Všechno při starým!
	};
};



// ************************************************************
// ***														***
// 			  			Teach STR und DEX
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 						Wanna Learn
// ------------------------------------------------------------
INSTANCE DIA_Addon_Brandon_WannaLearn (C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 11;
	condition	= DIA_Addon_Brandon_WannaLearn_Condition;
	information	= DIA_Addon_Brandon_WannaLearn_Info;

	description = "Můžeš mě něčemu naučit?";
};                       
FUNC INT DIA_Addon_Brandon_WannaLearn_Condition()
{
	return TRUE;
};
func void DIA_Addon_Brandon_WannaLearn_Info()
{
	AI_Output (other, self,"DIA_Addon_Brandon_WannaLearn_15_00"); //Můžeš mě něco naučit?
	AI_Output (self ,other,"DIA_Addon_Brandon_WannaLearn_04_01"); //Naučit? To si piš! Můžu ti ukázat, jak posílit svý tělo a stát se obratnějším.
	AI_Output (self ,other,"DIA_Addon_Brandon_WannaLearn_04_02"); //Ale proč bych to dělal?
	AI_Output (other,self ,"DIA_Addon_Pir_7_HenrysCrew_OfferDrink_15_00"); //Protože ti koupím něco k pití?
	AI_Output (self ,other,"DIA_Addon_Brandon_WannaLearn_04_03"); //(šklebí se) To není špatný, hochu! Uhádnul – a hned napoprvý!
	AI_Output (self ,other,"DIA_Addon_Brandon_WannaLearn_04_04"); //Ale ne abys mi přines ňákej levnej samoser.
	MIS_Brandon_BringHering = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry		(Topic_Addon_PIR_Teacher,Log_Text_Addon_BrandonTeach);
	
	Log_CreateTopic (TOPIC_Addon_BrandonBooze,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_BrandonBooze,LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_BrandonBooze,"Brandon mě může něčemu přiučit, ale napřed mu musím koupit něco k pití.");
};

// ------------------------------------------------------------
// 						Hole Grog
// ------------------------------------------------------------
INSTANCE DIA_Addon_Brandon_HoleGrog (C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 12;
	condition	= DIA_Addon_Brandon_HoleGrog_Condition;
	information	= DIA_Addon_Brandon_HoleGrog_Info;

	description = "Mám tu pro tebe trochu kořalky.";
};                       
FUNC INT DIA_Addon_Brandon_HoleGrog_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Brandon_WannaLearn))
	{
		return TRUE;
	};
};
func void DIA_Addon_Brandon_HoleGrog_Info()
{
	AI_Output (other,self ,"DIA_Addon_Pir_7_HenrysCrew_BringGrog_15_00"); //Chci pořádnou kořalku.
	AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_01"); //To mě chceš votrávit?
	AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_02"); //Takový močůvky se ani netknu! Máš vůbec ponětí, co do toho dávaj?
	AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_03"); //Starej Samuel prodává i DOBRÝ zboží! Tak mi koukej vobstarat něco takovýho!
	if (Player_KnowsSchnellerHering == TRUE)
	{
		AI_Output (other,self ,"DIA_Addon_Brandon_Hello_15_05"); //To mluvíš o jeho 'rychlým herynkovi'?
		AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_04"); //Jo, to myslím.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_05"); //Už jsi někdy vyzkoušel Samuelův zvláštní recept?
		AI_Output (other,self ,"DIA_Addon_Brandon_Hello_15_07"); //Ne, ještě ne.
		AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_06"); //Tak to koukej rychle napravit!
	};
	AI_Output (self ,other,"DIA_Addon_Brandon_HoleGrog_04_08"); //Já tu jeho míchanici prostě ZBOŽŇUJU!
	
	B_LogEntry (TOPIC_Addon_BrandonBooze,"Kořalka Brandonovi nestačí. Chce 'rychlého herynka', kterého prodává jedině Samuel.");
};
// ------------------------------------------------------------
// 					Schnellen Hering geben
// ------------------------------------------------------------
INSTANCE DIA_Addon_Brandon_SchnellerHering (C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 13;
	condition	= DIA_Addon_Brandon_SchnellerHering_Condition;
	information	= DIA_Addon_Brandon_SchnellerHering_Info;

	description = "Dej si tady rychlého herynka!";
};                       
FUNC INT DIA_Addon_Brandon_SchnellerHering_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Brandon_WannaLearn))
	&& (Npc_HasItems (other, ItFo_Addon_SchnellerHering) > 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Brandon_SchnellerHering_Info()
{
	AI_Output (other,self ,"DIA_Addon_Pir_7_HenrysCrew_GiveGrog_15_00"); //Tumáš.
	B_GiveInvItems (other, self, ItFo_Addon_Schnellerhering, 1);
	B_UseItem (self, ItFo_Addon_Schnellerhering);
	AI_Output (self ,other,"DIA_Addon_Brandon_GiveGrog_04_01"); //Aáá! To to krásně pálí! Jak voheň!
	
	B_LogEntry (TOPIC_Addon_BrandonBooze,"Dal jsem Brandonovi ten děsný dryák. Teď už mě bude učit.");
	
	MIS_Brandon_BringHering = LOG_SUCCESS;
	B_GivePlayerXP (XP_AMBIENT);
};


// ------------------------------------------------------------
// 			 Bring mir was bei! 
// ------------------------------------------------------------
var int	Brandon_Merke_Str;
var int	Brandon_Merke_Dex;
// ------------------------------------------------------------
INSTANCE DIA_Addon_Brandon_TeachPlayer(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 777;
	condition	= DIA_Addon_Brandon_TeachPlayer_Condition;
	information	= DIA_Addon_Brandon_TeachPlayer_Info;
	permanent	= TRUE;
	description = "Nauč mě něčemu!";
};                       
FUNC INT DIA_Addon_Brandon_TeachPlayer_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Brandon_WannaLearn))
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Brandon_TeachPlayer_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Francis_TeachPlayer_15_00"); //Nauč mě něco!
	
	Brandon_Merke_Str = other.attribute[ATR_STRENGTH];
	Brandon_Merke_Dex = other.attribute[ATR_DEXTERITY];
	
	if MIS_Brandon_BringHering == LOG_SUCCESS
	{
		Info_ClearChoices (DIA_Addon_Brandon_TeachPlayer);
		Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,DIALOG_BACK,DIA_Addon_Brandon_TeachPlayer_Back);
		Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Addon_Brandon_TeachPlayer_DEX_1);
		Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Brandon_TeachPlayer_DEX_5);
		Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Addon_Brandon_TeachPlayer_STR_1);
		Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Addon_Brandon_TeachPlayer_STR_5);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_TeachPlayer_04_01"); //Měls mi přinýst něco dobrýho k pití, hochu!
	};
};
// ------------------------------------------------------------
FUNC VOID DIA_Addon_Brandon_TeachPlayer_Back()
{
	if other.attribute[ATR_STRENGTH] > Brandon_Merke_Str
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_00"); //No dobře! Už seš vo trochu silnější.
	};
	
	if other.attribute[ATR_DEXTERITY] > Brandon_Merke_Dex
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_01"); //Čím budeš vobratnější, tím spíš zasáhneš cíl.
	};
	Info_ClearChoices (DIA_Addon_Brandon_TeachPlayer);
};
// ------------------------------------------------------------
FUNC VOID DIA_Addon_Brandon_TeachPlayer_DEX_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MED);
	
	Info_ClearChoices (DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,DIALOG_BACK,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Addon_Brandon_TeachPlayer_STR_5);	
};
// ------------------------------------------------------------
FUNC VOID DIA_Addon_Brandon_TeachPlayer_DEX_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MED);
	
	Info_ClearChoices (DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,DIALOG_BACK,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Addon_Brandon_TeachPlayer_STR_5);	
};
// ------------------------------------------------------------
FUNC VOID DIA_Addon_Brandon_TeachPlayer_STR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MED);
	
	Info_ClearChoices (DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,DIALOG_BACK,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Addon_Brandon_TeachPlayer_STR_5);
};
// ------------------------------------------------------------
FUNC VOID DIA_Addon_Brandon_TeachPlayer_STR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MED);

	Info_ClearChoices (DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,DIALOG_BACK,DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnDex5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice (DIA_Addon_Brandon_TeachPlayer,B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Addon_Brandon_TeachPlayer_STR_5);	
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
instance DIA_Addon_Brandon_Anheuern(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 11;
	condition	= DIA_Addon_Brandon_Anheuern_Condition;
	information	= DIA_Addon_Brandon_Anheuern_Info;
	permanent	= FALSE;
	description = "Měl bys mi pomoci.";
};                       
FUNC INT DIA_Addon_Brandon_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Brandon_Anheuern_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Brandon_FollowMe_15_00"); //Máš mi pomoct.
	AI_Output (self ,other,"DIA_Addon_Brandon_Anheuern_04_01"); //To je mi novina. A kdo to říká?
	AI_Output (other,self ,"DIA_Addon_Brandon_FollowMe_15_02"); //Greg. Máme jít do kaňonu lovit břitovce.
	AI_Output (self ,other,"DIA_Addon_Brandon_Anheuern_04_03"); //(šklebí se) Konečně se tu taky něco děje!
	AI_Output (self ,other,"DIA_Addon_Brandon_Anheuern_04_04"); //Tak pojďme, čím dřív to s nima vyřídíme, tím dřív se sem vrátíme.
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Brandon_ComeOn(C_INFO)
{
	npc			= 	PIR_1366_Addon_Brandon;
	nr		 	= 	12;
	condition	= 	DIA_Addon_Brandon_ComeOn_Condition;
	information	= 	DIA_Addon_Brandon_ComeOn_Info;
	permanent	= 	TRUE;
	description	= 	"Pojď se mnou.";
};
func int DIA_Addon_Brandon_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Brandon_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Brandon_ComeOn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Brandon_Weiter_15_00"); //Pojď se mnou.
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_ComeOn_04_02"); //Napřed se kousek vraťme.
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_ComeOn_04_01"); //Jsem přímo tady!
		AI_StopProcessInfos (self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Brandon_GoHome(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 13;
	condition	= DIA_Addon_Brandon_GoHome_Condition;
	information	= DIA_Addon_Brandon_GoHome_Info;
	permanent	= TRUE;
	description = "Už tě nepotřebuju.";
};                       
FUNC INT DIA_Addon_Brandon_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Brandon_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Brandon_DontNeedYou_15_00"); //Už tě nepotřebuju.
	AI_Output (self ,other,"DIA_Addon_Brandon_GoHome_04_01"); //Fajn, v pohodě.
	AI_Output (self ,other,"DIA_Addon_Brandon_GoHome_04_02"); //Snad spolu jednou popijem.

	AI_StopProcessInfos (self); 
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START"); //START! HOGE
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Brandon_TooFar(C_INFO)
{
	npc			= PIR_1366_Addon_Brandon;
	nr			= 14;
	condition	= DIA_Addon_Brandon_TooFar_Condition;
	information	= DIA_Addon_Brandon_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Brandon_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Brandon_TooFar_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Brandon_TooFar_04_00"); //Už dost! To chceš vyhubit celej ostrov?
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_TooFar_04_01"); //Jdem zpátky do tábora.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Brandon_TooFar_04_02"); //Jdu zpátky do tábora.	
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};







