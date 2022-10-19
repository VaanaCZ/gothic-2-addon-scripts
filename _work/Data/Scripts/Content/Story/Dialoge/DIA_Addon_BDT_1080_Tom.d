//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_EXIT   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 999;
	condition   = DIA_Addon_Tom_EXIT_Condition;
	information = DIA_Addon_Tom_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Tom_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Tom_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Tom_PICKPOCKET (C_INFO)
{
	npc			= BDT_1080_Addon_Tom;
	nr			= 900;
	condition	= DIA_Addon_Tom_PICKPOCKET_Condition;
	information	= DIA_Addon_Tom_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Tom_PICKPOCKET_Condition()
{
	C_Beklauen (40, 52);
};
 
FUNC VOID DIA_Addon_Tom_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Tom_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Tom_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Tom_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Tom_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Tom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Tom_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Tom_PICKPOCKET);
};
	
func void DIA_Addon_Tom_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Tom_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_HI   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 1;
	condition   = DIA_Addon_Tom_HI_Condition;
	information = DIA_Addon_Tom_HI_Info;
	permanent   = FALSE;
	description = "Warum sitzt du hier rum?";
};
FUNC INT DIA_Addon_Tom_HI_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Tom_HI_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_00"); //Warum sitzt du hier rum?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_01"); //Ich habe Ärger am Hals. Momentan ist es gesünder, wenn ich mich nicht mehr im Lager blicken lasse.
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_02"); //Was ist los?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_03"); //Ich hatte ziemlich gute Beziehungen zu einigen der Piraten, verstehst du?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_04"); //Hab' mich mit den Jungs immer vor ihrem Lager getroffen und gehandelt.
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_05"); //Mann! Ich hab' für das halbe Lager eingekauft. 'Tom bring mir dies - Tom, bring mir das'.
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_06"); //Und dann haut dieser Mistkerl Esteban dazwischen!
};
//---------------------------------------------------------------------
//	Info Juan
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Juan   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 2;
	condition   = DIA_Addon_Tom_Juan_Condition;
	information = DIA_Addon_Tom_Juan_Info;
	permanent   = FALSE;
	description = "Was ist passiert?";
};
FUNC INT DIA_Addon_Tom_Juan_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Tom_HI)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Juan_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Juan_15_00"); //Was ist passiert?
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_01"); //Esteban hat Juan geschickt - einen von seinen Jungs. Der Mistkerl hat uns aufgelauert.
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_02"); //Ich war gerade dabei, mit den Piraten den Deal zu machen, da kam er aus dem Dunkeln und hat sie mit zwei Schlägen niedergemacht!
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_03"); //Mann, der Typ ist schnell! Aber nicht schnell genug. Ich konnte ihm entwischen.
	SC_Knows_JuanMurderedAngus = TRUE;
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Also Juan ist für den Mord an Hank und Angus verantwortlich. Er hat den beiden aufgelauert und sie dann getötet.");
};

//---------------------------------------------------------------------
//	Info Esteban
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Esteban   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 3;
	condition   = DIA_Addon_Tom_Esteban_Condition;
	information = DIA_Addon_Tom_Esteban_Info;
	permanent   = FALSE;
	description = "Und seit dem Überfall versteckst du dich hier?";
};
FUNC INT DIA_Addon_Tom_Esteban_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Tom_Juan)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Esteban_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Esteban_15_00"); //Und seit dem Überfall versteckst du dich hier?
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_01"); //Ich bin zuerst zurück ins Lager und hab' Fisk, Huno und den anderen Bescheid gesagt, dass sie ihre Lieferung vergessen können.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_02"); //Und dass Esteban hinter der Sache steckt.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_03"); //Wenn Esteban rausfindet, dass ich den anderen gesagt habe, dass ER für die Sache verantwortlich ist, bin ich tot.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_04"); //Deswegen geh ich nicht zurück in's Lager.
	
	Tom_tells = TRUE;
};

//---------------------------------------------------------------------
//	Info Dead
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Dead   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 4;
	condition   = DIA_Addon_Tom_Dead_Condition;
	information = DIA_Addon_Tom_Dead_Info;
	permanent   = FALSE;
	description = "Esteban ist tot.";
};
FUNC INT DIA_Addon_Tom_Dead_Condition()
{	
	if (Npc_IsDead (Esteban))
	&& (Npc_KnowsInfo (other,DIA_Addon_Tom_Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Dead_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_00"); //Esteban ist tot.
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_01"); //Echt? Mann, DAS nenn ich Glück!
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_02"); //Wer hat das getan?
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_03"); //(verschmitzt) Sagen wir einfach, jemand, den du kennst ...
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_04"); //Danke, dass du zu mir gekommen bist. Jetzt kann ich wieder in's Lager ...
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"LAGER");
};

//---------------------------------------------------------------------
// PERM
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_PERM   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 5;
	condition   = DIA_Addon_Tom_PERM_Condition;
	information = DIA_Addon_Tom_PERM_Info;
	permanent   = TRUE;
	description = "Und sonst?";
};
FUNC INT DIA_Addon_Tom_PERM_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Tom_Esteban))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_PERM_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_PERM_15_00"); //Und sonst?

	if (Npc_GetDistToWP (self,"BL_INN_05_B") <= 500)
	{
		AI_Output (self,other,"DIA_Addon_Tom_PERM_11_01"); //Jetzt kann ich wieder ganz in Ruhe Lucias Schnaps trinken.
	}
	else
	{	
		if (Npc_KnowsInfo (other, DIA_Addon_Tom_Dead))
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_02"); //Jetzt kann ich mich endlich wieder im Lager blicken lassen!
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_03"); //Sonst? Sonst sitz ich hier rum und zähle Steine ...
		};
	};
};




