// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_BDT_1088_Addon_Torwache_EXIT (C_INFO)
{
	npc			= BDT_1088_Addon_Torwache;
	nr			= 999;
	condition	= DIA_BDT_1088_Addon_Torwache_EXIT_Condition;
	information	= DIA_BDT_1088_Addon_Torwache_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
FUNC INT DIA_BDT_1088_Addon_Torwache_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_BDT_1088_Addon_Torwache_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string BDT_1088_Checkpoint	= "BL_UP_CHECK";	
// -----------------------------------------------------------
	
instance DIA_BDT_1088_Addon_Torwache_FirstWarn (C_INFO)
{
	npc			= BDT_1088_Addon_Torwache;
	nr			= 1;
	condition	= DIA_BDT_1088_Addon_Torwache_FirstWarn_Condition;
	information	= DIA_BDT_1088_Addon_Torwache_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_BDT_1088_Addon_Torwache_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, BDT_1088_Checkpoint) <= 700) //NICHT von hinten!
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

func void DIA_BDT_1088_Addon_Torwache_FirstWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_BDT_1088_Addon_Torwache_FirstWarn_06_00"); //¡ALTO!
	
	if (MIS_Send_Buddler == LOG_SUCCESS)
	{
		//kairo: aioutput-string des spielers gab es doppelt. umbenannt!
		
		AI_Output (other, self,"DIA_Addon_BDT_1088_Torwache_FirstWarn_15_01"); //Aparta de mi camino, guardia.
		AI_Output (self, other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_06_02"); //Ahh, estupendo, puedes pasar.
		
		self.aivar[AIV_PASSGATE] = TRUE;
	}
	else if (MIS_Send_Buddler != LOG_RUNNING)
	&& 		(MIS_Send_Buddler != LOG_SUCCESS)
	{
		if (Torwache_Greetings == 0)
		{
			AI_Output (self, other,"DIA_Addon_BDT_1088_Addon_Torwache_FirstWarn_06_03"); //Mientras Thorus no te dé una piedra roja, no eres bienvenido.
			Torwache_Greetings = 1;
		}
		else if (Torwache_Greetings == 1)
		{
			AI_Output (self, other,"DIA_Addon_BDT_1088_Addon_Torwache_FirstWarn_06_04"); //¿Me entiendes? (con energía) ¡LÁRGATE!
			Torwache_Greetings = 2;
		}			
		else
		{
			AI_Output (self, other,"DIA_Addon_BDT_1088_Addon_Torwache_FirstWarn_06_05"); //(con energía) ¡LÁRGATE!
		};
	}
	else if (MIS_Send_Buddler == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Addon_BDT_1088_Addon_Torwache_FirstWarn_06_06"); //Eh, mientras Thorus no te dé su beneplácito, no vas a entrar.
	};
	
	
	AI_StopProcessInfos(self);
		
	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,BDT_1088_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
	
	
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_BDT_1088_Addon_Torwache_SecondWarn (C_INFO)
{
	npc			= BDT_1088_Addon_Torwache;
	nr			= 2;
	condition	= DIA_BDT_1088_Addon_Torwache_SecondWarn_Condition;
	information	= DIA_BDT_1088_Addon_Torwache_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_BDT_1088_Addon_Torwache_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1088_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_BDT_1088_Addon_Torwache_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_BDT_1088_Addon_Torwache_SecondWarn_06_00"); //Vale, tranquilo. Te doy una última oportunidad. Date la VUELTA AHORA mismo o te mato

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,BDT_1088_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_BDT_1088_Addon_Torwache_Attack (C_INFO)
{
	npc			= BDT_1088_Addon_Torwache;
	nr			= 3;
	condition	= DIA_BDT_1088_Addon_Torwache_Attack_Condition;
	information	= DIA_BDT_1088_Addon_Torwache_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_BDT_1088_Addon_Torwache_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1088_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_BDT_1088_Addon_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Addon_BDT_1088_Addon_Torwache_Attack_06_00"); //(suspiro) ¿Crees que es un farol? Ahora verás
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};








