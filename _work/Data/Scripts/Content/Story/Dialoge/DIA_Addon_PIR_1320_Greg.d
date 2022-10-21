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
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_00"); //(amenazante) Eh, t�. �Qu� est�s haciendo en mi caba�a?
	AI_Output (other,self,"DIA_Addon_Greg_Hello_15_01"); //Yo
	AI_Output (self,other,"DIA_Addon_Greg_Hello_01_02"); //(furioso) Me marcho un par de d�as y todos se piensan que pueden hacer lo que les salga de las narices.
	//AI_Output (other,self,"DIA_Addon_Greg_ImNew_15_00"); //Ich bin der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_01"); //(zynisch) So so, du bist der Neue.
	//AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_02"); //Hier entscheide immer noch ICH, wer bei uns mitmacht.
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_03"); //�Qu� demonios est� pasando aqu�?
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_04"); //�La empalizada no est� a�n acabada? El ca��n est� a rebosar de bestias y la gente por ah�, pasando el rato.
		
	GregIsBack = TRUE;
	
	if (!Npc_IsDead (Francis))
	{
		AI_TurnToNpc (self, Francis);
		AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_05"); //(en alto) �Esto es todo lo que has conseguido, Francis?
		
		if (C_BodyStateContains (Francis, BS_SIT))
		{
			AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_06"); //(en alto) �Largo de mi banco de inmediato!
		};
	};
	
	Npc_ExchangeRoutine	(self,"HOME");
	AI_TurnToNpc (self, other);
	AI_Output (self,other,"DIA_Addon_Greg_ImNew_01_07"); //�Y T�? �T� qu� has hecho?
	
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
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_02"); //Te has quedado con todo, �no es as�?
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_03"); //Te voy a hacer trabajar hasta pagarme todo con sudor.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Greg_UseRakeBilanz_01_04"); //Te voy a ense�ar lo que es trabajar de verdad.
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
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_nich_01_01"); //Tranquilo. Te encontrar� algo adecuado, amigo.
	B_UseRakeBilanz ();
};
func void DIA_Addon_Greg_ImNew_turm ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_ImNew_turm_15_00"); //He estado trabajando.
	AI_Output			(self, other, "DIA_Addon_Greg_ImNew_turm_01_01"); //�En serio? �Y qu�?

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
	description = "�Qu� hay que hacer?";
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
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_15_00"); //�Qu� tengo que hacer?
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_01"); //En primer lugar, vamos a poner esto en marcha.

	if ((Npc_IsDead(Morgan))== FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_02"); //Morgan, ese puerco perezoso, va a serrar tablas.
	};
	
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_01_03"); //T� te ocupar�s del trabajo de Morgan y limpiar�s el ca��n de esas malditas bestias.
	
	MIS_Addon_Greg_ClearCanyon = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_ClearCanyon,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Addon_ClearCanyon,LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg quiere que me ocupe del cargo de Morgan y despeje el ca��n de bestias.");

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"Entonces voy a empezar.",DIA_Addon_Greg_JoinPirates_Leave);

	if (((Npc_IsDead(Brandon))== FALSE)
	|| ((Npc_IsDead(Matt))== FALSE))
	{
		Info_AddChoice (DIA_Addon_Greg_JoinPirates,"�Se supone que debo hacerlo solo?",DIA_Addon_Greg_JoinPirates_Compadres);
	};

	Info_AddChoice (DIA_Addon_Greg_JoinPirates,"�Qu� bestias?",DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output (other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00"); //Entonces voy a empezar.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01"); //Una cosa m�s. Ahora eres de los nuestros.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02"); //As� que lo primero, b�scate un traje de caza decente.
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03"); //Aqu� tienes armaduras nuestras. Espero que te valgan.
	CreateInvItems (self, ItAr_Pir_M_Addon, 1);									
	B_GiveInvItems (self, other, ItAr_Pir_M_Addon, 1);		
	AI_EquipArmor(hero,ItAr_Pir_M_Addon);
	AI_Output (self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04"); //Y no te entretengas. �Al ataque!
	

	Info_ClearChoices (DIA_Addon_Greg_JoinPirates);
};

FUNC VOID DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_Compadres_15_00"); //�Se supone que debo hacerlo solo?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01"); //Adelante, coge a algunos de los chicos.
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02"); //Que se ganen su paga, en vez de holgazanear todo el d�a.

	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg dice que puedo llevarme a un par de hombres conmigo.");
};

FUNC VOID DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output (other,self ,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00"); //�Qu� bestias?
	AI_Output (self ,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01"); //Las cuchillas del ca��n se acercan cada vez m�s a nuestro campamento.
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
	description = "Sobre ese ca��n�";
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
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_15_00"); //Sobre ese ca��n
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_01_01"); //S�, dime.
	
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
	if (C_AllCanyonRazorDead() == FALSE)
	{
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,DIALOG_BACK,DIA_Addon_Greg_AboutCanyon_Back);	
		if (((Npc_IsDead(Brandon))== FALSE)
		|| ((Npc_IsDead(Matt))== FALSE))
		{
			Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"�Qui�n podr�a ayudarme?",DIA_Addon_Greg_AboutCanyon_Compadres);
		};
		Info_AddChoice (DIA_Addon_Greg_AboutCanyon,"�Qu� bestias son las que tengo que matar?",DIA_Addon_Greg_AboutCanyon_Job);
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
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00"); //�Qui�n podr�a ayudarme?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01"); //Ll�vate a algunos  hombres.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02"); //Normalmente, no hacen m�s que el vago.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_Job_15_00"); //�Qu� bestias son las que tengo que matar?
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01"); //�Deshazte de las cuchillas! Las otras criaturas son inofensivas.
	Info_ClearChoices (DIA_Addon_Greg_AboutCanyon);
};

FUNC VOID DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output (other,self ,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00"); //He matado a todas las cuchillas.
	AI_Output (self ,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01"); //Bien. Eres un buen fichaje.
	
	B_LogEntry (TOPIC_Addon_ClearCanyon,"Greg parece impresionado de que haya matado a las cuchillas del ca��n.");
	
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
			AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_02"); //�En primer lugar, mata a todas las cuchillas del ca��n!
		};
		
		B_LogEntry (TOPIC_Addon_BDTRuestung,"Greg quiere que le ayude a dar algo de vida al campamento. Despu�s, le hablar� de la armadura."); 
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_03"); //�Eh, no eres un tipo cualquiera!
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_04"); //Se supon�a que Bones deb�a ponerse esa armadura y espiar a los bandidos.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_05"); //Pero quiz� T� seas m�s adecuado para el trabajo.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_06"); //Tal vez consigas incluso salir con vida.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_07"); //Habla con Bones y dile que te d� la armadura. Luego p�ntela y ve al campamento de los bandidos.
		AI_Output (self,other,"DIA_Addon_Greg_BanditArmor_01_08"); //Quiero saber a qu� ha venido esa escoria a nuestro valle.
		AI_Output (other,self,"DIA_Addon_Greg_BanditArmor_15_09"); //�S�, capit�n!
	
		B_LogEntry (TOPIC_Addon_BDTRuestung,"Cuando termine con las cuchillas del campamento de Greg, me quedar� la armadura de Bones."); 
	
		Log_CreateTopic (TOPIC_Addon_ScoutBandits,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_ScoutBandits,LOG_RUNNING);
		B_LogEntry	(TOPIC_Addon_ScoutBandits,"Tengo que averiguar para Greg a qu� vinieron los bandidos a este valle.");
	
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

	description	 = 	"�Quieres que haga algo m�s?";
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
	AI_Output	(other, self, "DIA_Addon_Greg_Auftraege2_15_00"); //�Tienes alguna misi�n m�s para m�?

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
		B_LogEntry	(TOPIC_Addon_MorganBeach,"Greg quiere que me ocupe de la playa. Est� llena de bestias y necesita una limpieza.");
		
		MIS_Addon_MorganLurker = LOG_RUNNING;
	};
	
	if	(C_TowerBanditsDead() == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_03"); //A�n quedan bandidos en la torre del  acantilado.
		AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_04"); //Francis deber�a haberse ocupado de ellos.
	
		Log_CreateTopic (TOPIC_Addon_BanditsTower,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_Addon_BanditsTower,LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_BanditsTower,"Greg quiere que aleje a los bandidos de la torre sur del campamento.");
		
		MIS_Henry_FreeBDTTower = LOG_RUNNING; 
	
	};
	
	AI_Output	(self, other, "DIA_Addon_Greg_Auftraege2_01_05"); //Si quieres, oc�pate de eso tambi�n.
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

	description	 = 	"La playa del norte est� despejada.";
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
	AI_Output	(other, self, "DIA_Addon_Greg_Sauber2_15_00"); //La playa del norte est� despejada.
	AI_Output	(self, other, "DIA_Addon_Greg_Sauber2_01_01"); //Genial. Toma tu recompensa.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	
	B_LogEntry	(TOPIC_Addon_MorganBeach,"He informado a Greg de que la playa del norte est� limpia.");
	
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
	
	B_LogEntry (TOPIC_Addon_BanditsTower,"Los bandidos de la torre est�n muertos. Greg estaba muy satisfecho.");
	
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
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_01"); //�Lo sab�a! POR ESO han venido.
	AI_Output (self,other,"DIA_Addon_Greg_BanditGoldmine_01_02"); //Nadie vendr�a porque s� a esta ci�naga infestada de monstruos.
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
	description = "�Qui�n eres t�?";
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
	AI_Output (other,self ,"DIA_Addon_Greg_WhoAreYou_15_00"); //�Qui�n eres t�?
	AI_Output (self ,other,"DIA_Addon_Greg_WhoAreYou_01_01"); //Soy Greg, el l�der de esta pandilla de holgazanes.
	AI_Output (self ,other,"DIA_Addon_Greg_WhoAreYou_01_02"); //�Con eso te vale?
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
	description = "�C�mo has llegado aqu�?";
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
	AI_Output (other,self ,"DIA_Addon_Greg_NiceToSeeYou_15_00"); //Dime, �c�mo has llegado aqu�?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_01"); //No esperabas encontrarte conmigo, �eh?
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_02"); //Quiero que esto quede claro. Soy Greg, este es mi campamento.
	AI_Output (self ,other,"DIA_Addon_Greg_NiceToSeeYou_01_03"); //�Eso te vale?
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
	description = "Quiero saber una cosa m�s.";
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
	AI_Output (other,self ,"DIA_Addon_Greg_Story_15_00"); //Quiero saber una cosa m�s.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_01_01"); //�El qu�?
	
	Info_ClearChoices (DIA_Addon_Greg_Story);
	Info_AddChoice (DIA_Addon_Greg_Story,DIALOG_BACK,DIA_Addon_Greg_Story_Back);
	Info_AddChoice (DIA_Addon_Greg_Story,"�C�mo has llegado hasta aqu�?",DIA_Addon_Greg_Story_Way);
	Info_AddChoice (DIA_Addon_Greg_Story,"�D�nde est� tu barco?",DIA_Addon_Greg_Story_Ship);

	if (RavenIsDead == FALSE)
	{
		Info_AddChoice (DIA_Addon_Greg_Story,"�Qu� sabes acerca de Raven?",DIA_Addon_Greg_Story_Raven);
	};
};	

FUNC VOID DIA_Addon_Greg_Story_Back()
{
	Info_ClearChoices (DIA_Addon_Greg_Story);
};

FUNC VOID DIA_Addon_Greg_Story_Way()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Way_15_00"); //�C�mo has llegado aqu�?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_01"); //Encontr� un t�nel cerca de la antigua pir�mide custodiado por unos magos.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_02"); //Simplemente despist� a esos cegatos.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_03"); //Al principio cre�a que era una antigua c�mara funeraria y decid� ir a ver qu� encontraba.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_04"); //Cu�n fue mi sorpresa cuando me encontr� en este incre�ble valle.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Way_01_05"); //Cuando pienso que hubiera tenido que pasar el resto de mi vida huyendo de la milicia.
};

FUNC VOID DIA_Addon_Greg_Story_Ship()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_00"); //�D�nde est� tu barco?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_01"); //Para que veas: durante meses no he visto ninguna embarcaci�n navegar entre este lugar y el continente.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_02"); //�Durante meses! Y el primer barco que me encuentro es un nav�o de guerra totalmente tripulado del Rey.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_03"); //Lleno de paladines, desde la quilla hasta lo alto del m�stil.
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Ship_15_04"); //Eso es lo que yo llamo mala suerte.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Ship_01_05"); //Y que lo digas. Nos hundieron en un abrir y cerrar de ojos. Yo soy el �nico que lleg� a tierra.
};
FUNC VOID DIA_Addon_Greg_Story_Raven()
{
	AI_Output (other,self ,"DIA_Addon_Greg_Story_Raven_15_00"); //�Qu� sabes sobre Raven?
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_01"); //Por lo que s�, era un Magnate del Mineral. Un pez gordo en la colonia.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_02"); //No tengo ni idea de qu� hace ahora aqu�, ni por qu� la gente lo sigue.
	AI_Output (self ,other,"DIA_Addon_Greg_Story_Raven_01_03"); //Pero seguro que trama algo. No es el tipo de persona que se esconder�a en un pantano.
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

	description	 = 	"Se acab� Raven.";
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
	AI_Output	(other, self, "DIA_Addon_Greg_RavenDead_15_00"); //Se acab� Raven.
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_01"); //Vaya, yo� No me lo esperaba. Lo has cogido con los pantalones bajados, �no?
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_02"); //Algo as� bien vale 500 monedas de oro.
	CreateInvItems (self, ItMi_Gold, 500);									
	B_GiveInvItems (self, other, ItMi_Gold, 500);		
	AI_Output	(self, other, "DIA_Addon_Greg_RavenDead_01_03"); //Eres valiente. Sigue as�.
	B_GivePlayerXP (XP_ADDON_GregRavenLohn);
};



