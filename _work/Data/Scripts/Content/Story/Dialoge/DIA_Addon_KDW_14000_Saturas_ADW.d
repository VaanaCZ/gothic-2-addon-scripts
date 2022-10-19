
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Saturas_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14000_Addon_Saturas_ADW;
	nr          = 999;
	condition   = DIA_Addon_Saturas_ADW_EXIT_Condition;
	information = DIA_Addon_Saturas_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Saturas_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Saturas_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
	AI_Output			(self, other, "DIA_Addon_Saturas_ADW_EXIT_14_00"); //Que Adanos te proteja.
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Saturas_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14000_Addon_Saturas_ADW;
	nr			= 900;
	condition	= DIA_Addon_Saturas_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Saturas_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es w�re einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Saturas_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Saturas_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) 
	&& (other.attribute[ATR_DEXTERITY] >= (31 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Saturas_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Saturas_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Saturas_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Saturas_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Saturas_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Saturas_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Saturas_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 31)
	{
		
		B_GiveInvItems (self, other, ItSc_Water01, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Saturas_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Saturas_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Saturas_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWStart
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADWStart		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Saturas_ADWStart_Condition;
	information	 = 	DIA_Addon_Saturas_ADWStart_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Saturas_ADWStart_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Saturas_ADWStart_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_00"); //Gracias a Adanos. Por fin llegas. Cre�amos que no volver�as a aparecer.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_01"); //(confuso) �Qu�? �Ya est�s AQU�?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_02"); //Atravesaste el portal y te seguimos. Enseguida llegamos aqu�.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_03"); //Sin embargo, no estabas all�. Llevamos aqu� varios d�as.
	AI_Output	(other, self, "DIA_Addon_Saturas_ADWStart_15_04"); //(sorprendido) �VARIOS D�AS? �C�mo puede ser?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_05"); //Como no hubo forma de encontrarte, Nefarius empez� a pensar que podr�a haber fallado. Parec�a bastante desconcertado hasta ahora.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADWStart_14_06"); //Bueno. Ahora ya has llegado y puedes empezar a trabajar.

	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc (Giant_Rat ,"ADW_PORTALTEMPEL_11");

	Info_ClearChoices	(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "�Qu� ha ocurrido mientras tanto?", DIA_Addon_Saturas_ADWStart_was );
};
func void DIA_Addon_Saturas_ADWStart_was ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_was_15_00"); //�Qu� ocurri� en ese intervalo de tiempo?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_01"); //Hemos reunido muchas conclusiones nuevas.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_02"); //Los terremotos parecen M�S INTENSOS aqu�. No estamos lejos del epicentro.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_03"); //Los constructores de estas antiguas estructuras levantaron una ciudad aqu� en su d�a, eso seguro.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_04"); //Sin embargo, por alguna raz�n, su cultura muri�.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_was_14_05"); //Pero, hasta el momento, s�lo podemos suponer las causas.

	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "�Has encontrado alguna pista de los desaparecidos?", DIA_Addon_Saturas_ADWStart_missingPeople );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "�Y Raven?", DIA_Addon_Saturas_ADWStart_Raven );
};
func void DIA_Addon_Saturas_ADWStart_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_Raven_15_00"); //�Y Raven?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_01"); //En esta carta, Raven hablaba de un templo en el que estaba intentando entrar.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_02"); //Estamos todos de acuerdo en que el templo que Raven quiere profanar es uno de Adanos.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_03"); //Los terremotos son obviamente el resultado de encantamientos malditos que chocan con un poderoso conjuro.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_04"); //Las puertas del templo est�n m�gicamente selladas, la misma que hace cobrar vida a los centinelas de piedra.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_Raven_14_05"); //El templo se est� defendiendo. Hay que detener a Raven antes de que consiga entrar a lo m�s sagrado de lo sagrado.
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "�Y ahora qu� hacemos?", DIA_Addon_Saturas_ADWStart_wastun );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Raven s�lo es un antiguo Magnate del Mineral, no un mago.", DIA_Addon_Saturas_ADWStart_RavenOnlyBaron );
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "�Qu� se le ha perdido a Raven en el templo?", DIA_Addon_Saturas_ADWStart_RavenAim );
};
func void DIA_Addon_Saturas_ADWStart_RavenAim ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenAim_15_00"); //�Qu� quiere Raven del templo?
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_01"); //Wir wissen es nicht. Es muss etwas sehr Wertvolles oder M�chtiges in dem Tempel sein.
	//AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenAim_14_02"); //Aber wir k�nnen davon ausgehen, dass er nichts Gutes im Schilde f�hrt.
	AI_Output (self, other, "DIA_Addon_Bodo_14_01"); //S�lo sabemos que tiene que ver con un poderoso artefacto de alg�n modo conectado con Adanos y Beliar.
	AI_Output (self, other, "DIA_Addon_Bodo_14_02"); //(serio) Podemos dar por seguro que no trama nada bueno
};
func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00"); //Raven es s�lo un antiguo Magnate del Mineral, no un mago. �C�mo puede realizar una invocaci�n as�?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01"); //Tal vez no lo haga �l mismo, sino un mago renegado a sueldo.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02"); //De cualquier modo, DEBEMOS evitar el peligro.
};
func void DIA_Addon_Saturas_ADWStart_missingPeople ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_missingPeople_15_00"); //�Has encontrado alguna pista de los desaparecidos?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_01"); //Ayer mismo hayamos el cad�ver de un pescador. Estaba bajo una de esas ruinas que hay al este.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_missingPeople_14_02"); //Parece ser que el pescador era de Khorinis. Echa un vistazo a esto.
	Saturas_AboutWilliam = TRUE;

	B_LogEntry (TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche); 
};
func void DIA_Addon_Saturas_ADWStart_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun_15_00"); //�Qu� hacemos ahora?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_01"); //NOS quedaremos aqu� y seguiremos estudiando la cultura antigua.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_02"); //Los escritos de los constructores esconden muchos secretos que debemos revelar, si queremos entender lo que pas� por aqu�l entonces.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun_14_03"); //Entretanto, nos har�s unos recados
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "�Qu� tengo que hacer?", DIA_Addon_Saturas_ADWStart_wastun2 );
};
func void DIA_Addon_Saturas_ADWStart_wastun2 ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_00"); //�Qu� tengo que hacer?
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_01"); //Tienes que encontrar a Raven e impedirle que profane el templo de Adanos.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_02"); //Dices que LO MATE.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_03"); //Si es el �nico modo de detenerlo, entonces en nombre de Adanos� �S�!
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_04"); //De camino, recoge todas las reliquias e inscripciones que encuentres de los constructores y tr�enoslas.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_05"); //Queremos saber m�s sobre esa gente y su desaparici�n.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_06"); //S�lo cuando sepamos lo que trama Raven, podremos detenerle.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_07"); //Adem�s, tienes que encontrar el modo de liberar a los esclavos.
	AI_Output			(other, self, "DIA_Addon_Saturas_ADWStart_wastun2_15_08"); //(c�nicamente) �Eso es todo? Con los ojos cerrados.
	AI_Output			(self, other, "DIA_Addon_Saturas_ADWStart_wastun2_14_09"); //(molesto) S� que es mucho. T�malo como una forma de recuperar mi confianza.
	
	MIS_ADDON_Saturas_GoToRaven = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Raven est� profanando el templo sagrado de Adanos. Debo detenerle, aunque eso suponga matarle."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Sklaven,"Saturas quiere que libere a los esclavos."); 

	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,"Saturas quiere que le lleve algo que le proporcione m�s informaci�n sobre los antiguos constructores."); 
	
	Info_AddChoice	(DIA_Addon_Saturas_ADWStart, "Bueno, me voy ya�", DIA_Addon_Saturas_ADWStart_back );
};
func void DIA_Addon_Saturas_ADWStart_back ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADWStart_back_15_00"); //Bueno, me voy ya
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_01"); //Una cosa m�s� Raven ha reunido a su alrededor a un gran n�mero de bandidos.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_02"); //En tu ausencia, hemos tra�do a otro miembro del Anillo de Agua.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_03"); //Lo enviamos al pantano y no ha vuelto.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_04"); //Sospechamos que los bandidos atacan a todo el que no es como ellos.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_05"); //As� que compra armadura de bandidos.
	AI_Output (self, other, "DIA_Addon_Saturas_ADWStart_back_14_06"); //Es el �nico modo de acercarte a ellos sin que te ataquen autom�ticamente.

	Log_CreateTopic (TOPIC_Addon_BDTRuestung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Los bandidos disparan a cualquiera que no parezca de los suyos. Necesito armadura de bandido para acercarme a ellos."); 

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info PoorRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PoorRanger		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_PoorRanger_Condition;
	information	 = 	DIA_Addon_Saturas_PoorRanger_Info;

	description	 = 	"�A qu� pobre infeliz enviaste al pantano?";
};

func int DIA_Addon_Saturas_PoorRanger_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PoorRanger_15_00"); //�A qu� pobre infeliz enviaste al pantano?
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_01"); //Se llamaba Lance.
	AI_Output	(self, other, "DIA_Addon_Saturas_PoorRanger_14_02"); //Me temo que no lleg� muy lejos.
	
	Log_CreateTopic (TOPIC_Addon_Lance, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Lance,"Saturas envi� a la ci�naga a alguien llamado Lance, pero teme que no haya llegado demasiado lejos."); 
};

///////////////////////////////////////////////////////////////////////
//	Info Piraten
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Piraten		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Piraten_Condition;
	information	 = 	DIA_Addon_Saturas_Piraten_Info;

	description	 = 	"�D�nde puedo encontrar armadura de bandido para m�?";
};

func int DIA_Addon_Saturas_Piraten_Condition ()
{
	if (AlligatorJack.aivar [AIV_TalkedToPlayer] == FALSE)
	&& (Greg.aivar [AIV_TalkedToPlayer] == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Piraten_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Piraten_15_00"); //�D�nde puedo encontrar armadura de bandido para m�?
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_01"); //Al parecer, hay un campamento de piratas al oeste.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_02"); //Por lo que sabemos, est�n en contacto con los bandidos.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_03"); //No creo que te ataquen si te acercas a ellos.
	AI_Output	(self, other, "DIA_Addon_Saturas_Piraten_14_04"); //Tal vez te presten ayuda...

	B_LogEntry (TOPIC_Addon_BDTRuestung,"Saturas dice que los piratas podr�an ayudarme a buscar la armadura."); 
};

///////////////////////////////////////////////////////////////////////
//	Info LanceLeiche
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_LanceLeiche		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_LanceLeiche_Condition;
	information	 = 	DIA_Addon_Saturas_LanceLeiche_Info;

	description	 = 	"He encontrado el cuerpo de Lance.";
};

func int DIA_Addon_Saturas_LanceLeiche_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_PoorRanger))
	&& (Npc_HasItems (NONE_Addon_114_Lance_ADW, ItRi_LanceRing) == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_LanceLeiche_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceLeiche_15_00"); //He encontrado el cuerpo de Lance.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_01"); //Que su alma repose en el reino de Adanos.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceLeiche_14_02"); //Cuidado, hijo m�o. No quiero lamentar otra p�rdida.
	
	TOPIC_End_Lance = TRUE;
	B_GivePlayerXP (XP_Addon_LanceLeiche);
};

///////////////////////////////////////////////////////////////////////
//	Info LanceRing
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_LanceRing		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_LanceRing_Condition;
	information	 = 	DIA_Addon_Saturas_LanceRing_Info;

	description	 = 	"Aqu� tengo el anillo de aguamarina de Lance.";
};

func int DIA_Addon_Saturas_LanceRing_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_LanceLeiche))
	&& (Npc_HasItems (other,ItRi_LanceRing))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_LanceRing_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_LanceRing_15_00"); //Aqu� tengo el anillo de aguamarina de Lance.
	AI_Output	(self, other, "DIA_Addon_Saturas_LanceRing_14_01"); //D�melo, no vaya a ser que acabe en manos de quien no debe.
	B_GiveInvItems (other, self, ItRi_LanceRing, 1);		
	B_GivePlayerXP (XP_Addon_LanceRing);
};
///////////////////////////////////////////////////////////////////////
//	Info Tokens
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Tokens		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Saturas_Tokens_Condition;
	information	 = 	DIA_Addon_Saturas_Tokens_Info;
	permanent	 = 	TRUE;

	description	 = 	"Sobre las reliquias�";
};

func int DIA_Addon_Saturas_Tokens_Condition ()
{
	if (Saturas_SCBroughtAllToken == FALSE)
		{
			return TRUE;
		};
};

var int DIA_Addon_Saturas_Tokens_OneTime;
var int Saturas_SCBroughtAllToken;
var int Saturas_BroughtTokenAmount;
var int ScBroughtToken;
var int Saturas_SCFound_ItMi_Addon_Stone_01;
var int Saturas_SCFound_ItMi_Addon_Stone_02;
var int Saturas_SCFound_ItMi_Addon_Stone_03;
var int Saturas_SCFound_ItMi_Addon_Stone_04;
var int Saturas_SCFound_ItMi_Addon_Stone_05;

func void DIA_Addon_Saturas_Tokens_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_00"); //Sobre las reliquias
	
	if (DIA_Addon_Saturas_Tokens_OneTime == FALSE)
	&& ((C_ScHasMagicStonePlate ())
	|| (Npc_HasItems (other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_01"); //Creo que tengo aqu� algo para ti.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_02"); //Ya conocemos este tipo de tablilla de piedra. No nos van a desvelar nada nuevo ahora.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_03"); //Tiene que haber m�s.
		DIA_Addon_Saturas_Tokens_OneTime = TRUE;
	};
	
	
	var int BroughtToken;BroughtToken = 0;
	var int XP_BroughtTokens;XP_BroughtTokens = 0;
	
	if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
	|| ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
	{	
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_04"); //�Y ESTO qu�?
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_05"); //Tiene buena pinta. �D�nde lo has encontrado?
              
 		B_LogEntry (TOPIC_Addon_Relicts,"Le he entregado a Saturas las siguientes reliquias:"); 
                               
		if ((Npc_HasItems (other,ItMi_Addon_Stone_01)) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_01, 1);
				Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_06"); //Los bandidos usan estas tablillas como moneda de cambio.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_07"); //Las tablillas llevan el s�mbolo de Quarhodron, un gran guerrero.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_08"); //Es el comandante cuyo hijo, Rhademes, acab� con la ciudad.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_09"); //(con desd�n) Tsk. Apuesto a que los bandidos no saben ni lo que est�n vendiendo.
				Log_AddEntry (TOPIC_Addon_Relicts,"Una tablilla de piedra roja que los bandidos usan de moneda de cambio con el nombre del gran guerrero Quarhodron."); 
			};		
		if ((Npc_HasItems (other,ItMi_Addon_Stone_02)) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_02, 1);
				Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_10"); //He encontrado estas tablillas en una casa al sur.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_11"); //�Ah! Una tablilla de los guardianes de los muertos. Ellos mismos invocaron a los esp�ritus de su muerte.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_12"); //La conexi�n de los constructores con sus antepasados es muy fuerte.
				Log_AddEntry (TOPIC_Addon_Relicts,"#N/A"); 
			};	

		if ((Npc_HasItems (other,ItMi_Addon_Stone_03)) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_03,1);
				Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_13"); //He encontrado esas tablillas en una construcci�n al suroeste.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_14"); //A juzgar por la tablilla, tiene algo que ver con el refugio para sacerdotes de la ciudad.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_15"); //El supremo sacerdote se llamaba KHARDIMON. No sabemos mucho sobre �l.
				Log_AddEntry (TOPIC_Addon_Relicts,"#N/A"); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_04)) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_04,1);
				Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output (other, self, "DIA_Addon_Saturas_Tokens_15_15"); //Esto estaba tirado en una casa cerca del gran pantano.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_16"); //Habr� sido la casa de los curanderos.
				AI_Output (self, other, "DIA_Addon_Saturas_Tokens_14_17"); //No sabemos mucho sobre ellos. Parece que fueron los primeros en desaparecer.
				Log_AddEntry (TOPIC_Addon_Relicts,"#N/A"); 
			};		 
		if ((Npc_HasItems (other,ItMi_Addon_Stone_05)) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
			{
				B_GiveInvItems (other, self, ItMi_Addon_Stone_05, 1);
				Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
				BroughtToken = (BroughtToken + 1);
				AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_18"); //Esta pieza estaba en una casa enorme en un barranco profundo.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_19"); //Era la biblioteca del antiguo pueblo.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_20"); //Parece una tablilla de los eruditos.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_80"); //Muchos de los escritos que hemos encontrado provienen del l�der de la casta de los eruditos.
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_81"); //Curiosamente, no dej� constancia de su nombre en ning�n sitio
				Log_AddEntry (TOPIC_Addon_Relicts,"#N/A"); 
		};		 
			
			if (SC_Knows_WeaponInAdanosTempel == TRUE)
			{
			};
	
			XP_BroughtTokens = (XP_Addon_ForOneToken * BroughtToken);
	
			B_GivePlayerXP (XP_BroughtTokens);
			Saturas_BroughtTokenAmount = (Saturas_BroughtTokenAmount + BroughtToken);

		if (Saturas_BroughtTokenAmount < 5)
		{
			if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_21"); //Muy bien. La historia de esta ciudad comienza a aclararse, pero a�n no sabemos suficiente.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_22"); //En total, debe de haber cinco de estas tablillas de piedra escondidas por la zona.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_23"); //B�scalas y tr�emelas aqu�.
		};
		
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_24"); //Aqu� tienes oro como recompensa.

		var int Kohle;
		Kohle = (200 * BroughtToken);
			
		CreateInvItems (self, ItMi_Gold, Kohle);									
		B_GiveInvItems (self, other, ItMi_Gold, Kohle);		

		ScBroughtToken = TRUE; //mindestens einen gebracht
	};
	
	if (Saturas_BroughtTokenAmount == 5)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_25"); //Ya hemos recogido todas las reliquias que necesitamos.
	
		if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_26"); //Nos has prestado un gran servicio. Te lo agradezco.
			AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_27"); //Esto supondr� un gran paso en nuestras investigaciones.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_Tokens_15_28"); //Ver� si puedo encontrar algo.
		AI_Output	(self, other, "DIA_Addon_Saturas_Tokens_14_29"); //Bien, pero deprisa. El tiempo no corre a nuestro favor.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info StonePlateHint
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_StonePlateHint		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_StonePlateHint_Condition;
	information	 = 	DIA_Addon_Saturas_StonePlateHint_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Saturas_StonePlateHint_Condition ()
{
	if ((Merdarion_GotFocusCount >= 2) || (RavenIsInTempel == TRUE))
	&& (Saturas_SCBroughtAllToken == FALSE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_StonePlateHint_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_00"); //Me alegro de que hayas venido. Tenemos descubrimientos nuevos que compartir contigo.
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_15_01"); //Oig�moslo.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_02"); //La ciudad hundida se llam� en su d�a Jharkendar. Hab�a 5 gobernantes en la ciudad que compart�an el poder sobre el pueblo.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_03"); //Cada uno de ellos ten�a una mansi�n donde viv�a y guardaba sus pertenencias.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_14_04"); //Por ello, en tu b�squeda de las reliquias de la antigua cultura, es crucial buscar bien en esas mansiones.
	
	MIS_Saturas_LookingForHousesOfRulers = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "�Y qu� ocurre si ya no est�n las mansiones?", DIA_Addon_Saturas_StonePlateHint_unter );
	Info_AddChoice	(DIA_Addon_Saturas_StonePlateHint, "�Por qu� lugares de las mansiones busco?", DIA_Addon_Saturas_StonePlateHint_wo );
};
func void DIA_Addon_Saturas_StonePlateHint_wo ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_wo_15_00"); //�Por qu� lugares de las mansiones busco?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_01"); //Riordian ha estudiado la estructura de las casas en Jharkendar.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_wo_14_02"); //�l te dir� donde buscar las mansiones.

	Log_CreateTopic (TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_HousesOfRulers,"Saturas quiere que busque algo �til en las mansiones de los constructores. Riordian me dir� d�nde encontrarlas."); 
};
func void DIA_Addon_Saturas_StonePlateHint_unter ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_StonePlateHint_unter_15_00"); //�Y qu� ocurre si ya no est�n las mansiones?
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_01"); //Si no las encuentras, ser� que se hundieron con la ciudad.
	AI_Output	(self, other, "DIA_Addon_Saturas_StonePlateHint_unter_14_02"); //Sin embargo, si siguen existiendo, ser�n de un valor inestimable para nuestros estudios.
};

///////////////////////////////////////////////////////////////////////
//	Info SCBroughtAllToken
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_SCBroughtAllToken		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_SCBroughtAllToken_Condition;
	information	 = 	DIA_Addon_Saturas_SCBroughtAllToken_Info;

	description	 = 	"�Para qu� quieres las cinco tablillas de piedra?";
};

func int DIA_Addon_Saturas_SCBroughtAllToken_Condition ()
{
	if (ScBroughtToken == TRUE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_SCBroughtAllToken_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_SCBroughtAllToken_15_00"); //�Para qu� quieres las cinco tablillas de piedra?
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_01"); //Los registros que hemos encontrado en estas ruinas est�n incompletos.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_02"); //Pero los escritos de los constructores hablan de cinco gobernantes que reinaron en la ciudad.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_03"); //Cada uno de estos gobernantes pose�a una de las tablillas como s�mbolo de su poder.
	AI_Output	(self, other, "DIA_Addon_Saturas_SCBroughtAllToken_14_04"); //Creo que esas tablillas son la respuesta a nuestras preguntas.
};

///////////////////////////////////////////////////////////////////////
//	Info Flut
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Flut		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Flut_Condition;
	information	 = 	DIA_Addon_Saturas_Flut_Info;

	description	 = 	"Nefarius me habl� de una inundaci�n�";
};

func int DIA_Addon_Saturas_Flut_Condition ()
{
	if (NefariusADW_Talk2Saturas == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Flut_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Flut_15_00"); //Nefarius me habl� de una inundaci�n
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_02"); //Est� escrito que el propio Adanos descendi� del cielo para castigar a los infieles y desterrarlos al reino de los muertos.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_03"); //Henchido de ira sagrada, dej� que el mar se abalanzara sobre los constructores de la ciudad y los arrastrara.
	AI_Output	(self, other, "DIA_Addon_Saturas_Flut_14_04"); //La zona este del pantano a�n da testimonio de estos eventos del pasado.

	TOPIC_END_Flut = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AdanosZorn
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_AdanosZorn		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_AdanosZorn_Condition;
	information	 = 	DIA_Addon_Saturas_AdanosZorn_Info;

	description	 = 	"�Qu� pudo haber enfadado tanto a Adanos?";
};
func int DIA_Addon_Saturas_AdanosZorn_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_Flut))
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_AdanosZorn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_AdanosZorn_15_00"); //�Qu� pudo haber enfadado tanto a Adanos?
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_01"); //El templo de esta ciudad fue en su d�a una estructura grande y gloriosa.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_02"); //Todos le rend�an pleites�a y rezaban a nuestro dios Adanos.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_03"); //Rhademes, hijo del comandante Quarhodron, profan� el templo.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_04"); //Como resultado, todos cayeron uno a uno v�ctimas del mal.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_05"); //Sospecho que Adanos no pudo olvidarlo y su venganza cay� sobre esta tierra.
	AI_Output	(self, other, "DIA_Addon_Saturas_AdanosZorn_14_06"); //Eso hace que sea a�n m�s importante detener a Raven. Est� a punto de hacer exactamente lo mismo.
};

///////////////////////////////////////////////////////////////////////
//	Info RavenInfos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RavenInfos		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	9;
	condition	 = 	DIA_Addon_Saturas_RavenInfos_Condition;
	information	 = 	DIA_Addon_Saturas_RavenInfos_Info;
	permanent	 = 	TRUE;

	description	 = 	"Sobre Raven�";
};
var int DIA_Addon_Saturas_RavenInfos_OneTime1;
var int DIA_Addon_Saturas_RavenInfos_OneTime2;
var int DIA_Addon_Saturas_RavenInfos_OneTime3;
var int DIA_Addon_Saturas_RavenInfos_OneTime4;
var int DIA_Addon_Saturas_RavenInfos_OneTime5;

var int Addon_Saturas_Fortuno;

func int DIA_Addon_Saturas_RavenInfos_Condition ()
{
	if (MIS_ADDON_Saturas_GoToRaven == LOG_RUNNING)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_RavenInfos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_00"); //Sobre Raven
	
	var int RavenNeuigkeit;
	RavenNeuigkeit = 0;


	if (Thorus.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime1 == FALSE)
	&& (RavenIsInTempel == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_01"); //Yo estaba en el campamento de los bandidos al este. Raven es su l�der.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_02"); //Pero para llegar hasta Raven, antes tengo que deshacerme de varios bandidos.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_03"); //Bien, pues buena suerte. Y no olvides que hay que actuar con rapidez.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_04"); //Raven no debe lograr su objetivo bajo ninguna circunstancia.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (SC_KnowsRavensGoldmine == TRUE) 
	&& (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_05"); //Tiene una mina de oro y prisioneros trabajando en ella.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_06"); //Muy propio de �l. Tienes que sacar de all� a los prisioneros.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_07"); //(suspiro) S�, claro, estoy en ello.
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};	

	if (SC_KnowsFortunoInfos == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_08"); //Hay incluso un tipo con los bandidos que dice conocer los planes de Raven.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_09"); //Se llama Fortuno. Dice que Raven quiere entrar al templo para conseguir un poderoso artefacto.
		AI_Output	(self, other, "DIA_Addon_Bodo_14_03"); //�Y? �Sabe m�s acerca del artefacto?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_11"); //S�lo ha podido contarme que Raven ha abierto la tumba de un sacerdote de Adanos.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_12"); //En esa tumba pod�a estar la llave del templo. Deber�as echar un vistazo por all�.
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_13"); //Raven ha obligado a los prisioneros a exhumar la tumba de un sacerdote.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_14"); //Eso no es bueno. Debes darte prisa y detener a Raven.
		Addon_Saturas_Fortuno = TRUE;
		
		DIA_Addon_Saturas_RavenInfos_OneTime3 = TRUE;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};
		
	if (RavenIsInTempel == TRUE)
	&& (DIA_Addon_Saturas_RavenInfos_OneTime4 == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_15"); //He ido al cuartel general de Raven.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_16"); //�Y? �Qu� me dices de Raven?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_17"); //Llegu� demasiado tarde. Ha entrado en el templo de Adanos delante de mis narices.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_18"); //(agitado) �Qu�? �Eso es una CAT�STROFE! �Por qu� no lo has seguido?

		DIA_Addon_Saturas_RavenInfos_OneTime4 = TRUE;
		MIS_ADDON_Saturas_GoToRaven = LOG_SUCCESS;
		RavenNeuigkeit = (RavenNeuigkeit + 1);
	};

	if (RavenNeuigkeit != 0)
	{
		var int XP_RavenNeuigkeit;
		XP_RavenNeuigkeit = (RavenNeuigkeit * XP_Ambient);
		B_GivePlayerXP (XP_RavenNeuigkeit);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_19"); //�Tienes algo de lo que informar?
		AI_Output	(other, self, "DIA_Addon_Saturas_RavenInfos_15_20"); //Nada, hasta ahora.
		AI_Output	(self, other, "DIA_Addon_Saturas_RavenInfos_14_21"); //M�s vale que no subestimes a Raven, �me oyes?
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TuerZu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_TuerZu		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_TuerZu_Condition;
	information	 = 	DIA_Addon_Saturas_TuerZu_Info;

	description	 = 	"�No he podido seguir a Raven!";
};

func int DIA_Addon_Saturas_TuerZu_Condition ()
{
	if (MIS_ADDON_Saturas_GoToRaven == LOG_SUCCESS)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_TuerZu_Info ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_00"); //No he podido seguir a Raven. Bloque� la entrada desde dentro.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_02"); //(apresurado) Debo pensar
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_03"); //La cuesti�n es c�mo entr� Raven en el templo
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_04"); //�Qu� har�a despu�s de atravesar el portal?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_05"); //Pronunci� un encantamiento en la puerta.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_06"); //�Y antes?
	AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_07"); //Abri� una c�mara funeraria.

	if (Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_09"); //Ya te lo hab�a dicho
		AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_10"); //�Cierto!
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Saturas_TuerZu_15_08"); //S�lo s� que debe de haber realizado alg�n tipo de ritual por all
	};

	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_11"); //(meditando) Un ritual
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_12"); //(comprendiendo) �S�! �Eso es!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_13"); //Me temo que Raven ha hecho suyo el poder de los guardianes de la muerte.
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_14"); //�Adquiri� sus conocimientos del templo de un esp�ritu!
	AI_Output (self, other, "DIA_Addon_Saturas_TuerZu_14_15"); //�Debes visitar a Myxir y cont�rselo!
	
	Log_CreateTopic (TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Quarhodron,"Raven tiene ahora el poder de los guardianes de los muertos. Ha adquirido sus conocimientos del templo de Adanos de un fantasma. Debo ir a cont�rselo a Myxir. ");  
	
	Saturas_RiesenPlan = TRUE;	
};

///////////////////////////////////////////////////////////////////////
//	Info GhostQuestions
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_GhostQuestions		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_GhostQuestions_Condition;
	information	 = 	DIA_Addon_Saturas_GhostQuestions_Info;

	description	 = 	"He hablado con Quarhodron.";
};
func int DIA_Addon_Saturas_GhostQuestions_Condition ()
{
	if ((Npc_IsDead(Quarhodron)) == FALSE)
	&& (SC_TalkedToGhost == TRUE) 
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_GhostQuestions_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_00"); //He hablado con Quarhodron.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_01"); //�Y? �Qu� ha dicho?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_02"); //S�lo me ayudar� si contesto algunas preguntas.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_03"); //�Cu�l es el problema?
	AI_Output	(other, self, "DIA_Addon_Saturas_GhostQuestions_15_04"); //No s� muy bien qu� contestar.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_05"); //Mmh� sabemos que los eruditos de la ciudad construyeron una biblioteca al norte.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_06"); //Trabajaron duro para registrar lo ocurrido en el pasado.
	AI_Output	(self, other, "DIA_Addon_Saturas_GhostQuestions_14_07"); //Quiz� all� encuentres respuesta a las preguntas que Quarhodron te ha planteado.

	B_LogEntry (TOPIC_Addon_Quarhodron,"Saturas sospecha que puedo encontrar las respuestas a las preguntas de Quarhodron en la biblioteca de los eruditos, que queda hacia el norte."); 

};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToGhost
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_TalkedToGhost		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_TalkedToGhost_Condition;
	information	 = 	DIA_Addon_Saturas_TalkedToGhost_Info;

	description	 = 	"El problema de la puerta del templo est� resuelto.";
};

func int DIA_Addon_Saturas_TalkedToGhost_Condition ()
{
	if (Ghost_SCKnowsHow2GetInAdanosTempel == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_TalkedToGhost_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_00"); //El problema de la puerta del templo est� resuelto.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_01"); //�Ha hablado el esp�ritu?
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_02"); //S�, as� es.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_03"); //Entonces sabes c�mo entrar en el templo.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_04"); //Correcto. Y tambi�n me dijo lo que hay en el templo.
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_15_05"); //Me ha hablado de una poderosa espada y de las salas de Adanos.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_06"); //(desesperado) Por Adanos. Qu� idiotas somos. C�mo hemos podido ser tan inocentes.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_07"); //(conmocionado) Seg�n apuntan los registros
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_08"); //(emocionado) Esa espada s�lo puede ser la 'Garra de Beliar'.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_14_09"); //Debemos atravesar esas salas lo antes posible y hacernos con el arma.
	
	Info_ClearChoices	(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "�Qu� es la 'Garra de Beliar'?", DIA_Addon_Saturas_TalkedToGhost_wasistdas );
	Info_AddChoice		(DIA_Addon_Saturas_TalkedToGhost, "�D�nde est�n las salas de Adanos?", DIA_Addon_Saturas_TalkedToGhost_kammern );
};
func void DIA_Addon_Saturas_TalkedToGhost_wasistdas ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00"); //�Qu� es la 'Garra de Beliar'?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01"); //Es la encarnaci�n del mal. EL PROPIO Beliar la cre�.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02"); //Quien la porta posee un arma de destrucci�n terrible.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03"); //Cuanto m�s poderoso es el portador, mayor es el poder de la 'Garra'.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04"); //S�lo alguien de esp�ritu fuerte y firme en su fe puede soportar su conjuro.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05"); //Ahora est� claro por qu� los constructores sellaron el valle.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06"); //Trajeron a la ciudad este arma del mal y sucumbieron a su poder.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07"); //Esos necios arrogantes se destruyeron entre s� comidos por la avaricia.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08"); //La crueldad no conoci� l�mites hasta que la ira de Adanos lo arras� todo y hundi� la ciudad en las profundidades del mar.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09"); //As� es. Los creadores del portal hicieron bien en esconder estos objetos al resto del mundo.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10"); //Un final tr�gico para una cultura maravillosa.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11"); //�Comprendes ahora la importancia de nuestra misi�n?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12"); //Raven es un luchador fuerte y cegado por sus ansias de poder.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13"); //En su mano, la Garra ser� un instrumento de destrucci�n.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14"); //No debe conseguir el arma o de lo contrario, estaremos todos perdidos.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"Hay un arma muy poderosa en el templo de Adanos. La llaman la 'Garra de Beliar'. No podemos permitir que Raven se haga con ella. "); 

};
func void DIA_Addon_Saturas_TalkedToGhost_kammern ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_TalkedToGhost_kammern_15_00"); //�Qu� son las salas de Adanos?
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_01"); //Ahora conocemos la entrada, pero no es el �nico obst�culo que nos impide adentrarnos en las profundidades del templo.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_02"); //En el templo, hay tres salas ideadas para detener a los intrusos.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_03"); //Las reliquias de colores de los constructores son la clave.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_04"); //S�lo si reunimos todas las reliquias y resolvemos todos los enigmas podremos entrar en el sagrado n�cleo del templo.
	AI_Output	(self, other, "DIA_Addon_Saturas_TalkedToGhost_kammern_14_05"); //No s� si Raven habr� sido capaz de resolver los enigmas del templo, pero, en caso afirmativo, tenemos un grave problema.
	
	Log_CreateTopic (TOPIC_Addon_Kammern, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Kammern,LogText_Addon_Relicts); 
	
	Log_CreateTopic (TOPIC_Addon_Relicts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_Relicts,LogText_Addon_Relicts); 

	Saturas_KnowsHow2GetInTempel = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info RelictsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RelictsBack		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_RelictsBack_Condition;
	information	 = 	DIA_Addon_Saturas_RelictsBack_Info;

	description	 = 	"�Qu� deber�a hacer con las reliquias del templo?";
};

func int DIA_Addon_Saturas_RelictsBack_Condition ()
{
	if (Saturas_SCBroughtAllToken == TRUE)
	&& (Saturas_KnowsHow2GetInTempel == TRUE)
	&& (RavenIsDead == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_RelictsBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_RelictsBack_15_00"); //�Qu� deber�a hacer con las reliquias del templo?
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_03"); //Sabemos muy poco. Sin embargo, esperamos que reconozcas su importancia cuando entres en el templo.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_05"); //Siento no poder contarte m�s. Ahora todo depende de ti.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_06"); //Coge las reliquias y dir�gete al templo de inmediato.

	CreateInvItems (hero, ItMi_Addon_Stone_01, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_02, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_03, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_04, 1);
	CreateInvItems (hero, ItMi_Addon_Stone_05, 1);
	AI_PrintScreen	(PRINT_ItemsErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);

	B_LogEntry (TOPIC_Addon_Kammern,"Saturas me ha enviado al templo de Adanos con las cinco reliquias de los constructores para atravesar las salas y detener a Raven."); 

	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_07"); //Que Adanos sea compasivo y nos proteja a todos.
	AI_Output	(self, other, "DIA_Addon_Saturas_RelictsBack_14_08"); //Quiz� a�n no sea demasiado tarde.
};

///////////////////////////////////////////////////////////////////////
//	Info RavensDead
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_RavensDead		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_RavensDead_Condition;
	information	 = 	DIA_Addon_Saturas_RavensDead_Info;

	important	 = 	TRUE;
};
func int DIA_Addon_Saturas_RavensDead_Condition ()
{
	if (RavenIsDead == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Saturas_RavensDead_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_00"); //Los terremotos han cesado y veo que t� a�n est�s entre los vivos.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_01"); //�Significa eso que has cumplido tu misi�n?
	AI_Output	(other, self, "DIA_Addon_Saturas_RavensDead_15_02"); //S�. Raven est� muerto.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_03"); //Entonces todo se acab�. Gracias a Adanos.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_04"); //Lo has hecho muy bien, hijo. Estamos en deuda contigo.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_05"); //Le has arrebatado al mal una poderosa arma y has restablecido el equilibrio en esta parte del mundo.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_06"); //Cuando los terremotos cesaron, estuvimos discutiendo qu� iba a ocurrir y hemos llegado a una conclusi�n.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_07"); //Ve y coge la 'Garra de Beliar'. Que de ahora en adelante tu pu�o la porte.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_08"); //En tu mano, ser� una aliada para todos nosotros.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_09"); //�sala con sabidur�a, hijo m�o. Que Adanos te ayude.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_11"); //Nos quedaremos aqu� para ocuparnos de que el templo recupere su antiguo esplendor.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_12"); //S�lo Myxir est� ya de camino a Khorinis para apoyar a Vatras.
	AI_Output	(self, other, "DIA_Addon_Saturas_RavensDead_14_13"); //Vatras lleva solo en la ciudad demasiado tiempo.

	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"Han enviado a Mytrix a apoyar a Vetras en el puerto mar�timo."); 

	B_GivePlayerXP (XP_Addon_Saturas_RavensDead);
};

///////////////////////////////////////////////////////////////////////
//	Info FreedMissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_FreedMissingPeople		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Saturas_FreedMissingPeople_Condition;
	information	 = 	DIA_Addon_Saturas_FreedMissingPeople_Info;

	description	 = 	"He liberado a los prisioneros.";
};

func int DIA_Addon_Saturas_FreedMissingPeople_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_FreedMissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_FreedMissingPeople_15_00"); //He liberado a los prisioneros.
	AI_Output	(self, other, "DIA_Addon_Saturas_FreedMissingPeople_14_01"); //Muy bien. Ojal� vuelvan sanos y salvos a su patria.
	B_GivePlayerXP (XP_Addon_Saturas_FreedMissingPeople);
};

///////////////////////////////////////////////////////////////////////
//	Info BeliarsWeapon
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_BeliarsWeapon		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_BeliarsWeapon_Condition;
	information	 = 	DIA_Addon_Saturas_BeliarsWeapon_Info;

	description	 = 	"He cogido la 'Garra de Beliar'.";
};

func int DIA_Addon_Saturas_BeliarsWeapon_Condition ()
{
	if (C_ScHasBeliarsWeapon ())
	&& (RavenIsDead == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_BeliarsWeapon_Info ()
{
	AI_UnequipWeapons (hero);
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_00"); //He cogido la 'Garra de Beliar'.
	
	if (Npc_HasItems (hero,ItMw_BeliarWeapon_Raven))
	&& (SC_FailedToEquipBeliarsWeapon == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Saturas_BeliarsWeapon_15_01"); //Pero no puedo empu�arla.
	};
	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_02"); //La 'Garra de Beliar' es un arma muy ESPECIAL.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_03"); //Tiene su propia voluntad y su propia consciencia.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_04"); //Ahora que posees esta poderosa arma, eres su se�or y su maestro.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_05"); //Forma parte de ti y se adaptar� a tus capacidades.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_06"); //Sin embargo, no lo har� por voluntad propia.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarsWeapon_14_07"); //S�lo el PROPIO Beliar puede obligarla a obedecerte.
	
	Info_ClearChoices	(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "�Y por qu� iba a ayudarme Beliar?", DIA_Addon_Saturas_BeliarsWeapon_besser );
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "�Qu� puedo hacer con el arma?", DIA_Addon_Saturas_BeliarsWeapon_wastun );
};
func void DIA_Addon_Saturas_BeliarsWeapon_wastun ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00"); //�Qu� puedo hacer con el arma?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01"); //Eso lo dejo en tu mano. T� has conquistado el arma y t� eres su amo.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02"); //Yo s�lo puedo recomendarte qu� hacer.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03"); //O me la das a M� para que me ocupe de que no vuelva a causar m�s da�o
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04"); //�o aprovechas su poder y la empu�as en combate.
	Info_AddChoice	(DIA_Addon_Saturas_BeliarsWeapon, "�No podr�as mantener la espada a salvo?", DIA_Addon_Saturas_BeliarsWeapon_geben );
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_geben_15_00"); //�No podr�as mantener la espada a salvo?
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_01"); //Du bist der Bezwinger des B�sen. Deine Entscheidungen bestimmen das Geschick dieser Welt.
	//AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_02"); //Wenn du dich dazu entschlie�t, die Klaue aus der Hand zu geben, ist dein Schicksal nicht mehr an sie gebunden.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_03"); //Si me la das, yo la inutilizar�, para que nadie pueda volver a darle mal uso.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_geben_14_04"); //As� que madura bien tu decisi�n.

	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Klaue,"Le puedo dar la Garra de Beliar a Saturas o qued�rmela yo."); 
};

func void DIA_Addon_Saturas_BeliarsWeapon_besser ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_BeliarsWeapon_besser_15_00"); //�Y por qu� iba a ayudarme Beliar?
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_01"); //S�lo podr�s conseguirlo rez�ndole.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_02"); //Pero ten cuidado. Beliar es malvado.
	AI_Output			(self, other, "DIA_Addon_Saturas_BeliarsWeapon_besser_14_03"); //Si provocas su ira, te har� sufrirla.
	
	Log_CreateTopic (TOPIC_Addon_Klaue, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue, LOG_RUNNING);
	Log_AddEntry  (TOPIC_Addon_Klaue,"Para someter la Garra de Beliar a mi voluntad, debo rezar a Beliar.");

	B_Say 	  	(other,self,"$VERSTEHE");
};

///////////////////////////////////////////////////////////////////////
//	Info PermENDE_ADDON
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PermENDE_ADDON		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_PermENDE_ADDON_Condition;
	information	 = 	DIA_Addon_Saturas_PermENDE_ADDON_Info;
	permanent	 = 	TRUE;

	description	 = 	"�Ahora qu� vas a hacer?";
};

func int DIA_Addon_Saturas_PermENDE_ADDON_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_RavensDead))
		{
			return TRUE;
		};
};
var int DIA_Addon_Saturas_PermENDE_ADDON_OneTime;
func void DIA_Addon_Saturas_PermENDE_ADDON_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PermENDE_ADDON_15_00"); //�Qu� har�is ahora?
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_01"); //Nos quedaremos aqu� y haremos que el templo recupere su antiguo esplendor.
	AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_02"); //Estos muros llevan demasiado tiempo en este lamentable estado.
	if (DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_03"); //En cuanto a ti, hijo m�o
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_04"); //Me alegra comprobar que no me equivoqu� contigo. Eres el Defensor del Equilibrio. Ya no cabe duda.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_05"); //Sin tu coraje y tu fuerza, la isla de Khorinis se hubieran hundido. Te damos las gracias y te honramos en nuestra memoria.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_06"); //Ded�cate ahora a otras tareas que tengas pendientes y devuelve a este mundo el equilibrio y la paz.
		AI_Output	(self, other, "DIA_Addon_Saturas_PermENDE_ADDON_14_07"); //Ahora ve y cumple con tu destino, Defensor. Nuestras oraciones van contigo.
		DIA_Addon_Saturas_PermENDE_ADDON_OneTime = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeliarWeapGeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_BeliarWeapGeben		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_BeliarWeapGeben_Condition;
	information	 = 	DIA_Addon_Saturas_BeliarWeapGeben_Info;

	description	 = 	"Coge la 'Garra de Beliar' y destr�yela.";
};

func int DIA_Addon_Saturas_BeliarWeapGeben_Condition ()
{
	if (C_ScHasBeliarsWeapon ())
	&& (RavenIsDead == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Saturas_BeliarsWeapon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_BeliarWeapGeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_BeliarWeapGeben_15_00"); //Ll�vate la 'Garra de Beliar' y destr�yela.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_01"); //Como desees, hijo m�o. Entr�gamela.
	B_ClearBeliarsWeapon ();
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_02"); //Para que no pueda hacer m�s da�o, la hundir� en las profundidades del mar.
	AI_Output	(self, other, "DIA_Addon_Saturas_BeliarWeapGeben_14_03"); //La sabidur�a de Adanos velar� por ella.
	TOPIC_END_Klaue = TRUE;
	B_GivePlayerXP (XP_Addon_BeliarsWeaponAbgegeben);
	Saturas_KlaueInsMeer = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeachCircle
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_PreTeachCircle		(C_INFO)
{
	npc		 = 	KDW_14000_Addon_Saturas_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Saturas_ADW_PreTeachCircle_Condition;
	information	 = 	DIA_Addon_Saturas_ADW_PreTeachCircle_Info;

	description	 = 	"�Puedes ense�arme los C�rculos de Magia?";
};

func int DIA_Addon_Saturas_ADW_PreTeachCircle_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_ADW_PreTeachCircle_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_00"); //�Puedes ense�arme los C�rculos de Magia?
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_01"); //Eres un Mago de Fuego. �Qu� opinar�a Pyrokar al respecto?
	AI_Output	(other, self, "DIA_Addon_Saturas_ADW_PreTeachCircle_15_02"); //Nadie tiene por qu� saberlo.
	AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_03"); //(suspira) Veo que hablas en serio, as� que satisfar� tu petici�n.

	if ((RavenIsDead == FALSE))
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_04"); //Sin embargo, si percibo que nuestros conocimientos pasan a manos que no deben, ya no podr�s contar con mi ayuda.
		AI_Output	(self, other, "DIA_Addon_Saturas_ADW_PreTeachCircle_14_05"); //M�s te vale no decepcionarme.
	};
	Saturas_Addon_TeachCircle = TRUE;

	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_SaturasTeach); 
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHCIRCLE
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ADW_CIRCLE		(C_INFO)
{
	npc			 = 	KDW_14000_Addon_Saturas_ADW;
	nr			 = 	99;
	condition	 = 	DIA_Addon_Saturas_ADW_CIRCLE_Condition;
	information	 = 	DIA_Addon_Saturas_ADW_CIRCLE_Info;
	permanent	 = 	TRUE;
	description	 = 	"Quiero alcanzar un nivel de magia superior.";
};
var int DIA_Addon_Saturas_ADW_CIRCLE_NoPerm;
func int DIA_Addon_Saturas_ADW_CIRCLE_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) < 6)
	&& (Saturas_Addon_TeachCircle == TRUE)
	&& (DIA_Addon_Saturas_ADW_CIRCLE_NoPerm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_ADW_CIRCLE_Info ()
{
	AI_Output (other, self, "DIA_Addon_Saturas_ADW_CIRCLE_15_00"); //Quiero alcanzar un nivel de magia superior.
	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 1)
	&& (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self,other, 2)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_01"); //S�, est�s preparado para aumentar tus conocimientos.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_02"); //Entra ahora en el segundo C�rculo de Magia. Que Adanos te otorgue la fuerza para usar el poder que se te ha concedido.
		};                                                                                                                     
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 2)
	&& (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self,other, 3)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_03"); //S�, es el momento adecuado. Entra ahora en el tercer C�rculo de Magia.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_04"); //Tus conocimientos te permitir�n ahora realizar un magia m�s efectiva y poderosa. �sala con cuidado.
		};                                                             
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 3)
	&& (MIS_ReadyforChapter4 == TRUE)
	{
		if B_TeachMagicCircle (self,other, 4)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_05"); //Ha llegado el momento. Est�s listo para entrar en el cuarto C�rculo de Magia.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_06"); //Tus palabras y tus actos est�n llenos de fuerza. Escoge tus nuevos conjuros con cuidado y juicio.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 4)
	&& (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,other, 5)
		{
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_07"); //Vas a tener el privilegio de entrar en el quinto C�rculo de Magia.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_08"); //Los conjuros que podr�s aprender ahora son realmente devastadores.
			AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_09"); //S� consciente de tu poder y no sucumbas al enga�o de la grandeza.
		};
	}
	else if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_10"); //Yo ya he cumplido mi parte.
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_11"); //Para aprender el sexto y �ltimo C�rculo de Magia, m�s vale que vayas al monasterio de los Magos de Fuego.
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Saturas_ADW_CIRCLE_14_12"); //A�n es pronto para ti. Vuelve m�s adelante.
	};
};

















