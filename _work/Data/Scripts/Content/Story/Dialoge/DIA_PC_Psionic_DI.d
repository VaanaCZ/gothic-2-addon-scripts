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

	description = "Devi dirmi qualcosa?";
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
	AI_Output	(other ,self,"DIA_Lester_DI_Hello_15_00");	//Devi dirmi qualcosa?

	if (Npc_IsDead(Mario_DI) == FALSE)
	&& (ORkSturmDI  == TRUE)
	&& (DIA_Lester_DI_SCGotWarning1 == FALSE)
	{
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_01");	//Mario se l'è svignata quanto gli orchi hanno attaccato. Nonostante la confusione sulla nave sono riuscito a tenerlo d'occhio.
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_02");	//Si è diretto proprio verso le fila degli orchi, e gli orchi non l'hanno nemmeno toccato.
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_03");	//Ho sospettato di quel bastardo fin dall'inizio. È in combutta con il nemico.
		B_GivePlayerXP (XP_Ambient);
		DIA_Lester_DI_SCGotWarning1 = TRUE;
	}
	else if (Npc_IsDead(Mario_DI) == FALSE)
	&& (DIA_Lester_DI_SCGotWarning2 == FALSE)
	{
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_04");	//Quello strano tizio di nome Mario non mi piace. Ha un'aria malvagia.
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_05");	//Guardati le spalle, amico mio.
		DIA_Lester_DI_SCGotWarning2 = TRUE;
	}
	else
	{
		AI_Output	(self ,other,"DIA_Lester_DI_Hello_13_06");	//Non adesso. Magari piùì tardi.
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

	description = "Avevi ragione. Mario ci ha traditi.";
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
	AI_Output	(other ,self,"DIA_Lester_DI_MarioArsch_15_00");	//Avevi ragione. Mario ci ha traditi.
	AI_Output	(self ,other,"DIA_Lester_DI_MarioArsch_13_01");	//Sì. Forse di solito non sono molto percettivo, ma questa volta mi è sembrato chiaro.
	AI_Output	(self ,other,"DIA_Lester_DI_MarioArsch_13_02");	//In futuro stai più attento quando scegli i tuoi compagni.
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

	description = "Non saremo qui ancora per molto.";
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
	AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_00"); //Non saremo qui ancora per molto.

	if (DIA_PC_Lester_DI_UndeadDragonDead_OneTime == FALSE )
	{
		if ((Npc_GetDistToWP(self,"DI_DRACONIANAREA_19")<4000) )
			{
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_01"); //È come se il mio mal di testa fosse improvvisamente scomparso.
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_02"); //Come hai fatto?
				AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_03"); //Ho distrutto il nemico.
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_04"); //Dev'essere stato qualcosa di estremamente potente. Cos'era esattamente, dunque?
				AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_05"); //Un drago non morto.
			};
	
		if (SC_KnowsMadPsi == TRUE)
			{
				AI_Output (other,self ,"DIA_PC_Lester_DI_UndeadDragonDead_15_06"); //I tuoi vecchi amici di Campo Palude mi hanno reso la vita difficile.
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_07"); //Già. La fede può smuovere le montagne. È sempre stato così. Sfortunatamente essi servivano la divinità sbagliata.
				AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_08"); //Mi servirà del tempo prima di poter superare tutto questo.
			};
		DIA_PC_Lester_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output (self ,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_09"); //Spero che non accadrà mai più niente del genere. Non c'è abbastanza erba di palude nel mondo per quello che vorrei fumare in questo momento.
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


