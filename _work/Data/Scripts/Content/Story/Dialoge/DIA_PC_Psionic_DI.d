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

	description = "Jest co�, o czym powinienem wiedzie�?";
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
	AI_Output	(other ,self,"DIA_Lester_DI_Hello_15_00");	//Jest co�, o czym powinienem wiedzie�?

	if (Npc_IsDead(Mario_DI) == FALSE)
	&& (ORkSturmDI  == TRUE)
	&& (DIA_Lester_DI_SCGotWarning1 == FALSE)
	{
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_01");	//Mario wymkn�� si� ze statku podczas ataku ork�w. Mia�em na niego oko mimo ca�ego tego zamieszania.
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_02");	//Przemaszerowa� sobie przez lini� ork�w i nikt go nie zatrzymywa�.
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_03");	//Od samego pocz�tku co� mi si� w nim nie podoba�o. To szpieg!
		B_GivePlayerXP (XP_Ambient);
		DIA_Lester_DI_SCGotWarning1 = TRUE;
	}
	else if (Npc_IsDead(Mario_DI) == FALSE)
	&& (DIA_Lester_DI_SCGotWarning2 == FALSE)
	{
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_04");	//Co� mi si� nie podoba w tym ca�ym Mario. Facet roztacza wok� siebie jak�� dziwn� aur�.
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_05");	//Uwa�aj na siebie, przyjacielu.
		DIA_Lester_DI_SCGotWarning2 = TRUE;
	}
	else
	{
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_06");	//Nie teraz. Mo�e p�niej.
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

	description = "Mia�e� racj�. Mario nas zdradzi�!";
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
	AI_Output	(other ,self,"DIA_Lester_DI_MarioArsch_15_00");	//Mia�e� racj�. Mario nas zdradzi�!
	AI_Output	(self ,other,"DIA_Lester_DI_MarioArsch_13_01");	//A widzisz? Mo�e i nie jestem zbyt bystry, ale co do tego nie mia�em �adnych w�tpliwo�ci.
	AI_Output	(self ,other,"DIA_Lester_DI_MarioArsch_13_02");	//Na przysz�o�� staraj si� lepiej dobiera� towarzyszy podr�y.
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

	description = "D�ugo tu ju� nie zabawimy.";
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
	AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_00"); //D�ugo tu ju� nie zabawimy.

	if (DIA_PC_Lester_DI_UndeadDragonDead_OneTime == FALSE )
	{
		if ((Npc_GetDistToWP(self,"DI_DRACONIANAREA_19")<4000) )
			{
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_01"); //M�j b�l g�owy nagle ust�pi�!
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_02"); //Jak to zrobi�e�?
				AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_03"); //Pokona�em nieprzyjaciela.
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_04"); //To musia�o by� co� naprawd� pot�nego. Co dok�adnie?
				AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_05"); //Smok-o�ywieniec.
			};
	
		if (SC_KnowsMadPsi == TRUE)
			{
				AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_06"); //Twoi dawni kompani z obozu na bagnie dali mi nie�le popali�.
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_07"); //Tak. Wiara czyni cuda. Zawsze tak by�o. Szkoda tylko, �e s�u�yli z�emu.
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_08"); //Sporo czasu minie, nim si� z tego otrz�sn�.
			};
		DIA_PC_Lester_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_09"); //Mam nadziej�, �e co� takiego ju� nigdy si� nie powt�rzy. Na ca�ym �wiecie nie ma tyle ziela, ile mam teraz ochot� wypali�!
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


