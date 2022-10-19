
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Angar_DI_EXIT   (C_INFO)
{
	npc         = DJG_705_Angar_DI;
	nr          = 999;
	condition   = DIA_Angar_DI_EXIT_Condition;
	information = DIA_Angar_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Angar_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Angar_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_HALLO		(C_INFO)
{
	npc		 = 	DJG_705_Angar_DI;
	nr		 = 	10;
	condition	 = 	DIA_Angar_DI_HALLO_Condition;
	information	 = 	DIA_Angar_DI_HALLO_Info;
	permanent	 = 	TRUE;

	description 	 =  "Jak si� masz?";
};

func int DIA_Angar_DI_HALLO_Condition ()
{
	if ((Npc_IsDead(UndeadDragon)) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Angar_DI_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Angar_DI_HALLO_15_00"); //Jak si� czujesz?

	if ((Npc_IsDead(UndeadDragon)) == FALSE)
	{
		AI_Output			(self, other, "DIA_Angar_DI_HALLO_04_01"); //Odk�d wyl�dowali�my na tej wyspie, moje b�le g�owy sta�y si� nie do zniesienia.
		AI_Output			(self, other, "DIA_Angar_DI_HALLO_04_02"); //Cholera. To si� musi wreszcie sko�czy�.
	}
	else
	{
		AI_Output			(self, other, "DIA_Angar_DI_HALLO_04_03"); //O mnie si� nie martw. Wyno�my si� st�d!
	};

};

///////////////////////////////////////////////////////////////////////
//	Info ORKS
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_ORKS		(C_INFO)
{
	npc		 = 	DJG_705_Angar_DI;
	nr		 = 	5;
	condition	 = 	DIA_Angar_DI_ORKS_Condition;
	information	 = 	DIA_Angar_DI_ORKS_Info;
	important	 = 	TRUE;

};

func int DIA_Angar_DI_ORKS_Condition ()
{
	if (ORkSturmDI == TRUE) 
	&& ((Npc_IsDead(UndeadDragon)) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Angar_DI_ORKS_Info ()
{
	AI_Output			(self, other, "DIA_Angar_DI_ORKS_04_00"); //Pospiesz si�, do diaska! Nast�pnego ataku ork�w mo�emy nie prze�y�.
	AI_Output			(other, self, "DIA_Angar_DI_ORKS_15_01"); //Robi�, co mog�.
	AI_Output			(self, other, "DIA_Angar_DI_ORKS_04_02"); //To troch� za ma�o!

	Info_ClearChoices	(DIA_Angar_DI_ORKS);
	Info_AddChoice	(DIA_Angar_DI_ORKS, "Spokojnie.", DIA_Angar_DI_ORKS_no );
	Info_AddChoice	(DIA_Angar_DI_ORKS, "Pom� mi...", DIA_Angar_DI_ORKS_follow );
};
func void DIA_Angar_DI_ORKS_follow ()
{
	AI_Output			(other, self, "DIA_Angar_DI_ORKS_follow_15_00"); //Zamiast narzeka�, m�g�by� mi pom�c.
	AI_Output			(self, other, "DIA_Angar_DI_ORKS_follow_04_01"); //Tak zrobi�. No dalej, ruszaj przodem!
	AI_StopProcessInfos (self); 
	B_GivePlayerXP (XP_Ambient);
	Npc_ExchangeRoutine	(self,"FollowDI");
	Angar_DI_Party = LOG_RUNNING;
};

func void DIA_Angar_DI_ORKS_no ()
{
	AI_Output			(other, self, "DIA_Angar_DI_ORKS_no_15_00"); //Uspok�j si� troch�.
	AI_Output			(self, other, "DIA_Angar_DI_ORKS_no_04_01"); //�atwo ci powiedzie�, ale ja tu odchodz� od zmys��w.
	AI_StopProcessInfos (self); 
};

///////////////////////////////////////////////////////////////////////
//	Info FOLLOW
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_FOLLOW		(C_INFO)
{
	npc		 = 	DJG_705_Angar_DI;
	nr		 = 	5;
	condition	 = 	DIA_Angar_DI_FOLLOW_Condition;
	information	 = 	DIA_Angar_DI_FOLLOW_Info;
	permanent	 = 	TRUE;

	description  =  "Chc�, �eby� tu zosta�.";

};

func int DIA_Angar_DI_FOLLOW_Condition ()
{
	if (Angar_DI_Party == LOG_RUNNING) 
		{
				return TRUE;
		};
};

func void DIA_Angar_DI_FOLLOW_Info ()
{
	AI_Output			(other, self, "DIA_Angar_DI_FOLLOW_15_00"); //Chc�, �eby� tu zosta�.

	if (Npc_GetDistToWP(self,"SKELETTE")<4000) 
		{
			AI_Output			(other, self, "DIA_Angar_DI_FOLLOW_15_01"); //Dalej poradz� sobie sam.
			AI_Output			(self ,other, "DIA_Angar_DI_FOLLOW_04_02"); //Powodzenia.
			
			AI_StopProcessInfos (self); 
			Npc_ExchangeRoutine	(self,"Start");
			Angar_DI_Party = LOG_SUCCESS; //Joly: (Schluss mit Follow)
			B_GivePlayerXP (XP_Ambient);
		}
	else
		{	
			AI_Output			(self, other, "DIA_Angar_DI_FOLLOW_04_03"); //Jasne.

			AI_StopProcessInfos (self); 
						
			if (Npc_GetDistToWP(self,"SHIP")<10000) 
			{
				Npc_ExchangeRoutine	(self,"Start");
			}
			else
			{			
				if	(Npc_IsDead(FireDragonIsland))
				{
					Npc_ExchangeRoutine	(self,"FireDragonIsland");
				}			
				else if (Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI))
				{
					Npc_ExchangeRoutine	(self,"ORKOBERST_DI");
				}
				else if (Npc_IsDead(Troll_DI))
				{
					Npc_ExchangeRoutine	(self,"Troll_DI");
				}
				else
				{
					Npc_ExchangeRoutine	(self,"Start");
				};
			};
		};
		
	Angar_DI_Party = LOG_OBSOLETE;
};

///////////////////////////////////////////////////////////////////////
//	Info FOLLOWAGAIN
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_FOLLOWAGAIN		(C_INFO)
{
	npc		 = 	DJG_705_Angar_DI;
	nr		 = 	5;
	condition	 = 	DIA_Angar_DI_FOLLOWAGAIN_Condition;
	information	 = 	DIA_Angar_DI_FOLLOWAGAIN_Info;
	permanent	 = 	TRUE;

	description  =  "Chod�my!";

};

func int DIA_Angar_DI_FOLLOWAGAIN_Condition ()
{
	if (Angar_DI_Party == LOG_OBSOLETE) 
		{
				return TRUE;
		};
};

func void DIA_Angar_DI_FOLLOWAGAIN_Info ()
{
	AI_Output			(other, self, "DIA_Angar_DI_FOLLOWAGAIN_15_00"); //Chod�my!
	AI_Output			(self, other, "DIA_Angar_DI_FOLLOWAGAIN_04_01"); //Ty przodem.
	Angar_DI_Party = LOG_RUNNING;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FollowDI");
};

///////////////////////////////////////////////////////////////////////
//	Info FOLLOW
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_FOLLOWSTOP		(C_INFO)
{
	npc		 = 	DJG_705_Angar_DI;
	nr		 = 	5;
	condition	 = 	DIA_Angar_DI_FOLLOWSTOP_Condition;
	information	 = 	DIA_Angar_DI_FOLLOWSTOP_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Angar_DI_FOLLOWSTOP_Condition ()
{
	if (Angar_DI_Party == LOG_RUNNING) 
	&& 	(
		((Npc_GetDistToWP(self,"DI_DRACONIANAREA_FIREDRAGON")<3000) && (Npc_IsDead(FireDragonIsland)== FALSE))
		|| ((Npc_GetDistToWP(self,"SKELETTE")<3000))
		)
			{
					return TRUE;
			};
};

func void DIA_Angar_DI_FOLLOWSTOP_Info ()
{
	AI_Output			(self, other, "DIA_Angar_DI_FOLLOWSTOP_04_00"); //Aaargh! Moja g�owa! Zaraz oszalej�!
};

///////////////////////////////////////////////////////////////////////
//	Info UNDEADDRGDEAD
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_UNDEADDRGDEAD		(C_INFO)
{
	npc		 = 	DJG_705_Angar_DI;
	nr		 = 	2;
	condition	 = 	DIA_Angar_DI_UNDEADDRGDEAD_Condition;
	information	 = 	DIA_Angar_DI_UNDEADDRGDEAD_Info;
	
	description	 = 	"(z u�miechem) Uda�o ci si� prze�y�.";

};

func int DIA_Angar_DI_UNDEADDRGDEAD_Condition ()
{
	if (Npc_IsDead(UndeadDragon))
		{
				return TRUE;
		};
};

func void DIA_Angar_DI_UNDEADDRGDEAD_Info ()
{
	AI_Output			(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_00"); //Uda�o ci si� prze�y�.
	AI_Output			(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_01"); //Mo�emy si� st�d wreszcie wynie��?
	AI_Output			(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_02"); //Czemu nie... Wr�g zosta� pokonany.
	AI_Output			(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_03"); //No to nie tra�my czasu. Id� do kapitana i ka� mu podnosi� kotwic�.

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output			(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_04"); //Mam tylko nadziej�, �e nie natkniemy si� ju� na twoich dawnych kompan�w.
		AI_Output			(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_05"); //Wszystko jest mo�liwe. Prze�ladowcy byli niezwykle skuteczni. Ma�o brakowa�o, a ja te� uleg�bym ich mocy. Kto wie?
	};

	AI_Output			(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_06"); //Co zamierzasz teraz robi�?
	AI_Output			(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_07"); //Mo�e osi�d� gdzie� na wsi i zostan� rolnikiem? Do�� ju� mam wojaczki.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Angar_DI_PICKPOCKET (C_INFO)
{
	npc			= DJG_705_Angar_DI;
	nr			= 900;
	condition	= DIA_Angar_DI_PICKPOCKET_Condition;
	information	= DIA_Angar_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Angar_DI_PICKPOCKET_Condition()
{
	C_Beklauen (47, 45);
};
 
FUNC VOID DIA_Angar_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Angar_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Angar_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Angar_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Angar_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Angar_DI_PICKPOCKET_DoIt);
};

func void DIA_Angar_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Angar_DI_PICKPOCKET);
};
	
func void DIA_Angar_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Angar_DI_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info FoundAmulett
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DI_FOUNDAMULETT		(C_INFO)
{
	npc		 = 	DJG_705_Angar_DI;
	nr		 = 	7;
	condition	 = 	DIA_Angar_DI_FOUNDAMULETT_Condition;
	information	 = 	DIA_Angar_DI_FOUNDAMULETT_Info;

	description	 = 	"Znalaz�em tw�j amulet.";
};

func int DIA_Angar_DI_FOUNDAMULETT_Condition ()
{
	if 	(Npc_HasItems (other,ItAm_Mana_Angar_MIS))
		&& (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER))
		&& (DJG_AngarGotAmulett == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Angar_DI_FOUNDAMULETT_Info ()
{
	B_AngarsAmulettAbgeben ();
};

