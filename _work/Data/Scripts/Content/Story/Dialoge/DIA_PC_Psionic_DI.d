// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lester_DI_EXIT(C_INFO)
{
	npc			= PC_Psionic_DI;
	nr			= 999;
	condition	= DIA_Lester_DI_EXIT_Condition;
	information	= DIA_Lester_DI_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};   
                    
FUNC INT DIA_Lester_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Lester_DI_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
INSTANCE DIA_Lester_DI_Hello (C_INFO)
{
	npc			= PC_Psionic_DI;
	nr			= 1;
	condition	= DIA_Lester_DI_Hello_Condition;
	information	= DIA_Lester_DI_Hello_Info;
	permanent	 = 	TRUE;

	description = "Nechtęl bys mi nęco âíct?";
};    
                   
FUNC INT DIA_Lester_DI_Hello_Condition()
{	
	if (Npc_IsDead(UndeadDragon)  == FALSE)
	{
		return TRUE;
	};
};
var int DIA_Lester_DI_SCGotWarning1;
var int DIA_Lester_DI_SCGotWarning2;
FUNC VOID DIA_Lester_DI_Hello_Info()
{	
	AI_Output	(other ,self,"DIA_Lester_DI_Hello_15_00");	//Nechtęl bys mi nęco âíct?

	if (Npc_IsDead(Mario_DI) == FALSE)
	&& (ORkSturmDI  == TRUE)
	&& (DIA_Lester_DI_SCGotWarning1 == FALSE)
	{
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_01");	//Když skâeti zaútočili, Mario utekl. I když tady na lodi byl zmatek, neztratil jsem ho z očí.
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_02");	//Jednoduše prošel skrz skâetí linie - a skâeti se ho ani nedotkli.
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_03");	//Moc se mi ten parchant nelíbil už od samého začátku. Je ve spolku s nepâítelem.
		B_GivePlayerXP (XP_Ambient);
		DIA_Lester_DI_SCGotWarning1 = TRUE;
	}
	else if (Npc_IsDead(Mario_DI) == FALSE)
	&& (DIA_Lester_DI_SCGotWarning2 == FALSE)
	{
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_04");	//Ten divný chlapík, co si âíká Mario, se mi nelíbí. Má zlou auru.
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_05");	//Dávej si pozor, pâíteli.
		DIA_Lester_DI_SCGotWarning2 = TRUE;
	}
	else
	{
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_06");	//Teë ne. Možná pozdęji.
	};
};

// ************************************************************
// 			  				   MarioArsch 
// ************************************************************
INSTANCE DIA_Lester_DI_MarioArsch (C_INFO)
{
	npc			= PC_Psionic_DI;
	nr			= 2;
	condition	= DIA_Lester_DI_MarioArsch_Condition;
	information	= DIA_Lester_DI_MarioArsch_Info;

	description = "Męl jsi pravdu. Mario nás zradil.";
};    
                   
FUNC INT DIA_Lester_DI_MarioArsch_Condition()
{	
	if ((DIA_Lester_DI_SCGotWarning2 == TRUE) || (DIA_Lester_DI_SCGotWarning2 == TRUE))
	&& (MIS_Mario_Ambush == LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lester_DI_MarioArsch_Info()
{	
	AI_Output	(other ,self,"DIA_Lester_DI_MarioArsch_15_00");	//Męl jsi pravdu. Mario nás zradil.
	AI_Output	(self ,other,"DIA_Lester_DI_MarioArsch_13_01");	//Ano. Možná nejsem zrovna nejbystâejší, ale tohle mi bylo jasné.
	AI_Output	(self ,other,"DIA_Lester_DI_MarioArsch_13_02");	//Pâíštę buë pâi vybírání společníků opatrnęjší.
	B_GivePlayerXP (XP_Ambient);
};

// ************************************************************
// 	  	  UndeadDragonDead
// ************************************************************

INSTANCE DIA_PC_Lester_DI_UndeadDragonDead (C_INFO)
{
	npc			= PC_Psionic_DI;
	nr			= 5;
	condition	= DIA_PC_Lester_DI_UndeadDragonDead_Condition;
	information	= DIA_PC_Lester_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;

	description = "Už se tady moc dlouho nezdržíme.";
};                       
FUNC INT DIA_PC_Lester_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_PC_Lester_DI_UndeadDragonDead_OneTime;
FUNC VOID DIA_PC_Lester_DI_UndeadDragonDead_Info()
{	
	AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_00"); //Už se tady moc dlouho nezdržíme.

	if (DIA_PC_Lester_DI_UndeadDragonDead_OneTime == FALSE )
	{
		if ((Npc_GetDistToWP(self,"DI_DRACONIANAREA_19")<4000) )
			{
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_01"); //Zdá se, že ta bolest hlavy nadobro zmizela.
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_02"); //Jak jsi to udęlal?
				AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_03"); //Zničil jsem nepâítele.
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_04"); //Muselo to být opravdu nęco hodnę mocného. Co to pâesnę bylo?
				AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_05"); //Nemrtvý drak.
			};
	
		if (SC_KnowsMadPsi == TRUE)
			{
				AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_06"); //Tvoji bývalí pâátelé z tábora v bažinách mi dali docela zabrat.
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_07"); //Ano. Víra hory pâenáší. Tak to bylo vždycky. Bohužel sloužili špatnému bohu.
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_08"); //Budu potâebovat víc času, než se pâes to dokážu úplnę pâenést.
			};
		DIA_PC_Lester_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_09"); //Doufejme, že se už nikdy nic takového nestane. Na celém svętę není dost trávy, kolik bych jí chtęl teë vykouâit.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Začít");		
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Psionic_DI_PICKPOCKET (C_INFO)
{
	npc			= PC_Psionic_DI;
	nr			= 900;
	condition	= DIA_Psionic_DI_PICKPOCKET_Condition;
	information	= DIA_Psionic_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Psionic_DI_PICKPOCKET_Condition()
{
	C_Beklauen (56, 25);
};
 
FUNC VOID DIA_Psionic_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Psionic_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Psionic_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Psionic_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Psionic_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Psionic_DI_PICKPOCKET_DoIt);
};

func void DIA_Psionic_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Psionic_DI_PICKPOCKET);
};
	
func void DIA_Psionic_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Psionic_DI_PICKPOCKET);
};


