
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

	description 	 =  "Come va?";
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
	AI_Output			(other, self, "DIA_Angar_DI_HALLO_15_00"); //Come va?

	if ((Npc_IsDead(UndeadDragon)) == FALSE)
	{
		AI_Output			(self, other, "DIA_Angar_DI_HALLO_04_01"); //Il mal di testa è diventato insopportabile da quando siamo giunti sull'isola.
		AI_Output			(self, other, "DIA_Angar_DI_HALLO_04_02"); //Dannazione. Questa storia deve finire.
	}
	else
	{
		AI_Output			(self, other, "DIA_Angar_DI_HALLO_04_03"); //Non preoccuparti per me. Usciamo fuori di qui.
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
	AI_Output			(self, other, "DIA_Angar_DI_ORKS_04_00"); //Faresti meglio ad affrettarti. Il prossimo attacco degli orchi ci costerà la vita.
	AI_Output			(other, self, "DIA_Angar_DI_ORKS_15_01"); //Sto facendo del mio meglio.
	AI_Output			(self, other, "DIA_Angar_DI_ORKS_04_02"); //Non è abbastanza.

	Info_ClearChoices	(DIA_Angar_DI_ORKS);
	Info_AddChoice	(DIA_Angar_DI_ORKS, "Rilassati.", DIA_Angar_DI_ORKS_no );
	Info_AddChoice	(DIA_Angar_DI_ORKS, "Allora aiutami...", DIA_Angar_DI_ORKS_follow );
};
func void DIA_Angar_DI_ORKS_follow ()
{
	AI_Output			(other, self, "DIA_Angar_DI_ORKS_follow_15_00"); //Allora aiutami e smettila di lamentarti.
	AI_Output			(self, other, "DIA_Angar_DI_ORKS_follow_04_01"); //Lo farò. Vai avanti tu. Muoviti.
	AI_StopProcessInfos (self); 
	B_GivePlayerXP (XP_Ambient);
	Npc_ExchangeRoutine	(self,"FollowDI");
	Angar_DI_Party = LOG_RUNNING;
};

func void DIA_Angar_DI_ORKS_no ()
{
	AI_Output			(other, self, "DIA_Angar_DI_ORKS_no_15_00"); //Rilassati.
	AI_Output			(self, other, "DIA_Angar_DI_ORKS_no_04_01"); //È facile da dire per te. Io sto per impazzire qui.
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

	description  =  "Stai indietro, adesso.";

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
	AI_Output			(other, self, "DIA_Angar_DI_FOLLOW_15_00"); //Stai indietro, adesso.

	if (Npc_GetDistToWP(self,"SKELETTE")<4000) 
		{
			AI_Output			(other, self, "DIA_Angar_DI_FOLLOW_15_01"); //Dovrò occuparmi di tutto il resto da solo.
			AI_Output			(self ,other, "DIA_Angar_DI_FOLLOW_04_02"); //Buona fortuna.
			
			AI_StopProcessInfos (self); 
			Npc_ExchangeRoutine	(self,"Start");
			Angar_DI_Party = LOG_SUCCESS; //Joly: (Schluss mit Follow)
			B_GivePlayerXP (XP_Ambient);
		}
	else
		{	
			AI_Output			(self, other, "DIA_Angar_DI_FOLLOW_04_03"); //Certo.

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

	description  =  "Seguimi.";

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
	AI_Output			(other, self, "DIA_Angar_DI_FOLLOWAGAIN_15_00"); //Seguimi.
	AI_Output			(self, other, "DIA_Angar_DI_FOLLOWAGAIN_04_01"); //Vai avanti tu.
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
	AI_Output			(self, other, "DIA_Angar_DI_FOLLOWSTOP_04_00"); //Argh! Questo mal di testa mi sta facendo impazzire!
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
	
	description	 = 	"Ce l’hai fatta.";

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
	AI_Output			(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_00"); //Ce l’hai fatta.
	AI_Output			(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_01"); //Riusciremo a uscire di qui?
	AI_Output			(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_02"); //Sì. Il nemico è stato sconfitto.
	AI_Output			(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_03"); //Allora non perdiamo altro tempo. Vai dal capitano e digli di levare l'ancora.

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output			(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_04"); //Spero che non ci siano altri membri traditori della setta come te.
		AI_Output			(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_05"); //Tutto è possibile. I Cercatori erano comunque molto meticolosi. Persino io mi ero quasi fatto controllare da loro. Chi lo sa?
	};

	AI_Output			(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_06"); //Cosa farai ora?
	AI_Output			(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_07"); //Forse mi ritirerò in campagna e diventerò un contadino. Sono stufo di combattere.
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

	description	 = 	"Ho trovato il tuo amuleto.";
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

