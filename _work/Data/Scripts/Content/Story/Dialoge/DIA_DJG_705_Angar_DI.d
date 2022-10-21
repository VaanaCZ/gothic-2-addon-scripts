
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

	description 	 =  "¿Qué tal estás?";
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
	AI_Output			(other, self, "DIA_Angar_DI_HALLO_15_00"); //¿Qué tal estás?

	if ((Npc_IsDead(UndeadDragon)) == FALSE)
	{
		AI_Output			(self, other, "DIA_Angar_DI_HALLO_04_01"); //Desde que llegamos a la isla, los dolores de cabeza se han vuelto insoportables.
		AI_Output			(self, other, "DIA_Angar_DI_HALLO_04_02"); //Maldita sea. Esto tiene que acabar.
	}
	else
	{
		AI_Output			(self, other, "DIA_Angar_DI_HALLO_04_03"); //No te preocupes por mí. Salgamos de aquí.
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
	AI_Output			(self, other, "DIA_Angar_DI_ORKS_04_00"); //Será mejor que te des prisa. El próximo ataque de los orcos nos costará la vida.
	AI_Output			(other, self, "DIA_Angar_DI_ORKS_15_01"); //Hago lo que puedo.
	AI_Output			(self, other, "DIA_Angar_DI_ORKS_04_02"); //No es suficiente.

	Info_ClearChoices	(DIA_Angar_DI_ORKS);
	Info_AddChoice	(DIA_Angar_DI_ORKS, "Relájate.", DIA_Angar_DI_ORKS_no );
	Info_AddChoice	(DIA_Angar_DI_ORKS, "Pues ayúdame...", DIA_Angar_DI_ORKS_follow );
};
func void DIA_Angar_DI_ORKS_follow ()
{
	AI_Output			(other, self, "DIA_Angar_DI_ORKS_follow_15_00"); //Pues ayúdame y deja de quejarte.
	AI_Output			(self, other, "DIA_Angar_DI_ORKS_follow_04_01"); //Vale. Ve tú primero. Ponte en marcha.
	AI_StopProcessInfos (self); 
	B_GivePlayerXP (XP_Ambient);
	Npc_ExchangeRoutine	(self,"FollowDI");
	Angar_DI_Party = LOG_RUNNING;
};

func void DIA_Angar_DI_ORKS_no ()
{
	AI_Output			(other, self, "DIA_Angar_DI_ORKS_no_15_00"); //Relájate.
	AI_Output			(self, other, "DIA_Angar_DI_ORKS_no_04_01"); //Para ti es fácil decirlo. Estoy a punto de perder la cabeza.
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

	description  =  "Ahora quédate atrás.";

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
	AI_Output			(other, self, "DIA_Angar_DI_FOLLOW_15_00"); //Ahora quédate atrás.

	if (Npc_GetDistToWP(self,"SKELETTE")<4000) 
		{
			AI_Output			(other, self, "DIA_Angar_DI_FOLLOW_15_01"); //Tendré que ocuparme yo del resto.
			AI_Output			(self ,other, "DIA_Angar_DI_FOLLOW_04_02"); //Buena suerte.
			
			AI_StopProcessInfos (self); 
			Npc_ExchangeRoutine	(self,"Start");
			Angar_DI_Party = LOG_SUCCESS; //Joly: (Schluss mit Follow)
			B_GivePlayerXP (XP_Ambient);
		}
	else
		{	
			AI_Output			(self, other, "DIA_Angar_DI_FOLLOW_04_03"); //Seguro.

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

	description  =  "Sígueme.";

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
	AI_Output			(other, self, "DIA_Angar_DI_FOLLOWAGAIN_15_00"); //Sígueme.
	AI_Output			(self, other, "DIA_Angar_DI_FOLLOWAGAIN_04_01"); //Ve tú primero.
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
	AI_Output			(self, other, "DIA_Angar_DI_FOLLOWSTOP_04_00"); //¡Aarh! ¡Estos dolores de cabeza me están volviendo loco!
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
	
	description	 = 	"Lo has superado.";

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
	AI_Output			(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_00"); //Lo has superado.
	AI_Output			(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_01"); //¿Podemos irnos de una vez?
	AI_Output			(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_02"); //Sí. El enemigo ha sido derrotado.
	AI_Output			(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_03"); //Entonces no perdamos más tiempo. Ve a decirle al capitán que leve anclas.

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output			(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_04"); //Espero que no queden más sectarios renegados.
		AI_Output			(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_05"); //Todo es posible. No obstante, los buscadores fueron muy meticulosos, y a mí casi me esclavizan. A saber.
	};

	AI_Output			(other, self, "DIA_Angar_DI_UNDEADDRGDEAD_15_06"); //¿Qué vas a hacer después?
	AI_Output			(self, other, "DIA_Angar_DI_UNDEADDRGDEAD_04_07"); //A lo mejor me retiro al campo y me hago granjero. Estoy harto de luchar.
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

	description	 = 	"He encontrado el amuleto.";
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

