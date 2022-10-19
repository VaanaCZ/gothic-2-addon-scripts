//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_EXIT   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 999;
	condition   = DIA_Addon_Tom_EXIT_Condition;
	information = DIA_Addon_Tom_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Tom_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Tom_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Tom_PICKPOCKET (C_INFO)
{
	npc			= BDT_1080_Addon_Tom;
	nr			= 900;
	condition	= DIA_Addon_Tom_PICKPOCKET_Condition;
	information	= DIA_Addon_Tom_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Tom_PICKPOCKET_Condition()
{
	C_Beklauen (40, 52);
};
 
FUNC VOID DIA_Addon_Tom_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Tom_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Tom_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Tom_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Tom_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Tom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Tom_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Tom_PICKPOCKET);
};
	
func void DIA_Addon_Tom_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Tom_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_HI   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 1;
	condition   = DIA_Addon_Tom_HI_Condition;
	information = DIA_Addon_Tom_HI_Info;
	permanent   = FALSE;
	description = "¿Qué haces aquí sentado?";
};
FUNC INT DIA_Addon_Tom_HI_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Tom_HI_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_00"); //¿Qué haces aquí sentado?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_01"); //Tengo problemas. De momento, no me conviene mucho que me vean por el campamento.
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_02"); //¿Qué ocurre?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_03"); //Mantenía buenas relaciones con algunos piratas, ¿sabes?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_04"); //Siempre me reunía con los chicos a las afueras del campamento para comerciar.
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_05"); //¡Vaya! Compraba suministros para medio campamento. 'Tom, tráeme esto, Tom, tráeme aquello.'
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_06"); //Y entonces ese bastardo de Esteban tuvo que meterse.
};
//---------------------------------------------------------------------
//	Info Juan
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Juan   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 2;
	condition   = DIA_Addon_Tom_Juan_Condition;
	information = DIA_Addon_Tom_Juan_Info;
	permanent   = FALSE;
	description = "¿Qué ha pasado?";
};
FUNC INT DIA_Addon_Tom_Juan_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Tom_HI)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Juan_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Juan_15_00"); //¿Qué ocurrió?
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_01"); //Esteban envió a Juan, uno de sus hombres. El muy bastardo nos atacó.
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_02"); //¡Estaba a punto de hacer un trato con los piratas cuando salió de la nada y me tiró al suelo de dos golpes!
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_03"); //¡Qué tipo más rápido! Pero no lo suficiente, pude escaparme.
	SC_Knows_JuanMurderedAngus = TRUE;
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"Así que Juan es responsable de la muerte de Hank y Angus. Les esperó y luego acabó con ellos.");
};

//---------------------------------------------------------------------
//	Info Esteban
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Esteban   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 3;
	condition   = DIA_Addon_Tom_Esteban_Condition;
	information = DIA_Addon_Tom_Esteban_Info;
	permanent   = FALSE;
	description = "¿Y desde esa emboscada te escondes aquí?";
};
FUNC INT DIA_Addon_Tom_Esteban_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Tom_Juan)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Esteban_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Esteban_15_00"); //¿Y desde esa emboscada te escondes aquí?
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_01"); //Primero volví al campamento para informar a Fisk, Huno y el resto de que podían olvidarse de su envío.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_02"); //Y que Esteban era el culpable.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_03"); //Si Esteban se entera de que le dije a todos que ÉL era el responsable, soy hombre muerto.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_04"); //Por eso no puedo volver al campamento.
	
	Tom_tells = TRUE;
};

//---------------------------------------------------------------------
//	Info Dead
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_Dead   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 4;
	condition   = DIA_Addon_Tom_Dead_Condition;
	information = DIA_Addon_Tom_Dead_Info;
	permanent   = FALSE;
	description = "Han matado a Esteban.";
};
FUNC INT DIA_Addon_Tom_Dead_Condition()
{	
	if (Npc_IsDead (Esteban))
	&& (Npc_KnowsInfo (other,DIA_Addon_Tom_Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_Dead_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_00"); //Han matado a Esteban.
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_01"); //¿En serio? ¡Vaya, ESO sí que es suerte!
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_02"); //¿Quién lo hizo?
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_03"); //(maliciosamente) Digamos que alguien que conoces
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_04"); //Gracias por venir a decírmelo. Ahora podré volver al campamento
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"LAGER");
};

//---------------------------------------------------------------------
// PERM
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Tom_PERM   (C_INFO)
{
	npc         = BDT_1080_Addon_Tom;
	nr          = 5;
	condition   = DIA_Addon_Tom_PERM_Condition;
	information = DIA_Addon_Tom_PERM_Info;
	permanent   = TRUE;
	description = "¿Y además de eso?";
};
FUNC INT DIA_Addon_Tom_PERM_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Tom_Esteban))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Tom_PERM_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_PERM_15_00"); //¿Y si no?

	if (Npc_GetDistToWP (self,"BL_INN_05_B") <= 500)
	{
		AI_Output (self,other,"DIA_Addon_Tom_PERM_11_01"); //Ahora podré volver a disfrutar en paz del licor de Lucía.
	}
	else
	{	
		if (Npc_KnowsInfo (other, DIA_Addon_Tom_Dead))
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_02"); //¡Ahora podré volver a dejarme ver en el campamento!
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_03"); //¿Y si no? Si no me quedaría aquí contando rocas
		};
	};
};




