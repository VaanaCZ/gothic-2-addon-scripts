// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Larius_EXIT(C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 999;
	condition	= DIA_Larius_EXIT_Condition;
	information	= DIA_Larius_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Larius_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Larius_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Larius_Hello(C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 1;
	condition	= DIA_Larius_Hello_Condition;
	information	= DIA_Larius_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Larius_Hello_Condition()
{
	if (Npc_IsInState (self ,ZS_Talk))
	{ 
		return TRUE;
	};	
};

FUNC VOID DIA_Larius_Hello_Info()
{	
	AI_Output (self,other,"DIA_Larius_Hello_01_00"); //¿Qué se te ha perdido aquí? Si quieres algo, pide una cita.

};

// ************************************************************
// 			  		Wer bist du		    
// ************************************************************

INSTANCE DIA_Larius_WhoAreYou(C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 2;
	condition	= DIA_Larius_WhoAreYou_Condition;
	information	= DIA_Larius_WhoAreYou_Info;
	permanent	= FALSE;
	description	= "¿Quién eres tú?";
};                       

FUNC INT DIA_Larius_WhoAreYou_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Larius_WhoAreYou_Info()
{	
	AI_Output (other,self ,"DIA_Larius_WhoAreYou_15_00"); //¿Quién eres tú?
	AI_Output (self ,other,"DIA_Larius_WhoAreYou_01_01"); //Soy Larius, el gobernador local.
	AI_Output (self ,other,"DIA_Larius_WhoAreYou_01_02"); //Aunque en este momento no lo parezca, soy el hombre más poderoso de la ciudad.
	AI_Output (other,self ,"DIA_Larius_WhoAreYou_15_03"); //Así que ¿tú estás al mando aquí?
	AI_Output (self ,other,"DIA_Larius_WhoAreYou_01_04"); //Bueno... en este momento, mis manos están atadas.
	AI_Output (self ,other,"DIA_Larius_WhoAreYou_01_05"); //Ese lord Hagen está al mando aquí, al menos, mientras esté en la ciudad.
		
};

// ************************************************************
// 			  		Disturb		    
// ************************************************************

INSTANCE DIA_Larius_Disturb(C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 3;
	condition	= DIA_Larius_Disturb_Condition;
	information	= DIA_Larius_Disturb_Info;
	permanent	= TRUE;
	description	= "No quería entrometerme.";
};                       

FUNC INT DIA_Larius_Disturb_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Larius_Disturb_Info()
{	
	AI_Output (other,self ,"DIA_Larius_Disturb_15_00"); //No quería entrometerme.
	AI_Output (self ,other,"DIA_Larius_Disturb_01_01"); //Pues has fallado completamente. Así que ¡lárgate!
};

// ************************************************************
// 			  		Wie siehts aus?	    
// ************************************************************

INSTANCE DIA_Larius_DieLage(C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 2;
	condition	= DIA_Larius_DieLage_Condition;
	information	= DIA_Larius_DieLage_Info;
	permanent	= TRUE;
	description	= "¿Qué pasa?";
};                       

FUNC INT DIA_Larius_DieLage_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Larius_DieLage_Info()
{	
	AI_Output (other,self ,"DIA_Larius_DieLage_15_00"); //¿Cómo va todo?
	AI_Output (self ,other,"DIA_Larius_DieLage_01_01"); //¿Y a ti qué te importa? Mientras los paladines estén en la ciudad, Lord Hagen se ocupará de todos los problemas que le conciernen.
};


// ************************************************************
// 		Richterueberfall    
// ************************************************************

INSTANCE DIA_Larius_Richterueberfall(C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 2;
	condition	= DIA_Larius_Richterueberfall_Condition;
	information	= DIA_Larius_Richterueberfall_Info;

	description	= "El juez contrató a varios matones para asaltarte.";
};                       

FUNC INT DIA_Larius_Richterueberfall_Condition()
{
	if (SCKnowsRichterKomproBrief == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Larius_Richterueberfall_Info()
{	
	AI_Output (other,self ,"DIA_Larius_Richterueberfall_15_00"); //El juez contrató a varios matones para asaltarte. Puedo demostrarlo.
	AI_Output (self ,other,"DIA_Larius_Richterueberfall_01_01"); //No digas bobadas, ¿o quieres que te encadene?
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output (self ,other,"DIA_Larius_Richterueberfall_01_02"); //Aunque seas un guerrero de Innos...
		};
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Larius_Richterueberfall_01_03"); //Aunque seas un mago ordenado...
		};
	AI_Output (self ,other,"DIA_Larius_Richterueberfall_01_04"); //Mi palabra sigue pesando en esta ciudad. ¡No te atrevas a ensuciar el honorable nombre del juez nunca más!
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Larius_PICKPOCKET (C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 900;
	condition	= DIA_Larius_PICKPOCKET_Condition;
	information	= DIA_Larius_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Larius_PICKPOCKET_Condition()
{
	C_Beklauen (35, 120);
};
 
FUNC VOID DIA_Larius_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Larius_PICKPOCKET);
	Info_AddChoice		(DIA_Larius_PICKPOCKET, DIALOG_BACK 		,DIA_Larius_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Larius_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Larius_PICKPOCKET_DoIt);
};

func void DIA_Larius_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Larius_PICKPOCKET);
};
	
func void DIA_Larius_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Larius_PICKPOCKET);
};


