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

	description = "Jest coœ, o czym powinienem wiedzieæ?";
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
	AI_Output	(other ,self,"DIA_Lester_DI_Hello_15_00");	//Jest coœ, o czym powinienem wiedzieæ?

	if (Npc_IsDead(Mario_DI) == FALSE)
	&& (ORkSturmDI  == TRUE)
	&& (DIA_Lester_DI_SCGotWarning1 == FALSE)
	{
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_01");	//Mario wymkn¹³ siê ze statku podczas ataku orków. Mia³em na niego oko mimo ca³ego tego zamieszania.
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_02");	//Przemaszerowa³ sobie przez liniê orków i nikt go nie zatrzymywa³.
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_03");	//Od samego pocz¹tku coœ mi siê w nim nie podoba³o. To szpieg!
		B_GivePlayerXP (XP_Ambient);
		DIA_Lester_DI_SCGotWarning1 = TRUE;
	}
	else if (Npc_IsDead(Mario_DI) == FALSE)
	&& (DIA_Lester_DI_SCGotWarning2 == FALSE)
	{
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_04");	//Coœ mi siê nie podoba w tym ca³ym Mario. Facet roztacza wokó³ siebie jak¹œ dziwn¹ aurê.
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_05");	//Uwa¿aj na siebie, przyjacielu.
		DIA_Lester_DI_SCGotWarning2 = TRUE;
	}
	else
	{
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_06");	//Nie teraz. Mo¿e póŸniej.
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

	description = "Mia³eœ racjê. Mario nas zdradzi³!";
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
	AI_Output	(other ,self,"DIA_Lester_DI_MarioArsch_15_00");	//Mia³eœ racjê. Mario nas zdradzi³!
	AI_Output	(self ,other,"DIA_Lester_DI_MarioArsch_13_01");	//A widzisz? Mo¿e i nie jestem zbyt bystry, ale co do tego nie mia³em ¿adnych w¹tpliwoœci.
	AI_Output	(self ,other,"DIA_Lester_DI_MarioArsch_13_02");	//Na przysz³oœæ staraj siê lepiej dobieraæ towarzyszy podró¿y.
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

	description = "D³ugo tu ju¿ nie zabawimy.";
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
	AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_00"); //D³ugo tu ju¿ nie zabawimy.

	if (DIA_PC_Lester_DI_UndeadDragonDead_OneTime == FALSE )
	{
		if ((Npc_GetDistToWP(self,"DI_DRACONIANAREA_19")<4000) )
			{
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_01"); //Mój ból g³owy nagle ust¹pi³!
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_02"); //Jak to zrobi³eœ?
				AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_03"); //Pokona³em nieprzyjaciela.
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_04"); //To musia³o byæ coœ naprawdê potê¿nego. Co dok³adnie?
				AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_05"); //Smok-o¿ywieniec.
			};
	
		if (SC_KnowsMadPsi == TRUE)
			{
				AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_06"); //Twoi dawni kompani z obozu na bagnie dali mi nieŸle popaliæ.
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_07"); //Tak. Wiara czyni cuda. Zawsze tak by³o. Szkoda tylko, ¿e s³u¿yli z³emu.
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_08"); //Sporo czasu minie, nim siê z tego otrz¹snê.
			};
		DIA_PC_Lester_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_09"); //Mam nadziejê, ¿e coœ takiego ju¿ nigdy siê nie powtórzy. Na ca³ym œwiecie nie ma tyle ziela, ile mam teraz ochotê wypaliæ!
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");		
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


