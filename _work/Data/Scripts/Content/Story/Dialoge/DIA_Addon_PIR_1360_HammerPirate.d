// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_HammerPirate_EXIT(C_INFO)
{
	npc 		= PIR_1360_Addon_Pirat;
	nr			= 999;
	condition	= DIA_Addon_HammerPirate_EXIT_Condition;
	information	= DIA_Addon_HammerPirate_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
func INT DIA_Addon_HammerPirate_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_HammerPirate_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Hello - PERM
// *************************************************************************
instance DIA_Addon_HammerPirate_Hello(C_INFO)
{
	npc 		= PIR_1360_Addon_Pirat;
	nr			= 1;
	condition	= DIA_Addon_HammerPirate_Hello_Condition;
	information	= DIA_Addon_HammerPirate_Hello_Info;
	permanent	= TRUE;
	description = "¿Va todo bien?";
};                       
func INT DIA_Addon_HammerPirate_Hello_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_HammerPirate_Hello_Info()
{	
	AI_Output (other, self, "DIA_Addon_HammerPirate_Hello_15_00"); //¿Todo en orden?
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (C_TowerBanditsDead() == TRUE)
		{
			AI_Output (self, other, "DIA_Addon_HammerPirate_Hello_07_01"); //Claro, ya está todo arreglado. Hemos dejado planchados a esa escoria.
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_HammerPirate_Hello_07_02"); //¡Vamos a arreglar esto!
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_HammerPirate_Hello_07_03"); //¡No! Lo de martillear no va ocmigo.
	};
};



// ************************************************************
// *** 														***
// 						Mitkommen (Henry)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
instance DIA_Addon_HammerPirate_Anheuern(C_INFO)
{
	npc			= PIR_1360_Addon_Pirat;
	nr			= 11;
	condition	= DIA_Addon_HammerPirate_Anheuern_Condition;
	information	= DIA_Addon_HammerPirate_Anheuern_Info;
	permanent	= FALSE;
	description = "Tienes que ayudarme.";
};                       
FUNC INT DIA_Addon_HammerPirate_Anheuern_Condition()
{
	if (MIS_Henry_FreeBDTTower == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_HammerPirate_Anheuern_Info()
{	
	AI_Output (self, other, "DIA_Addon_HammerPirate_Anheuern_07_00"); //¡No me digas! ¡Quieres que vaya y te ayude a aniquilar a esos bandidos!
	AI_Output (other,self ,"DIA_Addon_PIR_6_JoinHenry_15_08"); //Eso es.
	if (!Npc_IsDead(SawPirate))
	{
		AI_Output (self, other, "DIA_Addon_HammerPirate_Anheuern_07_01"); //¿Por qué no se lo dices al que está serrando tablas?
	};
	AI_Output (self, other, "DIA_Addon_HammerPirate_Anheuern_07_02"); //Yo… no puedo con tanta tensión
};
// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_HammerPirate_ComeOn(C_INFO)
{
	npc			= PIR_1360_Addon_Pirat;
	nr		 	= 12;
	condition	= DIA_Addon_HammerPirate_ComeOn_Condition;
	information	= DIA_Addon_HammerPirate_ComeOn_Info;
	permanent	= TRUE;
	description	= "Ven conmigo.";
};
func int DIA_Addon_HammerPirate_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Henry_FreeBDTTower == LOG_RUNNING)
	&& (C_TowerBanditsDead() == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_HammerPirate_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_HammerPirate_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_HammerPirate_ComeOn_15_00"); //Ven conmigo.
	if (SawPirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_HammerPirate_ComeOn_07_01"); //Henry necesita que uno de nosotros se QUEDE
	}
	else if (Npc_GetDistToWP (self, "ADW_PIRATECAMP_WAY_08") > 6000)
	{	
		AI_Output (self ,other,"DIA_Addon_HammerPirate_ComeOn_07_02"); //Primero volvamos un poco hacia el campamento.
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_HammerPirate_ComeOn_07_03"); //(suspira) Sí, sí.
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_HammerPirate_GoHome(C_INFO)
{
	npc			= PIR_1360_Addon_Pirat;
	nr			= 13;
	condition	= DIA_Addon_HammerPirate_GoHome_Condition;
	information	= DIA_Addon_HammerPirate_GoHome_Info;
	permanent	= TRUE;
	description = "Ya no te necesito.";
};                       
FUNC INT DIA_Addon_HammerPirate_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_HammerPirate_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_HammerPirate_GoHome_15_00"); //Ya no te necesito.
	AI_Output (self ,other,"DIA_Addon_HammerPirate_GoHome_07_01"); //Si tú lo dices
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START"); 
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_HammerPirate_TooFar(C_INFO)
{
	npc			= PIR_1360_Addon_Pirat;
	nr			= 14;
	condition	= DIA_Addon_HammerPirate_TooFar_Condition;
	information	= DIA_Addon_HammerPirate_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_HammerPirate_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP (self, "ADW_PIRATECAMP_WAY_08") > 6000)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_HammerPirate_TooFar_Info()
{	
	AI_Output (self ,other,"DIA_Addon_HammerPirate_TooFar_07_01"); //Si quieres seguir en esa dirección, no seré yo quien te detenga
	AI_Output (self ,other,"DIA_Addon_HammerPirate_GoHome_07_02"); //Creo que voy a volver.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
	
	AI_StopProcessInfos (self); 
};

	

// ************************************************************
// 			 				SUCCESS
// ************************************************************
INSTANCE DIA_Addon_HammerPirate_Success(C_INFO)
{
	npc			= PIR_1360_Addon_Pirat;
	nr			= 14;
	condition	= DIA_Addon_HammerPirate_Success_Condition;
	information	= DIA_Addon_HammerPirate_Success_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_HammerPirate_Success_Condition()
{
	if (C_TowerBanditsDead() == TRUE)
	&& (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_HammerPirate_Success_Info()
{	
	AI_Output (self ,other,"DIA_Addon_HammerPirate_Success_07_01"); //¿Sabes qué? He estado pensando. ¡No eres mal tipo!
	AI_Output (self ,other,"DIA_Addon_HammerPirate_Success_07_02"); //Pues entonces vuelvo al campamento. ¡Nos vemos!
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START");
	
	AI_StopProcessInfos (self); 
};
