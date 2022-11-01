///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Pyrokar_EXIT   (C_INFO)
{
	npc         = KDF_500_Pyrokar;
	nr          = 999;
	condition   = DIA_Pyrokar_EXIT_Condition;
	information = DIA_Pyrokar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pyrokar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WELCOME		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  2;
	condition	 = 	DIA_Pyrokar_WELCOME_Condition;
	information	 = 	DIA_Pyrokar_WELCOME_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Pyrokar_WELCOME_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_WELCOME_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_00"); //Así que eres el nuevo novicio. Bien, supongo que el maestro Parlan ya te ha encargado una tarea.
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_01"); //(Con leve tono de reproche) Sabes que en la Comunidad del Fuego todos deben cumplir con su obligación según la voluntad de Innos.
};
///////////////////////////////////////////////////////////////////////
//	Info Hagen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Hagen		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_Hagen_Condition;
	information	 = 	DIA_Pyrokar_Hagen_Info;
	permanent	 =  FALSE;
	description	 =  "He de hablar con los paladines. Es urgente.";
};
func int DIA_Pyrokar_Hagen_Condition ()
{	
	if (other.guild  == GIL_NOV) //muss kommen
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Hagen_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_00"); //He de hablar con los paladines. Es urgente.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_01"); //¿Y vas a contarnos por qué quieres hablar con ellos?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_02"); //Tengo un mensaje importante para ellos.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_03"); //¿Y qué mensaje es?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_04"); //¡Un ejército maléfico liderado por dragones se está congregando en el Valle de las Minas! Tenemos que detenerlos mientras podamos.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_05"); //Um. Reflexionaremos acerca de tus palabras, novicio. Cuando llegue la hora, te haremos saber lo que el concilio ha decidido.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_06"); //Mientras tanto, será mejor que atiendas tus obligaciones de novicio.
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Auge)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_07"); //No queremos distraerte de tu trabajo más tiempo. Ya puedes marcharte.
		AI_StopProcessInfos (self);
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Auge		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_Auge_Condition;
	information	 = 	DIA_Pyrokar_Auge_Info;
	permanent	 =  FALSE;
	description	 =  "Busco el Ojo de Innos.";
};
func int DIA_Pyrokar_Auge_Condition ()
{	
	if (KNOWS_FIRE_CONTEST == FALSE)
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Auge_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_00"); //Busco el Ojo de Innos.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_01"); //Todo aquel que piensa que no solo puede encontrar el amuleto sagrado, sino también ponérselo, es un necio.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_02"); //El amuleto escoge a su portador. Nadie puede ponérselo, salvo el que esté predestinado para ello.
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_03"); //Estoy dispuesto a intentarlo.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_04"); //El novicio está obligado a demostrar humildad, no anhelo.
	
 	B_LogEntry (TOPIC_INNOSEYE, "No creí que fuera a ser tan difícil, pero Pyrokar no entregará el Ojo voluntariamente y sin la ayuda de los paladines.");
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_05"); //No queremos distraerte de tu trabajo más tiempo. Ya puedes marcharte.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Pyrokar_MissingPeople		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Pyrokar_MissingPeople_Condition;
	information	 = 	DIA_Addon_Pyrokar_MissingPeople_Info;

	description	 = 	"Algunos ciudadanos de Khorinis han desaparecido misteriosamente.";
};
func int DIA_Addon_Pyrokar_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (Sklaven_Flucht == FALSE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Pyrokar_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_00"); //Algunos ciudadanos de Khorinis han desaparecido misteriosamente.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_01"); //Tengo información al respecto y es lamentable. Pero hemos acordado con los Magos de Agua que ellos se ocuparán del asunto.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_02"); //Lo mismo ocurre con la investigación de los extraños terremotos en el noreste de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_03"); //Hasta ahora no me han informado de que se requiera nuestra intervención. Por eso, no vamos a hacer nada al respecto.
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_04"); //Sí, pero
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_05"); //¡Nada de peros! Procederemos como creamos conveniente y espero que incluso TÚ sepas respetarlo.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Los Magos de Fuego lamentan la pérdida de ciudadanos, pero dicen que el asunto corresponde a los Magos de Agua. No se puede esperar ayuda del monasterio."); 

	if (other.guild  == GIL_NOV)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	{
		AI_StopProcessInfos (self); 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GOAWAY
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GOAWAY		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_GOAWAY_Condition;
	information	 = 	DIA_Pyrokar_GOAWAY_Info;
	permanent	 = 	TRUE;
	important	 = 	TRUE;
};
func int DIA_Pyrokar_GOAWAY_Condition ()
{
	//ADDON>
	if (Npc_KnowsInfo (hero, DIA_Addon_Pyrokar_MissingPeople) == FALSE)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return FALSE;
		};
	//ADDON<

	if (Npc_IsInState (self, ZS_Talk)
	&&  Npc_KnowsInfo (hero, DIA_Pyrokar_Hagen)
	&&  Npc_KnowsInfo (hero, DIA_Pyrokar_Auge)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_GOAWAY_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_GOAWAY_11_00"); //(Molesto) La obediencia es una virtud que tienes que aprender. Por las buenas o por las malas.
	
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info FIRE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FIRE		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 =  1;
	condition	 = 	DIA_Pyrokar_FIRE_Condition;
	information	 = 	DIA_Pyrokar_FIRE_Info;
	permanent	 =  FALSE;
	description	 = 	"Quiero someterme a la prueba del fuego.";
};
func int DIA_Pyrokar_FIRE_Condition ()
{	
	if (KNOWS_FIRE_CONTEST == TRUE)
	&& (other.guild  == GIL_NOV)
	&&  Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_FIRE_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_00"); //Quiero someterme a la prueba del fuego.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_01"); //(Sorprendido) Así que la conoces... ¿quieres someterte a la prueba del fuego?
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_02"); //Sí, me remito a la ley del fuego, que dice que...
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_03"); //(Interrumpe con brusquedad) Conocemos la ley del fuego. También hemos visto morir a muchos novicios durante la prueba. Deberías sopesar con calma esta decisión.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_04"); //Ya lo he hecho. Quiero someterme a la prueba... y voy a superarla.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_05"); //(A modo de advertencia) Si insistes, el Concilio Supremo te pondrá a prueba.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_06"); //Insisto en someterme a la prueba del fuego.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_07"); //En ese caso, que así sea. Cuando estés listo, cada uno de los magos del Concilio Supremo te encargará una misión que tendrás que cumplir.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_08"); //Que Innos se apiade de tu alma.
	
	B_LogEntry (TOPIC_FireContest,"Le he exigido a Pyrokar la prueba del fuego. Ahora tengo que completar las tres tareas que me encargue el Concilio Supremo.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEST		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr           =  10;
	condition	 = 	DIA_Pyrokar_TEST_Condition;
	information	 = 	DIA_Pyrokar_TEST_Info;
	permanent	 =  FALSE;
	description	 = 	"Estoy listo para afrontar tu prueba, maestro.";
};
func int DIA_Pyrokar_TEST_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	&& (MIS_SCHNITZELJAGD == FALSE)
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEST_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_00"); //Estoy listo para afrontar tu prueba, maestro.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_01"); //Y solo Innos sabe si vas a superarla. Te someterás a la misma prueba que los novicios elegidos.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_02"); //La prueba de la magia. (Distante) Probablemente sepas que solo uno de los novicios puede superar la prueba.
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_03"); //Entiendo. En ese caso, ¿quiénes son los competidores?
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_04"); //En su sabiduría, Innos ha elegido a tres novicios que también van a someterse a la prueba: Agon, Igaraz y Ulf. Ya han iniciado la búsqueda.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_05"); //(Seco) ¡Basta ya! Escucha las palabras de la prueba: 'Sigue las señales de Innos y tráenos lo que el creyente encuentra detrás de la senda'.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_06"); //Vas a necesitar esta llave.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_07"); //Eso es todo lo que tenemos que decirte.
	
	Log_CreateTopic (TOPIC_Schnitzeljagd,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Schnitzeljagd,LOG_RUNNING);
	B_LogEntry (TOPIC_Schnitzeljagd,"Pyrokar está preparando la prueba de la magia. Es la misma prueba que tuvieron que afrontar los novicios escogidos: Ulf, Igaraz y Agon.");
	
	B_LogEntry (TOPIC_Schnitzeljagd,"Voy a seguir los signos de Innos y ''encontrar lo que el creyente encuentra detrás de la senda''. También me dio una llave.");
	
	CreateInvItems (self,ItKe_MagicChest,1);
	B_GiveInvItems (self,other,ItKe_MagicChest,1);
	
	//------------Igaraz klar machen------------------- 
	B_StartOtherRoutine (Igaraz,"CONTEST");
	AI_Teleport (Igaraz,"NW_TAVERNE_BIGFARM_05");	
	CreateInvItems (Igaraz, ItKe_MagicChest,1);
	Igaraz.aivar [AIV_DropDeadAndKill] = TRUE;
	Igaraz.aivar [AIV_NewsOverride] = TRUE;
	
	//---------Smalltalk Partner herbeirufen 
	B_StartOtherRoutine (NOV607,"EXCHANGE");
	
	//------------Agon klar machen-------------------
	B_StartOtherRoutine (Agon,"GOLEMDEAD");
	AI_Teleport (Agon,"NW_MAGECAVE_RUNE");
	CreateInvItems (Agon, ItKe_MagicChest,1);		
	Agon.aivar [AIV_DropDeadAndKill] = TRUE;
	Agon.aivar [AIV_NewsOverride] = TRUE;
	//------------Ulf klar machen-------------------
	B_StartOtherRoutine (Ulf,"SUCHE");
	AI_Teleport (Ulf,"NW_TROLLAREA_PATH_42");	
	CreateInvItems (Ulf, ItKe_MagicChest,1);	
	Ulf.aivar [AIV_DropDeadAndKill] = TRUE;
	Ulf.aivar [AIV_NewsOverride] = TRUE;
	//-------------------------------
	MIS_SCHNITZELJAGD = LOG_RUNNING;
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info RUNNING
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_RUNNING		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	20;
	condition	 = 	DIA_Pyrokar_RUNNING_Condition;
	information	 = 	DIA_Pyrokar_RUNNING_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Pyrokar_RUNNING_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&&  Npc_IsInState (self, ZS_Talk) 
	&& (other.guild  == GIL_NOV)
	&& (Mob_HasItems ("MAGICCHEST",ItMi_RuneBlank))
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_RUNNING_Info ()
{
	var int randomizer;
	randomizer = Hlp_Random (3); 
	
	if  (randomizer == 0)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_00"); //Mientras estés ocupado con la prueba, no tenemos nada que decirte.
	}
	else if (randomizer == 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_01"); //¿Qué haces aquí? ¡Ve a someterte a la prueba!
	}
	else if (randomizer == 2)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_02"); //Ha llegado el momento de que respaldes con obras tus grandes palabras. ¿No te parece, novicio?
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_SUCCESS_Condition;
	information	 = 	DIA_Pyrokar_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"He encontrado la piedra rúnica.";
};
func int DIA_Pyrokar_SUCCESS_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (hero.guild  == GIL_NOV)
	&& (!Mob_HasItems ("MAGICCHEST",ItMi_RuneBlank))
	&& (( Npc_HasItems (other,itmi_runeblank) >= 1)
	|| ( Npc_HasItems (other,itru_firebolt) >= 1))
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_SUCCESS_Info ()
{
	
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_00"); //He encontrado la piedra rúnica.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_01"); //(Sin creérselo) ¿Lo... has logrado? Seguiste las señales y descubriste el portal oculto...
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_02"); //… y derroté a todos esos monstruos que ya me consideraban su aperitivo.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_03"); //¿Y los demás novicios? ¿Qué ha sido de Agon? ¿No lo consiguieron antes que tú?
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_04"); //Han fracasado. Supongo que no estaban destinados a superar la prueba.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_05"); //En ese caso, declaramos que has superado la prueba. Puedes quedarte con la piedra rúnica.
	 
	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	B_GivePlayerXP (XP_SCHNITZELJAGD);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM wenn Prüfung erfolgreich und die anderen noch nicht. 
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Todo		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Todo_Condition;
	information	 = 	DIA_Pyrokar_Todo_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Pyrokar_Todo_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (other.guild  == GIL_NOV)
	&& ((MIS_RUNE  != LOG_SUCCESS)
	|| (MIS_GOLEM != LOG_SUCCESS)) 

	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Todo_Info ()
{
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_00"); //Has superado la prueba que te he planteado.
	AI_Output (self, other, "DIA_Pyrokar_Todo_11_01"); //Pero...
	
	if (MIS_RUNE  != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_02"); //… todavía tienes que superar la prueba de Ulthar.
	};
	if (MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_03"); //… todavía tienes que pasar la prueba de Serpentes.
	};
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MAGICAN		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	3;
	condition	 = 	DIA_Pyrokar_MAGICAN_Condition;
	information	 = 	DIA_Pyrokar_MAGICAN_Info;
	permanent	 =  FALSE;
	description	 = 	"¿Ahora seré aceptado en el Gremio de Magos?";
};

func int DIA_Pyrokar_MAGICAN_Condition ()
{	
	if (MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (MIS_RUNE  		  == LOG_SUCCESS)
	&& (MIS_GOLEM 		  == LOG_SUCCESS)
	&& (other.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_MAGICAN_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_MAGICAN_15_00"); //¿Ahora seré aceptado en el Gremio de Magos?
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_01"); //Lo has conseguido. Has superado la prueba del fuego. Siempre estuvimos seguros de que tendrías éxito.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_02"); //(Insistente) Igual que lo estamos de que seguirás esforzándote al máximo para convertirte en un siervo digno de Innos.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_03"); //Por lo tanto, si estás dispuesto a prestar el juramento del fuego, serás aceptado en nuestras filas como mago.
	
};
///////////////////////////////////////////////////////////////////////
//	Info OATH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_OATH		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	1;
	condition	 = 	DIA_Pyrokar_OATH_Condition;
	information	 = 	DIA_Pyrokar_OATH_Info;
	permanent 	 =  FALSE;
	description	 = 	"Estoy listo para entrar en el Círculo del Fuego.";
};
func int DIA_Pyrokar_OATH_Condition ()
{	
	if (Npc_KnowsInfo (hero, DIA_Pyrokar_MAGICAN))
	&& (hero.guild  == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_OATH_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_00"); //Estoy listo para entrar en el Círculo del Fuego.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_01"); //De acuerdo. En ese caso, presta el juramento sagrado del fuego.
	


	AI_Output (self, other, "DIA_Pyrokar_OATH_11_02"); //(Con solemnidad) ¿Juras ante el todopoderoso lord Innos, sus siervos y la Llama Sagrada...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_03"); //… que a partir de ahora y para siempre, tu vida permanecerá unida al fuego...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_04"); //… hasta que tu cuerpo y tu alma reposen en sus salones sagrados y se extinga la llama de tu vida?
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_05"); //Lo juro.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_06"); //Al pronunciar las palabras del juramento, has sellado un pacto con el fuego.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_07"); //Ponte esta túnica como muestra del vínculo eterno.
	
	CreateInvItems 		(hero,ITAR_KDF_L,1);
	AI_EquipArmor		(hero,ITAR_KDF_L);		
	
	other.guild = GIL_KDF;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Npc_SetTrueGuild (other, GIL_KDF);
	
	Fire_Contest = TRUE;//fürs Log
	
	Snd_Play ("LEVELUP"); 
	
	KDF_Aufnahme = LOG_SUCCESS;
	SLD_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	B_GivePlayerXP (XP_BecomeMage);
	
	
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_08"); //Como ya has sido aceptado en nuestras filas, puedes hablar con lord Hagen, el comandante supremo de los paladines.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_09"); //Nos interesa mucho saber su análisis de la situación. Ya puedes ir a Khorinis.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_10"); //Esperamos que nos traigas su respuesta de inmediato.
};
///////////////////////////////////////////////////////////////////////
//	Info  Lernen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Lernen		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Lernen_Condition;
	information	 = 	DIA_Pyrokar_Lernen_Info;
	PERMANENT	 =  FALSE;
	description	 = 	"¿Qué puedo aprender ahora?";
};
func int DIA_Pyrokar_Lernen_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Lernen_Info ()
{
	AI_Output	(other, self, "DIA_Pyrokar_Lernen_15_00"); //Y ahora, ¿qué puedo aprender?
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_01"); //En primer lugar, tienes derecho a estudiar los círculos de la magia, que te otorgarán el poder para usar las runas.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_02"); //Cuanto más alto llegues en los seis círculos de la magia, más potentes serán los hechizos que podrás realizar.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_03"); //Los hermanos del monasterio te enseñarán las fórmulas. Cada uno se ha especializado en una disciplina concreta que te explicará.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_04"); //Karras, por ejemplo, es un maestro de la invocación y la convocación, e Hyglas te enseñará la magia del fuego.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_05"); //Nadie sabe más que Marduk acerca de los poderes del hielo y el trueno. Parlan puede enseñarte diversos encantamientos, y te iniciará en los primeros círculos.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_06"); //Pero ellos solo te enseñarán las fórmulas. Las runas tendrás que crearlas tú.
	
	Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
	
	B_LogEntry (Topic_KlosterTeacher,"El maestro Parla me ordenará en los primeros círculos de la magia.");
	
	B_LogEntry (Topic_KlosterTeacher,"El hermano Karras enseña fórmulas de invocaciones y convocaciones.");
	B_LogEntry (Topic_KlosterTeacher,"El hermano Hyglas puede enseñarme los misterios del fuego.");
	B_LogEntry (Topic_KlosterTeacher,"El hermano Marduk puede enseñarme los poderes del hielo y el trueno.");
	B_LogEntry (Topic_KlosterTeacher,"El hermano Parlan enseña muchas otras fórmulas.");
};

///////////////////////////////////////////////////////////////////////
//	Info Wunsch
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Wunsch		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Wunsch_Condition;
	information	 = 	DIA_Pyrokar_Wunsch_Info;
	PERMANENT	 =  FALSE;
	description	 = 	"Me gustaría expresar un deseo...";
};
func int DIA_Pyrokar_Wunsch_Condition ()
{	
	if (other.guild == GIL_KDF)
	&& (Kapitel < 2)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Wunsch_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Wunsch_15_00"); //Me gustaría expresar un deseo...
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_01"); //Después de haber sido aceptado, cada mago tiene derecho a hacer algo.
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_02"); //¿Qué va a ser lo primero que hagas como mago?
	
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	Info_AddChoice (DIA_Pyrokar_Wunsch,"Nada.",DIA_Pyrokar_Wunsch_Nothing);
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Quiero que el novicio Babo sea el nuevo jardinero del monasterio.",DIA_Pyrokar_Wunsch_Babo);
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Quiero que el novicio Opolos pueda acceder a la biblioteca.",DIA_Pyrokar_Wunsch_Opolos);
	};
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Pyrokar_Wunsch,"Quiero que el novicio Dyrian se quede en el monasterio.",DIA_Pyrokar_Wunsch_Dyrian);
	};
};

FUNC VOID DIA_Pyrokar_Wunsch_Nothing ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Nothing_15_00"); //Nada.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Nothing_11_01"); //(Asombrado) Que así sea. El nuevo mago renuncia a hacer algo.
	
	B_StartOtherRoutine (Dyrian,"NOFAVOUR");
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos 	= LOG_FAILED;
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
	
	
};

FUNC VOID DIA_Pyrokar_Wunsch_Dyrian ()
{
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Dyrian_15_00"); //Quiero que el novicio Dyrian se quede en el monasterio.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01"); //Que así sea.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02"); //Se permitirá al novicio que se quede en el monasterio, y ocupará el puesto de jardinero que se encuentra vacante.
	
	B_GivePlayerXP (XP_HelpDyrian);
	
	B_StartOtherRoutine (Dyrian,"FAVOUR");
	
	MIS_HelpDyrian = LOG_SUCCESS;
	
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos = LOG_FAILED;
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};

FUNC VOID DIA_Pyrokar_Wunsch_Babo ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Babo_15_00"); //Quiero que el novicio Babo sea el jefe de jardineros del monasterio.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_01"); //Que así sea.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_02"); //Con efecto inmediato, el novicio Babo quedará al cargo de los jardines del monasterio.
	
	B_GivePlayerXP (XP_HelpBabo);
	
	B_StartOtherRoutine (Babo,"FAVOUR");
	B_StartOtherRoutine (Dyrian,"NOFAVOUR");
	
	MIS_HelpBabo = LOG_SUCCESS;
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpOpolos == LOG_RUNNING )
	{
		MIS_HelpOpolos 	= LOG_FAILED;
	};
	
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};

FUNC VOID DIA_Pyrokar_Wunsch_Opolos ()
{
	AI_Teleport (Dyrian,"TAVERNE");
	
	AI_Output (other,self ,"DIA_Pyrokar_Wunsch_Opolos_15_00"); //Quiero que el novicio Opolos pueda acceder a la biblioteca.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_01"); //Que así sea.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_02"); //A partir de ahora, el novicio Opolos estudiará las escritura de Innos.
	
	B_GivePlayerXP (XP_HelpOpolos);
	
	B_StartOtherRoutine (Opolos,"FAVOUR");
	B_StartOtherRoutine(Dyrian,"NOFAVOUR");
	
	MIS_HelpOpolos 	= LOG_SUCCESS;
	
	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian 	= LOG_FAILED;	
	};
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		
		MIS_HelpBabo = LOG_FAILED;
	};
	Info_ClearChoices (DIA_Pyrokar_Wunsch);
};
///////////////////////////////////////////////////////////////////////
//	Info war bei LH und nicht in der OW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Nachricht		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_Nachricht_Condition;
	information	 = 	DIA_Pyrokar_Nachricht_Info;
	permanent	 =  FALSE;
	description	 = 	"Traigo noticias de lord Hagen.";
};
func int DIA_Pyrokar_Nachricht_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Nachricht_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_00"); //Traigo noticias de lord Hagen. Quiere pruebas de la presencia de los dragones y del ejército del mal.
	
	if (EnterOW_Kapitel2 == FALSE)
	{
		AI_Teleport (Sergio,"NW_MONASTERY_PLACE_09");
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_01"); //Por lo tanto, iré al Valle de las Minas y las conseguiré.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_02"); //Bien. Entonces, obedece la siguiente orden. El paladín Sergio te escoltará hasta el desfiladero.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_03"); //Que Innos te proteja.
		
		Sergio_Follow = TRUE;
		AI_StopProcessInfos (self);
		B_StartOtherRoutine (Sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_04"); //Voy directo al Valle de las Minas.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_05"); //Bien. Dado que ya sabes cómo se va al valle, no necesitas escolta.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_06"); //Ocúpate de ese asunto para lord Hagen. Que Innos te proteja.
	};

};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	4;
	condition	 = 	DIA_Pyrokar_TEACH_Condition;
	information	 = 	DIA_Pyrokar_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Enséñame el último círculo de la magia.";
};
func int DIA_Pyrokar_TEACH_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)
	&& (Kapitel >= 5) 
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Pyrokar_TEACH_15_00"); //Enséñame el último círculo de la magia.
	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		if B_TeachMagicCircle (self,other, 6)  
		{
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_01"); //Ha pasado mucho tiempo desde que se estableció tu vínculo con el fuego. Han pasado muchas cosas y no encontramos reposo.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_02"); //Eres el elegido de Innos. Por lo tanto, para vencer en combate necesitarás todas tus fuerzas.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_03"); //Voy a consagrarte, elegido. Estás entrando en el sexto círculo: que traigas la luz y disperses las tinieblas.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_04"); //Si así lo quieres, ya te puedo enseñar la fórmula mágica del último círculo.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_05"); //Oh... una cosa más. Me ha costado reconocerte.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_06"); //Recibiste mi carta cuando te metieron en la barrera.
			AI_Output (other, self, "DIA_Pyrokar_TEACH_15_07"); //Sí, así me libraste de las tonterías del juez.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_08"); //Y eres el elegido de Innos.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_09"); //¡Recibe mi bendición, elegido!
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_10"); //Innos, luz del sol y fuego del mundo, bendice a este hombre, el siervo que has elegido.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_11"); //Dale valor, fuerza y sabiduría para que siga la senda que le has marcado.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_11_12"); //Aún no es el momento. Te instruiré cuando hayas avanzado algo más por la senda que Innos te marcará.
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info SPELLS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPELLS		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	2;
	condition	 = 	DIA_Pyrokar_SPELLS_Condition;
	information	 = 	DIA_Pyrokar_SPELLS_Info;
	permanent	 = 	TRUE;
	description	 = 	"Instrúyeme (crear runas)";
};
func int DIA_Pyrokar_SPELLS_Condition ()
{	
	if (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 6)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_SPELLS_Info ()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output (other, self, "DIA_Pyrokar_SPELLS_15_00"); //Instrúyeme.
	
	Info_ClearChoices 	(DIA_Pyrokar_SPELLS);
	Info_AddChoice		(DIA_Pyrokar_SPELLS, DIALOG_BACK, DIA_Pyrokar_SPELLS_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_Firerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firerain)) ,DIA_Pyrokar_SPELLS_Firerain);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_BreathOfDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_BreathOfDeath)) ,DIA_Pyrokar_SPELLS_BreathOfDeath);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_MassDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_MassDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MassDeath)) ,DIA_Pyrokar_SPELLS_MassDeath);
		abletolearn = (abletolearn +1);
	};
	if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
	{
		Info_AddChoice	(DIA_Pyrokar_SPELLS, B_BuildLearnString (NAME_SPL_Shrink, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Shrink)) ,DIA_Pyrokar_SPELLS_Shrink);
		abletolearn = (abletolearn +1);
	};
	if (abletolearn < 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_SPELLS_11_01"); //No te puedo enseñar nada más.
	};
};
FUNC VOID DIA_Pyrokar_SPELLS_BACK()
{
	Info_ClearChoices 	(DIA_Pyrokar_SPELLS);
};
FUNC VOID DIA_Pyrokar_SPELLS_Firerain()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firerain);	
};
FUNC VOID DIA_Pyrokar_SPELLS_BreathOfDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_BreathOfDeath);	
};
FUNC VOID DIA_Pyrokar_SPELLS_MassDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MassDeath);	
};
FUNC VOID DIA_Pyrokar_SPELLS_Shrink()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Shrink);	
};
///////////////////////////////////////////////////////////////////////
//	Info Parlan
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Parlan		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr 			 =  99;
	condition	 = 	DIA_Pyrokar_Parlan_Condition;
	information	 = 	DIA_Pyrokar_Parlan_Info;
	permanent	 = 	FALSE;
	description	 = 	"Me envió Parlan...";
};
func int DIA_Pyrokar_Parlan_Condition ()
{	
	if (hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV 
	|| hero.guild == GIL_PAL)
	&& (Parlan_Sends == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_Parlan_Info ()
{
		AI_Output (other, self, "DIA_Pyrokar_Parlan_15_00"); //Me manda Parlan. Quiero aumentar mis poderes mágicos.
		AI_Output (self, other, "DIA_Pyrokar_Parlan_11_01"); //Has aprendido mucho y tu poder ha crecido. A partir de ahora serás mi pupilo.
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH MANA
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH_MANA		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr 			 =  99;
	condition	 = 	DIA_Pyrokar_TEACH_MANA_Condition;
	information	 = 	DIA_Pyrokar_TEACH_MANA_Info;
	permanent	 = 	TRUE;
	description	 = 	"Quiero aumentar mis poderes mágicos.";
};
func int DIA_Pyrokar_TEACH_MANA_Condition ()
{	
	if (hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV 
	|| hero.guild == GIL_PAL)
	&& Npc_KnowsInfo (hero,DIA_Pyrokar_Parlan)
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_TEACH_MANA_Info ()
{
		AI_Output (other, self, "DIA_Pyrokar_TEACH_MANA_15_00"); //Quiero aumentar mis poderes mágicos.
		
		Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
		Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= 250)  
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_MANA_11_00"); //Siento que el poder mágico fluye a través de ti. Ni siquiera yo puedo enseñarte a aumentarlo.
	};
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MEGA);
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
	Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MEGA);
	
	Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
	Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PERM		(C_INFO)
{
	npc			 = 	KDF_500_Pyrokar;
	nr			 = 	900;
	condition	 = 	DIA_Pyrokar_PERM_Condition;
	information	 = 	DIA_Pyrokar_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"(Bendecir)";
};
func int DIA_Pyrokar_PERM_Condition ()
{	
	if (Kapitel >= 2)	
	{
		return TRUE;
	};
};
func void DIA_Pyrokar_PERM_Info ()
{
	if (hero.guild == GIL_KDF)
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_00"); //Bendíceme, maestro.
			}
		else
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_01"); //¿Qué hay de una bendicioncita? No me vendría mal.
			};
		
	if (Kapitel == 5)	
	&& 	(MIS_PyrokarClearDemonTower == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_02"); //Que el éxito corone tu batalla final con nuestro archienemigo. Que Innos te acompañe.
			}
		else
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_03"); //Que Innos te libre de todo mal en los senderos impíos que habrás de recorrer.
			};
};

//##############################################################
//##
//##
//##							KAPITEL 3
//##
//##
//##############################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Pyrokar_KAP3_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP3_EXIT_Condition;
	information	= DIA_Pyrokar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BACKFROMOW		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_BACKFROMOW_Condition;
	information	 = 	DIA_Pyrokar_BACKFROMOW_Info;

	description	 = 	"Vengo del viejo Valle de las Minas.";
};

func int DIA_Pyrokar_BACKFROMOW_Condition ()
{
	if (Kapitel >= 3)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BACKFROMOW_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_00"); //Vengo del viejo Valle de las Minas.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_01"); //¿Qué noticias traes?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_02"); //El enemigo ha movilizado allí un ejército de orcos y dragones.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_03"); //Milten ya nos había informado al respecto. ¿Qué hay del cargamento de mineral del rey?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_04"); //La mina que Garond ha ordenado explotar en el valle no basta para satisfacer las demandas del rey.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_05"); //Los días cada vez son más grises, y la luz del sol más tenue.
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_06"); //Me atacaron unos hombres vestidos con túnicas negras.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_07"); //Lo sé. Son los buscadores, secuaces del reino infernal de Beliar. Ten cuidado con ellos. Intentarán poseerte.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_08"); //Una vez poseído, dejarás de ser tú mismo y solo encontrarás ayuda en el monasterio. Ten cuidado.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar me habló de los buscadores, hombres vestidos con túnicas negras que son seguidores de Beliar. Me ha avisado de que pueden poseerte. Si alguna vez me pasa, volveré directamente al monasterio."); 
	};

	if ((Npc_IsDead(Karras))==FALSE)
	&& (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_09"); //Le he pedido a Karras que investigue este asunto. Seguro que pronto nos ofrecerá nuevos puntos de vista que nos aclaren las cosas.
		PyrokarToldKarrasToResearchDMT = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar ha ordenado a Karras que se encargue de la amenaza de los buscadores."); 
	};

	AI_Output (self ,other, "DIA_Pyrokar_Add_11_00"); //Ten. Esta runa te devolverá directamente al monasterio si necesitaras nuestra ayuda.
	B_GiveInvItems (self, other, itru_teleportmonastery, 1);
	
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_10"); //Recuerda que, si no nos resistimos, nuestra suerte estará echada.

};

///////////////////////////////////////////////////////////////////////
//	Info GiveInnoseye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GIVEINNOSEYE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	31;
	condition	 = 	DIA_Pyrokar_GIVEINNOSEYE_Condition;
	information	 = 	DIA_Pyrokar_GIVEINNOSEYE_Info;

	description	 = 	"He venido a llevarme el Ojo de Innos.";
};

func int DIA_Pyrokar_GIVEINNOSEYE_Condition ()
{
	if (Kapitel == 3)	
		&& (Npc_HasItems (other,ItWr_PermissionToWearInnosEye_MIS))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_15_00"); //He venido a llevarme el Ojo de Innos.
	B_GiveInvItems 		(other, self, ItWr_PermissionToWearInnosEye_MIS,1);
	//Joly: hier kein  B_UseFakeScroll();    Pyrokar poppt aus seinem Thron!!!
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_01"); //Veo que cuentas con permiso de lord Hagen para llevar el Ojo de Innos.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_02"); //Lamento decepcionarte. Hemos sido víctimas de una conjura traicionera del enemigo.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_03"); //Alguien ha sacado por la fuerza el Ojo de Innos del interior de estas sagradas paredes.

	
	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "¿Quién podría ser tan insolente, maestro?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	}
	else
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "¿Quién ha sido?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	};
};
func void DIA_Pyrokar_GIVEINNOSEYE_wer ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_00"); //¿Quién podría ser tan insolente, maestro?
	}
	else
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_01"); //¿Quién ha sido?
	};

	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_02"); //El mal es astuto y suele actuar con sigilo. Es raro que se le vea llevar a cabo sus perversas maquinaciones a plena luz del día.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_03"); //Pero en estos tiempos no es el caso. El enemigo se muestra en las calles, en cada hogar y en cada plaza pública.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_04"); //Solo puede significar que ya no teme a ningún adversario, y que no va a retroceder ante nada.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_05"); //Uno de nuestros devotos más fieles, candidato a la gran túnica de los magos del fuego, ha cambiado de bando inesperadamente y de manera alarmantemente maligna. Pedro.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_06"); //El enemigo lo ha poseído, y al hacerlo nos ha infligido una terrible derrota.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_07"); //Pedro ha entrado por la fuerza en nuestras salas más sagradas y ha robado el Ojo.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_08"); //Me temo que se pasó demasiado tiempo solo, al otro lado de las puertas y, por lo tanto, más allá de las paredes protectoras del monasterio, expuesto a todos los peligros que acechan.

	Pedro.flags = 0;	//Joly: Pedro ist nun mortal und zum Abschuß freigegeben.
	Pedro_Traitor = TRUE;	//Joly: Pedro ist für den SC nun als Traitor bekannt. Muß hier stehen bleiben und darf nur einmal auf True gesetzt werden

 	B_LogEntry (TOPIC_INNOSEYE, "Estupendo. Tenía que habérmelo imaginado. Llego demasiado tarde, estos zoquetes del monasterio han dejado que algún novicio les robe el Ojo y ahora tengo que salir detrás de Pedro, el traidor, rezando porque no se lo haya vendido a otro.");
 	B_LogEntry (TOPIC_TraitorPedro, "El traidor de Pedro ha robado el Ojo de Innos del monasterio. Me parece que los magos de fuego estarán más que contentos si lo encuentran.");
};



///////////////////////////////////////////////////////////////////////
//	Info NOVIZENCHASE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_NOVIZENCHASE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	34;
	
	condition	 = 	DIA_Pyrokar_NOVIZENCHASE_Condition;
	information	 = 	DIA_Pyrokar_NOVIZENCHASE_Info;

	description	 = 	"¿Adónde ha huido el ladrón?";
};

func int DIA_Pyrokar_NOVIZENCHASE_Condition ()
{
	if (Kapitel == 3)
	   && (Pedro_Traitor == TRUE)	
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_NOVIZENCHASE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_NOVIZENCHASE_15_00"); //¿Adónde ha huido el ladrón?
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_01"); //Pedro noqueó a otros novicios que intentaron detenerle y desapareció en la neblina matinal.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_02"); //Muchos novicios han ido tras él para devolver intacto el Ojo a su lugar.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_03"); //Si quieres alcanzarlos, tendrás que darte prisa antes de que Pedro se os escape.

	MIS_NovizenChase = LOG_RUNNING;	
};

///////////////////////////////////////////////////////////////////////
//	Info FoundInnosEye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FOUNDINNOSEYE		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	35;
	condition	 = 	DIA_Pyrokar_FOUNDINNOSEYE_Condition;
	information	 = 	DIA_Pyrokar_FOUNDINNOSEYE_Info;

	description	 = 	"He encontrado el Ojo de Innos.";
};

func int DIA_Pyrokar_FOUNDINNOSEYE_Condition ()
{
	if (Kapitel == 3)
		&& 	(MIS_NovizenChase == LOG_RUNNING)
		&& ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE))	
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_FOUNDINNOSEYE_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_00"); //He encontrado el Ojo de Innos. Está roto.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_01"); //Pero... no puede ser. ¿Qué ha pasado?
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_02"); //Lo tenían unos tipos bastante desagradables, y llegué demasiado tarde.
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_03"); //Estaban realizando un extraño encantamiento en un lugar de ceremonias en forma de media luna en el bosque.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_04"); //Que Innos nos proteja. Han profanado el círculo del sol.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_05"); //Ni en mis peores pesadillas habría imaginado que cuentan con ese poder.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	MIS_NovizenChase = LOG_SUCCESS;	
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
	Info_AddChoice		(DIA_Pyrokar_FOUNDINNOSEYE, "¿Y ahora qué hacemos?", DIA_Pyrokar_FOUNDINNOSEYE_was );
	
};
func void DIA_Pyrokar_FOUNDINNOSEYE_was ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_15_00"); //¿Y ahora qué hacemos?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_01"); //El enemigo ha adquirido mucho poder. Aun así, este antiguo artefacto suponía una amenaza poderosa para él.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_02"); //Debemos sanar el Ojo y devolverle su antiguo poder, pero el tiempo está en nuestra contra.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_03"); //Ni siquiera puedo imaginarme qué va ser de nosotros. Sin la protección del Ojo, estamos a merced del enemigo.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_04"); //Ve a la ciudad a ver a Vatras, el mago de agua. Solo él sabrá lo que hacer en esta terrible situación. Llévale el Ojo, y date prisa.


	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, DIALOG_BACK, DIA_Pyrokar_FOUNDINNOSEYE_weiter );
	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "¿Por qué a Vatras?", DIA_Pyrokar_FOUNDINNOSEYE_was_vatras );
	};
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "¿Qué es el círculo del sol?", DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis );
	
	
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar quiere que le pida consejo al mago de agua, Vatras, sobre qué hacer con el Ojo dañado.");

	MIS_Pyrokar_GoToVatrasInnoseye = LOG_RUNNING;

};
func void DIA_Pyrokar_FOUNDINNOSEYE_was_vatras ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00"); //¿Por qué a Vatras?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01"); //El privilegio de vestir la túnica no te autoriza a poner en duda mis instrucciones, hermano.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02"); //Vatras es siervo de Adanos. Solo el conocimiento de los magos de agua nos traerá claridad en esta hora aciaga.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03"); //No necesitas saber más.

};


func void DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00"); //¿Qué es el círculo del sol?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01"); //Cada año, todos los magos y novicios del monasterio van a este lugar durante el solsticio para indicar el comienzo de un nuevo ciclo.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02"); //El lugar está lleno del poder inconmensurable del sol.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03"); //No tenía ni la menor idea de que se podía invertir su poder, aunque es lo que ha sucedido.
};

func void DIA_Pyrokar_FOUNDINNOSEYE_weiter ()
{
		Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
};


///////////////////////////////////////////////////////////////////////
//	Info spokeToVatras
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPOKETOVATRAS		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_SPOKETOVATRAS_Condition;
	information	 = 	DIA_Pyrokar_SPOKETOVATRAS_Info;

	description	 = 	"He hablado con Vatras.";
};

func int DIA_Pyrokar_SPOKETOVATRAS_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		{
			return TRUE;
		};
};

func void DIA_Pyrokar_SPOKETOVATRAS_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_00"); //He hablado con Vatras.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_01"); //Ah, muy bien. ¿Dónde está?
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_02"); //Está preparando un ritual en el círculo del sol para sanar el Ojo de Innos.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_03"); //Si eso es cierto, a lo mejor aún queda alguna esperanza.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_04"); //Vatras quiere que le ayudéis Xardas y tú.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_05"); //¿Qué? ¿Xardas también va a estar allí? No hablas en serio.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_06"); //Oye, no fue cosa mía. Vatras insiste.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_07"); //Siempre ese Xardas. Estoy harto. Las cosas no podrían ir a peor.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_08"); //¿Cómo sé que Xardas no está compinchado con el enemigo?
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_09"); //No confío en Xardas, por mucho que lo necesitemos.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_10"); //Lo siento, pero dadas las circunstancias no puedo ayudar a Vatras.
	B_GivePlayerXP (XP_Ambient);


};


///////////////////////////////////////////////////////////////////////
//	Info XardasVertrauen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_XARDASVERTRAUEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_XARDASVERTRAUEN_Condition;
	information	 = 	DIA_Pyrokar_XARDASVERTRAUEN_Info;

	description	 = 	"Sin ti no se puede hacer.";
};

func int DIA_Pyrokar_XARDASVERTRAUEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_SPOKETOVATRAS))
		&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_XARDASVERTRAUEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_00"); //Sin ti no se puede hacer. Vatras no sería capaz de llevar a cabo el ritual.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_01"); //Tendrás que confiar en Xardas.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_02"); //No estoy obligado a hacer nada, ¿me oyes? No tengo la menor prueba de que Xardas no esté en nuestra contra. No puedo hacerlo.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_03"); //¿Y si te traigo alguna prueba?
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_04"); //Me temo que es imposible. Tendría que impresionarme.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_05"); //Con respecto a Xardas, no creo que consiga impresionarme absolutamente nada.

	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar siente temor cuando piensa en Xardas. Tendré que hablar con Xardas sobre cómo conseguir que acuda al ritual del círculo del sol.");
	
	Pyrokar_DeniesInnosEyeRitual = TRUE;

};

///////////////////////////////////////////////////////////////////////
//	Info Buchzurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHZURUECK		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_BUCHZURUECK_Condition;
	information	 = 	DIA_Pyrokar_BUCHZURUECK_Info;

	description	 = 	"Xardas me ha dado este libro.";
};

func int DIA_Pyrokar_BUCHZURUECK_Condition ()
{
	if (Npc_HasItems (other,ItWr_XardasBookForPyrokar_Mis))
		 && (Kapitel == 3)
		 {
				return TRUE;
		 };
};

func void DIA_Pyrokar_BUCHZURUECK_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_00"); //Xardas me ha dado este libro.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_01"); //Es una prueba de su amistad.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_02"); //Enséñamelo.
	B_GiveInvItems 		(other, self, ItWr_XardasBookForPyrokar_Mis,1);
	Npc_RemoveInvItems 	(self, ItWr_XardasBookForPyrokar_Mis,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_03"); //(Atónito) Es increíble. ¿Tienes la menor idea de lo que acabas de darme?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_04"); //Esto... no.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_05"); //(Molesto) Es un antiguo volumen que llevaba mucho tiempo desaparecido.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_06"); //Creíamos que había desaparecido para siempre, y ahora me entero de que Xardas siempre ha sabido lo que había sido de él.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_07"); //Entonces, ¿acudirás al ritual?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_08"); //Sí, iré al círculo del sol, pero sigo sin estar convencido de las buenas intenciones de Xardas.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_09"); //De hecho, voy a hacer que ese chacal me explique dónde ha escondido el libro tantos años. Esta vez se ha pasado.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_10"); //Nos vemos en el círculo del sol.
	
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"THRONE",-1);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar ha accedido finalmente a acudir al círculo del sol.");
	Pyrokar_GoesToRitualInnosEye = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info preRitual
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PRERITUAL		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_PRERITUAL_Condition;
	information	 = 	DIA_Pyrokar_PRERITUAL_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Crees que puedes reparar el Ojo?";
};

func int DIA_Pyrokar_PRERITUAL_Condition ()
{
		if (Pyrokar_GoesToRitualInnosEye == TRUE)
			&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
			&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_PRERITUAL_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_PRERITUAL_15_00"); //¿Crees que puedes enmendar el Ojo?
	AI_Output			(self, other, "DIA_Pyrokar_PRERITUAL_11_01"); //No sabría decirte. Ya veremos.
};

///////////////////////////////////////////////////////////////////////
//	Info AugeGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AUGEGEHEILT		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_AUGEGEHEILT_Condition;
	information	 = 	DIA_Pyrokar_AUGEGEHEILT_Info;

	description	 = 	"Lo has conseguido. El Ojo de Innos está curado.";
};

func int DIA_Pyrokar_AUGEGEHEILT_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Pyrokar_AUGEGEHEILT_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_00"); //Lo has conseguido. El Ojo de Innos está curado.
	AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_01"); //Pensaba que era prácticamente imposible.

	
	if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_02"); //Sí, maestro.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_03"); //Ya has demostrado en varias ocasiones que estás listo para ingresar en la orden suprema de los magos del fuego.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_04"); //A partir de ahora, eres miembro del concilio y representarás a nuestra orden en el mundo. Ya eres uno de los magos supremos del fuego.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_05"); //Viste la gran túnica con dignidad y aporta honor y riqueza a la orden, hermano mío.
		
			CreateInvItem	(hero, ITAR_KDF_H);
			AI_EquipArmor	(hero, ITAR_KDF_H);	
			
			heroGIL_KDF2 = TRUE;
		};	
};

//////////////////////////////////////////////////////////////////////
//	Info Kap4_Ready
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_KAP3_READY		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	30;
	condition	 = 	DIA_Pyrokar_KAP3_READY_Condition;
	information	 = 	DIA_Pyrokar_KAP3_READY_Info;

	description	 = 	"¿Qué queda por hacer?";
};

func int DIA_Pyrokar_KAP3_READY_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_AUGEGEHEILT))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_KAP3_READY_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_00"); //¿Qué me queda hacer aquí?
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_01"); //No pierdas el tiempo en cuestiones triviales. Ve a derrotar a los dragones. Ten, toma el Ojo.
	CreateInvItems (self,ItMi_InnosEye_MIS,1);
	B_GiveInvItems (self, other, ItMi_InnosEye_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_02"); //Recuerda que hay que hablar con un dragón antes de atacarlo.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_03"); //Das Auge wird dir helfen, die Drachen dazu zu zwingen, mit dir zu reden.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_04"); //Es bietet dir nicht nur Schutz gegen ihre Angriffe, es fügt ihnen auch unerträgliche Schmerzen zu, wenn du es bei dir trägst.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_01"); //El poder del Ojo hará que los dragones hablen contigo y te digan la verdad.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_02"); //Además, cuando lo lleves puesto te protegerá de sus ataques.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_05"); //Sin embargo, su poder no dura mucho. Tendrás que rellenarlo con energía mágica.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_06"); //Para hacerlo, necesitarás la esencia del corazón de un dragón, que tendrás que unir al Ojo en la mesa de trabajo de un alquimista.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_07"); //Una vez hecho esto, podrás enfrentarte a otro dragón.
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_08"); //Gracias. Lo recordaré.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_09"); //Ya tienes todo lo necesario. Vete. No te queda mucho tiempo.

	PLAYER_TALENT_ALCHEMY[Charge_InnosEye] 		= TRUE;	
	PrintScreen	(PRINT_LearnAlchemyInnosEye, -1, -1, FONT_Screen, 2);
	TOPIC_END_INNOSEYE = TRUE;
	B_GivePlayerXP (XP_Ambient);	
	
	CreateInvItems   (Gorax, ItMi_RuneBlank, 1);
	
	Log_CreateTopic (TOPIC_DRACHENJAGD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD, LOG_RUNNING);
	B_LogEntry (TOPIC_DRACHENJAGD,"Ahora estoy listo para enfrentarme a los dragones. El Ojo de Innos me ayudará a destruirlos, pero tengo que llevarlo puesto cuando luche contra esas bestias. Debo hablar con los dragones antes de ponerles a prueba. El problema es que el Ojo pierde fuerza cada vez que hablo con alguno. Necesito el corazón de un dragón y un frasco de laboratorio vacío para juntar la piedra debilitada del amuleto y el extracto del corazón en una mesa de trabajo de alquimista entre combate y combate y poder así enfrentarme a otro dragón."); 

	MIS_ReadyforChapter4 = TRUE; //Joly: Mit dieser Varible in den Levelchange zur OW -> Kapitel 4
	B_NPC_IsAliveCheck (NEWWORLD_ZEN);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info BuchderBessenen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHDERBESSENEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	39;
	condition	 = 	DIA_Pyrokar_BUCHDERBESSENEN_Condition;
	information	 = 	DIA_Pyrokar_BUCHDERBESSENEN_Info;

	description	 = 	"He encontrado un almanáque extraño.";
};

func int DIA_Pyrokar_BUCHDERBESSENEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_BACKFROMOW))
	&& (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS))		
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_BUCHDERBESSENEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_00"); //He encontrado un almanáque extraño.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_01"); //¿De veras? ¿Qué clase de almanáque?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_02"); //No lo tengo claro. Pensé que tú sabrías lo que hacer con él.
	B_GiveInvItems 		(other, self, ITWR_DementorObsessionBook_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_03"); //Desde luego, es muy inquietante. Me alegro de que me lo trajeras. Fue muy prudente por tu parte.
	B_GivePlayerXP (XP_Ambient);
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_04"); //Supongo que hay más. Encuéntrame más de estos libros condenados.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_05"); //Sospecho que se trata de un instrumento del poder de los buscadores.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_06"); //Lo usan para controlar las almas en pena de sus víctimas.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_07"); //Está claro que en estos libros escriben los nombres de aquellos a los que pretenden poseer.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_08"); //Mira, voy a darte esta carta mágica que te indicará los nombres escritos en los libros.
		CreateInvItems (self, ItWr_PyrokarsObsessionList, 1);									
		B_GiveInvItems (self, other, ItWr_PyrokarsObsessionList, 1);					
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_09"); //Encuentra a esas víctimas y tráeme sus libros. Me libraré de ellos.
	
		if ((Npc_IsDead(Karras))== FALSE)
			{
				AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_10"); //Pero antes deberías enseñarle por lo menos uno a Karras. A lo mejor le ayuda en sus estudios.
			};
	
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_11"); //No cometas la equivocación de tratar de destruirlos. Aún no estás listo para resistir su poder.

		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar quiere que no se dañen los almanáques de los poseídos. Me ha dado una lista de los que los buscadores planean poseer. Puede que se añadan más nombres más adelante."); 
	};
	
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_12"); //No te acerques mucho a los buscadores o te poseerán.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_13"); //Si no eres capaz de resistirte a su llamada, ven a verme lo antes posible.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_14"); //El monasterio es el único lugar en que puede salvarse tu alma.

	if ((Npc_IsDead(Karras))== FALSE)
	&& (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_15"); //¿No hay protección posible contra sus ataques mentales?
			AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_16"); //Tal vez la haya. A lo mejor Karras sabe algo al respecto.
			Pyrokar_AskKarrasAboutDMTAmulett = TRUE;
			B_LogEntry (TOPIC_DEMENTOREN,"Se supone que Karras me ayudará a encontrar una protección contra los ataques mentales de los buscadores."); 
		};
};

///////////////////////////////////////////////////////////////////////
//	Info SCObsessed
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCOBSESSED		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	70;
	condition	 = 	DIA_Pyrokar_SCOBSESSED_Condition;
	information	 = 	DIA_Pyrokar_SCOBSESSED_Info;
	permanent	 = 	TRUE;

	description	 = 	"(Curar posesión)";
};

func int DIA_Pyrokar_SCOBSESSED_Condition ()
{
	if (SC_IsObsessed == TRUE)
		{
				return TRUE;
		};
};

var int Got_HealObsession_Day;
func void DIA_Pyrokar_SCOBSESSED_Info ()
{
	if ((Got_HealObsession_Day<=(Wld_GetDay()-2)) || (Got_HealObsession_Day == 0))
	&& (Npc_HasItems (other,ItPo_HealObsession_MIS) == FALSE)  
		{
			if (hero.guild == GIL_KDF)
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_00"); //Cúrame, maestro, pues estoy poseído.
				
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_01"); //¡Que así sea! Tómate esta poción. Te librará de tus pesadillas.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_02"); //Que la piedad de Innos sea tu salvación.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_03"); //Actúa en su nombre y cuídate del mal de ojo del enemigo.
				
					if (SC_ObsessionTimes > 3)
						{	
							AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_04"); //Pero te advierto que si te expones demasiado al poder de los buscadores, en algún momento no habrá vuelta atrás. Recuérdalo en todo momento.
						};
					
					CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
					B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);					
					Got_HealObsession_Day = Wld_GetDay(); 
				}
			else
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_05"); //Creo que estoy poseído. ¿Puedes curarme?
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_06"); //No sin una muestra de respeto hacia este monasterio, hijo mío. 300 monedas de oro.
				
					Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "Es demasiado.", DIA_Pyrokar_SCOBSESSED_nein );
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "Estupendo. Aquí tienes el dinero.", DIA_Pyrokar_SCOBSESSED_ok );
				};
		 }
	 else
		 {
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_07"); //Pero si te acabas de tomar la poción curativa. No vuelvas a verme hasta que necesites mi ayuda de verdad.
		 };
};
func void DIA_Pyrokar_SCOBSESSED_ok ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_ok_15_00"); //Estupendo. Aquí tienes el dinero.

	if (B_GiveInvItems (other, self, ItMi_Gold,300))
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_01"); //Toma, bébete esto. Que la piedad de Innos sea tu salvación.
			CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
			B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);
			Got_HealObsession_Day = Wld_GetDay(); 
		}
		else
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_02"); //Si me traes el dinero, te ayudaré.
		};
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

func void DIA_Pyrokar_SCOBSESSED_nein ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_nein_15_00"); //Es demasiado.
	Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
};

///////////////////////////////////////////////////////////////////////
//	Info AlmanachBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AlmanachBringen		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	5;
	condition	 = 	DIA_Pyrokar_AlmanachBringen_Condition;
	information	 = 	DIA_Pyrokar_AlmanachBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Puedo contarte más cosas de los poseídos.";
};

func int DIA_Pyrokar_AlmanachBringen_Condition ()
{
	if (Kapitel >= 3)
	&& (Npc_HasItems (other,ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_BUCHDERBESSENEN))
		{
				return TRUE;
		};
};

var int AlmanachCounter;
var int DIA_Pyrokar_AlmanachBringen_OneTime;

func void DIA_Pyrokar_AlmanachBringen_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AlmanachBringen_15_00"); //Puedo contarte más cosas de los poseídos.
	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_01"); //Habla, hermano.
	
	var int AlmanachCount;
	var int XP_KDF_BringAlmanachs;
	var int AlmanachGeld;
	var int PyrokarsAlmanachOffer;
	
	PyrokarsAlmanachOffer = 400;	//Joly: Gold für einen Almanach
	
	AlmanachCount = Npc_HasItems(other, ITWR_DementorObsessionBook_MIS);


	if (AlmanachCount == 1)
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_02"); //He encontrado otro almanáque.
			B_GivePlayerXP (XP_KDF_BringAlmanach);
			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,1);
			AlmanachCounter = AlmanachCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_03"); //Te he traído más libros de los buscadores.

			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,  AlmanachCount);

			XP_KDF_BringAlmanachs = (AlmanachCount * XP_KDF_BringAlmanach);
			AlmanachCounter = (AlmanachCounter + AlmanachCount); 

			B_GivePlayerXP (XP_KDF_BringAlmanachs);
		};

	if (AlmanachCounter <= 5)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_04"); //Muy bien. No obstante, me temo que aún hay más. Sigue buscando.
		
	}
	else if	(AlmanachCounter <= 8)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_05"); //Ya hemos encontrado muchos, pero no creo que los tengamos todos.
	}
	else
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_06"); //Ya me has traído muchos de los libros del enemigo.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_07"); //Me sorprendería que hubieran puesto más en circulación.
	};

	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_08"); //Toma. Es un regalo del monasterio que te ayudará cuando te enfrentes al mal.
	if (DIA_Pyrokar_AlmanachBringen_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_09"); //Y recuerda echar un vistazo a mi carta mágica de vez en cuando.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_10"); //Es posible que intenten lo mismo con otros, aunque sus nombres no estén aún en los almanáques.
		DIA_Pyrokar_AlmanachBringen_OneTime = TRUE; 
	};
	AlmanachGeld	= (AlmanachCount * PyrokarsAlmanachOffer);

	CreateInvItems (self, ItMi_Gold, AlmanachGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, AlmanachGeld);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Pyrokar_KAP4_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP4_EXIT_Condition;
	information	= DIA_Pyrokar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Pyrokar_KAP5_EXIT(C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 999;
	condition	= DIA_Pyrokar_KAP5_EXIT_Condition;
	information	= DIA_Pyrokar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
///////////////////////////////////////////////////////////////////////
//	Info Drachentot
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DRACHENTOT		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_DRACHENTOT_Condition;
	information	 = 	DIA_Pyrokar_DRACHENTOT_Info;

	description	 = 	"Todos los dragones están muertos.";
};

func int DIA_Pyrokar_DRACHENTOT_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DRACHENTOT_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DRACHENTOT_15_00"); //Todos los dragones están muertos.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_01"); //Es una noticia magnífica, pero no cambia en nada nuestra situación, que parece desesperada.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_02"); //Los buscadores no se han marchado aún. Todo lo contrario. En estos últimos días he oído con insistencia que cada vez son más.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_03"); //La muerte de los dragones ha supuesto un duro golpe para el enemigo, pero no basta. Tenemos que erradicar el mal.

};

///////////////////////////////////////////////////////////////////////
//	Info DerMeister
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DERMEISTER		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_DERMEISTER_Condition;
	information	 = 	DIA_Pyrokar_DERMEISTER_Info;

	description	 = 	"He hablado con los dragones.";
};

func int DIA_Pyrokar_DERMEISTER_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DERMEISTER_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_00"); //He hablado con los dragones.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_01"); //¿Qué te han dicho?
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_02"); //No hacían más que hablar del poder de su amo, y de que se ha instalado en los salones de Irdorath.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_03"); //Que Innos nos proteja. El Templo Negro ha recuperado su poder y envía sus secuaces a nuestro mundo.

};

///////////////////////////////////////////////////////////////////////
//	Info WasIstIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WASISTIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_WASISTIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_WASISTIRDORATH_Info;

	description	 = 	"¿Qué son los salones de Irdorath?";
};

func int DIA_Pyrokar_WASISTIRDORATH_Condition ()
{
	if (Kapitel == 5)	
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_DERMEISTER))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_WASISTIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_00"); //¿Qué son los salones de Irdorath?
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_01"); //El templo oriental de invocación del dios Beliar. En Myrtana hay cuatro, pero tal vez ése sea el más aterrador.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_02"); //Hace 40 años, los templos septentrional y occidental de esta horrible deidad fueron destruidos.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_03"); //Los valientes caballeros de aquellos tiempos lo dieron todo para arrasar aquellos imponentes edificios.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_04"); //En aquel entonces, las hordas negras del enemigo no pudieron hacer nada ante la superioridad numérica y el heroísmo de caballeros y paladines.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_05"); //Habría sido sencillo destruir los otros dos templos y erradicar el mal de la Tierra para siempre...
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_06"); //… pero desaparecieron tras la caída del segundo templo.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_07"); //(Burlón) Desaparecido... todo un templo. Lo que tú digas.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_08"); //No te burles. La situación es grave. Si los salones de Irdorath han recuperado su poder, no será fácil derrotar al enemigo.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_09"); //Para ello, primero tendría que encontrarlo, y creo que ése será tu siguiente cometido, y el más difícil.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_10"); //Ya veremos.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"De acuerdo con Pyrokar, los salones de Irdorath son un templo perdido de invocación del dios Beliar. Debo encontrar ese templo."); 

};


///////////////////////////////////////////////////////////////////////
//	Info BuchIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	54;
	condition	 = 	DIA_Pyrokar_BUCHIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_BUCHIRDORATH_Info;

	description	 = 	"El libro de Xardas que se creía perdido. ¿Dónde está?";
};

func int DIA_Pyrokar_BUCHIRDORATH_Condition ()
{
	if (Kapitel == 5)	
	&& (ItWr_HallsofIrdorathIsOpen  == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_WASISTIRDORATH))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_00"); //El libro de Xardas que se creía perdido. ¿Dónde está?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_01"); //Me esperaba que lo preguntaras, pero me temo que no te servirá de nada.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_02"); //Ha sido sellado con magia. Lo llevé a una de las cámaras subterráneas, y hasta ahora no hemos sido capaces de abrirlo.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_03"); //El maldito Xardas nos ha jugado una mala pasada.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_04"); //¿Puedo ver el libro?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_05"); //Por supuesto. No creo que tengas éxito en lo que han fracasado los maestros más importantes de nuestro monasterio.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_06"); //Pero inténtalo. Talamon no va a impedírtelo.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"El libro de Xardas, LOS SALONES DE IRDORATH, está en las bóvedas inferiores del monasterio. Talamon lo vigila. Los magos no pueden abrirlo, está sellado mágicamente y se dice que Xardas es el responsable."); 
	
	Pyrokar_LetYouPassTalamon = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info IrdorathBookOpen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_IRDORATHBOOKOPEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	3;
	condition	 = 	DIA_Pyrokar_IRDORATHBOOKOPEN_Condition;
	information	 = 	DIA_Pyrokar_IRDORATHBOOKOPEN_Info;

	description	 = 	"He logrado abrir el libro de Xardas.";
};

func int DIA_Pyrokar_IRDORATHBOOKOPEN_Condition ()
{
	if (ItWr_HallsofIrdorathIsOpen == TRUE)
	&& (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_15_00"); //He logrado abrir el libro de Xardas.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_11_01"); //¿Qué? ¿Cómo lo has hecho? Estuvo a punto de sacarme de quicio.


	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Xardas me reveló cuál era el truco.", DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas );
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Supongo que habrá sido cuestión de suerte.", DIA_Pyrokar_IRDORATHBOOKOPEN_glueck );

};
func void DIA_Pyrokar_IRDORATHBOOKOPEN_glueck ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00"); //Supongo que habrá sido cuestión de suerte.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01"); //No digas tonterías. ¡Suerte!
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02"); //Yo no consigo abrir el libro y alguien como tú llega tan campante y...
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03"); //… eso me da que pensar.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04"); //Bueno, como has sido el único capaz de abrir el libro, se te otorga su custodia... al menos hasta que hayamos capeado este temporal.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00"); //Xardas me reveló cuál era el truco.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01"); //Ah, ha sido eso. Qué interesante. Espero por tu bien que no te afecte la mala influencia de Xardas.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02"); //Te lo advierto. No dejes que ese viejo diablo que embauque. A lo mejor te acabas arrepintiendo.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

///////////////////////////////////////////////////////////////////////
//	Info GeheimeBibliothek
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GEHEIMEBIBLIOTHEK		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	3;
	condition	 = 	DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition;
	information	 = 	DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info;

	description	 = 	"El libro menciona una biblioteca secreta.";
};

func int DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition ()
{
	if 	(ItWr_SCReadsHallsofIrdorath == TRUE)
		&& (Kapitel == 5)	
		&& (MIS_SCKnowsWayToIrdorath == FALSE)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN))
			{
					return TRUE;
			};
};

func void DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00"); //El libro menciona una biblioteca secreta.
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01"); //¿De qué narices hablas?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02"); //Una biblioteca que está detrás de estas paredes. ¿Te suena de algo?
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03"); //No. ¿Dónde dices que se supone que está esa biblioteca?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04"); //Entiendo. No tienes ni idea. Um.
	
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Pyrokar no sabe nada de la biblioteca secreta. Parece que solo Xardas ha accedido a ella."); 

};

///////////////////////////////////////////////////////////////////////
//	Info SCKnowsWayToIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCKNOWSWAYTOIRDORATH		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	2;
	condition	 = 	DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition;
	information	 = 	DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info;

	description	 = 	"Sé dónde encontrar los salones de Irdorath.";
};

func int DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN))
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00"); //Sé dónde encontrar los salones de Irdorath.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01"); //El templo está en una isla. He encontrado una carta de navegación que indica cómo se va.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02"); //Estupendo. En ese caso necesitarás un barco y una tripulación para enfrentarte al enemigo.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03"); //Pero recuerda que tienes que prepararte a fondo si quieres derrotar al señor de Irdorath.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04"); //¿Dónde encuentro a una tripulación?
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05"); //La tripulación debe consistir de hombres de tu confianza.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06"); //Habla con tus amigos y piensa en quién podría serte útil cuando estéis en la isla.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07"); //También vas a necesitar a un mago, pero por desgracia no puedo prescindir de ningún miembro del monasterio.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08"); //Tendrás que pedírselo a un mago que no trabaje en el monasterio.

};

///////////////////////////////////////////////////////////////////////
//	Info SCWillJorgen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCWILLJORGEN		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_SCWILLJORGEN_Condition;
	information	 = 	DIA_Pyrokar_SCWILLJORGEN_Info;

	description	 = 	"Jorgen es un marinero experto.";
};

func int DIA_Pyrokar_SCWILLJORGEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jorgen_Home))
		&&(Npc_KnowsInfo(other, DIA_Pyrokar_SCKNOWSWAYTOIRDORATH))
		&& (Kapitel == 5)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_SCWILLJORGEN_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_00"); //Jorgen es un marinero experto. Podría ayudarme a llegar a la isla de Irdorath.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_01"); //Me temo que no va a serte tan fácil.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_02"); //Tiene que trabajar para la hermandad. No ha pagado el tributo, ni nos ha traído una oveja.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_03"); //Jorgen debe acabar su trabajo y, si quieres, luego puedes llevártelo.
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_04"); //¿Cuánto tiempo va a tardar?
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_05"); //Consumió provisiones que le hubiesen durado tres semanás a un novicio, y todo en el primer día.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_06"); //No puedo dejarle marchar hasta que haya trabajado duro en los jardines durante tres meses.

};

///////////////////////////////////////////////////////////////////////
//	Info MachDTFrei
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MACHDTFREI		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_MACHDTFREI_Condition;
	information	 = 	DIA_Pyrokar_MACHDTFREI_Info;

	description	 = 	"¿Qué tengo que hacer para llevarme ahora mismo a Jorgen?";
};

func int DIA_Pyrokar_MACHDTFREI_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pyrokar_SCWILLJORGEN))
		&& (Kapitel == 5)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_MACHDTFREI_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_MACHDTFREI_15_00"); //¿Qué tengo que hacer para llevarme ahora mismo a Jorgen?
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_01"); //Um. Podrías hacer una cosa para mí, y tu buena relación con Xardas tal vez te sirva de algo.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_02"); //Me he enterado de que, durante los últimos días, han pasado cosas raras en su torre.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_03"); //De noche, muchos ciudadanos oyen gritos y ven extrañas luces que sobrevuelan la torre.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_04"); //Es lo que nos faltaba. Ve a ver qué ocurre y haz que pare.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_05"); //Luego podrás llevarte a Jorgen.

	MIS_PyrokarClearDemonTower = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PyrokarClearDemonTower,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PyrokarClearDemonTower,LOG_RUNNING);
	B_LogEntry (TOPIC_PyrokarClearDemonTower,"Ocurren cosas extrañas en la torre de Xardas. Si me encargo de ello, puedo llevar a Jorgen conmigo.");
};

///////////////////////////////////////////////////////////////////////
//	Info DTCleared
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DTCLEARED		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	59;
	condition	 = 	DIA_Pyrokar_DTCLEARED_Condition;
	information	 = 	DIA_Pyrokar_DTCLEARED_Info;

	description	 = 	"El asunto de la torre de Xardas se ha resuelto solo.";
};

func int DIA_Pyrokar_DTCLEARED_Condition ()
{
	if (Npc_IsDead(Xardas_DT_Demon1)) 
	&& (Npc_IsDead(Xardas_DT_Demon2))
	&& (Npc_IsDead(Xardas_DT_Demon3))
	&& (Npc_IsDead(Xardas_DT_Demon4))
	&& (Npc_IsDead(Xardas_DT_Demon5))
	&& (Npc_IsDead(Xardas_DT_DemonLord))
	&& (MIS_PyrokarClearDemonTower == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Pyrokar_DTCLEARED_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_DTCLEARED_15_00"); //El asunto de la torre de Xardas se ha resuelto solo.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_01"); //Y ¿qué pasaba...? No, espera, no quiero saber nada.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_02"); //Si aún quieres a Jorgen, llévatelo para tu viaje.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_03"); //Que Innos te proteja.
	MIS_PyrokarClearDemonTower = LOG_SUCCESS;
	B_GivePlayerXP (XP_PyrokarClearDemonTower);
};

///////////////////////////////////////////////////////////////////////
//	Amulett des Todes
///////////////////////////////////////////////////////////////////////

//---------------------------------
var int Pyro_Gives_Aura;
//---------------------------------
instance DIA_Pyrokar_AmulettofDeath		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	57;
	condition	 = 	DIA_Pyrokar_AmulettofDeath_Condition;
	information	 = 	DIA_Pyrokar_AmulettofDeath_Info;
	permanent	 = 	TRUE;
	description	 = 	"La profecía menciona el aura sagrada de Innos.";
};

func int DIA_Pyrokar_AmulettofDeath_Condition ()
{
	if (PlayerGetsAmulettOfDeath == TRUE)
	&& (Pyro_Gives_Aura == FALSE)
	{
			return TRUE;
	};
};

func void DIA_Pyrokar_AmulettofDeath_Info ()
{
	AI_Output			(other, self, "DIA_Pyrokar_AmulettofDeath_15_00"); //La profecía menciona el aura sagrada de Innos.
	AI_Output			(self, other, "DIA_Pyrokar_AmulettofDeath_11_01"); //El aura de Innos es un amuleto que solo pueden ponerse los magos más importantes de una era.
	
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,DIALOG_BACK,DIA_Pyrokar_AmulettofDeath_BAck);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"¿Me lo das?",DIA_Pyrokar_AmulettofDeath_CanHaveIt);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"¿Qué clase de amuleto es?",DIA_Pyrokar_AmulettofDeath_Amulett);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_BAck ()
{
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_CanHaveIt ()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00"); //¿Me lo das?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01"); //¿Qué? ¿Qué quieres hacer con él?
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02"); //Enfrentarme a un dragón.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03"); //Sí, por supuesto. Te daré el amuleto, pero cuídalo.
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04"); //Ya, claro.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05"); //No quiero tener que volvérselo a comprar a un mercader dentro de un tiempo.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06"); //Úsalo con prudencia, y que Innos te proteja en todo momento.
	
	CreateInvItems (self,ItAm_AmulettofDeath_Mis,1);
	B_GiveInvItems (self,other,ItAm_AmulettOfDeath_MIS,1);
	
	Pyro_Gives_Aura = TRUE;
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_Amulett()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00"); //¿Qué clase de amuleto es?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01"); //Dicen que el mismísimo Innos lo forjó y se lo regaló a la humanidad.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02"); //Protege a su portador de todo tipo de daños.
};


///////////////////////////////////////////////////////////////////////
//	Trank des Todes
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PotionofDeath		(C_INFO)
{
	npc		 = 	KDF_500_Pyrokar;
	nr		 = 	57;
	condition	 = 	DIA_Pyrokar_PotionofDeath_Condition;
	information	 = 	DIA_Pyrokar_PotionofDeath_Info;
	permanent	 = 	TRUE;
	description	 = 	"¿Qué son las Lágrimas de Innos?";
};

func int DIA_Pyrokar_PotionofDeath_Condition ()
{
	if (Npc_HasItems (other,ItPo_PotionOfDeath_01_MIS))
	{
			return TRUE;
	};
};

func void DIA_Pyrokar_PotionofDeath_Info ()
{
	AI_Output		(other, self, "DIA_Pyrokar_PotionofDeath_15_00"); //¿Qué son las Lágrimas de Innos?
	AI_Output		(self, other, "DIA_Pyrokar_PotionofDeath_11_01"); //Las Lágrimas de Innos no son más que un viejo cuento infantil. Narra cómo comenzó la batalla entre Innos y Beliar al principio de los tiempos.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Ya veo.",DIA_Pyrokar_PotionofDeath_Aha);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"He encontrado esta poción.",DIA_Pyrokar_PotionofDeath_Potion);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Aha()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Aha_15_00"); //Entiendo.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01"); //No sé si eres plenamente consciente de nuestra situación, pero no creo que a nuestro enemigo se le pueda vencer con un viejo cuento infantil.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Potion ()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_00"); //He encontrado esta poción.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01"); //Es imposible. No me lo puedo creer.
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_02"); //¿Qué pasa?
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03"); //Si de verdad son las auténticas Lágrimas de Innos, entonces...
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_04"); //(Interrumpe) Difícilmente.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05"); //No me interrumpas. Si son las auténticas Lágrimas de Innos, contamos con un arma poderosa contra el enemigo.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,Dialog_back,DIA_Pyrokar_PotionofDeath_BACK);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"¿Y qué son las Lágrimas de Innos?",DIA_Pyrokar_PotionofDeath_Teardrops);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"¿Qué quieres decir con 'arma'?",DIA_Pyrokar_PotionofDeath_Weapon);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Teardrops()
{
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00"); //¿Y qué son las Lágrimas de Innos?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01"); //Cuando Innos se percató de que tenía que luchar con Beliar, su hermano, para preservar la creación, sintió una gran pesadumbre.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02"); //Empezó a llorar y sus lágrimas cayeron al mundo. Fueron muchas, pues su corazón estaba tan lleno de pena que lloró durante 13 años.
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03"); //Ve al grano.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04"); //Las personas que encontraron las lágrimas y las probaron adquirieron una fuerza y una lucidez sobrenaturales. Reconocieron la sabiduría de la creación de Innos y comenzaron a servirle.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05"); //Fueron los primeros miembros de la Comunidad del Fuego, y sus lágrimas les dieron fuerza, valor y sabiduría. Pero eso fue hace mucho tiempo, y han pasado más de 250 años desde que la última vez que alguien vio una Lágrima de Innos.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath); 
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Weapon ()
{
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_00"); //¿A qué te refieres con lo de 'arma'?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01"); //Cuenta la leyenda que, gracias a la influencia de esta sustancia, los guerreros de Innos podían realizar proezas casi sobrenaturales.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02"); //Eran inmunes al agotamiento y contaban con la fuerza de dos osos.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03"); //Las hazañas heroicas más importantes de antaño solo fueron posibles gracias a las Lágrimas de Innos.
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_04"); //Comprendo.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05"); //Pero las Lágrimas también pueden causar muerte y sufrimiento. Solo los miembros de nuestra orden pueden beberlas.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06"); //Cualquier otro (incluso los paladines de nuestro señor) se encontraría con una muerte cruel.

	Npc_RemoveInvItems 	(hero,ItPo_PotionOfDeath_01_Mis,1);
	CreateInvItems 		(hero,ItPo_PotionOfDeath_02_Mis,1);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Pyrokar_KAP6_EXIT(C_INFO)
{
	npc		= KDF_500_Pyrokar;
	nr		= 999;
	condition	= DIA_Pyrokar_KAP6_EXIT_Condition;
	information	= DIA_Pyrokar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Pyrokar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Pyrokar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pyrokar_PICKPOCKET (C_INFO)
{
	npc			= KDF_500_Pyrokar;
	nr			= 900;
	condition	= DIA_Pyrokar_PICKPOCKET_Condition;
	information	= DIA_Pyrokar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Pyrokar_PICKPOCKET_Condition()
{
	C_Beklauen (108, 550);
};
 
FUNC VOID DIA_Pyrokar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pyrokar_PICKPOCKET);
	Info_AddChoice		(DIA_Pyrokar_PICKPOCKET, DIALOG_BACK 		,DIA_Pyrokar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pyrokar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pyrokar_PICKPOCKET_DoIt);
};

func void DIA_Pyrokar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pyrokar_PICKPOCKET);
};
	
func void DIA_Pyrokar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PICKPOCKET);
};















































































































































