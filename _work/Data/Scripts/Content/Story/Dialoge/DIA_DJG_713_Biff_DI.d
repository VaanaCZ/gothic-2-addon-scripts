
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
	AI_Output			(self, other, "DIA_Biff_DI_HALLO_07_00"); //No i? Gdzie s¹ te bogactwa, które mi obiecywa³eœ?

	if (Npc_KnowsInfo(other, DIA_Biff_DI_ORKS)==FALSE)
		{
				AI_Output			(other, self, "DIA_Biff_DI_HALLO_15_01"); //A co ci mówi³em wczeœniej, na morzu?
		};

	AI_Output			(other, self, "DIA_Biff_DI_HALLO_15_02"); //Na razie masz pilnowaæ statku.
	AI_Output			(other, self, "DIA_Biff_DI_HALLO_15_03"); //Wola³bym nie p³yn¹æ z powrotem wp³aw.
	AI_Output			(self, other, "DIA_Biff_DI_HALLO_07_04"); //Cholera. Gdybym to wczeœniej wiedzia³, zosta³bym w Khorinis.
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

	description	 = 	"Wszystko w porz¹dku na pok³adzie?";
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
	AI_Output			(other, self, "DIA_Biff_DI_perm_15_00"); //Wszystko w porz¹dku na pok³adzie?
	AI_Output			(self, other, "DIA_Biff_DI_perm_07_01"); //Taa, taa. Wszystko w porz¹dku.
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
	AI_Output			(self, other, "DIA_Biff_DI_ORKS_07_00"); //Te parszywe bestie!
	AI_Output			(other, self, "DIA_Biff_DI_ORKS_15_01"); //Do diab³a, co tu robisz? Mia³eœ pilnowaæ statku.
	AI_Output			(self, other, "DIA_Biff_DI_ORKS_07_02"); //Nie utonie przez te parê chwil, stary.
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
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
	AI_Output			(self, other, "DIA_Biff_DI_UNDEADDRGDEAD_07_00"); //Czyli to wszystko?
	AI_Output			(other, self, "DIA_Biff_DI_UNDEADDRGDEAD_15_01"); //Na razie to wszystko.
	AI_Output			(self, other, "DIA_Biff_DI_UNDEADDRGDEAD_07_02"); //A teraz, czy mogê...
	AI_Output			(other, self, "DIA_Biff_DI_UNDEADDRGDEAD_15_03"); //Jeœli o mnie chodzi, to mo¿esz spl¹drowaæ ca³¹ wyspê.
	AI_Output			(self, other, "DIA_Biff_DI_UNDEADDRGDEAD_07_04"); //Wspaniale.
	
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
	AI_Output			(self, other, "DIA_Biff_DI_plunder_07_00"); //Do diab³a. Nie teraz.
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
