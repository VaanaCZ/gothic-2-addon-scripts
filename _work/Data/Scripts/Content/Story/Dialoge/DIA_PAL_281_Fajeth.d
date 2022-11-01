FUNC INT C_SnapperDeath()
{
	if  Npc_IsDead(NewMine_Snapper1) 
	&& 	Npc_IsDead(NewMine_Snapper2)
	&& 	Npc_IsDead(NewMine_Snapper3)
	&& 	Npc_IsDead(NewMine_Snapper4)
	&& 	Npc_IsDead(NewMine_Snapper5)
	&& 	Npc_IsDead(NewMine_Snapper6)
	&& 	Npc_IsDead(NewMine_Snapper7)
	&& 	Npc_IsDead(NewMine_Snapper8)
	{
		return TRUE;
	}; 

};
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fajeth_EXIT   (C_INFO)
{
	npc         = PAL_281_Fajeth;
	nr          = 999;
	condition   = DIA_Fajeth_EXIT_Condition;
	information = DIA_Fajeth_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fajeth_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fajeth_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

/* 
	Seit einiger Zeit suchen wir in diesem verfluchten Gebiet eine Stelle, die noch erzhaltiges Gestein enthält, 
	nicht ständig von Orkpatroullien heimgesucht wird, wo die dauernden Drachenangriffe ausbleiben!
	Wir sind völlig verdreckt und ausgehungert, haben unzählige Kämpfe ausgetragen 
	und haben endlich hier den Funken einer Hoffnung gefunden bei diesem dreckigen Loch in der Erde dort drüben unseren praktisch unmöglichen Auftrag zu erledigen.
	Und da kommt einer wie du daher und besitzt die Frechheit uns zu sagen, wir seien überfällig! Entweder bist du völlig verrückt oder einfach nur unverschämt!
*/
///////////////////////////////////////////////////////////////////////	
//	Info First
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_First		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	2;	
	condition	 = 	DIA_Fajeth_First_Condition;
	information	 = 	DIA_Fajeth_First_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Fajeth_First_Condition ()
{
	if (Garond.aivar[AIV_TalkedToPlayer] == FALSE) 
	{
			return TRUE;
	};
};
func void DIA_Fajeth_First_Info ()
{
	AI_Output (self, other, "DIA_Fajeth_First_12_00"); //¿Quién eres y qué haces aquí?
	AI_Output (other, self, "DIA_Fajeth_First_15_01"); //Viajo por orden de lord Hagen...
	AI_Output (self, other, "DIA_Fajeth_First_12_02"); //Entonces deberías intentar llegar hasta el castillo. Allí es donde está el comandante Garond. Es el comandante en jefe de esta expedición.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Hallo		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	2;	
	condition	 = 	DIA_Fajeth_Hallo_Condition;
	information	 = 	DIA_Fajeth_Hallo_Info;
	permanent 	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Fajeth_Hallo_Condition ()
{
	if (MIS_ScoutMine == LOG_RUNNING) 
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_00"); //¿De dónde vienes?
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_01"); //Estoy aquí por orden de Garond...
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_02"); //Muy bien. Siempre viene bien que se incorporen nuevos hombres.
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_03"); //No he venido a ayudarte.
	AI_Output (self, other, "DIA_Fajeth_Hallo_12_04"); //¿No? Y entonces, ¿para qué has venido?
	AI_Output (other, self, "DIA_Fajeth_Hallo_15_05"); //Mi misión consiste en descubrir cuánto mineral habéis extraído hasta ahora.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_06"); //Honorable mago. Vuestra presencia nos da confianza a mis hombres y a mí.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_07"); //Agradeceríamos enormemente que pudierais usar el poder que os ha dado Innos para ayudarnos.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"¿Qué puedo hacer por ti?",DIA_Fajeth_Hallo_Tun);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Mi misión es más urgente.",DIA_Fajeth_Hallo_KDFNein);	
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_08"); //Y mi misión es hacer todo lo que considere necesario para extraer mineral y protegerlo.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_09"); //Eso incluye el reclutamiento forzoso de hombres. Estás al servicio de Innos y, por lo tanto, estás a mis órdenes.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"¿Qué puedo hacer por ti?",DIA_Fajeth_Hallo_Tun);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Ya tengo órdenes, de Garond.",DIA_Fajeth_Hallo_MILNein);	
	}
	else //GIL_SLD
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_10"); //Escucha, no sé por qué Garond me ha mandado un mercenario, pero seguro que tiene una razón.
		AI_Output (self, other, "DIA_Fajeth_Hallo_12_11"); //Pero antes de que te mande de vuelta, tendrás que realizar una misión para mí.
		
		
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"Todo tiene un precio.",DIA_Fajeth_Hallo_SLDJa);	
		Info_AddChoice 	  (DIA_Fajeth_Hallo,"No, no tengo tiempo...",DIA_Fajeth_Hallo_SLDNein);	
	};
}; 
FUNC VOID DIA_Fajeth_Hallo_Tun () //Mission
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_Tun_15_00"); //¿En qué puedo ayudarte?
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_01"); //Durante días, una horda de chasqueadores ha estado rondando el campamento. Parece que están esperando una oportunidad para atacar.
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_02"); //No sé a qué esperan, pero mientras estén por aquí, el campamento no está tranquilo.

	if ((Npc_IsDead(Fed)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_03"); //Ese Fed, por encima de todos, está aterrorizado y asusta a los demás reos.
	};

	if ((Npc_IsDead(Bilgot)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_04"); //¿Y a quién debería mandar? ¿Bilgot? Ja, también es un manojo de nervios
	};

	if ((Npc_IsDead(Tengron)) == FALSE)
	{
		AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_05"); //¿Y a Tengron? Seguro que sabe luchar, pero no tiene la astucia que hace falta.
	};
	AI_Output (self, other, "DIA_Fajeth_Hallo_Tun_12_06"); //Tú eres el único que puede hacerlo. Quiero que des caza a esas malditas bestias y las mates.
	
	Wld_InsertNpc	(NewMine_Snapper7,"OW_PATH_333");	//Joly: Zur Sicherheit, falls keine mehr da sind.
	Wld_InsertNpc	(NewMine_Snapper8,"OW_PATH_333");
	Wld_InsertNpc	(NewMine_Snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");	

	MIS_Fajeth_Kill_Snapper = LOG_RUNNING;
	Log_CreateTopic (TOPIC_FajethKillSnapper,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_FajethKillSnapper,LOG_RUNNING);
	B_LogEntry (TOPIC_FajethKillSnapper,"Fajeth me ha ordenado que cace los chasqueadores que han estado rondando por el campamento en los últimos días.");
	
	Info_ClearChoices (DIA_Fajeth_Hallo);
	

	PrintScreen ("", -1, -1, FONT_Screen, 0);

};
FUNC VOID DIA_Fajeth_Hallo_KDFNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_KDFNein_15_00"); //Mi misión es más urgente que eso. No puedo ayudarte.
	AI_Output (self, other, "DIA_Fajeth_Hallo_KDFNein_12_01"); //Por supuesto, honorable. Le informaré de todo lo que desee saber.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
};
FUNC VOID DIA_Fajeth_Hallo_MILNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_MILNein_15_00"); //Ya tengo órdenes, de Garond.
	AI_Output (self, other, "DIA_Fajeth_Hallo_MILNein_12_01"); //Y las llevarás a cabo. Pero solo cuando te mande de vuelta.
	AI_Output (self, other, "DIA_Fajeth_Hallo_MILNein_12_02"); //Todo lo que quiero oírte decir es: ''¿Qué puedo hacer por ti?'' ¿Comprendido?
};
FUNC VOID DIA_Fajeth_Hallo_SLDJa ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_SLDJa_15_00"); //Todo tiene un precio. Si puedes pagarme, me lo pensaría.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_01"); //No acostumbro a tratar con mercenarios. No me gusta andar regateando.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_02"); //Pero como muestra de buena voluntad, te pagaré 100 monedas de oro si trabajas para mí.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDJa_12_03"); //¿Trato hecho?
	Fajeth_Pay = TRUE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
	Info_AddChoice 	  (DIA_Fajeth_Hallo,"¿Qué puedo hacer por ti?",DIA_Fajeth_Hallo_Tun);	
	Info_AddChoice 	  (DIA_Fajeth_Hallo,"No, no tengo tiempo...",DIA_Fajeth_Hallo_SLDNein);	
};
FUNC VOID DIA_Fajeth_Hallo_SLDNein ()
{
	AI_Output (other, self, "DIA_Fajeth_Hallo_SLDNein_15_00"); //No, no tengo tiempo para preocuparme de tus problemas.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDNein_12_01"); //¿Rechazas dinero fácil? Nunca lo habría creído de un mercenario.
	AI_Output (self, other, "DIA_Fajeth_Hallo_SLDNein_12_02"); //Como no quieres ayudarnos, te sugiero que preguntes lo que tengas que preguntar y te largues.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Fajeth_Hallo);
};
///////////////////////////////////////////////////////////////////////	
//	Info Leader
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Leader		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	2;	
	condition	 = 	DIA_Fajeth_Leader_Condition;
	information	 = 	DIA_Fajeth_Leader_Info;
	permanent 	 =  FALSE;
	description	 =  "Maté al líder de la manáda.";
};
func int DIA_Fajeth_Leader_Condition ()
{
	if  Npc_KnowsInfo(other, DIA_Bilgot_KNOWSLEADSNAPPER) 
  	&&  Npc_IsDead(NewMine_LeadSnapper) 
	&& (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
			return TRUE;
	};
};
func void DIA_Fajeth_Leader_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_Leader_15_00"); //Maté al líder de la manada.
	AI_Output (self, other, "DIA_Fajeth_Leader_12_01"); //Bien. Sin líder son la mitad de peligrosos. No creo que nos vayan a atacar más.
	
	if (Fajeth_Pay == TRUE)
	{
		AI_Output (self, other, "DIA_Fajeth_Leader_12_02"); //Aquí está tu oro, tal y como acordamos.
		B_GiveInvItems (self, other, ItMi_Gold,100); 
	};
	
	Fajeth.flags = 0;
	MIS_Fajeth_Kill_Snapper = LOG_SUCCESS;
	B_GivePlayerXP (XP_FajethKillSnapper);
		
		
};
///////////////////////////////////////////////////////////////////////
//	Info SNAPPER_Killed
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_SNAPPER_KILLED		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr           = 	9;	
	condition	 = 	DIA_Fajeth_SNAPPER_KILLED_Condition;
	information	 = 	DIA_Fajeth_SNAPPER_KILLED_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ya he terminado con los chasqueadores.";
};

func int DIA_Fajeth_SNAPPER_KILLED_Condition ()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	&& (C_SnapperDeath() == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_SNAPPER_KILLED_Info ()
{
 		
	AI_Output (hero, self, "DIA_Fajeth_SNAPPER_KILLED_15_00"); //Ya he terminado con los chasqueadores.
	AI_Output (self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_01"); //Buen trabajo. Deberíamos poder con el resto de las bestias que rondan por aquí.
	
	if (Fajeth_Pay == TRUE)
	{
		AI_Output (self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_02"); //Te has ganado tu oro Ten 100 piezas de oro, tal y como acordamos.
		B_GiveInvItems (self, other, ItmI_Gold,100); 
	};					
	Fajeth.flags = 0;
	MIS_Fajeth_Kill_Snapper = LOG_SUCCESS;
	B_GivePlayerXP (XP_FajethKillSnapper);
};
///////////////////////////////////////////////////////////////////////
//	Info Running
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Running		(C_INFO)
{
	npc		 	 = 	PAL_281_Fajeth;
	nr           = 	9;	
	condition	 = 	DIA_Fajeth_Running_Condition;
	information	 = 	DIA_Fajeth_Running_Info;
	permanent	 =  TRUE;
	description  =  "¿Qué tal está la moral de los hombres?";
};

func int DIA_Fajeth_Running_Condition ()
{
	if  (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_Running_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_Running_15_00"); //¿Qué tal está la moral de los hombres?
	AI_Output (self, other, "DIA_Fajeth_Running_12_01"); //¿Quieres saberlo? ¡Tienen tanto miedo que apenas pueden trabajar!
	AI_Output (self, other, "DIA_Fajeth_Running_12_02"); //¡Resuelve lo de los chasqueadores o alguien se va a derrumbar!
};
///////////////////////////////////////////////////////////////////////
//	Info Belohnung
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_BELOHNUNG		(C_INFO)
{
	npc		 	 = 	PAL_281_Fajeth;
	nr           = 	3;	
	condition	 = 	DIA_Fajeth_BELOHNUNG_Condition;
	information	 = 	DIA_Fajeth_BELOHNUNG_Info;
	permanent	 =  FALSE;
	description	 = 	"Dime cuánto mineral habéis recogido hasta ahora.";
};

func int DIA_Fajeth_BELOHNUNG_Condition ()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
	|| (MIS_Fajeth_Kill_Snapper == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void DIA_Fajeth_BELOHNUNG_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_BELOHNUNG_15_00"); //Dime cuánto mineral habéis extraído hasta ahora.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_01"); //Informa a Garond de que hasta ahora hemos podido extraer DOS cofres de mineral.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_02"); //Ya he sufrido demasiadas bajas a causa de los ataques constantes.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_03"); //Si Garond me puede mandar más hombres, podremos recoger más mineral.
	AI_Output (other, self, "DIA_Fajeth_BELOHNUNG_15_04"); //Ya veo. Se lo haré saber.
	AI_Output (self, other, "DIA_Fajeth_BELOHNUNG_12_05"); //Bien. Entonces el resto depende de ti. Aguantaremos todo lo que podamos.
	
	Fajeth_Ore = TRUE;
	
	B_LogEntry (TOPIC_ScoutMine,"Los raspadores de Fajeth han conseguido extraer, por ahora, DOS cajones de mineral.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Perm2
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Perm2		(C_INFO)
{
	npc		 	 = 	PAL_281_Fajeth;
	nr           = 	9;	
	condition	 = 	DIA_Fajeth_Perm2_Condition;
	information	 = 	DIA_Fajeth_Perm2_Info;
	permanent	 =  TRUE;
	description  =  "¿Qué tal va la producción de mineral?";
};

func int DIA_Fajeth_Perm2_Condition ()
{
	if  Npc_KnowsInfo (other,DIA_Fajeth_BELOHNUNG)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_Fajeth_Perm2_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_Perm2_15_00"); //¿Qué tal va la producción de mineral?
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_01"); //Muy mal. No avanzamos nada.
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_02"); //Cuando llegamos fue bien pero, desde entonces, mis chicos apenas han encontrado nada más que esquirlas. Nada aprovechable.
	AI_Output (self, other, "DIA_Fajeth_Perm2_12_03"); //Pero no nos rendiremos, al menos no mientras yo esté al mando.
};
//#####################################################################
//##
//##
//##							KAPITEL 3 und höher
//##
//##
//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info Erzabbau
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_ERZABBAU		(C_INFO)
{
	npc			 = 	PAL_281_Fajeth;
	nr			 = 	11;
	condition	 = 	DIA_Fajeth_ERZABBAU_Condition;
	information	 = 	DIA_Fajeth_ERZABBAU_Info;
	permanent	 = 	TRUE;
	description	 = 	"¿Qué tal va la recogida de mineral?";
};

func int DIA_Fajeth_ERZABBAU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Fajeth_BELOHNUNG))
	&& (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Fajeth_ERZABBAU_Info ()
{
	AI_Output (other, self, "DIA_Fajeth_ERZABBAU_15_00"); //¿Qué tal va la extracción de mineral?
	
	if (MIS_AllDragonsDead == TRUE)
	{
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_01"); //Las cosas están más tranquilas. ¿Por qué será?
		AI_Output (other, self, "DIA_Fajeth_ERZABBAU_15_02"); //Los dragones están muertos.
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_03"); //Bien, entonces espero que llegue pronto el relevo. Me estoy volviendo loco.
	}
	else 
	{
		AI_Output (self, other, "DIA_Fajeth_ERZABBAU_12_04"); //Lo puedes ver tú mismo. Lo peor.
	};
};





// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fajeth_PICKPOCKET (C_INFO)
{
	npc			= PAL_281_Fajeth;
	nr			= 900;
	condition	= DIA_Fajeth_PICKPOCKET_Condition;
	information	= DIA_Fajeth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Fajeth_PICKPOCKET_Condition()
{
	C_Beklauen (56, 95);
};
 
FUNC VOID DIA_Fajeth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fajeth_PICKPOCKET);
	Info_AddChoice		(DIA_Fajeth_PICKPOCKET, DIALOG_BACK 		,DIA_Fajeth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fajeth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fajeth_PICKPOCKET_DoIt);
};

func void DIA_Fajeth_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fajeth_PICKPOCKET);
};
	
func void DIA_Fajeth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fajeth_PICKPOCKET);
};


