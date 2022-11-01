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
	description	= "Qu'y a-t-il?";
};

func int DIA_Sylvio_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Sylvio_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Sylvio_Hallo_15_00"); //Comment ça se passe ?
	AI_Output (self, other, "DIA_Sylvio_Hallo_09_01"); //Je vous ai donné l'autorisation de m'adresser la parole ?
	
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
	description	= "Thékla a un problème avec vous.";
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
	AI_Output (other, self, "DIA_Sylvio_Thekla_15_00"); //Thékla a un problème avec vous.
	AI_Output (self, other, "DIA_Sylvio_Thekla_09_01"); //Et alors ? C'est quoi, le problème de la petite dame ? Et pourquoi elle n'est pas venue elle-même, hein ?
	AI_Output (other, self, "DIA_Sylvio_Thekla_15_02"); //Vous savez très bien pourquoi...
	AI_Output (self, other, "DIA_Sylvio_Thekla_09_03"); //(cynique) Si on en discutait quelques instants avec mon ami Bullco ?

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
	description	= "Vous faites beaucoup parler de vous...";
};

func int DIA_Sylvio_Gossip_Condition ()
{
	return TRUE;
};

func void DIA_Sylvio_Gossip_Info ()
{
	AI_Output (other, self, "DIA_Sylvio_Gossip_15_00"); //On raconte beaucoup de choses à votre sujet.
	AI_Output (self, other, "DIA_Sylvio_Gossip_09_01"); //La plupart des gens parlent trop.
	
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
	description	= "Que pensez-vous de Lee ?";
};

func int DIA_Sylvio_AboutLee_Condition ()
{
	return TRUE;
};

func void DIA_Sylvio_AboutLee_Info ()
{
	AI_Output (other, self, "DIA_Sylvio_AboutLee_15_00"); //Que pensez-vous de Lee ?
	AI_Output (self, other, "DIA_Sylvio_AboutLee_09_01"); //(ironique) Oh, c'est un bon combattant. Je n'aimerais pas me retrouver face à lui, c'est sûr.
	AI_Output (self, other, "DIA_Sylvio_AboutLee_09_02"); //(implacable) Sauf si je ne pouvais pas faire autrement, bien sûr.
	
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
	AI_Output (self, other, "DIA_Sylvio_MenDefeated_09_00"); //Je me suis laissé dire que vous aviez une dent contre mes hommes.
	AI_Output (self, other, "DIA_Sylvio_MenDefeated_09_01"); //Et, pour autant que je sache, vous êtes l'un des protégés de Lee.
	AI_Output (self, other, "DIA_Sylvio_MenDefeated_09_02"); //Je vous préviens, les choses vont bientôt changer par ici, et nous reprendrons cette petite discussion à ce moment-là...
	
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
	description	= "Hé ! Trou du cul...";
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
	AI_Output (other, self, "DIA_Sylvio_Asshole_15_00"); //Hé, connard !
	AI_Output (self, other, "DIA_Sylvio_Asshole_09_01"); //Vous ne croyez tout de même pas que je vais accepter de me battre en duel contre vous, si ?
	AI_Output (self, other, "DIA_Sylvio_Asshole_09_02"); //Retournez vous terrer dans votre coin.
	
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

















