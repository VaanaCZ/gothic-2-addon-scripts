// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Sylvio_EXIT   (C_INFO)
{
	npc         = SLD_806_Sylvio;
	nr          = 999;
	condition   = DIA_Sylvio_EXIT_Condition;
	information = DIA_Sylvio_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Sylvio_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sylvio_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
instance DIA_Sylvio_Hallo		(C_INFO)
{
	npc			= SLD_806_Sylvio;
	nr		 	= 1;
	condition	= DIA_Sylvio_Hallo_Condition;
	information	= DIA_Sylvio_Hallo_Info;
	permanent	= TRUE;
	description	= "Cosa succede?";
};

func int DIA_Sylvio_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Sylvio_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Sylvio_Hallo_15_00"); //Come va?
	AI_Output (self, other, "DIA_Sylvio_Hallo_09_01"); //Ti ho dato il permesso di parlarmi?
	
	Sylvio_angequatscht = Sylvio_angequatscht + 1;
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				  Thekla 
// ************************************************************
instance DIA_Sylvio_Thekla		(C_INFO)
{
	npc		 	= SLD_806_Sylvio;
	nr		 	= 2;
	condition	= DIA_Sylvio_Thekla_Condition;
	information	= DIA_Sylvio_Thekla_Info;
	permanent 	= FALSE;
	description	= "Thekla ha qualche problema con te.";
};

func int DIA_Sylvio_Thekla_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Thekla_Problem))
	{
		return TRUE;
	};
};

func void DIA_Sylvio_Thekla_Info ()
{
	AI_Output (other, self, "DIA_Sylvio_Thekla_15_00"); //Thekla ha qualche problema con te.
	AI_Output (self, other, "DIA_Sylvio_Thekla_09_01"); //Quindi? Qual è il problema della cara signora? E perché non viene lei di persona?
	AI_Output (other, self, "DIA_Sylvio_Thekla_15_02"); //Lo sai benissimo...
	AI_Output (self, other, "DIA_Sylvio_Thekla_09_03"); //(cinicamente) Perché non vai a discuterne un po' con il mio amico Bullco?

	Sylvio_angequatscht = Sylvio_angequatscht + 1;
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Gossip 
// ************************************************************
instance DIA_Sylvio_Gossip		(C_INFO)
{
	npc			= SLD_806_Sylvio;
	nr		 	= 3;
	condition	= DIA_Sylvio_Gossip_Condition;
	information	= DIA_Sylvio_Gossip_Info;
	permanent	= FALSE;
	description	= "Molte persone parlano di te...";
};

func int DIA_Sylvio_Gossip_Condition ()
{
	return TRUE;
};

func void DIA_Sylvio_Gossip_Info ()
{
	AI_Output (other, self, "DIA_Sylvio_Gossip_15_00"); //Molte persone parlano di te...
	AI_Output (self, other, "DIA_Sylvio_Gossip_09_01"); //Molte persone parlano anche di te.
	
	Sylvio_angequatscht = Sylvio_angequatscht + 1;
	AI_StopProcessInfos (self);
};
	
// ************************************************************
// 			  				   Gossip 
// ************************************************************
instance DIA_Sylvio_AboutLee (C_INFO)
{
	npc			= SLD_806_Sylvio;
	nr		 	= 4;
	condition	= DIA_Sylvio_AboutLee_Condition;
	information	= DIA_Sylvio_AboutLee_Info;
	permanent	= FALSE;
	description	= "Cosa pensi di Lee?";
};

func int DIA_Sylvio_AboutLee_Condition ()
{
	return TRUE;
};

func void DIA_Sylvio_AboutLee_Info ()
{
	AI_Output (other, self, "DIA_Sylvio_AboutLee_15_00"); //Cosa pensi di Lee?
	AI_Output (self, other, "DIA_Sylvio_AboutLee_09_01"); //(ironicamente) Oh, è un abile guerriero. Non vorrei mai battermi con lui.
	AI_Output (self, other, "DIA_Sylvio_AboutLee_09_02"); //(freddo) A meno che, naturalmente, non possa essere altrimenti.
	
	Sylvio_angequatscht = Sylvio_angequatscht + 1;
	AI_StopProcessInfos (self);
};
	

// ************************************************************
// 			  				  MenDefeated
// ************************************************************
instance DIA_Sylvio_MenDefeated (C_INFO)
{
	npc			= SLD_806_Sylvio;
	nr		 	= 5;
	condition	= DIA_Sylvio_MenDefeated_Condition;
	information	= DIA_Sylvio_MenDefeated_Info;
	permanent	= FALSE;
	important	= TRUE;
};

func int DIA_Sylvio_MenDefeated_Condition ()
{
	var int victories;
	victories = 0;
	if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)		{	victories = victories + 1;	};
	if (Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE)	{	victories = victories + 1;	};
	if (Fester.aivar[AIV_DefeatedByPlayer] == TRUE)		{	victories = victories + 1;	};
	if (Raoul.aivar[AIV_DefeatedByPlayer] == TRUE)		{	victories = victories + 1;	};
	if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)		{	victories = victories + 1;	};
	if (MIS_Jarvis_SldKO != FALSE)
	&& (victories >= 2) 
	{
		return TRUE;
	};
};

func void DIA_Sylvio_MenDefeated_Info ()
{
	AI_Output (self, other, "DIA_Sylvio_MenDefeated_09_00"); //Mi sono accorto che ce l'hai con i miei ragazzi!
	AI_Output (self, other, "DIA_Sylvio_MenDefeated_09_01"); //E, per quanto ne so, sei uno favoriti di Lee.
	AI_Output (self, other, "DIA_Sylvio_MenDefeated_09_02"); //Ti avverto! Alcune cose stanno per cambiare qui e allora riparleremo di questo!
	
	Sylvio_MenDefeated = TRUE;
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				 Asshole
// ************************************************************
instance DIA_Sylvio_Asshole (C_INFO)
{
	npc			= SLD_806_Sylvio;
	nr		 	= 2;
	condition	= DIA_Sylvio_Asshole_Condition;
	information	= DIA_Sylvio_Asshole_Info;
	permanent	= FALSE;
	description	= "Ehi, stupido...";
};

func int DIA_Sylvio_Asshole_Condition ()
{
	if (Sylvio_angequatscht >= 1)
	{
		return TRUE;
	};
};

func void DIA_Sylvio_Asshole_Info ()
{
	AI_Output (other, self, "DIA_Sylvio_Asshole_15_00"); //Ehi, stupido...
	AI_Output (self, other, "DIA_Sylvio_Asshole_09_01"); //Non penserai che mi lasci coinvolgere in un duello con te, vero?
	AI_Output (self, other, "DIA_Sylvio_Asshole_09_02"); //Torna a strisciare sotto la tua pietra.
	
	Sylvio_angequatscht = Sylvio_angequatscht + 1;
	
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_SylvioSLD_PICKPOCKET (C_INFO)
{
	npc			= SLD_806_Sylvio;
	nr			= 900;
	condition	= DIA_SylvioSLD_PICKPOCKET_Condition;
	information	= DIA_SylvioSLD_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_SylvioSLD_PICKPOCKET_Condition()
{
	C_Beklauen (80, 210);
};
 
FUNC VOID DIA_SylvioSLD_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_SylvioSLD_PICKPOCKET);
	Info_AddChoice		(DIA_SylvioSLD_PICKPOCKET, DIALOG_BACK 		,DIA_SylvioSLD_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_SylvioSLD_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_SylvioSLD_PICKPOCKET_DoIt);
};

func void DIA_SylvioSLD_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_SylvioSLD_PICKPOCKET);
};
	
func void DIA_SylvioSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_SylvioSLD_PICKPOCKET);
};

















