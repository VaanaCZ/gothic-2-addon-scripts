///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_EXIT   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 999;
	condition   = DIA_Ignaz_EXIT_Condition;
	information = DIA_Ignaz_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ignaz_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ignaz_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ignaz_PICKPOCKET (C_INFO)
{
	npc			= VLK_498_Ignaz;
	nr			= 900;
	condition	= DIA_Ignaz_PICKPOCKET_Condition;
	information	= DIA_Ignaz_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Ignaz_PICKPOCKET_Condition()
{
	C_Beklauen (38, 50);
};
 
FUNC VOID DIA_Ignaz_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ignaz_PICKPOCKET);
	Info_AddChoice		(DIA_Ignaz_PICKPOCKET, DIALOG_BACK 		,DIA_Ignaz_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ignaz_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ignaz_PICKPOCKET_DoIt);
};

func void DIA_Ignaz_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ignaz_PICKPOCKET);
};
	
func void DIA_Ignaz_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ignaz_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Hallo   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 2;
	condition   = DIA_Ignaz_Hallo_Condition;
	information = DIA_Ignaz_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Ignaz_Hallo_Condition()
{
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Hallo_Info()
{
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_00");//Ah, has llegado a tiempo. Necesito un ayudante para un experimento m�gico.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_01");//Estoy seguro de que deseas hacerme un favor en aras de la ciencia.
	AI_Output (other, self, "DIA_Ignaz_Hallo_15_02");//Tranquilo, amigo. Primero dime de qu� va todo esto.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_03");//He desarrollado un nuevo conjuro. Un conjuro de olvido.
	AI_Output (self, other, "DIA_Ignaz_Hallo_14_04");//Ya he realizado con �xito unas cuantas aplicaciones pr�cticas, pero no tengo tiempo para realizar la prueba definitiva.
};
///////////////////////////////////////////////////////////////////////
//	Info Lerninhalte Traenke
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Traenke   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 3;
	condition   = DIA_Ignaz_Traenke_Condition;
	information = DIA_Ignaz_Traenke_Info;
	permanent   = FALSE;
	description = "�Qu� obtengo yo si te ayudo?";
};

FUNC INT DIA_Ignaz_Traenke_Condition()
{	
	if (MIS_Ignaz_Charm != LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Traenke_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Traenke_15_00");//�Qu� obtengo yo si te ayudo?
	AI_Output (self, other, "DIA_Ignaz_Traenke_14_01");//Podr�a ense�arte a hacer pociones.
	AI_Output (self, other, "DIA_Ignaz_Traenke_14_02");//Conozco las recetas de esencias curativas y de man� y de pociones de velocidad.
	//AI_Output (self, other, "DIA_Ignaz_Traenke_14_03");//Au�erdem kann ich dir beibringen, wie du ein Elixier der Geschicklichkeit herstellst.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Experiment
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Experiment   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 4;
	condition   = DIA_Ignaz_Experiment_Condition;
	information = DIA_Ignaz_Experiment_Info;
	permanent   = FALSE;
	description = "Cu�ntame m�s sobre el experimento y el hechizo.";
};

FUNC INT DIA_Ignaz_Experiment_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Ignaz_Experiment_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Experiment_15_00");//Cu�ntame m�s sobre el experimento y el conjuro.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_01");//El conjuro sirve para hacer que alguien olvide varios eventos.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_02");//Hasta ahora solo he conseguido que funcione cuando la persona en cuesti�n est� enfadada. Por ejemplo, cuando acaba de ser golpeada o robada.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_03");//Incluso aunque solo haya presenciado dicho acto, lo borrar� de su memoria.
	AI_Output (other, self, "DIA_Ignaz_Experiment_15_04");//�Entonces se supone que debo tumbar a alguien y luego hechizarlo?
	AI_Output (other, self, "DIA_Ignaz_Add_15_00"); //Eso tendr�a sentido s�lo si siguiera furioso DE VERDAD despu�s de aporrearlo.
	AI_Output (other, self, "DIA_Ignaz_Add_15_01"); //(para s�) Pero las peleas son algo frecuente en la zona del puerto. Supongo que deber�a  buscar a mi v�ctima en otro lugar
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_05");//S�, creo que lo has comprendido. Pero para hacer que alguien se enfade, basta con atacarlo. No hace falta que lo tumbes.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_06");//As� que debes encontrar a alguien que est� solo. Si hay otros alrededor, te meter�s en problemas con lord Andre.
	AI_Output (self, other, "DIA_Ignaz_Experiment_14_07");//Adem�s, no tiene sentido lanzar el conjuro sobre alguien que est� justo atac�ndote. Espera al momento adecuado.
};	
///////////////////////////////////////////////////////////////////////
//	Info teilnhemen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_teilnehmen   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 5;
	condition   = DIA_Ignaz_teilnehmen_Condition;
	information = DIA_Ignaz_teilnehmen_Info;
	permanent   = FALSE;
	description = "Muy bien, probar� ese hechizo.";
};

FUNC INT DIA_Ignaz_teilnehmen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Ignaz_Experiment)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_teilnehmen_Info()
{
	AI_Output (other, self, "DIA_Ignaz_teilnehmen_15_00");//Muy bien, probar� ese conjuro.
	AI_Output (self, other, "DIA_Ignaz_teilnehmen_14_01");//Pues toma este pergamino de conjuro y encuentra un conejillo de indias adecuado.
	AI_Output (self, other, "DIA_Ignaz_teilnehmen_14_02");//Cuando hayas terminado, regresa y me cuentas c�mo ha ido.
	
	B_GiveInvItems (self, other, ITSC_Charm,1);
	MIS_Ignaz_Charm = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Ignaz,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Ignaz,LOG_RUNNING);
	B_LogEntry (TOPIC_Ignaz,"Tengo que probar un nuevo conjuro por encargo de Ignaz. Es el conjuro olvido. Cuando alguien se enfade por una pelea o por cualquier otra raz�n, no volver� a hablarme jam�s. Este parece un buen momento para lanzarlo.");
	B_LogEntry (TOPIC_Ignaz,"�ste es el momento ideal para probar ese conjuro. Se olvidar� tambi�n de haber informado del asunto. No creo que nadie del distrito del puerto se preocupe si me encargo de �l.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info teilnhemen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Running   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 2;
	condition   = DIA_Ignaz_Running_Condition;
	information = DIA_Ignaz_Running_Info;
	permanent   = FALSE;
	description = "Acerca del experimento...";
};

FUNC INT DIA_Ignaz_Running_Condition()
{	
	if (MIS_Ignaz_Charm == LOG_RUNNING)
	&& (Charm_Test == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Running_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Running_15_00");//Acerca del experimento...
	AI_Output (self, other, "DIA_Ignaz_Running_14_01");//�Has tenido �xito entonces? �O has desperdiciado el pergamino de conjuro? �Eh?
	AI_Output (self, other, "DIA_Ignaz_Running_14_02");//Si necesitas m�s pergaminos de conjuros, puedes compr�rmelos a m�.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Danach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Danach   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 6;
	condition   = DIA_Ignaz_Danach_Condition;
	information = DIA_Ignaz_Danach_Info;
	permanent   = FALSE;
	description = "Us� el pergamino de conjuro.";
};
FUNC INT DIA_Ignaz_Danach_Condition()
{	
	if (Charm_Test == TRUE)
	&& (MIS_Ignaz_Charm == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Danach_Info()
{
	AI_Output (other, self, "DIA_Ignaz_Danach_15_00");//Us� el pergamino de conjuro.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_01");//Bien, bien. �Y tuviste �xito?
	AI_Output (other, self, "DIA_Ignaz_Danach_15_02");//S�, funcion�.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_03");//Excelente. Un peque�o �xito para la ciencia, �pero uno grande para m�!
	AI_Output (self, other, "DIA_Ignaz_Danach_14_04");//Ahora puedo usar mi tiempo en instruirte en el arte de la alquimia.
	AI_Output (self, other, "DIA_Ignaz_Danach_14_05");//Tambi�n podr�a darte unas cuantas cosas �tiles, si quieres.
	
	Ignaz_TeachAlchemy = TRUE;
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Ignaz me puede mostrar f�rmulas para destilar pociones. Vive en el distrito de los muelles.");
	MIS_Ignaz_Charm = LOG_SUCCESS;
	B_GivePlayerXP (XP_MIS_Ignaz_Charm);
	
	//PATCH fallls alle Scrolls aufgekauft oder gepl�ndert wurden
	CreateInvItems (self,ITSC_Charm		, 3);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Trade   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 6;
	condition   = DIA_Ignaz_Trade_Condition;
	information = DIA_Ignaz_Trade_Info;
	permanent   = TRUE;
	trade 		= TRUE;
	description = "Ens��ame tu mercanc�a.";
};
FUNC INT DIA_Ignaz_Trade_Condition()
{	
	if (MIS_Ignaz_Charm == LOG_SUCCESS)
	|| (Npc_KnowsInfo (other,DIA_Ignaz_Running))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Ignaz_Trade_15_00");//Ens��ame tu mercanc�a.
};

///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ignaz_Teach   (C_INFO)
{
	npc         = VLK_498_Ignaz;
	nr          = 2;
	condition   = DIA_Ignaz_Teach_Condition;
	information = DIA_Ignaz_Teach_Info;
	permanent   = TRUE;
	description = "Instr�yeme en el arte de la alquimia.";
};
//----------------------------------------
var int DIA_Ignaz_Teach_permanent;
//----------------------------------------

FUNC INT DIA_Ignaz_Teach_Condition()
{	
	if (DIA_Ignaz_Teach_permanent == FALSE)
	&& (Ignaz_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ignaz_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output (other, self,"DIA_Ignaz_Teach_15_00");//Instr�yeme en el arte de la alquimia.
	
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	|| ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_ClearChoices (DIA_Ignaz_Teach);
		Info_AddChoice (DIA_Ignaz_Teach,DIALOG_BACK,DIA_Ignaz_Teach_BACK);
	};
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Poci�n de velocidad", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Speed)),DIA_Ignaz_Teach_Speed);
		talente = (talente + 1);
	};
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Esencia de man�", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)),DIA_Ignaz_Teach_Mana);
		talente = (talente + 1);
	};
	
	if ( PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Ignaz_Teach,B_BuildLearnString ("Esencia de curaci�n", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)) ,DIA_Ignaz_Teach_Health);
		talente = (talente + 1);
	};
	if (talente > 0)
	{
		if (Alchemy_Explain != TRUE)
		{
			AI_Output (self, other,"DIA_Ignaz_Teach_14_01"); //Para preparar una poci�n en la mesa del alquimista, necesitas un frasco de laboratorio.
			AI_Output (self, other,"DIA_Ignaz_Teach_14_02"); //Y necesitar�s distintas plantas y otros ingredientes para cada poci�n.
			//AI_Output (self, other,"DIA_Ignaz_Teach_14_03"); //Eins noch. Falls du vorhast, das Wissen um Elixiere der Geschicklichkeit zu lernen, solltest du wissen, dass die ben�tigten Pflanzen daf�r sehr selten sind.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output (self, other,"DIA_Ignaz_Teach_14_04"); //�Qu� quieres saber?
		};
	}
	else 
	{
		AI_Output (self, other,"DIA_Ignaz_Teach_14_05"); //Ya has aprendido todo lo que puedo ense�arte.
		DIA_Ignaz_Teach_permanent = TRUE;
	};
};
	
FUNC VOID DIA_Ignaz_Teach_Health()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01);
	Info_ClearChoices (DIA_Ignaz_Teach);
};
FUNC VOID DIA_Ignaz_Teach_Mana()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01);
	Info_ClearChoices (DIA_Ignaz_Teach);
};
FUNC VOID DIA_Ignaz_Teach_Speed()
{
	B_TeachPlayerTalentAlchemy (self, other, POTION_Speed);
	Info_ClearChoices (DIA_Ignaz_Teach);
};
FUNC VOID DIA_Ignaz_Teach_BACK()
{
	Info_ClearChoices (DIA_Ignaz_Teach);
};

