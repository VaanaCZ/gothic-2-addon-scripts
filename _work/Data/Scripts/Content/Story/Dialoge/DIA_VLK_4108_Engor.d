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
	
 	AI_Output (self, other, "DIA_Engor_HALLO_13_00"); //So, du bist also der Typ, der es über den Pass geschafft hat.
	AI_Output (other, self, "DIA_Engor_HALLO_15_01"); //Ja.
	AI_Output (self, other, "DIA_Engor_HALLO_13_02"); //Schön. Ich bin Engor - der Verwalter dieser Expedition.
	AI_Output (self, other, "DIA_Engor_HALLO_13_03"); //Glaub mal ja nicht, dass du von mir irgendwas umsonst kriegst!
	AI_Output (self, other, "DIA_Engor_HALLO_13_04"); //Aber wenn du Gold in der Tasche hast - bin ich für einen kleinen Handel immer zu haben.
	
	Log_CreateTopic (TOPIC_Trader_OC, LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC, "Engor verwaltet die Vorräte der Burg und macht nebenher Geschäfte.");  
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
	description	 = 	"Zeig mir deine Ware";
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

	AI_Output			(other, self, "DIA_Engor_HANDELN_15_00"); //Zeig mir deine Ware.
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
	description	 = 	"Ich hab gehört, du teilst die Rationen ein.";
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
	AI_Output (other, self, "DIA_Engor_ABOUTPARLAF_15_00"); //Ich hab gehört, du teilst die Rationen ein.
	AI_Output (self, other, "DIA_Engor_ABOUTPARLAF_13_01"); //Das ist richtig. Wieso? Soll ich dich jetzt auch noch durchfüttern?
	AI_Output (self, other, "DIA_Engor_ABOUTPARLAF_13_02"); //Wenn du irgendwas haben willst, dann zahlst du dafür - genau wie alle anderen auch.
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
	description	 = 	"Hast du was interessantes für mich?";
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
	AI_Output (other, self, "DIA_Engor_Ruestung_15_00"); //Hast du was Interessantes für mich?
	AI_Output (self, other, "DIA_Engor_Ruestung_13_01"); //Ich kann dir eine bessere Rüstung besorgen, eine schwere Milizrüstung - wenn das für dich interessant ist.
	AI_Output (self, other, "DIA_Engor_Ruestung_13_02"); //Kostet natürlich 'ne Menge. Also besorg dir das Gold, dann kriegst du die Rüstung.
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
	description	 = 	"Schwere Milizrüstung kaufen (Schutz: Waffen 70, Pfeile 70. Kosten: 2500 Gold)"; 
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
		AI_Output (other, self, "DIA_Engor_RSkaufen_15_00"); //Gib mir die Rüstung.
		AI_Output (self, other, "DIA_Engor_RSkaufen_13_01"); //Hier bitte, sie wird dich gut schützen, ist verflucht gute Arbeit.
		B_GiveInvItems (self,other, ITAR_MIL_M,1);
		DIA_Engor_RSkaufen_perm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Engor_RSkaufen_13_02"); //Besorg dir erst das Gold.
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
	description	 = 	"Vielleicht kann ich dir bei deiner Arbeit helfen.";
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
	AI_Output (other, self, "DIA_Engor_HELP_15_00"); //Vielleicht kann ich dir bei deiner Arbeit helfen.
	AI_Output (self, other, "DIA_Engor_HELP_13_01"); //Hm ... Ja, warum nicht. Hilfe könnte ich wohl gebrauchen.
	AI_Output (other, self, "DIA_Engor_HELP_15_02"); //Also, was ist zu tun?
	AI_Output (self, other, "DIA_Engor_HELP_13_03"); //Unsere Nahrungsvorräte sind knapp. Vor allem unsere Fleischvorräte gehen zur Neige.
	AI_Output (self, other, "DIA_Engor_HELP_13_04"); //Wenn du also Fleisch besorgen kannst, roh oder gebraten, Schinken oder Würste, dann wäre uns geholfen. Wie sieht's aus, hilfst du uns?

	
	Info_ClearChoices (DIA_Engor_HELP);
	Info_AddChoice (DIA_Engor_HELP,"Dafür habe ich keine Zeit",DIA_Engor_HELP_NO);
	Info_AddChoice (DIA_Engor_HELP,"Kein Problem, ich besorge euch Fleisch",DIA_Engor_HELP_YES);
	
	
};
FUNC VOID DIA_Engor_HELP_NO()
{
	AI_Output (other, self, "DIA_Engor_HELP_NO_15_00"); //Dafür habe ich keine Zeit.
	AI_Output (self, other, "DIA_Engor_HELP_NO_13_01"); //Warum stiehlst du mir dann meine?
	
	MIS_Engor_BringMeat = LOG_OBSOLETE; 
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Engor_HELP_YES()
{
	AI_Output (other, self, "DIA_Engor_HELP_YES_15_00"); //Kein Problem, ich besorge euch Fleisch.
	AI_Output (self, other, "DIA_Engor_HELP_YES_13_01"); //Mit zwei Dutzend Fleisch könnte ich schon einige hungrige Mäuler stopfen. Komm wieder, wenn du das Fleisch hast. Ich muss nun weiterarbeiten.

	Log_CreateTopic (TOPIC_BringMeat, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BringMeat, LOG_RUNNING);
	B_LogEntry  (TOPIC_BringMeat,"Engor braucht zwei Dutzend Fleisch für die Versorgung der Männer.");
	B_LogEntry  (TOPIC_BringMeat,"Dabei spielt es keine Rolle, ob Würste, Schinken, gebratenes oder rohes Fleisch. Hauptsache, die Jungs kriegen wieder was Anständiges zwischen die Zähne ");  

	
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
	description	 = 	"Ich habe hier was für dich (Fleisch geben)";
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
	
	AI_Output (other, self, "DIA_Engor_BRINGMEAT_15_00"); //Ich habe hier was für dich.
	
// ***** Rohes Fleisch *****
	if (Npc_HasItems (hero,ItFoMuttonRaw) >= 1) 
	{
		if (Npc_HasItems (hero, ItFoMuttonRaw) >= Meat_Amount) 
		&& (Meat_Counter < Meat_Amount) 
		{
			B_GiveInvItems (hero, self, ItFoMuttonRaw, (Meat_Amount - Meat_Counter));
		
			Meat_Counter = (Meat_Counter + (Meat_Amount - Meat_Counter));
		}
		else if (Npc_HasItems (hero, ItFoMuttonRaw) < Meat_Amount) // muss hier stehen, wegen nächster Zeile
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
	// ***** Würste *****	
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
		
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_01"); //Das ist schon nicht schlecht, aber ich brauche noch mehr.
		
		GesamtFleisch = IntToString (Meat_Counter);
		GesamtFleisch = ConcatStrings ("Insgesamt Fleisch gegeben: ",GesamtFleisch);
		
		AI_PrintScreen (GesamtFleisch, -1, 48, FONT_ScreenSmall, 3);
	};
	if (Meat_counter >= Meat_Amount)
	{
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_02"); //Gut, du hast genug Fleisch gebracht. Das wird für eine Weile reichen.
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_03"); //Glaub aber ja nicht, dass du von mir jetzt irgendwas umsonst kriegst!
		/*
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_04"); //Hm...
		AI_Output (self, other, "DIA_Engor_BRINGMEAT_13_05"); //Na schön. Du hast mir geholfen, du kriegst was umsonst. Ich gebe dir eine Information. 	
		*/
		MIS_Engor_BringMeat = LOG_SUCCESS;
		B_GivePlayerXP (XP_BringMeat);
		Log_AddEntry (TOPIC_BringMeat," Engor hat das Fleisch bekommen. Er wird dafür sorgen, das es unter den Männern verteilt wird."); 
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
//	Wie laufen die Geschäfte?
///////////////////////////////////////////////////////////////////////
instance DIA_Engor_Business		(C_INFO)
{
	npc		 	 = 	VLK_4108_Engor;
	nr		 	 = 	1;
	condition	 = 	DIA_Engor_Business_Condition;
	information	 = 	DIA_Engor_Business_Info;
	permanent	 =	FALSE;	
	description	 = 	"Wie laufen die Geschäfte?";
	
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
	AI_Output (other, self, "DIA_Engor_Business_15_00"); //Wie laufen die Geschäfte?
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
		{
			AI_Output (self, other, "DIA_Engor_Business_13_01"); //Es geht! Ich hoffe, die Drachenjäger haben auch Gold und nicht nur große Worte.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Engor_Business_13_02"); //Beschissen! Die Paladine wollen einfach nichts kaufen.
		};

	AI_Output (self, other, "DIA_Engor_Business_13_03"); //Wie steht's mit dir, brauchst du noch irgendwas?
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
	description = "(Es wäre gewagt seine Karte zu stehlen)";
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
