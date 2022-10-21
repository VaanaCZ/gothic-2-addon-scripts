///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Garvell_EXIT   (C_INFO)
{
	npc         = VLK_441_Garvell;
	nr          = 999;
	condition   = DIA_Garvell_EXIT_Condition;
	information = DIA_Garvell_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Garvell_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Garvell_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Garvell_PICKPOCKET (C_INFO)
{
	npc			= VLK_441_Garvell;
	nr			= 900;
	condition	= DIA_Garvell_PICKPOCKET_Condition;
	information	= DIA_Garvell_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Robar su bolsa ser�a un juego de ni�os)";
};                       

FUNC INT DIA_Garvell_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItSe_GoldPocket25) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (10 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Garvell_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Garvell_PICKPOCKET);
	Info_AddChoice		(DIA_Garvell_PICKPOCKET, DIALOG_BACK 		,DIA_Garvell_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Garvell_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Garvell_PICKPOCKET_DoIt);
};

func void DIA_Garvell_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 10)
	{
		
		B_GiveInvItems (self, other, ItSe_GoldPocket25, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Garvell_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Garvell_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Garvell_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_GREET		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_GREET_Condition;
	information	 = 	DIA_Garvell_GREET_Info;
	description	 = 	"�Qu� est�s haciendo aqu�?";
};
func int DIA_Garvell_GREET_Condition ()
{	
	if (Wld_IsTime (05,00,19,00))
	{	
			return TRUE;
	};
};
func void DIA_Garvell_GREET_Info ()
{
	AI_Output (other, self, "DIA_Garvell_GREET_15_00"); //�Qu� est�s haciendo aqu�?
	AI_Output (self, other, "DIA_Garvell_GREET_04_01"); //Construyo un barco porque quiero salir de aqu�. Lo antes que pueda.
	AI_Output (self, other, "DIA_Garvell_GREET_04_02"); //Pero, por el aspecto que tiene ahora, este barco nunca estar� acabado.
};
///////////////////////////////////////////////////////////////////////
//	Info eilig
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_eilig		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_eilig_Condition;
	information	 = 	DIA_Garvell_eilig_Info;
	description	 = 	"�Por qu� tienes tanta prisa?";
};
func int DIA_Garvell_eilig_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Garvell_GREET)
	{	
			return TRUE;
	};
};
func void DIA_Garvell_eilig_Info ()
{
	AI_Output (other, self, "DIA_Garvell_eilig_15_00"); //�Por qu� tienes tanta prisa?
	AI_Output (self, other, "DIA_Garvell_eilig_04_01"); //Pronto llegar�n los orcos y arrasar�n la ciudad.
	AI_Output (other, self, "DIA_Garvell_eilig_15_02"); //�Qu� te hace pensar eso?
	AI_Output (self, other, "DIA_Garvell_eilig_04_03"); //Chico, �no has visto a los paladines corriendo por todas partes? �Por qu� crees que est�n aqu�?
	AI_Output (self, other, "DIA_Garvell_eilig_04_04"); //Te digo que est�n aqu� porque los orcos van a atacar pronto. Y no ser� un espect�culo agradable.
};

///////////////////////////////////////////////////////////////////////
//	Info Schiff
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Schiff		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	99;
	condition	 = 	DIA_Garvell_Schiff_Condition;
	information	 = 	DIA_Garvell_Schiff_Info;
	description	 = 	"�Por qu� no puedes terminar tu barco?";
};
func int DIA_Garvell_Schiff_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Garvell_GREET)
	{	
			return TRUE;
	};
};
func void DIA_Garvell_Schiff_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Schiff_15_00"); //�Por qu� no puedes terminar tu barco?
	AI_Output (self, other, "DIA_Garvell_Schiff_04_01"); //(Quit�ndole importancia) Oh, tenemos miles de problemas. El casco a�n no es estable y le faltan montones de tablas.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_02"); //Pero casi no me queda oro con el que comprar nuevos materiales y el �ltimo env�o ten�a carcoma.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_03"); //Mis chicos no son muy productivos. Uno quiere un barco que sea sobre todo r�pido �y el otro est� preocupado por el mascar�n de proa!
	AI_Output (self, other, "DIA_Garvell_Schiff_04_04"); //�Como si no tuvi�ramos cosas m�s importantes que hacer!
	AI_Output (self, other, "DIA_Addon_Garvell_Schiff_04_00"); //Adem�s, uno de mis hombres ha dejado de venir a trabajar. Estoy empezando a temer que eso retrase a�n m�s la construcci�n.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Garvell_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_441_Garvell;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Garvell_MissingPeople_Condition;
	information	 = 	DIA_Addon_Garvell_MissingPeople_Info;

	description	 = 	"�Te falta un trabajador?";
};

func int DIA_Addon_Garvell_MissingPeople_Condition ()
{
	if Npc_KnowsInfo (other,DIA_Garvell_Schiff)
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	{	
			return TRUE;
	};
};

func void DIA_Addon_Garvell_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Garvell_MissingPeople_15_00"); //�Te falta un trabajador?
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_01"); //S�. Se llama Monty. Se lo ha tragado la tierra.
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_02"); //Ese cerdo holgaz�n estar� d�ndose la buena vida en alguna granja. No deber�a haberle pagado por adelantado.
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Garvell se queja de que su empleado Monty lleva un d�a sin aparecer en el trabajo. Garvell cree que Monty est� viviendo a lo grande con los granjeros."); 

	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "He o�do que tambi�n  ha desaparecido m�s gente.", DIA_Addon_Garvell_MissingPeople_more );
	if (SCKnowsFarimAsWilliamsFriend == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "�Cu�ndo fue la �ltima vez que viste a Monty?", DIA_Addon_Garvell_MissingPeople_wo );
	};
};
func void DIA_Addon_Garvell_MissingPeople_more ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_more_15_00"); //He o�do que tambi�n  ha desaparecido m�s gente.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_01"); //Lo que yo dec�a. As� empieza la semilla del mal.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_02"); //Farim, el pescador, me cont� algo parecido. Su amigo William ya no est�.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_03"); //Apuesto a que los orcos andan detr�s de esto.
	SCKnowsFarimAsWilliamsFriend = TRUE;

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"El pescador Farim parece saber algo de la desaparici�n de su amigo William."); 
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 

	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, DIALOG_BACK, DIA_Addon_Garvell_MissingPeople_BACK );

	if (Farim.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "�D�nde puedo encontrar a Farim?", DIA_Addon_Garvell_MissingPeople_Farim );
	};
};
func void DIA_Addon_Garvell_MissingPeople_BACK ()
{
	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
};
func void DIA_Addon_Garvell_MissingPeople_Farim ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_Farim_15_00"); //�D�nde puedo encontrar a Farim?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_Farim_04_01"); //Es pescador. Creo que su caba�a est� cerca de la tienda de provisiones de los paladines, pero no estoy seguro.

	B_LogEntry (TOPIC_Addon_WhoStolePeople,"La caba�a de Farim est� cerca del almac�n de los paladines."); 
};
func void DIA_Addon_Garvell_MissingPeople_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_wo_15_00"); //�Cu�ndo fue la �ltima vez que viste a Monty?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_wo_04_01"); //(enfadado) Lleva sin aparecer en el trabajo por lo menos dos d�as.
};
///////////////////////////////////////////////////////////////////////
//	Info ReturnMonty
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_ReturnMonty		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	99;
	condition	 = 	DIA_Garvell_ReturnMonty_Condition;
	information	 = 	DIA_Garvell_ReturnMonty_Info;
	description	 = 	"�Y qu� tal todo AHORA?";
};
func int DIA_Garvell_ReturnMonty_Condition ()
{	
	if (Npc_GetDistToWP (Monty_NW, "NW_CITY_HABOUR_WERFT_IN_01") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Garvell_ReturnMonty_Info ()
{
	AI_Output (other, self, "DIA_Addon_Garvell_ReturnMonty_15_00"); //�Y qu� tal todo AHORA?
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_01"); //�Monty ha vuelto! Ha estado ocupado estudiando los planos.
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_02"); //Quiz� ahora podamos construir el barco
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info MISSION
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_MISSION		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_MISSION_Condition;
	information	 = 	DIA_Garvell_MISSION_Info;
	permanent    =  FALSE;
	description	 = 	"�Puedo ayudarte de alguna manera?";
};

func int DIA_Garvell_MISSION_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Garvell_eilig)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Garvell_MISSION_Info ()
{
	AI_Output (other, self, "DIA_Garvell_MISSION_15_00"); //�Puedo ayudarte de alguna forma?
	AI_Output (self, other, "DIA_Garvell_MISSION_04_01"); //S� que puedes. Averigua lo que planean los paladines. Quiero saber por qu� est�n aqu�.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_02"); //Y tengo que saber si los orcos van a atacar y a qu� distancia de la ciudad est�n.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_03"); //Uno de los bastardos fue avistado justo fuera de la ciudad.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_04"); //Basta con que me traigas toda la informaci�n que puedas obtener.
	AI_Output (self ,other, "DIA_Garvell_Add_04_00"); //Necesito saber cu�nto tiempo me queda para terminar el barco.

	MIS_Garvell_Infos = LOG_RUNNING;
	Knows_Ork = TRUE;
	
	Log_CreateTopic (TOPIC_Garvell,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Garvell,LOG_RUNNING);
	B_LogEntry (TOPIC_Garvell,"Garvell quiere informaci�n de los orcos, adem�s de saber por qu� est�n los paladines en la ciudad.");
};
FUNC VOID B_GarvellWeiter()
{
	AI_Output (self, other, "DIA_Garvell_Weiter_04_00"); //Vale. Si te enteras de m�s, av�same.
};
FUNC VOID B_GarvellSuccess()
{
	AI_Output (self, other, "DIA_Garvell_Success_04_00"); //Gracias por la informaci�n. Por lo que parece, tenemos todo el tiempo del mundo para construir nuestro barco.
	MIS_Garvell_Infos = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info Orks
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Orks		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	3;
	condition	 = 	DIA_Garvell_Orks_Condition;
	information	 = 	DIA_Garvell_Orks_Info;
	permanent    =  FALSE;
	description	 = 	"Tengo cierta informaci�n sobre los orcos.";
};
func int DIA_Garvell_Orks_Condition ()
{	
	if (MIS_Garvell_Infos == LOG_RUNNING)
	&& (Knows_Paladins >= 1)
	{
		return TRUE;
	};
};
func void DIA_Garvell_Orks_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Orks_15_00"); //Tengo cierta informaci�n sobre los orcos.
	AI_Output (self, other, "DIA_Garvell_Orks_04_01"); //Oig�mosla.
	AI_Output (other, self, "DIA_Garvell_Orks_15_02"); //Est�n bloqueados en el Valle de las Minas y parece que van a seguir ah�.
	AI_Output (other, self, "DIA_Garvell_Orks_15_03"); //Para asegurarse, los paladines est�n vigilando el paso.

	Tell_Garvell = (Tell_Garvell +1);
	B_GivePlayerXP (XP_Ambient);
	
	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Orks
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Paladine		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	2;
	condition	 = 	DIA_Garvell_Paladine_Condition;
	information	 = 	DIA_Garvell_Paladine_Info;
	permanent    =  FALSE;
	description	 = 	"S� por qu� los paladines est�n aqu�.";
};
func int DIA_Garvell_Paladine_Condition ()
{	
	if (MIS_Garvell_Infos == LOG_RUNNING)
	&& (KnowsPaladins_Ore == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Garvell_Paladine_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Paladine_15_00"); //S� por qu� los paladines est�n aqu�.
	AI_Output (self, other, "DIA_Garvell_Paladine_04_01"); //�En serio? �Cu�ntame!
	AI_Output (other, self, "DIA_Garvell_Paladine_15_02"); //Los paladines est�n aqu� para hacerse con el mineral m�gico del Valle de las Minas, no porque esperen que los orcos vayan a atacar la ciudad.
	AI_Output (other, self, "DIA_Garvell_Paladine_15_03"); //En cuanto tengan el mineral, volver�n al continente.

	Tell_Garvell = (Tell_Garvell +1);
	B_GivePlayerXP (XP_Ambient);
	
	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Ork vor der Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_City		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	4;
	condition	 = 	DIA_Garvell_City_Condition;
	information	 = 	DIA_Garvell_City_Info;
	permanent    =  FALSE;
	description	 = 	"Y en cuanto a ese orco en el exterior de la ciudad...";
};
func int DIA_Garvell_City_Condition ()
{	
	if (MIS_Garvell_Infos == LOG_RUNNING)
	&& (Knows_Paladins >= 2)
	{
		return TRUE;
	};
};
func void DIA_Garvell_City_Info ()
{
	AI_Output (other, self, "DIA_Garvell_City_15_00"); //Y en cuanto a ese orco en el exterior de la ciudad...
	AI_Output (self, other, "DIA_Garvell_City_04_01"); //�S�...?
	AI_Output (other, self, "DIA_Garvell_City_15_02"); //No te preocupes por �l. La guardia de la ciudad se ocupar� del tema.
	

	Tell_Garvell = (Tell_Garvell +1);
	B_GivePlayerXP (XP_Ambient);
	
	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Perm		(C_INFO)
{
	npc			 = 	VLK_441_Garvell;
	nr			 = 	13;
	condition	 = 	DIA_Garvell_Perm_Condition;
	information	 = 	DIA_Garvell_Perm_Info;
	permanent    =  TRUE;
	description	 = 	"�Qu� ocurre en el puerto?";
};
func int DIA_Garvell_Perm_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Garvell_MISSION)
	{
		return TRUE;
	};
};
func void DIA_Garvell_Perm_Info ()
{
	AI_Output (other, self, "DIA_Garvell_Perm_15_00"); //�Qu� ocurre en el puerto?
	
	if (MIS_Garvell_Infos != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_01"); //Tenemos a los orcos respir�ndonos en el cogote y �t� preguntas por el puerto?
		AI_Output (other, self, "DIA_Garvell_Perm_15_02"); //Solo quer�a...
		AI_Output (self, other, "DIA_Garvell_Perm_04_03"); //El mayor problema que tenemos es que no hay barcos suficientes en el puerto para sacarnos de aqu�.
		AI_Output (self, other, "DIA_Garvell_Perm_04_04"); //Para ser honesto, solo hay un barco aqu�, y pertenece a los paladines. Evidentemente, no van a dejarnos salir de aqu� con �l.
	}
	else
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_05"); //Mira a tu alrededor. Aqu� no pasa nada.
	};
};























