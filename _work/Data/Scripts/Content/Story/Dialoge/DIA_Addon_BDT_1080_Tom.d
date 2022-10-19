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
	description = "�Qu� haces aqu� sentado?";
};
FUNC INT DIA_Addon_Tom_HI_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Tom_HI_Info()
{	
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_00"); //�Qu� haces aqu� sentado?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_01"); //Tengo problemas. De momento, no me conviene mucho que me vean por el campamento.
	AI_Output (other,self,"DIA_Addon_Tom_HI_15_02"); //�Qu� ocurre?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_03"); //Manten�a buenas relaciones con algunos piratas, �sabes?
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_04"); //Siempre me reun�a con los chicos a las afueras del campamento para comerciar.
	AI_Output (self,other,"DIA_Addon_Tom_HI_11_05"); //�Vaya! Compraba suministros para medio campamento. 'Tom, tr�eme esto, Tom, tr�eme aquello.'
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
	description = "�Qu� ha pasado?";
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
	AI_Output (other,self,"DIA_Addon_Tom_Juan_15_00"); //�Qu� ocurri�?
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_01"); //Esteban envi� a Juan, uno de sus hombres. El muy bastardo nos atac�.
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_02"); //�Estaba a punto de hacer un trato con los piratas cuando sali� de la nada y me tir� al suelo de dos golpes!
	AI_Output (self,other,"DIA_Addon_Tom_Juan_11_03"); //�Qu� tipo m�s r�pido! Pero no lo suficiente, pude escaparme.
	SC_Knows_JuanMurderedAngus = TRUE;
	
	B_LogEntry	(TOPIC_Addon_KillJuan,"As� que Juan es responsable de la muerte de Hank y Angus. Les esper� y luego acab� con ellos.");
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
	description = "�Y desde esa emboscada te escondes aqu�?";
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
	AI_Output (other,self,"DIA_Addon_Tom_Esteban_15_00"); //�Y desde esa emboscada te escondes aqu�?
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_01"); //Primero volv� al campamento para informar a Fisk, Huno y el resto de que pod�an olvidarse de su env�o.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_02"); //Y que Esteban era el culpable.
	AI_Output (self,other,"DIA_Addon_Tom_Esteban_11_03"); //Si Esteban se entera de que le dije a todos que �L era el responsable, soy hombre muerto.
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
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_01"); //�En serio? �Vaya, ESO s� que es suerte!
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_02"); //�Qui�n lo hizo?
	AI_Output (other,self,"DIA_Addon_Tom_Dead_15_03"); //(maliciosamente) Digamos que alguien que conoces
	AI_Output (self,other,"DIA_Addon_Tom_Dead_11_04"); //Gracias por venir a dec�rmelo. Ahora podr� volver al campamento
	
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
	description = "�Y adem�s de eso?";
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
	AI_Output (other,self,"DIA_Addon_Tom_PERM_15_00"); //�Y si no?

	if (Npc_GetDistToWP (self,"BL_INN_05_B") <= 500)
	{
		AI_Output (self,other,"DIA_Addon_Tom_PERM_11_01"); //Ahora podr� volver a disfrutar en paz del licor de Luc�a.
	}
	else
	{	
		if (Npc_KnowsInfo (other, DIA_Addon_Tom_Dead))
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_02"); //�Ahora podr� volver a dejarme ver en el campamento!
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Tom_PERM_11_03"); //�Y si no? Si no me quedar�a aqu� contando rocas
		};
	};
};




