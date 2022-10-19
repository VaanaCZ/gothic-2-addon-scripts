
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Sengrath_EXIT(C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 999;
	condition	= DIA_Sengrath_EXIT_Condition;
	information	= DIA_Sengrath_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Sengrath_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Sengrath_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			Hallo
// ************************************************************
INSTANCE DIA_Sengrath_Hello (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 2;
	condition	= DIA_Sengrath_Hello_Condition;
	information	= DIA_Sengrath_Hello_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_Sengrath_Hello_Condition()
{
	return TRUE;
};	 
FUNC VOID DIA_Sengrath_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Sengrath_Hello_03_00"); //Ich hab's gewusst! Ich wusste, einer wird es schaffen!
	AI_Output (self ,other,"DIA_Sengrath_Hello_03_01"); //Bist du über den Pass gekommen? Dann hat unser Bote es geschafft und ist durchgekommen?
	AI_Output (other ,self,"DIA_Sengrath_Hello_15_02"); //Nein, euer Bote hat es nicht über den Pass geschafft. Ich komme im Auftrag von Lord Hagen.
	AI_Output (self ,other,"DIA_Sengrath_Hello_03_03"); //(knurrt) Verfluchte Orks ...
	AI_Output (self ,other,"DIA_Sengrath_Hello_03_04"); //Nun, Kommandant Garond wird sicher mit dir sprechen wollen. Du findest ihn im großen Haus, das von zwei Rittern bewacht wird.
};
// ************************************************************
// 			  	Equipment 
// ************************************************************
INSTANCE DIA_Sengrath_Equipment (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 2;
	condition	= DIA_Sengrath_Equipment_Condition;
	information	= DIA_Sengrath_Equipment_Info;
	permanent	= FALSE;
	description = "Wo gibt's hier Ausrüstung?";
};                       

FUNC INT DIA_Sengrath_Equipment_Condition()
{
	return TRUE;
};	 
FUNC VOID DIA_Sengrath_Equipment_Info()
{	
	AI_Output (other ,self,"DIA_Sengrath_Equipment_15_00"); //Wo gibt's hier Ausrüstung?
	AI_Output (self ,other,"DIA_Sengrath_Equipment_03_01"); //Tandor gibt die Waffen raus. Für alles andere ist Engor, der Verwalter, zuständig.
	AI_Output (other ,self,"DIA_Sengrath_Equipment_15_02"); //Was ist mit magischem Bedarf?
	AI_Output (self ,other,"DIA_Sengrath_Equipment_03_03"); //Wir sind mit Spruchrollen ausgestattet worden. Wenn du welche haben willst, lass es mich wissen.
	
	Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry (TOPIC_Trader_OC,"Sengrath verkauft Spruchrollen in der Burg.");
};
// ************************************************************
// 			  	Lehrer
// ************************************************************
INSTANCE DIA_Sengrath_Perm (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 2;
	condition	= DIA_Sengrath_Perm_Condition;
	information	= DIA_Sengrath_Perm_Info;
	permanent	= FALSE;
	description = "Wer kann mir hier was beibringen? ";
};                       

FUNC INT DIA_Sengrath_Perm_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Sengrath_Perm_Info()
{	
	AI_Output (other ,self,"DIA_Sengrath_Perm_15_00"); //Wer kann mir hier was beibringen?
	
	if (other.guild == GIL_KDF)
	&& (Kapitel == 2)
	{
		AI_Output (self ,other,"DIA_Sengrath_Perm_03_01"); //Sprich mal mit Milten - er ist der einzige Magier hier.
	}
	else
	{
		AI_Output (self ,other,"DIA_Sengrath_Perm_03_02"); //Frag mal Keroloth. Er trainiert die Jungs im Schwertkampf. Vielleicht unterrichtet er dich ja auch.
		
		Log_CreateTopic (TOPIC_Teacher_OC,LOG_NOTE);
		B_LogEntry (TOPIC_Teacher_OC,"Keroloth trainiert Schwertkampf in der Burg.");
	};
};
// ************************************************************
// 			Scrolls
// ************************************************************
INSTANCE DIA_Sengrath_Scrolls (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 9;
	condition	= DIA_Sengrath_Scrolls_Condition;
	information	= DIA_Sengrath_Scrolls_Info;
	permanent	= TRUE;
	trade		= TRUE;
	description = "Zeig mir deine Spruchrollen.";

};                       

FUNC INT DIA_Sengrath_Scrolls_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Sengrath_Equipment)
	{
		return TRUE;
	};	 
};
FUNC VOID DIA_Sengrath_Scrolls_Info()
{	
	B_GiveTradeInv (self);
	AI_Output (other ,self,"DIA_Sengrath_Scrolls_15_00"); //Zeig mir deine Spruchrollen.
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sengrath_PICKPOCKET (C_INFO)
{
	npc			= PAL_267_Sengrath;
	nr			= 900;
	condition	= DIA_Sengrath_PICKPOCKET_Condition;
	information	= DIA_Sengrath_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Sengrath_PICKPOCKET_Condition()
{
	C_Beklauen (32, 35);
};
 
FUNC VOID DIA_Sengrath_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sengrath_PICKPOCKET);
	Info_AddChoice		(DIA_Sengrath_PICKPOCKET, DIALOG_BACK 		,DIA_Sengrath_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sengrath_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sengrath_PICKPOCKET_DoIt);
};

func void DIA_Sengrath_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sengrath_PICKPOCKET);
};
	
func void DIA_Sengrath_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sengrath_PICKPOCKET);
};



