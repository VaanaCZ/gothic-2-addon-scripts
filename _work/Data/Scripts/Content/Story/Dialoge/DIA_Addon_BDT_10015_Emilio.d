//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_EXIT   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 999;
	condition   = DIA_Addon_Emilio_EXIT_Condition;
	information = DIA_Addon_Emilio_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Emilio_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Emilio_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Emilio_PICKPOCKET (C_INFO)
{
	npc			= BDT_10015_Addon_Emilio;
	nr			= 900;
	condition	= DIA_Addon_Emilio_PICKPOCKET_Condition;
	information	= DIA_Addon_Emilio_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Emilio_PICKPOCKET_Condition()
{
	C_Beklauen (76, 112);
};
 
FUNC VOID DIA_Addon_Emilio_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Emilio_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Emilio_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Emilio_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Emilio_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Emilio_PICKPOCKET_DoIt);
};

func void DIA_Addon_Emilio_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Emilio_PICKPOCKET);
};
	
func void DIA_Addon_Emilio_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Emilio_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Hi   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 1;
	condition   = DIA_Addon_Emilio_Hi_Condition;
	information = DIA_Addon_Emilio_Hi_Info;
	permanent   = FALSE;
	description	= "Pareces un cavador.";
};
FUNC INT DIA_Addon_Emilio_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Emilio_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Hi_15_00");//Pareces un cavador.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Hi_10_01");//SOY cavador. La última vez que estuve en la mina, trabajé como un condenado.

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};

	SC_KnowsRavensGoldmine = TRUE;
};
//----------------------------------------------------------------------
//	Info Gold
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Gold   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 2;
	condition   = DIA_Addon_Emilio_Gold_Condition;
	information = DIA_Addon_Emilio_Gold_Info;
	permanent   = FALSE;
	description	= "¿Qué ocurre con el oro de la mina?";
};
FUNC INT DIA_Addon_Emilio_Gold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BDT_10015_Emilio_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Gold_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Gold_15_00");//¿Qué ocurre con el oro de la mina?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_01");//Thorus lo recoge y lo distribuye. Nadie puede quedarse lo que extrae.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_02");//La gente se queda sólo una parte del oro. De ese modo, los guardias y los cazadores también reciben su parte.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_03");//Me parece correcto. Desde que lo hacemos así, ha habido menos muertes y los mineros siguen ganando más que los que trabajan fuera.
};
//----------------------------------------------------------------------
//	Info Stein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Stein   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 3;
	condition   = DIA_Addon_Emilio_Stein_Condition;
	information = DIA_Addon_Emilio_Stein_Info;
	permanent   = FALSE;
	description	= "¿Qué es eso de las piedras rojas?";
};
FUNC INT DIA_Addon_Emilio_Stein_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Emilio_Jetzt)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Stein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Stein_15_00");//¿Qué es eso de las piedras rojas?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_01");//Es algo que pensaron Thorus y Esteban.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_02");//Thorus se ocupa de distribuir el oro y Esteban organiza a los trabajadores de la mina.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_03");//Por supuesto, no quiere tener que hablar con Thorus cada vez que envía a alguien a la mina.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_04");//Por eso nos da una de estas tablillas de piedra roja y Thorus nos deja pasar. Es como una contraseña.
};
//---------------------------------------------------------------------
//	Info Attentat 
//---------------------------------------------------------------------
var int Emilio_Switch;

INSTANCE DIA_Addon_Emilio_Attentat   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 4;
	condition   = DIA_Addon_Emilio_Attentat_Condition;
	information = DIA_Addon_Emilio_Attentat_Info;
	permanent   = TRUE;
	description	= "¿Qué sabes sobre el ataque?";
};
FUNC INT DIA_Addon_Emilio_Attentat_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Emilio_VonEmilio)) 
	&& (Npc_IsDead (Senyan))
	{
		return FALSE;		//selbe Condition wie 'Hilf mir...'
	}
	else if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};
FUNC VOID DIA_Addon_Emilio_Attentat_Info()
{
	AI_Output (other, self, "DIA_Addon_Emilio_Attentat_15_00"); //¿Qué sabes del ataque?
	if (Emilio_Switch == 0)
	{
		AI_Output (self, other, "DIA_Addon_Emilio_Attentat_10_01"); //(asustado) ¡Eh, amigo, yo no he tenido nada que ver!
		Emilio_Switch = 1;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Emilio_Attentat_10_02"); //(asustado) ¡NADA QUE VER!
		Emilio_Switch = 0;
	};
};

//----------------------------------------------------------------------
//	Info Senyan 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Senyan   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 1;
	condition   = DIA_Addon_Emilio_Senyan_Condition;
	information = DIA_Addon_Emilio_Senyan_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Emilio_Senyan_Condition()
{	
	if Npc_IsDead (Senyan)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Senyan_Info()
{	
	if (Senyan_Called == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_00");//(inquisitorio) Dime, ¿por qué gritó Senyan 'Mira a quién tenemos aquí'?
		AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Senyan_15_01");//(seco) Deudas pendientes.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_02"); //¡Tú mataste a Senyan!
	};
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Senyan_15_03");//¿Y tienes algún problema?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_04");//(rápidamente) No, tío, ningún problema.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_05");//Al contrario. (con malicia) Ese bastardo trabajaba para Esteban.
	
	Senyan_CONTRA = LOG_SUCCESS;
	B_LogEntry (Topic_Addon_Esteban, "Emilio no está de parte de Esteban.");
};

//----------------------------------------------------------------------
//	Info Jetzt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_Jetzt   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 5;
	condition   = DIA_Addon_Emilio_Jetzt_Condition;
	information = DIA_Addon_Emilio_Jetzt_Info;
	permanent   = FALSE;
	description	= "¿Por qué no estás en la mina?";
};
FUNC INT DIA_Addon_Emilio_Jetzt_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BDT_10015_Emilio_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Jetzt_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_Jetzt_15_00"); //¿Por qué no estás en la mina?
	AI_Output (self, other, "DIA_Addon_Emilio_Jetzt_10_01"); //(algo inseguro) He pasado mucho tiempo en la mina trabajando como un burro hasta que no podía más. Ahora necesito unos días de descanso.
	AI_Output (self, other, "DIA_Addon_Emilio_Jetzt_10_02"); //(suspira, algo inseguro) Antes de conseguir mi siguiente piedra roja.
};

//----------------------------------------------------------------------
//	Info VonEmilio
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_VonEmilio (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 6;
	condition   = DIA_Addon_Emilio_VonEmilio_Condition;
	information = DIA_Addon_Emilio_VonEmilio_Info;
	permanent   = FALSE;
	description	= "Lennar me ha contado un par de cosas sobre ti…";
};
FUNC INT DIA_Addon_Emilio_VonEmilio_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Emilio_Jetzt))
	&& (Npc_KnowsInfo (other, DIA_Addon_Lennar_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_VonEmilio_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_VonEmilio_15_00"); //Lennar me habló algo de ti
	AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_01"); //¿Lennar? Ese tipo es idiota. Seguro que te has dado cuenta.
	AI_Output (other, self, "DIA_Addon_Emilio_VonEmilio_15_02"); //Dice que no has vuelto a la mina desde el ataque.
	AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_03"); //(intimidado) ¡Yo… no sé nada!
	
	if (!Npc_IsDead (Senyan))
	{	
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_04"); //¡Trabajas con Senyan!
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_05"); //¡Y los dos estáis asociados con Esteban! ¡He oído perfectamente lo que andabais cuchicheando!
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_06"); //Hasta ahora, Esteban no se ha preocupado en absoluto por nosotros. No tengo por qué confiar en su gente.
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_07"); //¡Déjame en paz!
		AI_StopProcessInfos(self);
	};
	B_LogEntry (Topic_Addon_Esteban, "Emilio cree que Lennar es idiota.");
};
//----------------------------------------------------------------------
//	Info Hilf Mir
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_HilfMir (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 7;
	condition   = DIA_Addon_Emilio_HilfMir_Condition;
	information = DIA_Addon_Emilio_HilfMir_Info;
	permanent   = FALSE;
	description	= "¡Ayúdame a averiguar quién anda detrás del ataque!";
};
FUNC INT DIA_Addon_Emilio_HilfMir_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Emilio_VonEmilio))
	&& (Npc_IsDead (Senyan))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_HilfMir_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_00"); //¡Ayúdame a averiguar quién anda detrás del ataque!
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_01"); //¡No! ¡No quiero tener nada que ver con eso!
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_02"); //Si un idiota como Lennar se da cuenta de que actúas raro, Esteban tampoco tardará en percatarse.
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_03"); //(inquieto) ¡Yo… mierda! Te diré un nombre, nada más.
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_04"); //Te escucho.
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_05"); //Huno… visita a Huno. Él sabrá algo de este asunto.
	Emilio_TellAll = TRUE;
	
	B_LogEntry (Topic_Addon_Esteban, "Emilio por fin ha soltado un nombre: Huno.");
};

//----------------------------------------------------------------------
//	Info Hilf Mir
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_GegenEsteban (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 8;
	condition   = DIA_Addon_Emilio_GegenEsteban_Condition;
	information = DIA_Addon_Emilio_GegenEsteban_Info;
	permanent   = FALSE;
	description	= "¿Qué tienes contra Esteban?";
};
FUNC INT DIA_Addon_Emilio_GegenEsteban_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_BDT_10015_Emilio_Senyan))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_GegenEsteban_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_GegenEsteban_15_00"); //¿Qué tienes contra Esteban?
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_01"); //Ese cerdo sólo piensa en el dinero.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_02"); //Cada pocos días, uno de nosotros muerte víctima de un reptador.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_03"); //Pero Esteban no manda a ningún luchador a las minas.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_04"); //¿Y por qué? Esos tipos pertenecen a los 'guardaespaldas de Raven' y Esteban se muere de miedo de decírselo.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_05"); //¡Prefiere que nos maten!
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Mine   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 9;
	condition   = DIA_Addon_Emilio_Mine_Condition;
	information = DIA_Addon_Emilio_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Emilio_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Mine_10_00");//Así que ahora mandas tú. Vale, entonces me pondré en marcha.
	
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
	
	
};
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_Hacker   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 9;
	condition   = DIA_Addon_Emilio_Hacker_Condition;
	information = DIA_Addon_Emilio_Hacker_Info;
	permanent   = TRUE;
	Description = "¿Qué tal va todo?"; 
};
FUNC INT DIA_Addon_Emilio_Hacker_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_MINE_09_PICK") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Emilio_Hacker_15_00"); //¿Qué pasa?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Emilio_Hacker_10_01"); //Me estoy matando a trabajar. En fín, lo importante es no dejarse devorar por un crawler.
};




