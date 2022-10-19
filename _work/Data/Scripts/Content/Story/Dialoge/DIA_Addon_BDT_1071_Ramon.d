// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Ramon_EXIT (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 999;
	condition	= DIA_Addon_Ramon_EXIT_Condition;
	information	= DIA_Addon_Ramon_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Addon_Ramon_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Addon_Ramon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string BDT_1071_Checkpoint	= "BL_UP_CHECK";	
// -----------------------------------------------------------
	
instance DIA_Addon_Ramon_FirstWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 1;
	condition	= DIA_Addon_Ramon_FirstWarn_Condition;
	information	= DIA_Addon_Ramon_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Addon_Ramon_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, BDT_1071_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		))
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_FirstWarn_Info()
{
	if Npc_IsDead (Franco)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_00"); //Eh, �qu� ha pasado all� abajo?
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_01"); //He aplastado a Franco.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_02"); //�Y? Entonces ahora te toca A TI asegurarte de que esos perros rastreros trabajan todos los d�as.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_03"); //Eh, no he venido a que me molesten los cazadores. Quiero entrar al campamento.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_04"); //Olv�dalo. T� te has cargado a Franco, as� que t� eres el l�der. Haz tu trabajo.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_05"); //Si yo soy el l�der, yo decido qui�n es el siguiente.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_06"); //Y he decidido que YO soy el siguiente.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_07"); //(risas) No es tan f�cil. No hemos pedido a NADIE, as� que NADIE puede entrar.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_08"); //Thorus puede enviar un nuevo l�der para los cazadores y entonces habr� una vacante dentro para m�.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_09"); //(risas) No te rindes, �eh? Vale, mueve tu culo dentro.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_10"); //Thorus se ocupar� de que los cazadores no puedan vivir sin un l�der.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_11"); //�A qu� est�s esperando? Y ve a conseguir una piqueta.
		
		self.aivar[AIV_PASSGATE] = TRUE;
		Player_HasTalkedToBanditCamp = TRUE;
		B_GivePlayerXP (XP_Addon_Hinein);
		AI_StopProcessInfos(self);
		
		
		AI_Teleport (Carlos,"BL_WAIT_FINN");//40 m Glumpsche
		
		B_StartOtherRoutine (Carlos,"START");
		B_StartOtherRoutine (Finn, "START");
	}
	else if (Ramon_News == FALSE)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_12"); //Eh, �qu� quieres? No creo que tengas un permiso para el campamento.
		
		if Npc_KnowsInfo (other, DIA_Addon_Franco_HI)
		{
			AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_13"); //Me env�a Franco. Quiere saber si se requiere a alguien en el campamento.
		};
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_14"); //S�, as� es. Otro tipo pas� ayer a mejor vida.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_15"); //Ese idiota se meti� en l�os con Esteban.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_16"); //�Qui�n es Esteban?
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_17"); //El l�der del campamento de abajo. Decide qui�n entra a la mina.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_18"); //Dile a Franco que Thorus necesita a alguien nuevo, �lo captas?
		
		Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
		B_LogEntry (Topic_Addon_Franco,"Thorus necesita a alguien para el campamento. A Franco le interesa.");
		
		Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"�Thorus? �ESE Thorus?",DIA_Addon_Ramon_FirstWarn_YES);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"�Thorus? No me suena�",DIA_Addon_Ramon_FirstWarn_NO);
		
		Ramon_News = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_19"); //�Eh, tranquilo! �No vas a entrar aqu�, as� que largo!
		AI_StopProcessInfos(self);
	};
				
	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_YES()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_00"); //�Thorus? �ESE Thorus?
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_01"); //S�. ESE Thorus. EL que pide gente nueva.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_02"); //El hombre que decide qui�n sale del pantano para entrar en el campamento.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_03"); //�Me est�s diciendo que ya lo conoc�as?
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_04"); //Pues�s
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_05"); //Mira, TODOS conocen a Thorus.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_06"); //Sea como sea, t� no vas a entrar, �y no le PIENSO dar el mensaje!
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_NO()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_NO_15_00"); //�Thorus? No me suena
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_01"); //Venga, hombre, �no lo conoces? Era el jefe de los guardias del Campamento Viejo.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_02"); //El hombre en quien todos conf�an.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_03"); //�l es quien pide gente nueva y quien decide si alguien nuevo entra al campamento.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_04"); //Si vives lo suficiente, quiz� llegues a conocerle.
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Addon_Ramon_SecondWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 2;
	condition	= DIA_Addon_Ramon_SecondWarn_Condition;
	information	= DIA_Addon_Ramon_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_Ramon_SecondWarn_07_00"); //�Un paso m�s y ser� el �ltimo que des!

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Addon_Ramon_Attack (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 3;
	condition	= DIA_Addon_Ramon_Attack_Condition;
	information	= DIA_Addon_Ramon_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Addon_Ramon_Attack_07_00"); //Algunos nunca aprenden
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};
// ************************************************************
// 			News
// ************************************************************
INSTANCE DIA_Addon_Ramon_News (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_News_Condition;
	information	= DIA_Addon_Ramon_News_Info;
	permanent	= FALSE;
	description	= "Soy el tipo nuevo.";
};                       

FUNC INT DIA_Addon_Ramon_News_Condition()
{	
	if !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_News_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_News_15_00"); //Soy el tipo nuevo.
	AI_Output (self, other,"DIA_Addon_Ramon_News_07_01"); //Eh, no intentes enga�arme. Sigue siendo Franco quien decide qui�nes entr�is al campamento.
};
// ************************************************************
// 			Lie
// ************************************************************
INSTANCE DIA_Addon_Ramon_Lie (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_Lie_Condition;
	information	= DIA_Addon_Ramon_Lie_Info;
	permanent	= FALSE;
	description	= "Me env�a Franco�";
};                       

FUNC INT DIA_Addon_Ramon_Lie_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Lie_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Lie_15_00"); //Me env�a Franco
	AI_Output (self, other,"DIA_Addon_Ramon_Lie_07_01"); //No creo. L�rgate o te romper� los huesos
	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			Perm
// ************************************************************
INSTANCE DIA_Addon_Ramon_Perm (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 99;
	condition	= DIA_Addon_Ramon_Perm_Condition;
	information	= DIA_Addon_Ramon_Perm_Info;
	permanent	= TRUE;
	description	= "�Todo bajo control?";
};                       

FUNC INT DIA_Addon_Ramon_Perm_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Perm_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Perm_15_00"); //�Todo bajo control?
	AI_Output (self, other,"DIA_Addon_Ramon_Perm_07_01"); //Aqu� todo va bien, mientras no intente colarse quien no DEBE.
	
	AI_StopProcessInfos (self);
};


