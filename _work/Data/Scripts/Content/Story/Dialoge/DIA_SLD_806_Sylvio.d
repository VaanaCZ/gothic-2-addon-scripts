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
	description	= "¿Qué pasa?";
};

func int DIA_Sylvio_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Sylvio_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Sylvio_Hallo_15_00"); //¿Cómo va todo?
	AI_Output (self, other, "DIA_Sylvio_Hallo_09_01"); //¿Te he dado permiso para dirigirte a mí?
	
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
	description	= "Thekla tiene un problema contigo.";
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
	AI_Output (other, self, "DIA_Sylvio_Thekla_15_00"); //Thekla tiene un problema contigo.
	AI_Output (self, other, "DIA_Sylvio_Thekla_09_01"); //¿Y bien? ¿Cuál es el problema de la querida señora? ¿Y por qué no viene ella misma?
	AI_Output (other, self, "DIA_Sylvio_Thekla_15_02"); //Lo sabes de sobra...
	AI_Output (self, other, "DIA_Sylvio_Thekla_09_03"); //(Cínicamente amistoso) ¿Por que no lo discutes un rato con mi amigo Bullco?

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
	description	= "Son muchos los que hablan de ti...";
};

func int DIA_Sylvio_Gossip_Condition ()
{
	return TRUE;
};

func void DIA_Sylvio_Gossip_Info ()
{
	AI_Output (other, self, "DIA_Sylvio_Gossip_15_00"); //Son muchos los que hablan de ti...
	AI_Output (self, other, "DIA_Sylvio_Gossip_09_01"); //Son muchos los que hablan demasiado.
	
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
	description	= "¿Qué opinas de Lee?";
};

func int DIA_Sylvio_AboutLee_Condition ()
{
	return TRUE;
};

func void DIA_Sylvio_AboutLee_Info ()
{
	AI_Output (other, self, "DIA_Sylvio_AboutLee_15_00"); //¿Qué opinas de Lee?
	AI_Output (self, other, "DIA_Sylvio_AboutLee_09_01"); //(Con algo de ironía) Oh, es un buen guerrero. No me gustaría enfrentarme a él.
	AI_Output (self, other, "DIA_Sylvio_AboutLee_09_02"); //(Con frialdad) A menos, claro, que no pudiera evitarlo.
	
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
	AI_Output (self, other, "DIA_Sylvio_MenDefeated_09_00"); //¡Me he enterado de que vienes a buscar bronca con mis chicos!
	AI_Output (self, other, "DIA_Sylvio_MenDefeated_09_01"); //Y, por lo que sé, eres uno de los protegidos de Lee.
	AI_Output (self, other, "DIA_Sylvio_MenDefeated_09_02"); //¡Te lo advierto! Aquí no van a tardar en cambiar las cosas, ¡y entonces volveremos a hablar de esto!
	
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
	description	= "Oye, imbécil...";
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
	AI_Output (other, self, "DIA_Sylvio_Asshole_15_00"); //Oye, imbécil...
	AI_Output (self, other, "DIA_Sylvio_Asshole_09_01"); //¿No creerás de verdad que me voy a medir en duelo contigo?
	AI_Output (self, other, "DIA_Sylvio_Asshole_09_02"); //Vuelve a meterte debajo de una roca.
	
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

















