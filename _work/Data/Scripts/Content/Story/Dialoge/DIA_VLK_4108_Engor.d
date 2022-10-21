///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Engor_EXIT   (C_INFO)
{
	npc         = VLK_4108_Engor;
	nr          = 999;
	condition   = DIA_Engor_EXIT_Condition;
	information = DIA_Engor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Engor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Engor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_HALLO		(C_INFO)
{
	npc			 = 	VLK_4108_Engor;
	nr		 	 = 	2;
	condition	 = 	DIA_Engor_HALLO_Condition;
	information	 = 	DIA_Engor_HALLO_Info;
	important	 = 	TRUE;
};
func int DIA_Engor_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Engor_HALLO_Info ()
{
	
 	AI_Output (self, other, "DIA_Engor_HALLO_13_00"); //А, ты тот парень, которому удалось пройти через Проход?
	AI_Output (other, self, "DIA_Engor_HALLO_15_01"); //Да.
	AI_Output (self, other, "DIA_Engor_HALLO_13_02"); //Отлично. Я Энгор - я обеспечиваю эту экспедицию.
	AI_Output (self, other, "DIA_Engor_HALLO_13_03"); //Только не думай, что можешь получить от меня что-нибудь бесплатно!
	AI_Output (self, other, "DIA_Engor_HALLO_13_04"); //Но если в твоих карманах позванивает золото, мы всегда договоримся.
	
	Log_CreateTopic (TOPIC_Trader_OC, LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC, "Энгор заведует припасами замка и ведет небольшой бизнес на стороне.");  
};
///////////////////////////////////////////////////////////////////////
//	Info Handeln
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_HANDELN		(C_INFO)
{
	npc			 = 	VLK_4108_Engor;
	nr			 = 	10;
	condition	 = 	DIA_Engor_HANDELN_Condition;
	information	 = 	DIA_Engor_HANDELN_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Покажи мне свои товары.";
};

func int DIA_Engor_HANDELN_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Engor_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Engor_HANDELN_Info ()
{
	B_GiveTradeInv (self);

	//Joly: Mc ArrowBolt
	//////////////////////////////////////////////////////////////////////////////////////
	Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 50);
	CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
	Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 50);
	CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
	//////////////////////////////////////////////////////////////////////////////////////

	AI_Output			(other, self, "DIA_Engor_HANDELN_15_00"); //Покажи мне свои товары.
};
///////////////////////////////////////////////////////////////////////
//	Info ABOUTPARLAF
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_ABOUTPARLAF		(C_INFO)
{
	npc		 	 = 	VLK_4108_Engor;
	nr		 	 = 	2;
	condition	 = 	DIA_Engor_ABOUTPARLAF_Condition;
	information	 = 	DIA_Engor_ABOUTPARLAF_Info;
	description	 = 	"Ты распределяешь пайки, как я слышал?";
};

func int DIA_Engor_ABOUTPARLAF_Condition ()
{
	if Npc_KnowsInfo (hero, DIA_Parlaf_ENGOR)
	{
		return TRUE;
	};
};
func void DIA_Engor_ABOUTPARLAF_Info ()
{
	AI_Output (other, self, "DIA_Engor_ABOUTPARLAF_15_00"); //Ты распределяешь пайки, как я слышал?
	AI_Output (self, other, "DIA_Engor_ABOUTPARLAF_13_01"); //Это так. А что? Мне теперь и тебя кормить придется?
	AI_Output (self, other, "DIA_Engor_ABOUTPARLAF_13_02"); //Если тебе что-то нужно, тебе придется платить за это - как и всем остальным.
};
///////////////////////////////////////////////////////////////////////
//	Info Ruestung
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_Ruestung		(C_INFO)
{
	npc		 	 = 	VLK_4108_Engor;
	nr		 	 = 	2;
	condition	 = 	DIA_Engor_Ruestung_Condition;
	information	 = 	DIA_Engor_Ruestung_Info;
	permanent 	 =  FALSE;
	description	 = 	"У тебя есть что-нибудь интересное для меня?";
};

func int DIA_Engor_Ruestung_Condition ()
{
	if (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
func void DIA_Engor_Ruestung_Info ()
{
	AI_Output (other, self, "DIA_Engor_Ruestung_15_00"); //У тебя есть что-нибудь интересное для меня?
	AI_Output (self, other, "DIA_Engor_Ruestung_13_01"); //Я могу продать тебе хорошие доспехи - тяжелые доспехи ополчения. Если, конечно, тебе это интересно.
	AI_Output (self, other, "DIA_Engor_Ruestung_13_02"); //Они недешевы, конечно же. Но если у тебя есть золото, ты получишь их.
};
///////////////////////////////////////////////////////////////////////
//	Info RSkaufen
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_RSkaufen		(C_INFO)
{
	npc		 	 = 	VLK_4108_Engor;
	nr		 	 = 	2;
	condition	 = 	DIA_Engor_RSkaufen_Condition;
	information	 = 	DIA_Engor_RSkaufen_Info;
	permanent 	 =  TRUE;
	description	 = 	"Купить тяжелые доспехи ополчения (Защита: Оружие 60, Стрелы 60. Цена: 2500 золота)"; 
};
//--------------------------------------
var int DIA_Engor_RSkaufen_perm;
//--------------------------------------
func int DIA_Engor_RSkaufen_Condition ()
{
	if (other.guild == GIL_MIL)
	&& Npc_KnowsInfo (other, DIA_Engor_Ruestung)
	&& (DIA_Engor_RSkaufen_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Engor_RSkaufen_Info ()
{
	if (B_GiveInvItems (other, self, Itmi_Gold,2500))
	{
		AI_Output (other, self, "DIA_Engor_RSkaufen_15_00"); //Дай мне доспехи.
		AI_Output (self, other, "DIA_Engor_RSkaufen_13_01"); //Вот, держи, они надежно защитят тебя - это чертовски хорошие доспехи.
		B_GiveInvItems (self,other, ITAR_MIL_M,1);
		DIA_Engor_RSkaufen_perm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Engor_RSkaufen_13_02"); //Сначала принеси золото.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info HELP
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_HELP		(C_INFO)
{
	npc			 = 	VLK_4108_Engor;
	nr			 = 	3;
	condition	 = 	DIA_Engor_HELP_Condition;
	information	 = 	DIA_Engor_HELP_Info;
	description	 = 	"Может, я смогу помочь тебе в твоей работе?";
};

func int DIA_Engor_HELP_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Engor_ABOUTPARLAF)
	{
		return TRUE;
	};
};
func void DIA_Engor_HELP_Info ()
{
	AI_Output (other, self, "DIA_Engor_HELP_15_00"); //Может, я смогу помочь тебе в твоей работе?
	AI_Output (self, other, "DIA_Engor_HELP_13_01"); //Хмм... Конечно, почему нет? Мне не помешала бы помощь.
	AI_Output (other, self, "DIA_Engor_HELP_15_02"); //Так что нужно сделать?
	AI_Output (self, other, "DIA_Engor_HELP_13_03"); //Наши запасы продовольствия на исходе. Хуже всего, что у нас почти не осталось мяса.
	AI_Output (self, other, "DIA_Engor_HELP_13_04"); //Так что если сможешь раздобыть мясо, сырое или приготовленное, окорока или колбасу, я был бы очень благодарен. Ну, как? Ты поможешь нам?

	
	Info_ClearChoices (DIA_Engor_HELP);
	Info_AddChoice (DIA_Engor_HELP,"У меня нет времени на это.",DIA_Engor_HELP_NO);
	Info_AddChoice (DIA_Engor_HELP,"Не волнуйся, я принесу тебе мясо.",DIA_Engor_HELP_YES);
	
	
};
FUNC VOID DIA_Engor_HELP_NO()
{
	AI_Output (other, self, "DIA_Engor_HELP_NO_15_00"); //У меня нет времени на это.
	AI_Output (self, other, "DIA_Engor_HELP_NO_13_01"); //Тогда зачем ты тратишь мое время попусту?
	
	MIS_Engor_BringMeat = LOG_OBSOLETE; 
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Engor_HELP_YES()
{
	AI_Output (other, self, "DIA_Engor_HELP_YES_15_00"); //Не волнуйся, я принесу тебе мясо.
	AI_Output (self, other, "DIA_Engor_HELP_YES_13_01"); //Две дюжины кусков хватило бы, чтобы накормить все эти голодные рты. Возвращайся, когда у тебя будет это мясо. А мне нужно работать.

	Log_CreateTopic (TOPIC_BringMeat, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BringMeat, LOG_RUNNING);
	B_LogEntry  (TOPIC_BringMeat,"Энгору нужно две дюжины кусков мяса, чтобы накормить людей в замке.");
	B_LogEntry  (TOPIC_BringMeat,"Неважно, что это будет - колбаса, окорок, сырое или жареное мясо. Что угодно, лишь бы это можно было жевать.");  

	
	MIS_Engor_BringMeat = LOG_RUNNING;  
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info BRINGMEAT
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_BRINGMEAT		(C_INFO)
{
	npc			 = 	VLK_4108_Engor;
	nr			 = 	4;
	condition	 = 	DIA_Engor_BRINGMEAT_Condition;
	information	 = 	DIA_Engor_BRINGMEAT_Info;
	permanent	 = 	TRUE;
	description	 = 	"Вот, я принес тебе кое-что. (дать мясо).";
};

func int DIA_Engor_BRINGMEAT_Condition ()
{	
	if (MIS_Engor_BringMeat == LOG_RUNNING)
	&& (Meat_Counter < Meat_Amount)
	&&((Npc_HasItems (hero, ItFo_Bacon) 	>= 1)
	|| (Npc_HasItems (hero, ItFoMuttonRaw)  >= 1)
	|| (Npc_HasItems (hero, ItFoMutton) 	>= 1)
	|| (Npc_HasItems (hero, ItFo_Sausage) 	>= 1))
	{
		return TRUE;
	};
};
func void DIA_Engor_BRINGMEAT_Info ()
{
	var string ConcatRaw;
	var string ConcatMutton;
	var string ConcatBacon;
	var string ConcatSausage;
	
	AI_Output (other, self, "DIA_Engor_BRINGMEAT_15_00"); //Вот, я принес тебе кое-что.
	
// ***** Rohes Fleisch *****
	if (Npc_HasItems (hero,ItFoMuttonRaw) >= 1) 
	{
		if (Npc_HasItems (hero, ItFoMuttonRaw) >= Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			B_GiveInvItems (hero, self, ItFoMuttonRaw, (Meat_Amount - Meat_Counter));
		
			Meat_Counter = (Meat_Counter + (Meat_Amount - Meat_Counter));
		}
		else if (Npc_HasItems (hero, ItFoMuttonRaw) < Meat_Amount) // muss hier stehen, wegen nдchster Zeile
		&& (Meat_Counter < Meat_Amount) 
		{
			Meat_Counter = Meat_Counter + (Npc_HasItems (hero,ItFoMuttonRaw));
			
			//B_GiveInvItems (hero, self,ItFoMuttonRaw, (Npc_HasItems (hero,ItFoMuttonRaw))); 
		
			ConcatRaw = IntToString (Npc_HasItems (other,ItFoMuttonRaw));
			ConcatRaw = ConcatStrings (ConcatRaw, " Rohes Fleisch gegeben");
			 
			AI_PrintScreen (ConcatRaw, -1, 35, FONT_ScreenSmall, 2);
			Npc_RemoveInvItems (other, ItFoMuttonRaw,(Npc_HasItems (other,ItFoMuttonRaw)));
		};
	};
// ***** gebratenes Fleisch *****
	if (Npc_HasItems (hero,ItFoMutton) >= 1) 
	{
		if (Npc_HasItems (hero, ItFoMutton) >= Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			B_GiveInvItems (hero, self, ItFoMutton, (Meat_Amount - Meat_Counter));
			Meat_Counter = (Meat_Counter + (Meat_Amount - Meat_Counter));
		}
		else if (Npc_HasItems (hero, ItFoMutton) < Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			Meat_Counter = Meat_Counter + (Npc_HasItems (hero,ItFoMutton));
			
			//B_GiveInvItems (hero, self,ItFoMutton, (Npc_HasItems (hero,ItFoMutton)));
			
			ConcatMutton = IntToString (Npc_HasItems (other,ItFoMutton));
			ConcatMutton = ConcatStrings (ConcatMutton, " Gebratenes Fleisch gegeben");
			 
			AI_PrintScreen (ConcatMutton, -1, 38, FONT_ScreenSmall, 2);
			Npc_RemoveInvItems (other, ItFoMutton,(Npc_HasItems (other,ItFoMutton)));
		};
	};
// ***** Schinken *****	
	if (Npc_HasItems (hero,ItFo_Bacon) >= 1) 
	{
		if (Npc_HasItems (hero, ItFo_Bacon) >= Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			B_GiveInvItems (hero, self, ItFo_Bacon, (Meat_Amount - Meat_Counter));
			Meat_Counter = (Meat_Counter + (Meat_Amount - Meat_Counter));
		}
		else if (Npc_HasItems (hero, ItFo_Bacon) < Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			Meat_Counter = Meat_Counter + (Npc_HasItems (hero,ItFo_Bacon));
			
			//B_GiveInvItems (hero, self,ItFo_Bacon, (Npc_HasItems (hero,ItFo_Bacon)));
			
			ConcatBacon =  IntToString (Npc_HasItems (other,ItFo_Bacon));
			ConcatBacon = ConcatStrings (ConcatBacon, " Schinken gegeben");
			
			AI_PrintScreen (ConcatBacon, -1, 41, FONT_ScreenSmall, 3);
			
			Npc_RemoveInvItems (other, ItFo_Bacon,(Npc_HasItems (other,ItFo_Bacon)));
		};
	};
	// ***** Wьrste *****	
	if (Npc_HasItems (hero,ItFo_Sausage) >= 1) 
	{
		if (Npc_HasItems (hero, ItFo_Sausage) >= Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			
			B_GiveInvItems (hero, self, ItFo_Sausage, (Meat_Amount - Meat_Counter));
			Meat_Counter = (Meat_Counter + (Meat_Amount - Meat_Counter));
		}
		else if (Npc_HasItems (hero, ItFo_Sausage) < Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			Meat_Counter = Meat_Counter + (Npc_HasItems (hero,ItFo_Sausage));
		
			//B_GiveInvItems (hero, self,ItFo_Sausage, (Npc_HasItems (hero,ItFo_Sausage)));
			
			ConcatSausage =  IntToString (Npc_HasItems (other,ItFo_Sausage));
			ConcatSausage = ConcatStrings (ConcatSausage, " mal Wurst gegeben");
			
			AI_PrintScreen (ConcatSausage, -1, 44, FONT_ScreenSmall, 3);
			Npc_RemoveInvItems (other, ItFo_Sausage,(Npc_HasItems (other,ItFo_Sausage)));	
		};
	};
	// ***** Dialoge und XP *****	
	if (Meat_Amount > Meat_Counter)
	{	
		var string GesamtFleisch;
		
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_01"); //Для начала и это неплохо, но мне нужно больше.
		
		GesamtFleisch = IntToString (Meat_Counter);
		GesamtFleisch = ConcatStrings ("Insgesamt Fleisch gegeben: ",GesamtFleisch);
		
		AI_PrintScreen (GesamtFleisch, -1, 48, FONT_ScreenSmall, 3);
	};
	if (Meat_counter >= Meat_Amount)
	{
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_02"); //Отлично, ты принес достаточно мяса. Этого хватит на некоторое время.
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_03"); //Но даже не надейся, что я теперь буду давать тебе что-нибудь бесплатно!
		/*
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_04"); //Hm...
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_05"); //Na schцn. Du hast mir geholfen, du kriegst was umsonst. Ich gebe dir eine Information. 	
		*/
		MIS_Engor_BringMeat = LOG_SUCCESS;
		B_GivePlayerXP (XP_BringMeat);
		Log_AddEntry (TOPIC_BringMeat,"Энгор получил свое мясо. Он разделит его между защитниками замка."); 
	};
};

//*************************************
//*************************************
//***								***
//***			Kapitel 4			***
//***								***
//*************************************
//*************************************

///////////////////////////////////////////////////////////////////////
//	Wie laufen die Geschдfte?
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_Business		(C_INFO)
{
	npc		 	 = 	VLK_4108_Engor;
	nr		 	 = 	1;
	condition	 = 	DIA_Engor_Business_Condition;
	information	 = 	DIA_Engor_Business_Info;
	permanent	 =	FALSE;	
	description	 = 	"Как торговля?";
	
};

func int DIA_Engor_Business_Condition ()
{
	if (Kapitel >= 4)
	&& (MIS_Engor_BringMeat == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Engor_Business_Info ()
{
	AI_Output (other, self, "DIA_Engor_Business_15_00"); //Как бизнес?
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
		{
			AI_Output (self, other, "DIA_Engor_Business_13_01"); //Неважно. Я надеюсь, что хотя бы у этих охотников на драконов есть какое-нибудь золото.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Engor_Business_13_02"); //Паршиво! Паладины ничего не покупают.
		};

	AI_Output (self, other, "DIA_Engor_Business_13_03"); //А как насчет тебя? Ты хочешь что-нибудь купить?
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Engor_PICKPOCKET (C_INFO)
{
	npc			= VLK_4108_Engor;
	nr			= 900;
	condition	= DIA_Engor_PICKPOCKET_Condition;
	information	= DIA_Engor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Красть его карту рискованно)";
};                       

FUNC INT DIA_Engor_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItWr_Map_Oldworld) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Engor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Engor_PICKPOCKET);
	Info_AddChoice		(DIA_Engor_PICKPOCKET, DIALOG_BACK 		,DIA_Engor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Engor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Engor_PICKPOCKET_DoIt);
};

func void DIA_Engor_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems (self, other, ItWr_Map_Oldworld, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Engor_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Engor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Engor_PICKPOCKET);
};
