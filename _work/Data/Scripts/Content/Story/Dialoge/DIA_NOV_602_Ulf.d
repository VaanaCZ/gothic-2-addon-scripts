///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ulf_EXIT   (C_INFO)
{
	npc         = NOV_602_Ulf;
	nr          = 999;
	condition   = DIA_Ulf_EXIT_Condition;
	information = DIA_Ulf_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ulf_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ulf_EXIT_Info()
{
	AI_StopProcessInfos (self);
};	
///////////////////////////////////////////////////////////////////////
//	Info YOU
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Hallo		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	2;
	condition	 = 	DIA_Ulf_Hallo_Condition;
	information	 = 	DIA_Ulf_Hallo_Info;
	permanent	 =  FALSE;
	description	 = 	"�Qu� est�s haciendo aqu�?";
};

func int DIA_Ulf_Hallo_Condition ()
{
	if (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_KDF)
	&& (MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};	
};
func void DIA_Ulf_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Hallo_15_00"); //�Qu� haces aqu�?
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Ulf_Hallo_03_01"); //Intento realizar a tu entera satisfacci�n las tareas que el monasterio me ha encomendado.
	}
	else
	{
		AI_Output (self, other, "DIA_Ulf_Hallo_03_02"); //Soy novicio del monasterio. Hago recados para los magos y tambi�n para los paladines.
		AI_Output (self, other, "DIA_Ulf_Hallo_03_03"); //He suministrado vino del monasterio a los tres posaderos de la ciudad.
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Wirte
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Wirte		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	3;
	condition	 = 	DIA_Ulf_Wirte_Condition;
	information	 = 	DIA_Ulf_Wirte_Info;
	permanent	 = 	FALSE;
	description	 = 	"�Qui�nes son los tres posaderos?";
};

func int DIA_Ulf_Wirte_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Wirte_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Wirte_15_00"); //�Qui�nes son los tres posaderos?
	AI_Output (self, other, "DIA_Ulf_Wirte_03_01"); //Uno de ellos es el buen hombre que est� detr�s de la barra.
	AI_Output (self, other, "DIA_Ulf_Wirte_03_02"); //Luego est� Caragon, que tiene su fonda en la plaza del templo, y Kardif, el propietario de la taberna del distrito portuario.
};
///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Kloster		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	3;
	condition	 = 	DIA_Ulf_Kloster_Condition;
	information	 = 	DIA_Ulf_Kloster_Info;
	permanent	 = 	FALSE;
	description	 = 	"�Qu� me puedes contar del monasterio?";
};

func int DIA_Ulf_Kloster_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Kloster_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Kloster_15_00"); //�Qu� me puedes contar del monasterio?
	AI_Output (self, other, "DIA_Ulf_Kloster_03_01"); //Los novicios buscan la iluminaci�n cuando rezan a Innos y aprenden de los magos los principios de la fe.
	AI_Output (self, other, "DIA_Ulf_Kloster_03_02"); //Les servimos igual que servimos a Innos y nos preparamos para la uni�n con el fuego.
};
///////////////////////////////////////////////////////////////////////
//	bring mich zum Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Bringen	(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	4;
	condition	 = 	DIA_Ulf_Bringen_Condition;
	information	 = 	DIA_Ulf_Bringen_Info;
	permanent	 =  FALSE;
	description	 = 	"Ll�vame al monasterio.";
};

func int DIA_Ulf_Bringen_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Hallo)
	&& (hero.guild != GIL_KDF)
	&& (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Bringen_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Bringen_15_00"); //Ll�vame al monasterio.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_01"); //Ni hablar. �Sabes cu�ntas criaturas he tenido que eludir por el camino?
	AI_Output (self, other, "DIA_Ulf_Bringen_03_02"); //Cuando pienso en todas esas moscas de sangre, lobos y trasgos, me alegro de no tener que volver a salir de aqu�.
	AI_Output (self, other, "DIA_Ulf_Bringen_03_03"); //Adem�s, tampoco podr�as entrar en el monasterio.
	AI_Output (other, self, "DIA_Ulf_Bringen_15_04"); //�Por qu� no?
	AI_Output (self, other, "DIA_Ulf_Bringen_03_05"); //Solo pueden entrar los magos, los paladines y los novicios.
};
///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Aufnahme		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	3;
	condition	 = 	DIA_Ulf_Aufnahme_Condition;
	information	 = 	DIA_Ulf_Aufnahme_Info;
	permanent	 = 	FALSE;
	description	 = 	"�C�mo puedo convertirme en novicio?";
};

func int DIA_Ulf_Aufnahme_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Bringen)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Aufnahme_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Aufnahme_15_00"); //�C�mo puedo convertirme en novicio?
	AI_Output (self, other, "DIA_Ulf_Aufnahme_03_01"); //Si un hombre siente el anhelo profundo...
	AI_Output (other, self, "DIA_Ulf_Aufnahme_15_02"); //Mira, lim�tate a decirme las condiciones.
	AI_Output (self, other, "DIA_Ulf_Aufnahme_03_03"); //Necesitas las ofrendas. Una oveja y...
	B_Say_Gold (self, other, Summe_Kloster);
	
	Log_CreateTopic (Topic_Kloster,LOG_MISSION);
	Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
	B_LogEntry (Topic_Kloster,"Para convertirme en un novicio del monasterio de Innos necesito una oveja y 1.000 monedas de oro.");
};
///////////////////////////////////////////////////////////////////////
//	Info Gold
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Gold		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	8;
	condition	 = 	DIA_Ulf_Gold_Condition;
	information	 = 	DIA_Ulf_Gold_Info;
	permanent	 = 	FALSE;
	description	 = 	"�De d�nde voy a sacar tanto oro?";
};

func int DIA_Ulf_Gold_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Aufnahme)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Gold_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Gold_15_00"); //�De d�nde voy a sacar tanto oro?
	AI_Output (self, other, "DIA_Ulf_Gold_03_01"); //Como es evidente que no tienes a nadie que pague por ti, tendr�s que trabajar.
};
///////////////////////////////////////////////////////////////////////
//	Info Schaf
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Schaf		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Schaf_Condition;
	information	 = 	DIA_Ulf_Schaf_Info;
	permanent	 = 	FALSE;
	description	 = 	"�D�nde encuentro una oveja?";
};

func int DIA_Ulf_Schaf_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Ulf_Aufnahme)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Schaf_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Schaf_15_00"); //�Qui�n me puede proporcionar una oveja?
	AI_Output (self, other, "DIA_Ulf_Schaf_03_01"); //Los granjeros, claro. Pero no te la dar�n a cambio de nada.
	
	B_LogEntry (Topic_Kloster,"La oveja la puedo conseguir de los granjeros.");
};
///////////////////////////////////////////////////////////////////////
//	Info Suche
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Suche		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Suche_Condition;
	information	 = 	DIA_Ulf_Suche_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_Ulf_Suche_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_GetDistToWP (self,"NW_TROLLAREA_PATH_42") <= 1000)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Suche_Info ()
{
	AI_Output (self, other, "DIA_Ulf_Suche_03_00"); //�Eh!, �sabes qu� ha pasado?
	AI_Output (other, self, "DIA_Ulf_Suche_15_01"); //Te han elegido.
	AI_Output (self, other, "DIA_Ulf_Suche_03_02"); //S�. Justo cuando me iba a tomar un trago de cerveza, lleg� Daron y me cont� que me hab�an elegido.
	AI_Output (self, other, "DIA_Ulf_Suche_03_03"); //�Qui�n lo habr�a pensado? Los caminos de Innos son inescrutables. Y, �qu� te trae por aqu�?
	AI_Output (other, self, "DIA_Ulf_Suche_15_04"); //He solicitado la prueba del fuego.
	AI_Output (self, other, "DIA_Ulf_Suche_03_05"); //�Es imposible! Chico, eres valiente de verdad. �Eso quiere decir que tienes que buscar ''lo que el creyente encuentra detr�s de la senda''?
	AI_Output (other, self, "DIA_Ulf_Suche_15_06"); //Eso parece.
};
///////////////////////////////////////////////////////////////////////
//	Info Rausgefunden
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Rausgefunden		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Rausgefunden_Condition;
	information	 = 	DIA_Ulf_Rausgefunden_Info;
	permanent	 = 	FALSE;
	description  = "�Y has encontrado algo?";
};
func int DIA_Ulf_Rausgefunden_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_GetDistToWP (self,"NW_TROLLAREA_PATH_42") <= 1000)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Rausgefunden_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Rausgefunden_15_00"); //�Y has encontrado algo?
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_01"); //Bueno, precisamente segu�a a Agon, pero acab� perdi�ndole.
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_02"); //Y ahora... �qu� dicen? Sigue las se�ales de Innos. Pero no comprendo la parte de la senda.
	AI_Output (self, other, "DIA_Ulf_Rausgefunden_03_03"); //As� que seguir� buscando.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "FOLLOW");
	
};
///////////////////////////////////////////////////////////////////////
//	Info Folgen
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Folgen		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Folgen_Condition;
	information	 = 	DIA_Ulf_Folgen_Info;
	permanent	 = 	FALSE;
	description  = "Eh, �me est�s siguiendo?";
};
func int DIA_Ulf_Folgen_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other,DIA_Ulf_Rausgefunden)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Folgen_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Folgen_15_00"); //�Eh!, �me est�s siguiendo?
	AI_Output (self, other, "DIA_Ulf_Folgen_03_01"); //Vaya tonter�a. Solo ha coincidido que iba en la misma direcci�n que t�.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Stop
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Stop		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Stop_Condition;
	information	 = 	DIA_Ulf_Stop_Info;
	permanent	 = 	FALSE;
	description  = "�Deja de correr detr�s de m�!";
};
func int DIA_Ulf_Stop_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other,DIA_Ulf_Folgen)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Stop_Info ()
{
	AI_Output (other, self, "DIA_Ulf_Stop_15_00"); //�Deja de correr detr�s de m�!
	AI_Output (self, other, "DIA_Ulf_Stop_03_01"); //No te estoy siguiendo. Pero si es eso lo que crees, me ir� por otro lado.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SUCHE");
};
///////////////////////////////////////////////////////////////////////
//	Info Abrechnung
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Abrechnung		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Abrechnung_Condition;
	information	 = 	DIA_Ulf_Abrechnung_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};	
func int DIA_Ulf_Abrechnung_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& (Npc_HasItems (other, ItmI_RuneBlank) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Ulf_Abrechnung_Info ()
{
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_00"); //Volvemos a encontrarnos. �Sabes qu�? Le he estado dando ueltas y creo que deseo fervientemente ser mago.
	AI_Output (other, self, "DIA_Ulf_Abrechnung_15_01"); //Venga, hombre, no hagas eso...
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_02"); //No tengo opci�n. La vida de novicio no va conmigo.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_03"); //Tengo que convertirme en mago, y todo me ir� bien. Y ahora voy a tomar lo que me corresponde por derecho.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_03_04"); //�Alguna �ltima voluntad?
	
	Info_ClearChoices (DIA_Ulf_Abrechnung);
	Info_AddChoice (DIA_Ulf_Abrechnung,"�Basta ya!, no quiero matarte.",DIA_Ulf_Abrechnung_Lass);
	Info_AddChoice (DIA_Ulf_Abrechnung,"Tengamos las cosas claras. Tengo que volver al monasterio.",DIA_Ulf_Abrechnung_Schnell);
	Info_AddChoice (DIA_Ulf_Abrechnung,"�Tienes algo que fumar?",DIA_Ulf_Abrechnung_Rauch);
};
FUNC VOID DIA_Ulf_Abrechnung_Lass()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Lass_15_00"); //�Basta ya!, no quiero matarte.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Lass_03_01"); //�Milongas, pero sabes que no tienes nada que hacer contra m�! �Vamos!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
FUNC VOID DIA_Ulf_Abrechnung_Schnell()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Schnell_15_00"); //Pong�monos manos a la obra. Tengo que volver al monasterio.
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Schnell_03_01"); //�Ya no vas a volver a ir a ning�n sitio!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
FUNC VOID DIA_Ulf_Abrechnung_Rauch()
{
	AI_Output (other, self, "DIA_Ulf_Abrechnung_Rauch_15_00"); //�Tienes algo que fumar?
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Rauch_03_01"); //Tienes suerte. Resulta que tengo algo por aqu�.
	
	B_GiveInvItems (self, other, ITmi_Joint,1);
	B_UseItem (other, itmI_Joint);
	AI_Output (self, other, "DIA_Ulf_Abrechnung_Rauch_03_02"); //Acabemos de una vez.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0);
};
///////////////////////////////////////////////////////////////////////
//	Info Troll
///////////////////////////////////////////////////////////////////////
instance DIA_Ulf_Troll		(C_INFO)
{
	npc			 = 	NOV_602_Ulf;
	nr			 = 	9;
	condition	 = 	DIA_Ulf_Troll_Condition;
	information	 = 	DIA_Ulf_Troll_Info;
	permanent	 = 	FALSE;
	important 	 =  TRUE;
};
func int DIA_Ulf_Troll_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo (other,DIA_Ulf_Rausgefunden)
	&& ((Npc_GetDistToWP (self, "NW_TROLLAREA_PATH_14") <= 1000)
	|| (Npc_GetDistToWP (self, "NW_TROLLAREA_PATH_15") <= 1000))
	{
		return TRUE;
	};
};
func void DIA_Ulf_Troll_Info ()
{
	AI_Output (self, other, "DIA_Ulf_Troll_03_00"); //�Eh!, �est�s seguro de que vamos por el buen camino? En alg�n sitio, por all� atr�s, vive un troll.
	AI_Output (self, other, "DIA_Ulf_Troll_03_01"); //Creo que preferir�a mirar en otra direcci�n.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"WAIT");
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ulf_PICKPOCKET (C_INFO)
{
	npc			= NOV_602_Ulf;
	nr			= 900;
	condition	= DIA_Ulf_PICKPOCKET_Condition;
	information	= DIA_Ulf_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Ulf_PICKPOCKET_Condition()
{
	C_Beklauen (34, 50);
};
 
FUNC VOID DIA_Ulf_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ulf_PICKPOCKET);
	Info_AddChoice		(DIA_Ulf_PICKPOCKET, DIALOG_BACK 		,DIA_Ulf_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ulf_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ulf_PICKPOCKET_DoIt);
};

func void DIA_Ulf_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ulf_PICKPOCKET);
};
	
func void DIA_Ulf_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ulf_PICKPOCKET);
};











