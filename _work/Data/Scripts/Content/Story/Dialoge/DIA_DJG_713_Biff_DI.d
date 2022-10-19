
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Biff_DI_EXIT   (C_INFO)
{
	npc         = DJG_713_Biff_DI;
	nr          = 999;
	condition   = DIA_Biff_DI_EXIT_Condition;
	information = DIA_Biff_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Biff_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Biff_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DI_HALLO		(C_INFO)
{
	npc		 = 	DJG_713_Biff_DI;
	nr		 = 	10;
	condition	 = 	DIA_Biff_DI_HALLO_Condition;
	information	 = 	DIA_Biff_DI_HALLO_Info;
	important	 = 	TRUE;

};

func int DIA_Biff_DI_HALLO_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& ((Npc_IsDead(UndeadDragon)) == FALSE)
		{
			return TRUE;
		};	
};

func void DIA_Biff_DI_HALLO_Info ()
{
	AI_Output			(self, other, "DIA_Biff_DI_HALLO_07_00"); //A? Kde je to bohatstv�, cos mi sliboval?

	if (Npc_KnowsInfo(other, DIA_Biff_DI_ORKS)==FALSE)
		{
				AI_Output			(other, self, "DIA_Biff_DI_HALLO_15_01"); //A co jsem ��kal p�edt�m, je�t� na mo�i?
		};

	AI_Output			(other, self, "DIA_Biff_DI_HALLO_15_02"); //Te� tady m� hl�dat lo�.
	AI_Output			(other, self, "DIA_Biff_DI_HALLO_15_03"); //Nerad bych celou cestu nazp�tek plaval.
	AI_Output			(self, other, "DIA_Biff_DI_HALLO_07_04"); //Do kelu. Kdybych to byl v�d�l, z�stal bych rad�j v Khorinidu.
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DI_perm		(C_INFO)
{
	npc		 = 	DJG_713_Biff_DI;
	nr		 = 	5;
	condition	 = 	DIA_Biff_DI_perm_Condition;
	information	 = 	DIA_Biff_DI_perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"Na palub� v�echno v po��dku?";
};

func int DIA_Biff_DI_perm_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Biff_DI_HALLO))
	&& ((Npc_IsDead(UndeadDragon)) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Biff_DI_perm_Info ()
{
	AI_Output			(other, self, "DIA_Biff_DI_perm_15_00"); //Na palub� v�echno v po��dku?
	AI_Output			(self, other, "DIA_Biff_DI_perm_07_01"); //(podr�d�n�) Jo, jo. Je tu klid.
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info ORKS
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DI_ORKS		(C_INFO)
{
	npc		 = 	DJG_713_Biff_DI;
	nr		 = 	5;
	condition	 = 	DIA_Biff_DI_ORKS_Condition;
	information	 = 	DIA_Biff_DI_ORKS_Info;
	important	 = 	TRUE;

};

func int DIA_Biff_DI_ORKS_Condition ()
{
	if (Npc_GetDistToWP(self,"DI_SHIP_03")<1000)
	&& (ORkSturmDI == TRUE) 
	&& ((Npc_IsDead(UndeadDragon)) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Biff_DI_ORKS_Info ()
{
	AI_Output			(self, other, "DIA_Biff_DI_ORKS_07_00"); //Ty zav�iven� bestie!
	AI_Output			(other, self, "DIA_Biff_DI_ORKS_15_01"); //Co tady naho�e ksakru d�l�? M�ls hl�dat lo�.
	AI_Output			(self, other, "DIA_Biff_DI_ORKS_07_02"); //Ta se jen tak nepotop�, chlape.
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Za��t");
};

///////////////////////////////////////////////////////////////////////
//	Info UNDEADDRGDEAD
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DI_UNDEADDRGDEAD		(C_INFO)
{
	npc		 = 	DJG_713_Biff_DI;
	nr		 = 	4;
	condition	 = 	DIA_Biff_DI_UNDEADDRGDEAD_Condition;
	information	 = 	DIA_Biff_DI_UNDEADDRGDEAD_Info;
	important	 = 	TRUE;

};

func int DIA_Biff_DI_UNDEADDRGDEAD_Condition ()
{
	if (Npc_IsDead(UndeadDragon))
		{
				return TRUE;
		};
};

func void DIA_Biff_DI_UNDEADDRGDEAD_Info ()
{
	AI_Output			(self, other, "DIA_Biff_DI_UNDEADDRGDEAD_07_00"); //A bylo to tak?
	AI_Output			(other, self, "DIA_Biff_DI_UNDEADDRGDEAD_15_01"); //Je to tak te�.
	AI_Output			(self, other, "DIA_Biff_DI_UNDEADDRGDEAD_07_02"); //M��u te�...
	AI_Output			(other, self, "DIA_Biff_DI_UNDEADDRGDEAD_15_03"); //M��e� vyrabovat celej ostrov, kdy� na to p�ijde.
	AI_Output			(self, other, "DIA_Biff_DI_UNDEADDRGDEAD_07_04"); //Skv�l�.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"PlunderTempel");
};

///////////////////////////////////////////////////////////////////////
//	Info plunder
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DI_plunder		(C_INFO)
{
	npc		 = 	DJG_713_Biff_DI;
	nr		 = 	5;
	condition	 = 	DIA_Biff_DI_plunder_Condition;
	information	 = 	DIA_Biff_DI_plunder_Info;
	important	 = 	TRUE;

};

func int DIA_Biff_DI_plunder_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (Npc_KnowsInfo(other, DIA_Biff_DI_plunder))
	&& (Npc_IsDead(UndeadDragon))
		{
				return TRUE;
		};

};

func void DIA_Biff_DI_plunder_Info ()
{
	AI_Output			(self, other, "DIA_Biff_DI_plunder_07_00"); //Sakra. Te� ne.
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Biff_DI_PICKPOCKET (C_INFO)
{
	npc			= DJG_713_Biff_DI;
	nr			= 900;
	condition	= DIA_Biff_DI_PICKPOCKET_Condition;
	information	= DIA_Biff_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Biff_DI_PICKPOCKET_Condition()
{
	C_Beklauen (92, 450);
};
 
FUNC VOID DIA_Biff_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Biff_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Biff_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Biff_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Biff_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Biff_DI_PICKPOCKET_DoIt);
};

func void DIA_Biff_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Biff_DI_PICKPOCKET);
};
	
func void DIA_Biff_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Biff_DI_PICKPOCKET);
};
