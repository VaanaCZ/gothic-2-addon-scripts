// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Greg_EXIT(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 999;
	condition	= DIA_Addon_Greg_EXIT_Condition;
	information	= DIA_Addon_Greg_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Greg_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Greg_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Greg_PICKPOCKET (C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 900;
	condition	= DIA_Addon_Greg_PICKPOCKET_Condition;
	information	= DIA_Addon_Greg_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Addon_Greg_PICKPOCKET_Condition()
{
	C_Beklauen (111, 666);
};
 
FUNC VOID DIA_Addon_Greg_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Greg_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Greg_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Greg_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Greg_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Greg_PICKPOCKET_DoIt);
};

func void DIA_Addon_Greg_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Greg_PICKPOCKET);
};
	
func void DIA_Addon_Greg_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Greg_PICKPOCKET);
};
// ************************************************************
// 			  			Hallo - (Greg Is Back)
// ************************************************************
INSTANCE DIA_Addon_Greg_ImNew(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 1;
	condition	= DIA_Addon_Greg_ImNew_Condition;
	information	= DIA_Addon_Greg_ImNew_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Greg_ImNew_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Greg_ImNew_Info()
{	
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_00"); //(amenazante) Eh, tú. ¿Qué estás haciendo en mi cabaña?
	AI_Output (other,self,"DIA_Addon_Greg_Hello_15_01"); //Yo
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_02"); //(furioso) Me marcho un par de días y todos se piensan que pueden hacer lo que les salga de las narices.
	//AI_Output (other,self,"DIA_Addon_Greg_ImNew_15_00"); //Ich bin der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_01"); //(zynisch) So so, du bist der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_02"); //Hier entscheide immer noch ICH, wer bei uns mitmacht.
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_03"); //¿Qué demonios está pasando aquí?
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_04"); //¿La empalizada no está aún acabada? El cañón está a rebosar de bestias y la gente por ahí, pasando el rato.
		
	GregIsBack = TRUE;
	
	if (!Npc_IsDead (Francis))
	{
		AI_TurnToNpc (self, Francis);
		AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_05"); //(en alto) ¿Esto es todo lo que has conseguido, Francis?
		
		if (C_BodyStateContains (Francis, BS_SIT))
		{
			AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_06"); //(en alto) ¡Largo de mi banco de inmediato!
		};
	};
	
	Npc_ExchangeRoutine	(self,"HOME");
	AI_TurnToNpc (self, other);
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_07"); //¿Y TÚ? ¿TÚ qué has hecho?
	
	Info_ClearChoices	(DIA_Addon_Greg_ImNew);
	Info_AddChoice	(DIA_Addon_Greg_ImNew, "Hasta ahora, es soportable.", DIA_Addon_Greg_ImNew_nich );
	if (
			(Npc_IsDead(BeachLurker1))
			&& (Npc_IsDead(BeachLurker2))
			&& (Npc_IsDead(BeachLurker3))
			&& (Npc_IsDead(BeachWaran1))
			&& (Npc_IsDead(BeachWaran2))
			&& (Npc_IsDead(BeachShadowbeast1))
			&& (Npc_IsDead(BeachShadowbeast1))
			&& (MIS_Addon_MorganLurker != 0 )
		)
		|| (C_TowerBanditsDead() == TRUE)
			{
				Info_AddChoice	(DIA_Addon_Greg_ImNew, "He estado trabajando.", DIA_Addon_Greg_ImNew_turm );
			};

	};
// ------------------------------------------------------------------
func void B_UseRakeBilanz ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_00"); //No creas que me he olvidado de que me debes un par de cosas.
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_01"); //Cosas que valen varios cientos de monedas de oro y que he enterrado por todo Khorinis.
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_02"); //Te has quedado con todo, ¿no es así?
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_03"); //Te voy a hacer trabajar hasta pagarme todo con sudor.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_04"); //Te voy a enseñar lo que es trabajar de verdad.
	};
	
	if (!Npc_IsDead (Francis))
	{
		Npc_ExchangeRoutine  (Francis,"GREGISBACK");
		AI_StartState (Francis, ZS_Saw, 1, "ADW_PIRATECAMP_BEACH_19"); //HACK - REDUNDANT!!!
		Francis_ausgeschissen = TRUE;
	};
	
	Info_ClearChoices	(DIA_Addon_Greg_ImNew);
};
// --------------------------------------------------------------------
func void DIA_Addon_Greg_ImNew_nich ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_ImNew_nich_15_00"); //Hasta ahora, es soportable.
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_nich_01_01"); //Tranquilo. Te encontraré algo adecuado, amigo.
	B_UseRakeBilanz ();
};
func void DIA_Addon_Greg_ImNew_turm ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_00"); //He estado trabajando.
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_01"); //¿En serio? ¿Y qué?

	if (C_TowerBanditsDead() == TRUE)
	{
		AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_02"); //Me he deshecho de los bandidos de la torre.
	};

	if (Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (Npc_IsDead(BeachShadowbeast1))
	&& (MIS_Addon_MorganLurker != 0)
	{
		AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_03"); //Ya no hay bestias en la playa del norte.
	};

	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_04"); //En fin, por algo se empieza, supongo.
	
	B_UseRakeBilanz ();
};

// ************************************************************
// 			  				JoinPirates
// ************************************************************
INSTANCE DIA_Addon_Greg_JoinPirates(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_JoinPirates_Condition;
	information	= DIA_Addon_Greg_JoinPirates_Info;
	permanent	= FALSE;
	description = "¿Qué hay que hacer?";
};                       
FUNC INT DIA_Addon_Greg_JoinPirates_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Greg_ImNew) == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Info()
{	
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_15_00"); //¿Qué tengo que hacer?
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_01"); //En primer lugar, vamos a poner esto en marcha.

	if ((Npc_IsDead(Morgan))== FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_02"); //Morgan, ese puerco perezoso, va a serrar tablas.
	};
	
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_03"); //TÚ te ocuparás del trabajo de Morgan y limpiarás el cañón de esas malditas bestias.
	
	MIS_Addon_Greg_ClearCanyon = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_ClearCanyon,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_ClearCanyon,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg quiere que me ocupe del cargo de Morgan y despeje el cañón de bestias.");

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"Entonces voy a empezar.",DIA_Addon_Greg_JoinPirates_Leave);

	if (((Npc_IsDead(Brandon))== FALSE)
	|| ((Npc_IsDead(Matt))== FALSE))
	{
		Info_AddChoice (DIA_Addon_Greg_JoinPirates,"¿Se supone que debo hacerlo solo?",DIA_Addon_Greg_JoinPirates_Compadres);
	};

	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"¿Qué bestias?",DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00"); //Entonces voy a empezar.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01"); //Una cosa más. Ahora eres de los nuestros.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02"); //Así que lo primero, búscate un traje de caza decente.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03"); //Aquí tienes armaduras nuestras. Espero que te valgan.
	CreateInvItems (self, ItAr_Pir_M_Addon, 1);									
	B_GiveInvItems (self, other, ItAr_Pir_M_Addon, 1);		
	AI_EquipArmor(hero,ItAr_Pir_M_Addon);
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04"); //Y no te entretengas. ¡Al ataque!
	

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_Compadres_15_00"); //¿Se supone que debo hacerlo solo?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01"); //Adelante, coge a algunos de los chicos.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02"); //Que se ganen su paga, en vez de holgazanear todo el día.

	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg dice que puedo llevarme a un par de hombres conmigo.");
};

FUNC VOID DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00"); //¿Qué bestias?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01"); //Las cuchillas del cañón se acercan cada vez más a nuestro campamento.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02"); //No pienso esperar a que se coma a uno de mis hombres que ande de borrachera.

	B_LogEntry (TOPIC_Addon_ClearCanyon,"Parece que todo es cosa de cuchillas.");
};

// ************************************************************
// 			  				Wegen dem Canyon...
// ************************************************************
INSTANCE DIA_Addon_Greg_AboutCanyon(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_AboutCanyon_Condition;
	information	= DIA_Addon_Greg_AboutCanyon_Info;
	permanent	= TRUE;
	description = "Sobre ese cañón…";
};                       
FUNC INT DIA_Addon_Greg_AboutCanyon_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Info()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_15_00"); //Sobre ese cañón
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_01_01"); //Sí, dime.
	
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
	if (C_AllCanyonRazorDead() == FALSE)
	{
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,DIALOG_BACK,DIA_Addon_Greg_AboutCanyon_Back);	
		if (((Npc_IsDead(Brandon))== FALSE)
		|| ((Npc_IsDead(Matt))== FALSE))
		{
			Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"¿Quién podría ayudarme?",DIA_Addon_Greg_AboutCanyon_Compadres);
		};
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"¿Qué bestias son las que tengo que matar?",DIA_Addon_Greg_AboutCanyon_Job);
	}
	else 
	{
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"He matado a todas las cuchillas.",DIA_Addon_Greg_AboutCanyon_RazorsDead);
	};
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Back()
{
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Compadres()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00"); //¿Quién podría ayudarme?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01"); //Llévate a algunos  hombres.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02"); //Normalmente, no hacen más que el vago.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Job_15_00"); //¿Qué bestias son las que tengo que matar?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01"); //¡Deshazte de las cuchillas! Las otras criaturas son inofensivas.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00"); //He matado a todas las cuchillas.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01"); //Bien. Eres un buen fichaje.
	
	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg parece impresionado de que haya matado a las cuchillas del cañón.");
	
	MIS_Addon_Greg_ClearCanyon = LOG_SUCCESS;
	B_Addon_PiratesGoHome();
	B_GivePlayerXP (XP_ADDON_CLEARCANYON);
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};


// ************************************************************
// 			  				BanditArmor
// ************************************************************
INSTANCE DIA_Addon_Greg_BanditArmor(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_BanditArmor_Condition;
	information	= DIA_Addon_Greg_BanditArmor_Info;
	permanent	= TRUE;
	description = "Necesito la armadura de ese bandido.";
};                       
FUNC INT DIA_Addon_Greg_BanditArmor_Condition()
{
	if (MIS_Greg_ScoutBandits == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_BanditArmor_Info()
{	
	AI_Output (other,self,"DIA_Addon_Greg_BanditArmor_15_00"); //Necesito la armadura de ese bandido.
	if (MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_01"); //Primero demuestra lo que vales. Luego hablaremos.
		if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
		{
			AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_02"); //¡En primer lugar, mata a todas las cuchillas del cañón!
		};
		
		B_LogEntry (TOPIC_Addon_BDTRuestung,"Greg quiere que le ayude a dar algo de vida al campamento. Después, le hablaré de la armadura."); 
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_03"); //¡Eh, no eres un tipo cualquiera!
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_04"); //Se suponía que Bones debía ponerse esa armadura y espiar a los bandidos.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_05"); //Pero quizá TÚ seas más adecuado para el trabajo.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_06"); //Tal vez consigas incluso salir con vida.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_07"); //Habla con Bones y dile que te dé la armadura. Luego póntela y ve al campamento de los bandidos.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_08"); //Quiero saber a qué ha venido esa escoria a nuestro valle.
		AI_Output (other,self,"DIA_Addon_Greg_BanditArmor_15_09"); //¡Sí, capitán!
	
		B_LogEntry (TOPIC_Addon_BDTRuestung,"Cuando termine con las cuchillas del campamento de Greg, me quedaré la armadura de Bones."); 
	
		Log_CreateTopic (TOPIC_Addon_ScoutBandits,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_ScoutBandits,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_ScoutBandits,"Tengo que averiguar para Greg a qué vinieron los bandidos a este valle.");
	
		MIS_Greg_ScoutBandits = LOG_RUNNING;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Auftraege2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_Auftraege2		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_Auftraege2_Condition;
	information	 = 	DIA_Addon_Greg_Auftraege2_Info;

	description	 = 	"¿Quieres que haga algo más?";
};

func int DIA_Addon_Greg_Auftraege2_Condition ()
{
	if (MIS_Greg_ScoutBandits != 0)
	&& (
		(C_TowerBanditsDead() == FALSE)
		|| (
				 (Npc_IsDead(BeachLurker1)== FALSE)
				&& (Npc_IsDead(BeachLurker2)== FALSE)
				&& (Npc_IsDead(BeachLurker3)== FALSE)
				&& (Npc_IsDead(BeachWaran1)== FALSE)
				&& (Npc_IsDead(BeachWaran2)== FALSE)
				&& (Npc_IsDead(BeachShadowbeast1)== FALSE)
		   )
		)
				{
					return TRUE;
				};
};

func void DIA_Addon_Greg_Auftraege2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_Auftraege2_15_00"); //¿Tienes alguna misión más para mí?

	if (Npc_IsDead(BeachLurker1)== FALSE)
	&& (Npc_IsDead(BeachLurker2)== FALSE)
	&& (Npc_IsDead(BeachLurker3)== FALSE)
	&& (Npc_IsDead(BeachWaran1)== FALSE)
	&& (Npc_IsDead(BeachWaran2)== FALSE)
	&& (Npc_IsDead(BeachShadowbeast1)== FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_01"); //La playa del norte sigue plagada de bestias.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_02"); //Parece que Morgan no ha movido un dedo.
		
		Log_CreateTopic (TOPIC_Addon_MorganBeach,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_MorganBeach,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_MorganBeach,"Greg quiere que me ocupe de la playa. Está llena de bestias y necesita una limpieza.");
		
		MIS_Addon_MorganLurker = LOG_RUNNING;
	};
	
	if	(C_TowerBanditsDead() == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_03"); //Aún quedan bandidos en la torre del  acantilado.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_04"); //Francis debería haberse ocupado de ellos.
	
		Log_CreateTopic (TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_BanditsTower,LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_BanditsTower,"Greg quiere que aleje a los bandidos de la torre sur del campamento.");
		
		MIS_Henry_FreeBDTTower = LOG_RUNNING; 
	
	};
	
	AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_05"); //Si quieres, ocúpate de eso también.
};

///////////////////////////////////////////////////////////////////////
//	Info Sauber2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_Sauber2		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_Sauber2_Condition;
	information	 = 	DIA_Addon_Greg_Sauber2_Info;

	description	 = 	"La playa del norte está despejada.";
};

func int DIA_Addon_Greg_Sauber2_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_Auftraege2))
	&& (Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (Npc_IsDead(BeachShadowbeast1))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_Sauber2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_Sauber2_15_00"); //La playa del norte está despejada.
	AI_Output	(self, other, "DIA_Addon_Greg_Sauber2_01_01"); //Genial. Toma tu recompensa.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	
	B_LogEntry	(TOPIC_Addon_MorganBeach,"He informado a Greg de que la playa del norte está limpia.");
	
	MIS_Addon_MorganLurker = LOG_SUCCESS;	
	B_GivePlayerXP (XP_Addon_Morgan_LurkerPlatt);	
};

///////////////////////////////////////////////////////////////////////
//	Info BanditPlatt2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_BanditPlatt2		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_BanditPlatt2_Condition;
	information	 = 	DIA_Addon_Greg_BanditPlatt2_Info;

	description	 = 	"Ya me he ocupado de los bandidos de la torre.";
};

func int DIA_Addon_Greg_BanditPlatt2_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_Auftraege2))
	&& (C_TowerBanditsDead() == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditPlatt2_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_BanditPlatt2_15_00"); //Ya me he ocupado de los bandidos de la torre.
	AI_Output	(self, other, "DIA_Addon_Greg_BanditPlatt2_01_01"); //Excelente. Buen trabajo. Toma tu recompensa.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);	
	
	B_LogEntry (TOPIC_Addon_BanditsTower,"Los bandidos de la torre están muertos. Greg estaba muy satisfecho.");
	
	MIS_Henry_FreeBDTTower = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Henry_FreeBDTTower);	
};



// ************************************************************
// 			  				BanditGoldmine
// ************************************************************
INSTANCE DIA_Addon_Greg_BanditGoldmine(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_BanditGoldmine_Condition;
	information	= DIA_Addon_Greg_BanditGoldmine_Info;
	permanent	= TRUE;
	description = "Los bandidos han encontrado una mina de oro.";
};                       
FUNC INT DIA_Addon_Greg_BanditGoldmine_Condition()
{
	if (SC_KnowsRavensGoldmine == TRUE)
	&& (MIS_Greg_ScoutBandits == LOG_RUNNING)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_BanditGoldmine_Info()
{	
	AI_Output (other,self,"DIA_Addon_Greg_BanditGoldmine_15_00"); //Los bandidos han encontrado una mina de oro.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_01"); //¡Lo sabía! POR ESO han venido.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_02"); //Nadie vendría porque sí a esta ciénaga infestada de monstruos.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_03"); //Buen trabajo. Toma, tengo algo para ti.
	
	B_GiveInvItems (self,other,ItRi_Addon_STR_01,1);
	
	B_LogEntry (TOPIC_Addon_ScoutBandits,"He informado a Greg sobre la mina de oro.");	
	
	MIS_Greg_ScoutBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_Greg_ScoutBandits);
};


// ************************************************************
// 			Wer bist du			  				
// ************************************************************
INSTANCE DIA_Addon_Greg_WhoAreYou(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 2;
	condition	= DIA_Addon_Greg_WhoAreYou_Condition;
	information	= DIA_Addon_Greg_WhoAreYou_Info;
	permanent	= FALSE;
	description = "¿Quién eres tú?";
};                       
FUNC INT DIA_Addon_Greg_WhoAreYou_Condition()
{
	if (PlayerTalkedToGregNW == FALSE)//Joly:WAR VOHER npc_gLOBAL -> GREG_NW
	&& (SC_MeetsGregTime == 0)//Joly:zur sicherheit
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_WhoAreYou_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Greg_WhoAreYou_15_00"); //¿Quién eres tú?
	AI_Output (self ,other,"DIA_Addon_Greg_WhoAreYou_01_01"); //Soy Greg, el líder de esta pandilla de holgazanes.
	AI_Output (self ,other,"DIA_Addon_Greg_WhoAreYou_01_02"); //¿Con eso te vale?
};

// ************************************************************
// 			  	NiceToSeeYou			
// ************************************************************
INSTANCE DIA_Addon_Greg_NiceToSeeYou(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 5;
	condition	= DIA_Addon_Greg_NiceToSeeYou_Condition;
	information	= DIA_Addon_Greg_NiceToSeeYou_Info;
	permanent	= FALSE;
	description = "¿Cómo has llegado aquí?";
};                       
FUNC INT DIA_Addon_Greg_NiceToSeeYou_Condition()
{
	if (PlayerTalkedToGregNW	 == TRUE)
	&& (MIS_Greg_ScoutBandits == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_NiceToSeeYou_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Greg_NiceToSeeYou_15_00"); //Dime, ¿cómo has llegado aquí?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_01"); //No esperabas encontrarte conmigo, ¿eh?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_02"); //Quiero que esto quede claro. Soy Greg, este es mi campamento.
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_03"); //¿Eso te vale?
};
	
// ************************************************************
// 			  	Story			
// ************************************************************
INSTANCE DIA_Addon_Greg_Story(C_INFO)
{
	npc			= PIR_1320_Addon_Greg;
	nr			= 99;
	condition	= DIA_Addon_Greg_Story_Condition;
	information	= DIA_Addon_Greg_Story_Info;
	permanent	= TRUE;
	description = "Quiero saber una cosa más.";
};                       
FUNC INT DIA_Addon_Greg_Story_Condition()
{
	if ((Npc_KnowsInfo (other,DIA_Addon_Greg_WhoAreYou) == TRUE)
	|| (Npc_KnowsInfo (other,DIA_Addon_Greg_NiceToSeeYou) == TRUE))
	&& (MIS_Greg_ScoutBandits != 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Greg_Story_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Greg_Story_15_00"); //Quiero saber una cosa más.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_01_01"); //¿El qué?
	
	Info_ClearChoices (DIA_Addon_Greg_Story);
	Info_AddChoice (DIA_Addon_Greg_Story,DIALOG_BACK,DIA_Addon_Greg_Story_Back);
	Info_AddChoice (DIA_Addon_Greg_Story,"¿Cómo has llegado hasta aquí?",DIA_Addon_Greg_Story_Way);
	Info_AddChoice (DIA_Addon_Greg_Story,"¿Dónde está tu barco?",DIA_Addon_Greg_Story_Ship);

	if (RavenIsDead == FALSE)
	{
		Info_AddChoice (DIA_Addon_Greg_Story,"¿Qué sabes acerca de Raven?",DIA_Addon_Greg_Story_Raven);
	};
};	

FUNC VOID DIA_Addon_Greg_Story_Back()
{
	Info_ClearChoices (DIA_Addon_Greg_Story);
};

FUNC VOID DIA_Addon_Greg_Story_Way()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Way_15_00"); //¿Cómo has llegado aquí?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_01"); //Encontré un túnel cerca de la antigua pirámide custodiado por unos magos.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_02"); //Simplemente despisté a esos cegatos.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_03"); //Al principio creía que era una antigua cámara funeraria y decidí ir a ver qué encontraba.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_04"); //Cuán fue mi sorpresa cuando me encontré en este increíble valle.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_05"); //Cuando pienso que hubiera tenido que pasar el resto de mi vida huyendo de la milicia.
};

FUNC VOID DIA_Addon_Greg_Story_Ship()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_00"); //¿Dónde está tu barco?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_01"); //Para que veas: durante meses no he visto ninguna embarcación navegar entre este lugar y el continente.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_02"); //¡Durante meses! Y el primer barco que me encuentro es un navío de guerra totalmente tripulado del Rey.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_03"); //Lleno de paladines, desde la quilla hasta lo alto del mástil.
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_04"); //Eso es lo que yo llamo mala suerte.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_05"); //Y que lo digas. Nos hundieron en un abrir y cerrar de ojos. Yo soy el único que llegó a tierra.
};
FUNC VOID DIA_Addon_Greg_Story_Raven()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Raven_15_00"); //¿Qué sabes sobre Raven?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_01"); //Por lo que sé, era un Magnate del Mineral. Un pez gordo en la colonia.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_02"); //No tengo ni idea de qué hace ahora aquí, ni por qué la gente lo sigue.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_03"); //Pero seguro que trama algo. No es el tipo de persona que se escondería en un pantano.
};

///////////////////////////////////////////////////////////////////////
//	Info RavenDead
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_RavenDead		(C_INFO)
{
	npc		 = 	PIR_1320_Addon_Greg;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Greg_RavenDead_Condition;
	information	 = 	DIA_Addon_Greg_RavenDead_Info;

	description	 = 	"Se acabó Raven.";
};

func int DIA_Addon_Greg_RavenDead_Condition ()
{
	if (RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_RavenDead_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_RavenDead_15_00"); //Se acabó Raven.
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_01"); //Vaya, yo… No me lo esperaba. Lo has cogido con los pantalones bajados, ¿no?
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_02"); //Algo así bien vale 500 monedas de oro.
	CreateInvItems (self, ItMi_Gold, 500);									
	B_GiveInvItems (self, other, ItMi_Gold, 500);		
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_03"); //Eres valiente. Sigue así.
	B_GivePlayerXP (XP_ADDON_GregRavenLohn);
};



