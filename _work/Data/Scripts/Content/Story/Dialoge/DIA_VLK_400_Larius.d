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
	AI_Output (self,other,"DIA_Larius_Hello_01_00"); //Czego chcesz? Jeśli masz jakąś sprawę, musisz się najpierw umówić.

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
	description	= "Kim jesteś?";
};                       

FUNC INT DIA_Larius_WhoAreYou_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Larius_WhoAreYou_Info()
{	
	AI_Output (other,self ,"DIA_Larius_WhoAreYou_15_00"); //Kim jesteś?
	AI_Output (self ,other,"DIA_Larius_WhoAreYou_01_01"); //Jestem Larius, miejscowy gubernator.
	AI_Output (self ,other,"DIA_Larius_WhoAreYou_01_02"); //Chociaż w tym momencie może trudno w to uwierzyć, jestem najbardziej wpływowym człowiekiem w tym mieście.
	AI_Output (other,self ,"DIA_Larius_WhoAreYou_15_03"); //A więc ty tutaj rządzisz?
	AI_Output (self ,other,"DIA_Larius_WhoAreYou_01_04"); //Ja... No cóż... w chwili obecnej mam związane ręce.
	AI_Output (self ,other,"DIA_Larius_WhoAreYou_01_05"); //Dopóki Lord Hagen nie opuści miasta, to on sprawuje władzę.
		
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
	description	= "Nie chciałem przeszkadzać.";
};                       

FUNC INT DIA_Larius_Disturb_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Larius_Disturb_Info()
{	
	AI_Output (other,self ,"DIA_Larius_Disturb_15_00"); //Nie chciałem przeszkadzać.
	AI_Output (self ,other,"DIA_Larius_Disturb_01_01"); //A jednak przeszkadzasz. Wynoś się stąd!
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
	description	= "Co słychać?";
};                       

FUNC INT DIA_Larius_DieLage_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Larius_DieLage_Info()
{	
	AI_Output (other,self ,"DIA_Larius_DieLage_15_00"); //Jak leci?
	AI_Output (self ,other,"DIA_Larius_DieLage_01_01"); //A co cię to obchodzi? Dopóki w mieście przebywają paladyni, Lord Hagen sprawuje tu władzę.
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

	description	= "Sędzia wynajął kilku opryszków, żeby cię uciszyli.";
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
	AI_Output (other,self ,"DIA_Larius_Richterueberfall_15_00"); //Sędzia wynajął kilku opryszków, żeby cię uciszyli. Mogę to udowodnić.
	AI_Output (self ,other,"DIA_Larius_Richterueberfall_01_01"); //Nie opowiadaj takich bzdur, chcesz skończyć w areszcie?
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output (self ,other,"DIA_Larius_Richterueberfall_01_02"); //Nawet jeśli jesteś wojownikiem Innosa...
		};
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Larius_Richterueberfall_01_03"); //Nawet jeśli jesteś szanowanym magiem...
		};
	AI_Output (self ,other,"DIA_Larius_Richterueberfall_01_04"); //Moje słowo wciąż coś znaczy w tym mieście. Ostrzegam cię, nie zamierzam słuchać, jak bezczelnie szkalujesz dobre imię sędziego!
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


