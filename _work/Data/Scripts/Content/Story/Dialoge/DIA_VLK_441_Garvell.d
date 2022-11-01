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
	description = "(Robar su bolsa sería un juego de niños)";
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
	description	 = 	"¿Qué estás haciendo aquí?";
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
	AI_Output (other, self, "DIA_Garvell_GREET_15_00"); //¿Qué estás haciendo aquí?
	AI_Output (self, other, "DIA_Garvell_GREET_04_01"); //Construyo un barco porque quiero salir de aquí. Lo antes que pueda.
	AI_Output (self, other, "DIA_Garvell_GREET_04_02"); //Pero, por el aspecto que tiene ahora, este barco nunca estará acabado.
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
	description	 = 	"¿Por qué tienes tanta prisa?";
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
	AI_Output (other, self, "DIA_Garvell_eilig_15_00"); //¿Por qué tienes tanta prisa?
	AI_Output (self, other, "DIA_Garvell_eilig_04_01"); //Pronto llegarán los orcos y arrasarán la ciudad.
	AI_Output (other, self, "DIA_Garvell_eilig_15_02"); //¿Qué te hace pensar eso?
	AI_Output (self, other, "DIA_Garvell_eilig_04_03"); //Chico, ¿no has visto a los paladines corriendo por todas partes? ¿Por qué crees que están aquí?
	AI_Output (self, other, "DIA_Garvell_eilig_04_04"); //Te digo que están aquí porque los orcos van a atacar pronto. Y no será un espectáculo agradable.
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
	description	 = 	"¿Por qué no puedes terminar tu barco?";
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
	AI_Output (other, self, "DIA_Garvell_Schiff_15_00"); //¿Por qué no puedes terminar tu barco?
	AI_Output (self, other, "DIA_Garvell_Schiff_04_01"); //(Quitándole importancia) Oh, tenemos miles de problemas. El casco aún no es estable y le faltan montones de tablas.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_02"); //Pero casi no me queda oro con el que comprar nuevos materiales y el último envío tenía carcoma.
	AI_Output (self, other, "DIA_Garvell_Schiff_04_03"); //Mis chicos no son muy productivos. Uno quiere un barco que sea sobre todo rápido ¡y el otro está preocupado por el mascarón de proa!
	AI_Output (self, other, "DIA_Garvell_Schiff_04_04"); //¡Como si no tuviéramos cosas más importantes que hacer!
	AI_Output (self, other, "DIA_Addon_Garvell_Schiff_04_00"); //Además, uno de mis hombres ha dejado de venir a trabajar. Estoy empezando a temer que eso retrase aún más la construcción.
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

	description	 = 	"¿Te falta un trabajador?";
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
	AI_Output	(other, self, "DIA_Addon_Garvell_MissingPeople_15_00"); //¿Te falta un trabajador?
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_01"); //Sí. Se llama Monty. Se lo ha tragado la tierra.
	AI_Output	(self, other, "DIA_Addon_Garvell_MissingPeople_04_02"); //Ese cerdo holgazán estará dándose la buena vida en alguna granja. No debería haberle pagado por adelantado.
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Garvell se queja de que su empleado Monty lleva un día sin aparecer en el trabajo. Garvell cree que Monty está viviendo a lo grande con los granjeros."); 

	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "He oído que también  ha desaparecido más gente.", DIA_Addon_Garvell_MissingPeople_more );
	if (SCKnowsFarimAsWilliamsFriend == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "¿Cuándo fue la última vez que viste a Monty?", DIA_Addon_Garvell_MissingPeople_wo );
	};
};
func void DIA_Addon_Garvell_MissingPeople_more ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_more_15_00"); //He oído que también  ha desaparecido más gente.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_01"); //Lo que yo decía. Así empieza la semilla del mal.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_02"); //Farim, el pescador, me contó algo parecido. Su amigo William ya no está.
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_03"); //Apuesto a que los orcos andan detrás de esto.
	SCKnowsFarimAsWilliamsFriend = TRUE;

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"El pescador Farim parece saber algo de la desaparición de su amigo William."); 
	
	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 

	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, DIALOG_BACK, DIA_Addon_Garvell_MissingPeople_BACK );

	if (Farim.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	Info_AddChoice	(DIA_Addon_Garvell_MissingPeople, "¿Dónde puedo encontrar a Farim?", DIA_Addon_Garvell_MissingPeople_Farim );
	};
};
func void DIA_Addon_Garvell_MissingPeople_BACK ()
{
	Info_ClearChoices	(DIA_Addon_Garvell_MissingPeople);
};
func void DIA_Addon_Garvell_MissingPeople_Farim ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_Farim_15_00"); //¿Dónde puedo encontrar a Farim?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_Farim_04_01"); //Es pescador. Creo que su cabaña está cerca de la tienda de provisiones de los paladines, pero no estoy seguro.

	B_LogEntry (TOPIC_Addon_WhoStolePeople,"La cabaña de Farim está cerca del almacén de los paladines."); 
};
func void DIA_Addon_Garvell_MissingPeople_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Garvell_MissingPeople_wo_15_00"); //¿Cuándo fue la última vez que viste a Monty?
	AI_Output			(self, other, "DIA_Addon_Garvell_MissingPeople_wo_04_01"); //(enfadado) Lleva sin aparecer en el trabajo por lo menos dos días.
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
	description	 = 	"¿Y qué tal todo AHORA?";
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
	AI_Output (other, self, "DIA_Addon_Garvell_ReturnMonty_15_00"); //¿Y qué tal todo AHORA?
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_01"); //¡Monty ha vuelto! Ha estado ocupado estudiando los planos.
	AI_Output (self, other, "DIA_Addon_Garvell_ReturnMonty_04_02"); //Quizá ahora podamos construir el barco
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
	description	 = 	"¿Puedo ayudarte de alguna manera?";
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
	AI_Output (other, self, "DIA_Garvell_MISSION_15_00"); //¿Puedo ayudarte de alguna forma?
	AI_Output (self, other, "DIA_Garvell_MISSION_04_01"); //Sí que puedes. Averigua lo que planean los paladines. Quiero saber por qué están aquí.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_02"); //Y tengo que saber si los orcos van a atacar y a qué distancia de la ciudad están.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_03"); //Uno de los bastardos fue avistado justo fuera de la ciudad.
	AI_Output (self, other, "DIA_Garvell_MISSION_04_04"); //Basta con que me traigas toda la información que puedas obtener.
	AI_Output (self ,other, "DIA_Garvell_Add_04_00"); //Necesito saber cuánto tiempo me queda para terminar el barco.

	MIS_Garvell_Infos = LOG_RUNNING;
	Knows_Ork = TRUE;
	
	Log_CreateTopic (TOPIC_Garvell,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Garvell,LOG_RUNNING);
	B_LogEntry (TOPIC_Garvell,"Garvell quiere información de los orcos, además de saber por qué están los paladines en la ciudad.");
};
FUNC VOID B_GarvellWeiter()
{
	AI_Output (self, other, "DIA_Garvell_Weiter_04_00"); //Vale. Si te enteras de más, avísame.
};
FUNC VOID B_GarvellSuccess()
{
	AI_Output (self, other, "DIA_Garvell_Success_04_00"); //Gracias por la información. Por lo que parece, tenemos todo el tiempo del mundo para construir nuestro barco.
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
	description	 = 	"Tengo cierta información sobre los orcos.";
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
	AI_Output (other, self, "DIA_Garvell_Orks_15_00"); //Tengo cierta información sobre los orcos.
	AI_Output (self, other, "DIA_Garvell_Orks_04_01"); //Oigámosla.
	AI_Output (other, self, "DIA_Garvell_Orks_15_02"); //Están bloqueados en el Valle de las Minas y parece que van a seguir ahí.
	AI_Output (other, self, "DIA_Garvell_Orks_15_03"); //Para asegurarse, los paladines están vigilando el paso.

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
	description	 = 	"Sé por qué los paladines están aquí.";
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
	AI_Output (other, self, "DIA_Garvell_Paladine_15_00"); //Sé por qué los paladines están aquí.
	AI_Output (self, other, "DIA_Garvell_Paladine_04_01"); //¿En serio? ¡Cuéntame!
	AI_Output (other, self, "DIA_Garvell_Paladine_15_02"); //Los paladines están aquí para hacerse con el mineral mágico del Valle de las Minas, no porque esperen que los orcos vayan a atacar la ciudad.
	AI_Output (other, self, "DIA_Garvell_Paladine_15_03"); //En cuanto tengan el mineral, volverán al continente.

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
	AI_Output (self, other, "DIA_Garvell_City_04_01"); //¿Sí...?
	AI_Output (other, self, "DIA_Garvell_City_15_02"); //No te preocupes por él. La guardia de la ciudad se ocupará del tema.
	

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
	description	 = 	"¿Qué ocurre en el puerto?";
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
	AI_Output (other, self, "DIA_Garvell_Perm_15_00"); //¿Qué ocurre en el puerto?
	
	if (MIS_Garvell_Infos != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_01"); //Tenemos a los orcos respirándonos en el cogote y ¿tú preguntas por el puerto?
		AI_Output (other, self, "DIA_Garvell_Perm_15_02"); //Solo quería...
		AI_Output (self, other, "DIA_Garvell_Perm_04_03"); //El mayor problema que tenemos es que no hay barcos suficientes en el puerto para sacarnos de aquí.
		AI_Output (self, other, "DIA_Garvell_Perm_04_04"); //Para ser honesto, solo hay un barco aquí, y pertenece a los paladines. Evidentemente, no van a dejarnos salir de aquí con él.
	}
	else
	{
		AI_Output (self, other, "DIA_Garvell_Perm_04_05"); //Mira a tu alrededor. Aquí no pasa nada.
	};
};























