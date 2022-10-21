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
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_00"); //As� que eres el nuevo novicio. Bien, supongo que el maestro Parlan ya te ha encargado una tarea.
	AI_Output (self, other, "DIA_Pyrokar_WELCOME_11_01"); //(Con leve tono de reproche) Sabes que en la Comunidad del Fuego todos deben cumplir con su obligaci�n seg�n la voluntad de Innos.
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
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_01"); //�Y vas a contarnos por qu� quieres hablar con ellos?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_02"); //Tengo un mensaje importante para ellos.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_03"); //�Y qu� mensaje es?
	AI_Output (other, self, "DIA_Pyrokar_Hagen_15_04"); //�Un ej�rcito mal�fico liderado por dragones se est� congregando en el Valle de las Minas! Tenemos que detenerlos mientras podamos.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_05"); //Um. Reflexionaremos acerca de tus palabras, novicio. Cuando llegue la hora, te haremos saber lo que el concilio ha decidido.
	AI_Output (self, other, "DIA_Pyrokar_Hagen_11_06"); //Mientras tanto, ser� mejor que atiendas tus obligaciones de novicio.
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Auge)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_07"); //No queremos distraerte de tu trabajo m�s tiempo. Ya puedes marcharte.
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
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_01"); //Todo aquel que piensa que no solo puede encontrar el amuleto sagrado, sino tambi�n pon�rselo, es un necio.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_02"); //El amuleto escoge a su portador. Nadie puede pon�rselo, salvo el que est� predestinado para ello.
	AI_Output (other, self, "DIA_Pyrokar_Auge_15_03"); //Estoy dispuesto a intentarlo.
	AI_Output (self, other, "DIA_Pyrokar_Auge_11_04"); //El novicio est� obligado a demostrar humildad, no anhelo.
	
 	B_LogEntry (TOPIC_INNOSEYE, "No cre� que fuera a ser tan dif�cil, pero Pyrokar no entregar� el Ojo voluntariamente y sin la ayuda de los paladines.");
	
	if Npc_KnowsInfo (other,DIA_Pyrokar_Hagen)
	{
		AI_Output (self, other, "DIA_Pyrokar_ALL_11_05"); //No queremos distraerte de tu trabajo m�s tiempo. Ya puedes marcharte.
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
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_01"); //Tengo informaci�n al respecto y es lamentable. Pero hemos acordado con los Magos de Agua que ellos se ocupar�n del asunto.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_02"); //Lo mismo ocurre con la investigaci�n de los extra�os terremotos en el noreste de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_03"); //Hasta ahora no me han informado de que se requiera nuestra intervenci�n. Por eso, no vamos a hacer nada al respecto.
	AI_Output	(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_04"); //S�, pero
	AI_Output	(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_05"); //�Nada de peros! Procederemos como creamos conveniente y espero que incluso T� sepas respetarlo.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Los Magos de Fuego lamentan la p�rdida de ciudadanos, pero dicen que el asunto corresponde a los Magos de Agua. No se puede esperar ayuda del monasterio."); 

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
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_01"); //(Sorprendido) As� que la conoces... �quieres someterte a la prueba del fuego?
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_02"); //S�, me remito a la ley del fuego, que dice que...
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_03"); //(Interrumpe con brusquedad) Conocemos la ley del fuego. Tambi�n hemos visto morir a muchos novicios durante la prueba. Deber�as sopesar con calma esta decisi�n.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_04"); //Ya lo he hecho. Quiero someterme a la prueba... y voy a superarla.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_05"); //(A modo de advertencia) Si insistes, el Concilio Supremo te pondr� a prueba.
	AI_Output (other, self, "DIA_Pyrokar_FIRE_15_06"); //Insisto en someterme a la prueba del fuego.
	AI_Output (self, other, "DIA_Pyrokar_FIRE_11_07"); //En ese caso, que as� sea. Cuando est�s listo, cada uno de los magos del Concilio Supremo te encargar� una misi�n que tendr�s que cumplir.
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
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_01"); //Y solo Innos sabe si vas a superarla. Te someter�s a la misma prueba que los novicios elegidos.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_02"); //La prueba de la magia. (Distante) Probablemente sepas que solo uno de los novicios puede superar la prueba.
	AI_Output (other, self, "DIA_Pyrokar_TEST_15_03"); //Entiendo. En ese caso, �qui�nes son los competidores?
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_04"); //En su sabidur�a, Innos ha elegido a tres novicios que tambi�n van a someterse a la prueba: Agon, Igaraz y Ulf. Ya han iniciado la b�squeda.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_05"); //(Seco) �Basta ya! Escucha las palabras de la prueba: 'Sigue las se�ales de Innos y tr�enos lo que el creyente encuentra detr�s de la senda'.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_06"); //Vas a necesitar esta llave.
	AI_Output (self, other, "DIA_Pyrokar_TEST_11_07"); //Eso es todo lo que tenemos que decirte.
	
	Log_CreateTopic (TOPIC_Schnitzeljagd,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Schnitzeljagd,LOG_RUNNING);
	B_LogEntry (TOPIC_Schnitzeljagd,"Pyrokar est� preparando la prueba de la magia. Es la misma prueba que tuvieron que afrontar los novicios escogidos: Ulf, Igaraz y Agon.");
	
	B_LogEntry (TOPIC_Schnitzeljagd,"Voy a seguir los signos de Innos y ''encontrar lo que el creyente encuentra detr�s de la senda''. Tambi�n me dio una llave.");
	
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
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_00"); //Mientras est�s ocupado con la prueba, no tenemos nada que decirte.
	}
	else if (randomizer == 1)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_01"); //�Qu� haces aqu�? �Ve a someterte a la prueba!
	}
	else if (randomizer == 2)
	{
		AI_Output (self, other, "DIA_Pyrokar_RUNNING_11_02"); //Ha llegado el momento de que respaldes con obras tus grandes palabras. �No te parece, novicio?
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
	description	 = 	"He encontrado la piedra r�nica.";
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
	
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_00"); //He encontrado la piedra r�nica.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_01"); //(Sin cre�rselo) �Lo... has logrado? Seguiste las se�ales y descubriste el portal oculto...
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_02"); //� y derrot� a todos esos monstruos que ya me consideraban su aperitivo.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_03"); //�Y los dem�s novicios? �Qu� ha sido de Agon? �No lo consiguieron antes que t�?
	AI_Output (other, self, "DIA_Pyrokar_SUCCESS_15_04"); //Han fracasado. Supongo que no estaban destinados a superar la prueba.
	AI_Output (self, other, "DIA_Pyrokar_SUCCESS_11_05"); //En ese caso, declaramos que has superado la prueba. Puedes quedarte con la piedra r�nica.
	 
	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	B_GivePlayerXP (XP_SCHNITZELJAGD);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM wenn Pr�fung erfolgreich und die anderen noch nicht. 
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
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_02"); //� todav�a tienes que superar la prueba de Ulthar.
	};
	if (MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Pyrokar_Todo_11_03"); //� todav�a tienes que pasar la prueba de Serpentes.
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
	description	 = 	"�Ahora ser� aceptado en el Gremio de Magos?";
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
	AI_Output (other, self, "DIA_Pyrokar_MAGICAN_15_00"); //�Ahora ser� aceptado en el Gremio de Magos?
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_01"); //Lo has conseguido. Has superado la prueba del fuego. Siempre estuvimos seguros de que tendr�as �xito.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_02"); //(Insistente) Igual que lo estamos de que seguir�s esforz�ndote al m�ximo para convertirte en un siervo digno de Innos.
	AI_Output (self, other, "DIA_Pyrokar_MAGICAN_11_03"); //Por lo tanto, si est�s dispuesto a prestar el juramento del fuego, ser�s aceptado en nuestras filas como mago.
	
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
	description	 = 	"Estoy listo para entrar en el C�rculo del Fuego.";
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
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_00"); //Estoy listo para entrar en el C�rculo del Fuego.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_01"); //De acuerdo. En ese caso, presta el juramento sagrado del fuego.
	


	AI_Output (self, other, "DIA_Pyrokar_OATH_11_02"); //(Con solemnidad) �Juras ante el todopoderoso lord Innos, sus siervos y la Llama Sagrada...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_03"); //� que a partir de ahora y para siempre, tu vida permanecer� unida al fuego...
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_04"); //� hasta que tu cuerpo y tu alma reposen en sus salones sagrados y se extinga la llama de tu vida?
	AI_Output (other, self, "DIA_Pyrokar_OATH_15_05"); //Lo juro.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_06"); //Al pronunciar las palabras del juramento, has sellado un pacto con el fuego.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_07"); //Ponte esta t�nica como muestra del v�nculo eterno.
	
	CreateInvItems 		(hero,ITAR_KDF_L,1);
	AI_EquipArmor		(hero,ITAR_KDF_L);		
	
	other.guild = GIL_KDF;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Npc_SetTrueGuild (other, GIL_KDF);
	
	Fire_Contest = TRUE;//f�rs Log
	
	Snd_Play ("LEVELUP"); 
	
	KDF_Aufnahme = LOG_SUCCESS;
	SLD_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	B_GivePlayerXP (XP_BecomeMage);
	
	
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_08"); //Como ya has sido aceptado en nuestras filas, puedes hablar con lord Hagen, el comandante supremo de los paladines.
	AI_Output (self, other, "DIA_Pyrokar_OATH_11_09"); //Nos interesa mucho saber su an�lisis de la situaci�n. Ya puedes ir a Khorinis.
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
	description	 = 	"�Qu� puedo aprender ahora?";
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
	AI_Output	(other, self, "DIA_Pyrokar_Lernen_15_00"); //Y ahora, �qu� puedo aprender?
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_01"); //En primer lugar, tienes derecho a estudiar los c�rculos de la magia, que te otorgar�n el poder para usar las runas.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_02"); //Cuanto m�s alto llegues en los seis c�rculos de la magia, m�s potentes ser�n los hechizos que podr�s realizar.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_03"); //Los hermanos del monasterio te ense�ar�n las f�rmulas. Cada uno se ha especializado en una disciplina concreta que te explicar�.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_04"); //Karras, por ejemplo, es un maestro de la invocaci�n y la convocaci�n, e Hyglas te ense�ar� la magia del fuego.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_05"); //Nadie sabe m�s que Marduk acerca de los poderes del hielo y el trueno. Parlan puede ense�arte diversos encantamientos, y te iniciar� en los primeros c�rculos.
	AI_Output	(self, other, "DIA_Pyrokar_Lernen_11_06"); //Pero ellos solo te ense�ar�n las f�rmulas. Las runas tendr�s que crearlas t�.
	
	Log_CreateTopic (Topic_KlosterTeacher,LOG_NOTE);
	
	B_LogEntry (Topic_KlosterTeacher,"El maestro Parla me ordenar� en los primeros c�rculos de la magia.");
	
	B_LogEntry (Topic_KlosterTeacher,"El hermano Karras ense�a f�rmulas de invocaciones y convocaciones.");
	B_LogEntry (Topic_KlosterTeacher,"El hermano Hyglas puede ense�arme los misterios del fuego.");
	B_LogEntry (Topic_KlosterTeacher,"El hermano Marduk puede ense�arme los poderes del hielo y el trueno.");
	B_LogEntry (Topic_KlosterTeacher,"El hermano Parlan ense�a muchas otras f�rmulas.");
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
	description	 = 	"Me gustar�a expresar un deseo...";
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
	AI_Output (other, self, "DIA_Pyrokar_Wunsch_15_00"); //Me gustar�a expresar un deseo...
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_01"); //Despu�s de haber sido aceptado, cada mago tiene derecho a hacer algo.
	AI_Output (self, other, "DIA_Pyrokar_Wunsch_11_02"); //�Qu� va a ser lo primero que hagas como mago?
	
	
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
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Nothing_11_01"); //(Asombrado) Que as� sea. El nuevo mago renuncia a hacer algo.
	
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
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01"); //Que as� sea.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02"); //Se permitir� al novicio que se quede en el monasterio, y ocupar� el puesto de jardinero que se encuentra vacante.
	
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
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_01"); //Que as� sea.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Babo_11_02"); //Con efecto inmediato, el novicio Babo quedar� al cargo de los jardines del monasterio.
	
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
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_01"); //Que as� sea.
	AI_Output (self ,other,"DIA_Pyrokar_Wunsch_Opolos_11_02"); //A partir de ahora, el novicio Opolos estudiar� las escritura de Innos.
	
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
	AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_00"); //Traigo noticias de lord Hagen. Quiere pruebas de la presencia de los dragones y del ej�rcito del mal.
	
	if (EnterOW_Kapitel2 == FALSE)
	{
		AI_Teleport (Sergio,"NW_MONASTERY_PLACE_09");
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_01"); //Por lo tanto, ir� al Valle de las Minas y las conseguir�.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_02"); //Bien. Entonces, obedece la siguiente orden. El palad�n Sergio te escoltar� hasta el desfiladero.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_03"); //Que Innos te proteja.
		
		Sergio_Follow = TRUE;
		AI_StopProcessInfos (self);
		B_StartOtherRoutine (Sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output (other, self, "DIA_Pyrokar_Nachricht_15_04"); //Voy directo al Valle de las Minas.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_05"); //Bien. Dado que ya sabes c�mo se va al valle, no necesitas escolta.
		AI_Output (self, other, "DIA_Pyrokar_Nachricht_11_06"); //Oc�pate de ese asunto para lord Hagen. Que Innos te proteja.
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
	description	 = 	"Ens��ame el �ltimo c�rculo de la magia.";
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
	AI_Output (other, self, "DIA_Pyrokar_TEACH_15_00"); //Ens��ame el �ltimo c�rculo de la magia.
	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		if B_TeachMagicCircle (self,other, 6)  
		{
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_01"); //Ha pasado mucho tiempo desde que se estableci� tu v�nculo con el fuego. Han pasado muchas cosas y no encontramos reposo.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_02"); //Eres el elegido de Innos. Por lo tanto, para vencer en combate necesitar�s todas tus fuerzas.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_03"); //Voy a consagrarte, elegido. Est�s entrando en el sexto c�rculo: que traigas la luz y disperses las tinieblas.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_04"); //Si as� lo quieres, ya te puedo ense�ar la f�rmula m�gica del �ltimo c�rculo.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_05"); //Oh... una cosa m�s. Me ha costado reconocerte.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_06"); //Recibiste mi carta cuando te metieron en la barrera.
			AI_Output (other, self, "DIA_Pyrokar_TEACH_15_07"); //S�, as� me libraste de las tonter�as del juez.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_08"); //Y eres el elegido de Innos.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_09"); //�Recibe mi bendici�n, elegido!
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_10"); //Innos, luz del sol y fuego del mundo, bendice a este hombre, el siervo que has elegido.
			AI_Output (self, other, "DIA_Pyrokar_TEACH_11_11"); //Dale valor, fuerza y sabidur�a para que siga la senda que le has marcado.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_11_12"); //A�n no es el momento. Te instruir� cuando hayas avanzado algo m�s por la senda que Innos te marcar�.
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
	description	 = 	"Instr�yeme (crear runas)";
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
	AI_Output (other, self, "DIA_Pyrokar_SPELLS_15_00"); //Instr�yeme.
	
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
		AI_Output (self, other, "DIA_Pyrokar_SPELLS_11_01"); //No te puedo ense�ar nada m�s.
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
	description	 = 	"Me envi� Parlan...";
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
		AI_Output (other, self, "DIA_Pyrokar_Parlan_15_00"); //Me manda Parlan. Quiero aumentar mis poderes m�gicos.
		AI_Output (self, other, "DIA_Pyrokar_Parlan_11_01"); //Has aprendido mucho y tu poder ha crecido. A partir de ahora ser�s mi pupilo.
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
	description	 = 	"Quiero aumentar mis poderes m�gicos.";
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
		AI_Output (other, self, "DIA_Pyrokar_TEACH_MANA_15_00"); //Quiero aumentar mis poderes m�gicos.
		
		Info_ClearChoices   (DIA_Pyrokar_TEACH_MANA);	
		Info_AddChoice 		(DIA_Pyrokar_TEACH_MANA,DIALOG_BACK,DIA_Pyrokar_TEACH_MANA_BACK);		
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1			, B_GetLearnCostAttribute(other, ATR_MANA_MAX))			,DIA_Pyrokar_TEACH_MANA_1);
		Info_AddChoice		(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5			, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)		,DIA_Pyrokar_TEACH_MANA_5);
};
FUNC VOID DIA_Pyrokar_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= 250)  
	{
		AI_Output (self, other, "DIA_Pyrokar_TEACH_MANA_11_00"); //Siento que el poder m�gico fluye a trav�s de ti. Ni siquiera yo puedo ense�arte a aumentarlo.
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
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_00"); //Bend�ceme, maestro.
			}
		else
			{
				AI_Output			(other, self, "DIA_Pyrokar_PERM_15_01"); //�Qu� hay de una bendicioncita? No me vendr�a mal.
			};
		
	if (Kapitel == 5)	
	&& 	(MIS_PyrokarClearDemonTower == LOG_SUCCESS)
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_02"); //Que el �xito corone tu batalla final con nuestro archienemigo. Que Innos te acompa�e.
			}
		else
			{
				AI_Output			(self, other, "DIA_Pyrokar_PERM_11_03"); //Que Innos te libre de todo mal en los senderos imp�os que habr�s de recorrer.
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
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_01"); //�Qu� noticias traes?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_02"); //El enemigo ha movilizado all� un ej�rcito de orcos y dragones.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_03"); //Milten ya nos hab�a informado al respecto. �Qu� hay del cargamento de mineral del rey?
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_04"); //La mina que Garond ha ordenado explotar en el valle no basta para satisfacer las demandas del rey.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_05"); //Los d�as cada vez son m�s grises, y la luz del sol m�s tenue.
	AI_Output			(other, self, "DIA_Pyrokar_BACKFROMOW_15_06"); //Me atacaron unos hombres vestidos con t�nicas negras.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_07"); //Lo s�. Son los buscadores, secuaces del reino infernal de Beliar. Ten cuidado con ellos. Intentar�n poseerte.
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_08"); //Una vez pose�do, dejar�s de ser t� mismo y solo encontrar�s ayuda en el monasterio. Ten cuidado.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar me habl� de los buscadores, hombres vestidos con t�nicas negras que son seguidores de Beliar. Me ha avisado de que pueden poseerte. Si alguna vez me pasa, volver� directamente al monasterio."); 
	};

	if ((Npc_IsDead(Karras))==FALSE)
	&& (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_09"); //Le he pedido a Karras que investigue este asunto. Seguro que pronto nos ofrecer� nuevos puntos de vista que nos aclaren las cosas.
		PyrokarToldKarrasToResearchDMT = TRUE;
		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar ha ordenado a Karras que se encargue de la amenaza de los buscadores."); 
	};

	AI_Output (self ,other, "DIA_Pyrokar_Add_11_00"); //Ten. Esta runa te devolver� directamente al monasterio si necesitaras nuestra ayuda.
	B_GiveInvItems (self, other, itru_teleportmonastery, 1);
	
	AI_Output			(self, other, "DIA_Pyrokar_BACKFROMOW_11_10"); //Recuerda que, si no nos resistimos, nuestra suerte estar� echada.

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
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_02"); //Lamento decepcionarte. Hemos sido v�ctimas de una conjura traicionera del enemigo.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_03"); //Alguien ha sacado por la fuerza el Ojo de Innos del interior de estas sagradas paredes.

	
	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "�Qui�n podr�a ser tan insolente, maestro?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	}
	else
	{
		Info_AddChoice	(DIA_Pyrokar_GIVEINNOSEYE, "�Qui�n ha sido?", DIA_Pyrokar_GIVEINNOSEYE_wer );
	};
};
func void DIA_Pyrokar_GIVEINNOSEYE_wer ()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_00"); //�Qui�n podr�a ser tan insolente, maestro?
	}
	else
	{
		AI_Output			(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_01"); //�Qui�n ha sido?
	};

	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_02"); //El mal es astuto y suele actuar con sigilo. Es raro que se le vea llevar a cabo sus perversas maquinaciones a plena luz del d�a.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_03"); //Pero en estos tiempos no es el caso. El enemigo se muestra en las calles, en cada hogar y en cada plaza p�blica.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_04"); //Solo puede significar que ya no teme a ning�n adversario, y que no va a retroceder ante nada.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_05"); //Uno de nuestros devotos m�s fieles, candidato a la gran t�nica de los magos del fuego, ha cambiado de bando inesperadamente y de manera alarmantemente maligna. Pedro.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_06"); //El enemigo lo ha pose�do, y al hacerlo nos ha infligido una terrible derrota.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_07"); //Pedro ha entrado por la fuerza en nuestras salas m�s sagradas y ha robado el Ojo.
	AI_Output			(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_08"); //Me temo que se pas� demasiado tiempo solo, al otro lado de las puertas y, por lo tanto, m�s all� de las paredes protectoras del monasterio, expuesto a todos los peligros que acechan.

	Pedro.flags = 0;	//Joly: Pedro ist nun mortal und zum Abschu� freigegeben.
	Pedro_Traitor = TRUE;	//Joly: Pedro ist f�r den SC nun als Traitor bekannt. Mu� hier stehen bleiben und darf nur einmal auf True gesetzt werden

 	B_LogEntry (TOPIC_INNOSEYE, "Estupendo. Ten�a que hab�rmelo imaginado. Llego demasiado tarde, estos zoquetes del monasterio han dejado que alg�n novicio les robe el Ojo y ahora tengo que salir detr�s de Pedro, el traidor, rezando porque no se lo haya vendido a otro.");
 	B_LogEntry (TOPIC_TraitorPedro, "El traidor de Pedro ha robado el Ojo de Innos del monasterio. Me parece que los magos de fuego estar�n m�s que contentos si lo encuentran.");
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

	description	 = 	"�Ad�nde ha huido el ladr�n?";
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
	AI_Output			(other, self, "DIA_Pyrokar_NOVIZENCHASE_15_00"); //�Ad�nde ha huido el ladr�n?
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_01"); //Pedro noque� a otros novicios que intentaron detenerle y desapareci� en la neblina matinal.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_02"); //Muchos novicios han ido tras �l para devolver intacto el Ojo a su lugar.
	AI_Output			(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_03"); //Si quieres alcanzarlos, tendr�s que darte prisa antes de que Pedro se os escape.

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
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_00"); //He encontrado el Ojo de Innos. Est� roto.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_01"); //Pero... no puede ser. �Qu� ha pasado?
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_02"); //Lo ten�an unos tipos bastante desagradables, y llegu� demasiado tarde.
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_03"); //Estaban realizando un extra�o encantamiento en un lugar de ceremonias en forma de media luna en el bosque.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_04"); //Que Innos nos proteja. Han profanado el c�rculo del sol.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_05"); //Ni en mis peores pesadillas habr�a imaginado que cuentan con ese poder.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	MIS_NovizenChase = LOG_SUCCESS;	
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Pyrokar_FOUNDINNOSEYE);
	Info_AddChoice		(DIA_Pyrokar_FOUNDINNOSEYE, "�Y ahora qu� hacemos?", DIA_Pyrokar_FOUNDINNOSEYE_was );
	
};
func void DIA_Pyrokar_FOUNDINNOSEYE_was ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_15_00"); //�Y ahora qu� hacemos?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_01"); //El enemigo ha adquirido mucho poder. Aun as�, este antiguo artefacto supon�a una amenaza poderosa para �l.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_02"); //Debemos sanar el Ojo y devolverle su antiguo poder, pero el tiempo est� en nuestra contra.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_03"); //Ni siquiera puedo imaginarme qu� va ser de nosotros. Sin la protecci�n del Ojo, estamos a merced del enemigo.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_04"); //Ve a la ciudad a ver a Vatras, el mago de agua. Solo �l sabr� lo que hacer en esta terrible situaci�n. Ll�vale el Ojo, y date prisa.


	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, DIALOG_BACK, DIA_Pyrokar_FOUNDINNOSEYE_weiter );
	if (hero.guild == GIL_KDF)
	{
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "�Por qu� a Vatras?", DIA_Pyrokar_FOUNDINNOSEYE_was_vatras );
	};
	Info_AddChoice	(DIA_Pyrokar_FOUNDINNOSEYE, "�Qu� es el c�rculo del sol?", DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis );
	
	
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar quiere que le pida consejo al mago de agua, Vatras, sobre qu� hacer con el Ojo da�ado.");

	MIS_Pyrokar_GoToVatrasInnoseye = LOG_RUNNING;

};
func void DIA_Pyrokar_FOUNDINNOSEYE_was_vatras ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00"); //�Por qu� a Vatras?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01"); //El privilegio de vestir la t�nica no te autoriza a poner en duda mis instrucciones, hermano.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02"); //Vatras es siervo de Adanos. Solo el conocimiento de los magos de agua nos traer� claridad en esta hora aciaga.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03"); //No necesitas saber m�s.

};


func void DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis ()
{
	AI_Output			(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00"); //�Qu� es el c�rculo del sol?
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01"); //Cada a�o, todos los magos y novicios del monasterio van a este lugar durante el solsticio para indicar el comienzo de un nuevo ciclo.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02"); //El lugar est� lleno del poder inconmensurable del sol.
	AI_Output			(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03"); //No ten�a ni la menor idea de que se pod�a invertir su poder, aunque es lo que ha sucedido.
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
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_01"); //Ah, muy bien. �D�nde est�?
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_02"); //Est� preparando un ritual en el c�rculo del sol para sanar el Ojo de Innos.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_03"); //Si eso es cierto, a lo mejor a�n queda alguna esperanza.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_04"); //Vatras quiere que le ayud�is Xardas y t�.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_05"); //�Qu�? �Xardas tambi�n va a estar all�? No hablas en serio.
	AI_Output			(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_06"); //Oye, no fue cosa m�a. Vatras insiste.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_07"); //Siempre ese Xardas. Estoy harto. Las cosas no podr�an ir a peor.
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_08"); //�C�mo s� que Xardas no est� compinchado con el enemigo?
	AI_Output			(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_09"); //No conf�o en Xardas, por mucho que lo necesitemos.
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
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_00"); //Sin ti no se puede hacer. Vatras no ser�a capaz de llevar a cabo el ritual.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_01"); //Tendr�s que confiar en Xardas.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_02"); //No estoy obligado a hacer nada, �me oyes? No tengo la menor prueba de que Xardas no est� en nuestra contra. No puedo hacerlo.
	AI_Output			(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_03"); //�Y si te traigo alguna prueba?
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_04"); //Me temo que es imposible. Tendr�a que impresionarme.
	AI_Output			(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_05"); //Con respecto a Xardas, no creo que consiga impresionarme absolutamente nada.

	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar siente temor cuando piensa en Xardas. Tendr� que hablar con Xardas sobre c�mo conseguir que acuda al ritual del c�rculo del sol.");
	
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
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_02"); //Ens��amelo.
	B_GiveInvItems 		(other, self, ItWr_XardasBookForPyrokar_Mis,1);
	Npc_RemoveInvItems 	(self, ItWr_XardasBookForPyrokar_Mis,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_03"); //(At�nito) Es incre�ble. �Tienes la menor idea de lo que acabas de darme?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_04"); //Esto... no.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_05"); //(Molesto) Es un antiguo volumen que llevaba mucho tiempo desaparecido.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_06"); //Cre�amos que hab�a desaparecido para siempre, y ahora me entero de que Xardas siempre ha sabido lo que hab�a sido de �l.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHZURUECK_15_07"); //Entonces, �acudir�s al ritual?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_08"); //S�, ir� al c�rculo del sol, pero sigo sin estar convencido de las buenas intenciones de Xardas.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_09"); //De hecho, voy a hacer que ese chacal me explique d�nde ha escondido el libro tantos a�os. Esta vez se ha pasado.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHZURUECK_11_10"); //Nos vemos en el c�rculo del sol.
	
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"THRONE",-1);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
	B_LogEntry (TOPIC_INNOSEYE, "Pyrokar ha accedido finalmente a acudir al c�rculo del sol.");
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

	description	 = 	"�Crees que puedes reparar el Ojo?";
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
	AI_Output			(other, self, "DIA_Pyrokar_PRERITUAL_15_00"); //�Crees que puedes enmendar el Ojo?
	AI_Output			(self, other, "DIA_Pyrokar_PRERITUAL_11_01"); //No sabr�a decirte. Ya veremos.
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

	description	 = 	"Lo has conseguido. El Ojo de Innos est� curado.";
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
	AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_00"); //Lo has conseguido. El Ojo de Innos est� curado.
	AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_01"); //Pensaba que era pr�cticamente imposible.

	
	if (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_02"); //S�, maestro.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_03"); //Ya has demostrado en varias ocasiones que est�s listo para ingresar en la orden suprema de los magos del fuego.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_04"); //A partir de ahora, eres miembro del concilio y representar�s a nuestra orden en el mundo. Ya eres uno de los magos supremos del fuego.
			AI_Output			(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_05"); //Viste la gran t�nica con dignidad y aporta honor y riqueza a la orden, hermano m�o.
		
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

	description	 = 	"�Qu� queda por hacer?";
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
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_00"); //�Qu� me queda hacer aqu�?
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_01"); //No pierdas el tiempo en cuestiones triviales. Ve a derrotar a los dragones. Ten, toma el Ojo.
	CreateInvItems (self,ItMi_InnosEye_MIS,1);
	B_GiveInvItems (self, other, ItMi_InnosEye_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_02"); //Recuerda que hay que hablar con un drag�n antes de atacarlo.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_03"); //Das Auge wird dir helfen, die Drachen dazu zu zwingen, mit dir zu reden.
	//AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_04"); //Es bietet dir nicht nur Schutz gegen ihre Angriffe, es f�gt ihnen auch unertr�gliche Schmerzen zu, wenn du es bei dir tr�gst.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_01"); //El poder del Ojo har� que los dragones hablen contigo y te digan la verdad.
	AI_Output (self ,other, "DIA_Pyrokar_Add_11_02"); //Adem�s, cuando lo lleves puesto te proteger� de sus ataques.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_05"); //Sin embargo, su poder no dura mucho. Tendr�s que rellenarlo con energ�a m�gica.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_06"); //Para hacerlo, necesitar�s la esencia del coraz�n de un drag�n, que tendr�s que unir al Ojo en la mesa de trabajo de un alquimista.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_07"); //Una vez hecho esto, podr�s enfrentarte a otro drag�n.
	AI_Output			(other, self, "DIA_Pyrokar_KAP3_READY_15_08"); //Gracias. Lo recordar�.
	AI_Output			(self, other, "DIA_Pyrokar_KAP3_READY_11_09"); //Ya tienes todo lo necesario. Vete. No te queda mucho tiempo.

	PLAYER_TALENT_ALCHEMY[Charge_InnosEye] 		= TRUE;	
	PrintScreen	(PRINT_LearnAlchemyInnosEye, -1, -1, FONT_Screen, 2);
	TOPIC_END_INNOSEYE = TRUE;
	B_GivePlayerXP (XP_Ambient);	
	
	CreateInvItems   (Gorax, ItMi_RuneBlank, 1);
	
	Log_CreateTopic (TOPIC_DRACHENJAGD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD, LOG_RUNNING);
	B_LogEntry (TOPIC_DRACHENJAGD,"Ahora estoy listo para enfrentarme a los dragones. El Ojo de Innos me ayudar� a destruirlos, pero tengo que llevarlo puesto cuando luche contra esas bestias. Debo hablar con los dragones antes de ponerles a prueba. El problema es que el Ojo pierde fuerza cada vez que hablo con alguno. Necesito el coraz�n de un drag�n y un frasco de laboratorio vac�o para juntar la piedra debilitada del amuleto y el extracto del coraz�n en una mesa de trabajo de alquimista entre combate y combate y poder as� enfrentarme a otro drag�n."); 

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

	description	 = 	"He encontrado un alman�que extra�o.";
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
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_00"); //He encontrado un alman�que extra�o.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_01"); //�De veras? �Qu� clase de alman�que?
	AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_02"); //No lo tengo claro. Pens� que t� sabr�as lo que hacer con �l.
	B_GiveInvItems 		(other, self, ITWR_DementorObsessionBook_MIS,1);
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_03"); //Desde luego, es muy inquietante. Me alegro de que me lo trajeras. Fue muy prudente por tu parte.
	B_GivePlayerXP (XP_Ambient);
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_04"); //Supongo que hay m�s. Encu�ntrame m�s de estos libros condenados.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_05"); //Sospecho que se trata de un instrumento del poder de los buscadores.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_06"); //Lo usan para controlar las almas en pena de sus v�ctimas.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_07"); //Est� claro que en estos libros escriben los nombres de aquellos a los que pretenden poseer.
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_08"); //Mira, voy a darte esta carta m�gica que te indicar� los nombres escritos en los libros.
		CreateInvItems (self, ItWr_PyrokarsObsessionList, 1);									
		B_GiveInvItems (self, other, ItWr_PyrokarsObsessionList, 1);					
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_09"); //Encuentra a esas v�ctimas y tr�eme sus libros. Me librar� de ellos.
	
		if ((Npc_IsDead(Karras))== FALSE)
			{
				AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_10"); //Pero antes deber�as ense�arle por lo menos uno a Karras. A lo mejor le ayuda en sus estudios.
			};
	
		AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_11"); //No cometas la equivocaci�n de tratar de destruirlos. A�n no est�s listo para resistir su poder.

		B_LogEntry (TOPIC_DEMENTOREN,"Pyrokar quiere que no se da�en los alman�ques de los pose�dos. Me ha dado una lista de los que los buscadores planean poseer. Puede que se a�adan m�s nombres m�s adelante."); 
	};
	
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_12"); //No te acerques mucho a los buscadores o te poseer�n.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_13"); //Si no eres capaz de resistirte a su llamada, ven a verme lo antes posible.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_14"); //El monasterio es el �nico lugar en que puede salvarse tu alma.

	if ((Npc_IsDead(Karras))== FALSE)
	&& (hero.guild == GIL_KDF)
		{
			AI_Output			(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_15"); //�No hay protecci�n posible contra sus ataques mentales?
			AI_Output			(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_16"); //Tal vez la haya. A lo mejor Karras sabe algo al respecto.
			Pyrokar_AskKarrasAboutDMTAmulett = TRUE;
			B_LogEntry (TOPIC_DEMENTOREN,"Se supone que Karras me ayudar� a encontrar una protecci�n contra los ataques mentales de los buscadores."); 
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

	description	 = 	"(Curar posesi�n)";
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
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_00"); //C�rame, maestro, pues estoy pose�do.
				
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_01"); //�Que as� sea! T�mate esta poci�n. Te librar� de tus pesadillas.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_02"); //Que la piedad de Innos sea tu salvaci�n.
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_03"); //Act�a en su nombre y cu�date del mal de ojo del enemigo.
				
					if (SC_ObsessionTimes > 3)
						{	
							AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_04"); //Pero te advierto que si te expones demasiado al poder de los buscadores, en alg�n momento no habr� vuelta atr�s. Recu�rdalo en todo momento.
						};
					
					CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
					B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);					
					Got_HealObsession_Day = Wld_GetDay(); 
				}
			else
				{
					AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_15_05"); //Creo que estoy pose�do. �Puedes curarme?
					AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_06"); //No sin una muestra de respeto hacia este monasterio, hijo m�o. 300 monedas de oro.
				
					Info_ClearChoices	(DIA_Pyrokar_SCOBSESSED);
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "Es demasiado.", DIA_Pyrokar_SCOBSESSED_nein );
					Info_AddChoice	(DIA_Pyrokar_SCOBSESSED, "Estupendo. Aqu� tienes el dinero.", DIA_Pyrokar_SCOBSESSED_ok );
				};
		 }
	 else
		 {
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_11_07"); //Pero si te acabas de tomar la poci�n curativa. No vuelvas a verme hasta que necesites mi ayuda de verdad.
		 };
};
func void DIA_Pyrokar_SCOBSESSED_ok ()
{
	AI_Output			(other, self, "DIA_Pyrokar_SCOBSESSED_ok_15_00"); //Estupendo. Aqu� tienes el dinero.

	if (B_GiveInvItems (other, self, ItMi_Gold,300))
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_01"); //Toma, b�bete esto. Que la piedad de Innos sea tu salvaci�n.
			CreateInvItems (self, ItPo_HealObsession_MIS, 2);									
			B_GiveInvItems (self, other, ItPo_HealObsession_MIS, 2);
			Got_HealObsession_Day = Wld_GetDay(); 
		}
		else
		{
			AI_Output			(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_02"); //Si me traes el dinero, te ayudar�.
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

	description	 = 	"Puedo contarte m�s cosas de los pose�dos.";
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
	AI_Output			(other, self, "DIA_Pyrokar_AlmanachBringen_15_00"); //Puedo contarte m�s cosas de los pose�dos.
	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_01"); //Habla, hermano.
	
	var int AlmanachCount;
	var int XP_KDF_BringAlmanachs;
	var int AlmanachGeld;
	var int PyrokarsAlmanachOffer;
	
	PyrokarsAlmanachOffer = 400;	//Joly: Gold f�r einen Almanach
	
	AlmanachCount = Npc_HasItems(other, ITWR_DementorObsessionBook_MIS);


	if (AlmanachCount == 1)
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_02"); //He encontrado otro alman�que.
			B_GivePlayerXP (XP_KDF_BringAlmanach);
			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,1);
			AlmanachCounter = AlmanachCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Pyrokar_AlmanachBringen_15_03"); //Te he tra�do m�s libros de los buscadores.

			B_GiveInvItems (other, self, ITWR_DementorObsessionBook_MIS,  AlmanachCount);

			XP_KDF_BringAlmanachs = (AlmanachCount * XP_KDF_BringAlmanach);
			AlmanachCounter = (AlmanachCounter + AlmanachCount); 

			B_GivePlayerXP (XP_KDF_BringAlmanachs);
		};

	if (AlmanachCounter <= 5)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_04"); //Muy bien. No obstante, me temo que a�n hay m�s. Sigue buscando.
		
	}
	else if	(AlmanachCounter <= 8)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_05"); //Ya hemos encontrado muchos, pero no creo que los tengamos todos.
	}
	else
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_06"); //Ya me has tra�do muchos de los libros del enemigo.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_07"); //Me sorprender�a que hubieran puesto m�s en circulaci�n.
	};

	AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_08"); //Toma. Es un regalo del monasterio que te ayudar� cuando te enfrentes al mal.
	if (DIA_Pyrokar_AlmanachBringen_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_09"); //Y recuerda echar un vistazo a mi carta m�gica de vez en cuando.
		AI_Output			(self, other, "DIA_Pyrokar_AlmanachBringen_11_10"); //Es posible que intenten lo mismo con otros, aunque sus nombres no est�n a�n en los alman�ques.
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

	description	 = 	"Todos los dragones est�n muertos.";
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
	AI_Output			(other, self, "DIA_Pyrokar_DRACHENTOT_15_00"); //Todos los dragones est�n muertos.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_01"); //Es una noticia magn�fica, pero no cambia en nada nuestra situaci�n, que parece desesperada.
	AI_Output			(self, other, "DIA_Pyrokar_DRACHENTOT_11_02"); //Los buscadores no se han marchado a�n. Todo lo contrario. En estos �ltimos d�as he o�do con insistencia que cada vez son m�s.
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
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_01"); //�Qu� te han dicho?
	AI_Output			(other, self, "DIA_Pyrokar_DERMEISTER_15_02"); //No hac�an m�s que hablar del poder de su amo, y de que se ha instalado en los salones de Irdorath.
	AI_Output			(self, other, "DIA_Pyrokar_DERMEISTER_11_03"); //Que Innos nos proteja. El Templo Negro ha recuperado su poder y env�a sus secuaces a nuestro mundo.

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

	description	 = 	"�Qu� son los salones de Irdorath?";
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
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_00"); //�Qu� son los salones de Irdorath?
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_01"); //El templo oriental de invocaci�n del dios Beliar. En Myrtana hay cuatro, pero tal vez �se sea el m�s aterrador.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_02"); //Hace 40 a�os, los templos septentrional y occidental de esta horrible deidad fueron destruidos.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_03"); //Los valientes caballeros de aquellos tiempos lo dieron todo para arrasar aquellos imponentes edificios.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_04"); //En aquel entonces, las hordas negras del enemigo no pudieron hacer nada ante la superioridad num�rica y el hero�smo de caballeros y paladines.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_05"); //Habr�a sido sencillo destruir los otros dos templos y erradicar el mal de la Tierra para siempre...
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_06"); //� pero desaparecieron tras la ca�da del segundo templo.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_07"); //(Burl�n) Desaparecido... todo un templo. Lo que t� digas.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_08"); //No te burles. La situaci�n es grave. Si los salones de Irdorath han recuperado su poder, no ser� f�cil derrotar al enemigo.
	AI_Output			(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_09"); //Para ello, primero tendr�a que encontrarlo, y creo que �se ser� tu siguiente cometido, y el m�s dif�cil.
	AI_Output			(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_10"); //Ya veremos.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"De acuerdo con Pyrokar, los salones de Irdorath son un templo perdido de invocaci�n del dios Beliar. Debo encontrar ese templo."); 

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

	description	 = 	"El libro de Xardas que se cre�a perdido. �D�nde est�?";
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
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_00"); //El libro de Xardas que se cre�a perdido. �D�nde est�?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_01"); //Me esperaba que lo preguntaras, pero me temo que no te servir� de nada.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_02"); //Ha sido sellado con magia. Lo llev� a una de las c�maras subterr�neas, y hasta ahora no hemos sido capaces de abrirlo.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_03"); //El maldito Xardas nos ha jugado una mala pasada.
	AI_Output			(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_04"); //�Puedo ver el libro?
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_05"); //Por supuesto. No creo que tengas �xito en lo que han fracasado los maestros m�s importantes de nuestro monasterio.
	AI_Output			(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_06"); //Pero int�ntalo. Talamon no va a imped�rtelo.

	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"El libro de Xardas, LOS SALONES DE IRDORATH, est� en las b�vedas inferiores del monasterio. Talamon lo vigila. Los magos no pueden abrirlo, est� sellado m�gicamente y se dice que Xardas es el responsable."); 
	
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
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_11_01"); //�Qu�? �C�mo lo has hecho? Estuvo a punto de sacarme de quicio.


	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Xardas me revel� cu�l era el truco.", DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas );
	Info_AddChoice	(DIA_Pyrokar_IRDORATHBOOKOPEN, "Supongo que habr� sido cuesti�n de suerte.", DIA_Pyrokar_IRDORATHBOOKOPEN_glueck );

};
func void DIA_Pyrokar_IRDORATHBOOKOPEN_glueck ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00"); //Supongo que habr� sido cuesti�n de suerte.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01"); //No digas tonter�as. �Suerte!
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02"); //Yo no consigo abrir el libro y alguien como t� llega tan campante y...
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03"); //� eso me da que pensar.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04"); //Bueno, como has sido el �nico capaz de abrir el libro, se te otorga su custodia... al menos hasta que hayamos capeado este temporal.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Pyrokar_IRDORATHBOOKOPEN);

};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas ()
{
	AI_Output			(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00"); //Xardas me revel� cu�l era el truco.
	AI_Output			(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01"); //Ah, ha sido eso. Qu� interesante. Espero por tu bien que no te afecte la mala influencia de Xardas.
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
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01"); //�De qu� narices hablas?
	AI_Output			(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02"); //Una biblioteca que est� detr�s de estas paredes. �Te suena de algo?
	AI_Output			(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03"); //No. �D�nde dices que se supone que est� esa biblioteca?
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

	description	 = 	"S� d�nde encontrar los salones de Irdorath.";
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
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00"); //S� d�nde encontrar los salones de Irdorath.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01"); //El templo est� en una isla. He encontrado una carta de navegaci�n que indica c�mo se va.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02"); //Estupendo. En ese caso necesitar�s un barco y una tripulaci�n para enfrentarte al enemigo.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03"); //Pero recuerda que tienes que prepararte a fondo si quieres derrotar al se�or de Irdorath.
	AI_Output			(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04"); //�D�nde encuentro a una tripulaci�n?
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05"); //La tripulaci�n debe consistir de hombres de tu confianza.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06"); //Habla con tus amigos y piensa en qui�n podr�a serte �til cuando est�is en la isla.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07"); //Tambi�n vas a necesitar a un mago, pero por desgracia no puedo prescindir de ning�n miembro del monasterio.
	AI_Output			(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08"); //Tendr�s que ped�rselo a un mago que no trabaje en el monasterio.

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
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_00"); //Jorgen es un marinero experto. Podr�a ayudarme a llegar a la isla de Irdorath.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_01"); //Me temo que no va a serte tan f�cil.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_02"); //Tiene que trabajar para la hermandad. No ha pagado el tributo, ni nos ha tra�do una oveja.
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_03"); //Jorgen debe acabar su trabajo y, si quieres, luego puedes llev�rtelo.
	AI_Output			(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_04"); //�Cu�nto tiempo va a tardar?
	AI_Output			(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_05"); //Consumi� provisiones que le hubiesen durado tres seman�s a un novicio, y todo en el primer d�a.
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

	description	 = 	"�Qu� tengo que hacer para llevarme ahora mismo a Jorgen?";
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
	AI_Output			(other, self, "DIA_Pyrokar_MACHDTFREI_15_00"); //�Qu� tengo que hacer para llevarme ahora mismo a Jorgen?
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_01"); //Um. Podr�as hacer una cosa para m�, y tu buena relaci�n con Xardas tal vez te sirva de algo.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_02"); //Me he enterado de que, durante los �ltimos d�as, han pasado cosas raras en su torre.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_03"); //De noche, muchos ciudadanos oyen gritos y ven extra�as luces que sobrevuelan la torre.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_04"); //Es lo que nos faltaba. Ve a ver qu� ocurre y haz que pare.
	AI_Output			(self, other, "DIA_Pyrokar_MACHDTFREI_11_05"); //Luego podr�s llevarte a Jorgen.

	MIS_PyrokarClearDemonTower = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PyrokarClearDemonTower,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PyrokarClearDemonTower,LOG_RUNNING);
	B_LogEntry (TOPIC_PyrokarClearDemonTower,"Ocurren cosas extra�as en la torre de Xardas. Si me encargo de ello, puedo llevar a Jorgen conmigo.");
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
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_01"); //Y �qu� pasaba...? No, espera, no quiero saber nada.
	AI_Output			(self, other, "DIA_Pyrokar_DTCLEARED_11_02"); //Si a�n quieres a Jorgen, ll�vatelo para tu viaje.
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
	description	 = 	"La profec�a menciona el aura sagrada de Innos.";
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
	AI_Output			(other, self, "DIA_Pyrokar_AmulettofDeath_15_00"); //La profec�a menciona el aura sagrada de Innos.
	AI_Output			(self, other, "DIA_Pyrokar_AmulettofDeath_11_01"); //El aura de Innos es un amuleto que solo pueden ponerse los magos m�s importantes de una era.
	
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,DIALOG_BACK,DIA_Pyrokar_AmulettofDeath_BAck);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"�Me lo das?",DIA_Pyrokar_AmulettofDeath_CanHaveIt);
	Info_AddChoice (DIA_Pyrokar_AmulettofDeath,"�Qu� clase de amuleto es?",DIA_Pyrokar_AmulettofDeath_Amulett);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_BAck ()
{
	Info_ClearChoices (DIA_Pyrokar_AmulettofDeath);
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_CanHaveIt ()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00"); //�Me lo das?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01"); //�Qu�? �Qu� quieres hacer con �l?
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02"); //Enfrentarme a un drag�n.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03"); //S�, por supuesto. Te dar� el amuleto, pero cu�dalo.
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04"); //Ya, claro.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05"); //No quiero tener que volv�rselo a comprar a un mercader dentro de un tiempo.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06"); //�salo con prudencia, y que Innos te proteja en todo momento.
	
	CreateInvItems (self,ItAm_AmulettofDeath_Mis,1);
	B_GiveInvItems (self,other,ItAm_AmulettOfDeath_MIS,1);
	
	Pyro_Gives_Aura = TRUE;
};

FUNC VOID DIA_Pyrokar_AmulettofDeath_Amulett()
{
	AI_Output (other,self ,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00"); //�Qu� clase de amuleto es?
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01"); //Dicen que el mism�simo Innos lo forj� y se lo regal� a la humanidad.
	AI_Output (self ,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02"); //Protege a su portador de todo tipo de da�os.
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
	description	 = 	"�Qu� son las L�grimas de Innos?";
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
	AI_Output		(other, self, "DIA_Pyrokar_PotionofDeath_15_00"); //�Qu� son las L�grimas de Innos?
	AI_Output		(self, other, "DIA_Pyrokar_PotionofDeath_11_01"); //Las L�grimas de Innos no son m�s que un viejo cuento infantil. Narra c�mo comenz� la batalla entre Innos y Beliar al principio de los tiempos.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"Ya veo.",DIA_Pyrokar_PotionofDeath_Aha);
	Info_AddChoice (DIA_Pyrokar_PotionofDeath,"He encontrado esta poci�n.",DIA_Pyrokar_PotionofDeath_Potion);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Aha()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Aha_15_00"); //Entiendo.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01"); //No s� si eres plenamente consciente de nuestra situaci�n, pero no creo que a nuestro enemigo se le pueda vencer con un viejo cuento infantil.

	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Potion ()
{
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_00"); //He encontrado esta poci�n.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01"); //Es imposible. No me lo puedo creer.
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_02"); //�Qu� pasa?
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03"); //Si de verdad son las aut�nticas L�grimas de Innos, entonces...
	AI_Output (other,self ,"DIA_Pyrokar_PotionofDeath_Potion_15_04"); //(Interrumpe) Dif�cilmente.
	AI_Output (self ,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05"); //No me interrumpas. Si son las aut�nticas L�grimas de Innos, contamos con un arma poderosa contra el enemigo.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,Dialog_back,DIA_Pyrokar_PotionofDeath_BACK);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"�Y qu� son las L�grimas de Innos?",DIA_Pyrokar_PotionofDeath_Teardrops);
	Info_AddChoice 	(DIA_Pyrokar_PotionofDeath,"�Qu� quieres decir con 'arma'?",DIA_Pyrokar_PotionofDeath_Weapon);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_BACK()
{
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath);
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Teardrops()
{
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00"); //�Y qu� son las L�grimas de Innos?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01"); //Cuando Innos se percat� de que ten�a que luchar con Beliar, su hermano, para preservar la creaci�n, sinti� una gran pesadumbre.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02"); //Empez� a llorar y sus l�grimas cayeron al mundo. Fueron muchas, pues su coraz�n estaba tan lleno de pena que llor� durante 13 a�os.
	AI_Output	(other,self ,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03"); //Ve al grano.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04"); //Las personas que encontraron las l�grimas y las probaron adquirieron una fuerza y una lucidez sobrenaturales. Reconocieron la sabidur�a de la creaci�n de Innos y comenzaron a servirle.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05"); //Fueron los primeros miembros de la Comunidad del Fuego, y sus l�grimas les dieron fuerza, valor y sabidur�a. Pero eso fue hace mucho tiempo, y han pasado m�s de 250 a�os desde que la �ltima vez que alguien vio una L�grima de Innos.
	
	Info_ClearChoices (DIA_Pyrokar_PotionofDeath); 
};

FUNC VOID DIA_Pyrokar_PotionofDeath_Weapon ()
{
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_00"); //�A qu� te refieres con lo de 'arma'?
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01"); //Cuenta la leyenda que, gracias a la influencia de esta sustancia, los guerreros de Innos pod�an realizar proezas casi sobrenaturales.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02"); //Eran inmunes al agotamiento y contaban con la fuerza de dos osos.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03"); //Las haza�as heroicas m�s importantes de anta�o solo fueron posibles gracias a las L�grimas de Innos.
	AI_Output 	(other,self ,"DIA_Pyrokar_PotionofDeath_Weapon_15_04"); //Comprendo.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05"); //Pero las L�grimas tambi�n pueden causar muerte y sufrimiento. Solo los miembros de nuestra orden pueden beberlas.
	AI_Output 	(self ,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06"); //Cualquier otro (incluso los paladines de nuestro se�or) se encontrar�a con una muerte cruel.

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















































































































































