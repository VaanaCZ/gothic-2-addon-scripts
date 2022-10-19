//////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_EXIT   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 999;
	condition   = DIA_Cassia_EXIT_Condition;
	information = DIA_Cassia_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Cassia_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Cassia_PICKME (C_INFO)
{
	npc			= VLK_447_Cassia;
	nr			= 900;
	condition	= DIA_Cassia_PICKME_Condition;
	information	= DIA_Cassia_PICKME_Info;
	permanent	= TRUE;
	description = Pickpocket_100_Female;
};                       

FUNC INT DIA_Cassia_PICKME_Condition()
{
	C_Beklauen (100, 400);
};
 
FUNC VOID DIA_Cassia_PICKME_Info()
{	
	Info_ClearChoices	(DIA_Cassia_PICKME);
	Info_AddChoice		(DIA_Cassia_PICKME, DIALOG_BACK 		,DIA_Cassia_PICKME_BACK);
	Info_AddChoice		(DIA_Cassia_PICKME, DIALOG_PICKPOCKET	,DIA_Cassia_PICKME_DoIt);
};

func void DIA_Cassia_PICKME_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Cassia_PICKME);
};
	
func void DIA_Cassia_PICKME_BACK()
{
	Info_ClearChoices (DIA_Cassia_PICKME);
};
//////////////////////////////////////////////////////////////////////
//	Info Gilde
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Gilde   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 1;
	condition   = DIA_Cassia_Gilde_Condition;
	information = DIA_Cassia_Gilde_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Cassia_Gilde_Condition()
{	
	if (Cassia_Gildencheck == TRUE)
	&& (Join_Thiefs == TRUE)
	&& ((other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Gilde_Info()
{
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Cassia_Gilde_16_00");//Veo que te has convertido en un guerrero de la ley y el orden.
		AI_Output (self, other, "DIA_Cassia_Gilde_16_01");//No importa que est�s al servicio de Innos. Eres uno de los nuestros. Y espero que t� tambi�n lo veas as�.
	};
	if (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Cassia_Gilde_16_02");//As� que ahora perteneces a la iglesia de Innos. Perfecto, pero sigues siendo uno de los nuestros. Espero que no lo olvides.
	};
	
	
	AI_StopProcessInfos (self);
	
};
//////////////////////////////////////////////////////////////////////
//	Info Frist abgelaufen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Abgelaufen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Abgelaufen_Condition;
	information = DIA_Cassia_Abgelaufen_Info;
	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_Cassia_Abgelaufen_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Cassia_Frist == TRUE)  
	&& (Cassia_Day < (B_GetDayPlus() -2))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Abgelaufen_Info()
{
	AI_Output (self, other, "DIA_Cassia_Abgelaufen_16_00");//Tu fecha l�mite ha pasado. No deber�as haber vuelto.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL,0); 
};
//////////////////////////////////////////////////////////////////////
//	Info News
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_News   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 1;
	condition   = DIA_Cassia_News_Condition;
	information = DIA_Cassia_News_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Cassia_News_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_News_Info()
{
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_News_16_00");//Veo que recibiste nuestro regalo. Soy Cassia.
		AI_Output (other, self, "DIA_Cassia_News_15_01");//Muy bien, Cassia. Dime por qu� estoy aqu�.
		AI_Output (self, other, "DIA_Cassia_News_16_02");//Llamaste nuestra atenci�n al ganar la confianza de algunos de nuestros amigos.
		AI_Output (self, other, "DIA_Cassia_News_16_03");//Y queremos darte una oportunidad. Puedes unirte a nosotros.
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_News_16_04");//Mira qui�n ha encontrado el camino para llegar aqu�. Attila te subestim�. No voy a cometer el mismo error.
		AI_Output (other, self, "DIA_Cassia_News_15_05");//�Qu� se est� cociendo aqu�?
		AI_Output (self, other, "DIA_Cassia_News_16_06");//Quer�amos que murieras por haber dado el chivatazo sobre un amigo. Por eso enviamos a Attila.
		AI_Output (self, other, "DIA_Cassia_News_16_07");//Sin embargo, tu presencia aqu� abre una nueva opci�n...
		AI_Output (other, self, "DIA_Cassia_News_15_08");//� �qu� quieres ofrecerme?
		AI_Output (self, other, "DIA_Cassia_News_16_09");//Puedes unirte a nosotros.
	};
	if  (Npc_GetTrueGuild (other) == GIL_NONE)
	||  (Npc_GetTrueGuild (other) == GIL_NOV)
	{	
		Cassia_Gildencheck = TRUE;
	};
	
	DG_gefunden = TRUE;
};
//////////////////////////////////////////////////////////////////////
//	Info Erz�hle mir mehr 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_mehr   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_mehr_Condition;
	information = DIA_Cassia_mehr_Info;
	permanent   = FALSE;
	description = "Cu�ntame m�s sobre tu organizaci�n.";
};

FUNC INT DIA_Cassia_mehr_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_mehr_Info()
{
	AI_Output (other, self, "DIA_Cassia_mehr_15_00");//Cu�ntame m�s sobre tu organizaci�n.
	AI_Output (self, other, "DIA_Cassia_mehr_16_01");//La gente de la ciudad est� bastante nerviosa respecto a nosotros. Pero nadie conoce nuestra guarida.
	AI_Output (self, other, "DIA_Cassia_mehr_16_02");//Las pocas personas que saben siquiera que existen las alcantarillas, creen que est�n cerradas y que no se puede acceder a ellas.
	AI_Output (self, other, "DIA_Cassia_mehr_16_03");//Y, mientras no nos encuentren, podemos trabajar en paz.
};

//////////////////////////////////////////////////////////////////////
//	Vermisste Leute
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_MissingPeople   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_MissingPeople_Condition;
	information = DIA_Cassia_MissingPeople_Info;
	permanent   = FALSE;
	description = "�Qu� sabes sobre la gente desaparecida?";
};

FUNC INT DIA_Cassia_MissingPeople_Condition()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Cassia_MissingPeople_Info()
{
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_00"); //�Qu� sabes sobre la gente desaparecida?
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_01"); //�Por qu� te interesa?
	AI_Output (other, self, "DIA_Addon_Cassia_Add_15_02"); //Quiero averiguar qu� ha sido de ellos.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_03"); //Saliendo de las cloacas, nada un rato siguiendo la costa hacia la derecha.
	AI_Output (self, other, "DIA_Addon_Cassia_Add_16_04"); //All� encontrar�s respuestas
};


//////////////////////////////////////////////////////////////////////
//	Info Was habe ich davon? 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Vorteil   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 3;
	condition   = DIA_Cassia_Vorteil_Condition;
	information = DIA_Cassia_Vorteil_Info;
	permanent   = FALSE;
	description = "�Qu� obtengo yo si me uno a ti?";
};

FUNC INT DIA_Cassia_Vorteil_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cassia_Vorteil_Info()
{
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_00");//�Qu� obtengo yo si me uno a ti?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_01");//Puedes aprender habilidades especiales de nosotros. Habilidades que te permitir�n vivir en la opulencia.
	AI_Output (other, self, "DIA_Cassia_Vorteil_15_02");//Pero yo no tendr�a que esconderme aqu� abajo, �no?
	AI_Output (self, other, "DIA_Cassia_Vorteil_16_03");//(Se r�e tranquilamente) No. Solo tienes que acatar nuestras reglas. Eso es todo.
};
//////////////////////////////////////////////////////////////////////
//	Info Was kann ich bei euch lernen?
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Lernen  (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 4;
	condition   = DIA_Cassia_Lernen_Condition;
	information = DIA_Cassia_Lernen_Info;
	permanent   = FALSE;
	description = "�Qu� puedo aprender de vosotros?";
};

FUNC INT DIA_Cassia_Lernen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Vorteil)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Lernen_Info()
{
	AI_Output (other, self, "DIA_Cassia_Lernen_15_00");//�Qu� puedo aprender de vosotros?
	AI_Output (self, other, "DIA_Cassia_Lernen_16_01");//Jesper es el maestro del sigilo. Te ense�ar� a moverte sin hacer ni un ruido.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_02");//Ram�rez es un ladr�n de casas excepcionalmente dotado. Ninguna cerradura puede resistirse a sus ganz�as.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_03");//Y yo puedo ense�arte a ser carterista.
	AI_Output (self, other, "DIA_Cassia_Lernen_16_04");//Tambi�n voy a ayudarte a ser m�s diestro, ya que la destreza es la clave de nuestras habilidades.
	
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry(Topic_CityTeacher,"Cassia me puede ense�ar a hurtar y me puede ayudar a ser m�s diestro.");
	B_LogEntry(Topic_CityTeacher,"Ram�rez puede ense�arme a forzar cerraduras.");
	B_LogEntry(Topic_CityTeacher,"Jesper puede ense�arme a ser sigiloso.");
};
//////////////////////////////////////////////////////////////////////
//	Info Regeln 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Regeln   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 3;
	condition   = DIA_Cassia_Regeln_Condition;
	information = DIA_Cassia_Regeln_Info;
	permanent   = FALSE;
	description = "�Cu�les son tus reglas?";
};

FUNC INT DIA_Cassia_Regeln_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Vorteil)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Regeln_Info()
{
	AI_Output (other, self, "DIA_Cassia_Regeln_15_00");//�Cu�les son tus reglas?
	//AI_Output (self, other, "DIA_Cassia_Regeln_16_01");//Wir richten uns nach drei Regeln.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_02");//La primera regla es: ni una palabra sobre nosotros. A nadie. Nunca.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_03");//Segunda: que no te pillen.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_04");//Tercera: si sacas tu arma aqu� abajo para atacar a alguien, te mataremos.
	AI_Output (self, other, "DIA_Cassia_Regeln_16_05");//Y la cuarta y �ltima regla es: los que quieran unirse a nosotros, tienen que demostrar su val�a.
};
//////////////////////////////////////////////////////////////////////
//	Info Was passiert, wenn ich erwischt werde? 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Erwischen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Erwischen_Condition;
	information = DIA_Cassia_Erwischen_Info;
	permanent   = FALSE;
	description = "�Qu� ocurre si me cazan?";
};

FUNC INT DIA_Cassia_Erwischen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Erwischen_Info()
{
	AI_Output (other, self, "DIA_Cassia_Erwischen_15_00");//�Qu� ocurre si me cazan?
	AI_Output (self, other, "DIA_Cassia_Erwischen_16_01");//Que no te cacen, �de acuerdo?
};
//////////////////////////////////////////////////////////////////////
//	Info Wie muss ich mich beweisen?
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_beweisen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_beweisen_Condition;
	information = DIA_Cassia_beweisen_Info;
	permanent   = TRUE;
	description = "�C�mo se supone que debo demostrar mi val�a?";
};
//--------------------------------------
var int DIA_Cassia_beweisen_permanent;
//-------------------------------------
FUNC INT DIA_Cassia_beweisen_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	&& (DIA_Cassia_beweisen_permanent == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_beweisen_Info()
{
	AI_Output (other, self, "DIA_Cassia_beweisen_15_00");//�C�mo se supone que debo demostrar mi val�a?
	
	if (Join_Thiefs == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_01");//Entonces, �te unir�s a nosotros o no?
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_beweisen_16_02");//Ese obstinado y viejo alquimista, Constantino, tiene un bonito anillo.
		AI_Output (self, other, "DIA_Cassia_beweisen_16_03");//Pero en realidad no lo necesita. Quiero verlo adornando mi mano.
		
		MIS_CassiaRing = LOG_RUNNING;
		DIA_Cassia_beweisen_permanent = TRUE;
		
		Log_CreateTopic(Topic_CassiaRing,LOG_MISSION);
		Log_SetTopicStatus (Topic_CassiaRing,LOG_RUNNING);
		B_LogEntry 	(Topic_CassiaRing,"Cassia quiere que le consiga el anillo de Constantino.");
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Beitreten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Beitreten   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 10;
	condition   = DIA_Cassia_Beitreten_Condition;
	information = DIA_Cassia_Beitreten_Info;
	permanent   = FALSE;
	description = "De acuerdo, acepto.";
};

FUNC INT DIA_Cassia_Beitreten_Condition()
{	
	if (Join_Thiefs == FALSE)
	&& Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Beitreten_Info()
{
	AI_Output (other, self, "DIA_Cassia_Beitreten_15_00");//De acuerdo, acepto.
	AI_Output (self, other, "DIA_Cassia_Beitreten_16_01");//Genial. Tendr�s una oportunidad de demostrar tu val�a. Y, si quieres aprender cosas de nosotros, eres bienvenido.
	
	Join_Thiefs = TRUE;
};
//////////////////////////////////////////////////////////////////////
//	Info Und wenn ich euch nicht beitrete...? 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Ablehnen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 9;
	condition   = DIA_Cassia_Ablehnen_Condition;
	information = DIA_Cassia_Ablehnen_Info;
	permanent   = FALSE;
	description = "�Y si no me quiero unir a vosotros...?";
};

FUNC INT DIA_Cassia_Ablehnen_Condition()
{	
	if (Join_Thiefs == FALSE)
	&& Npc_KnowsInfo (other, DIA_Cassia_Regeln)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Ablehnen_Info()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_15_00");//�Y si no me quiero unir a vosotros...?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_01");//Estar�s desperdiciando una oportunidad �nica, pero puedes irte.
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_02");//(Serio) Y que no se te ocurra traicionarnos. Lo lamentar�as amargamente.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"De acuerdo, acepto.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Necesito meditar esto.",DIA_Cassia_Ablehnen_Frist);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Ablehnen_16_03");//En ese caso, te matar�a.
		
		Info_ClearChoices (DIA_Cassia_Ablehnen);
		Info_AddChoice (DIA_Cassia_Ablehnen,"De acuerdo, acepto.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice (DIA_Cassia_Ablehnen,"Pues intenta matarme.",DIA_Cassia_Ablehnen_Kill);
	};
};
FUNC VOID DIA_Cassia_Ablehnen_Okay()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Okay_15_00");//De acuerdo, acepto.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_01");//(Sonr�e) Has tomado una sabia decisi�n. Si consigues demostrar tu val�a, podr�s unirte a nuestras filas.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Okay_16_02");//Si quieres aprender primero las habilidades de los ladrones, t� mismo. Las vas a necesitar.
	Join_Thiefs = TRUE; 
	Info_ClearChoices (DIA_Cassia_Ablehnen);
};
FUNC VOID DIA_Cassia_Ablehnen_Kill()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Kill_15_00");//Pues intenta matarme.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Kill_16_01");//Qu� pena. Pens� que eras m�s listo.

	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
FUNC VOID DIA_Cassia_Ablehnen_Frist()
{
	AI_Output (other, self, "DIA_Cassia_Ablehnen_Frist_15_00");//Necesito meditar esto.
	AI_Output (self, other, "DIA_Cassia_Ablehnen_Frist_16_01");//Hazlo. Te dar� dos d�as para tomar una decisi�n. Despu�s de ellos, no ser�s bienvenido aqu�.
	
	Cassia_Day = B_GetDayPlus ();
	Cassia_Frist = TRUE;
	Info_ClearChoices (DIA_Cassia_Ablehnen);
};


//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_BevorLernen   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 5;
	condition   = DIA_Cassia_BevorLernen_Condition;
	information = DIA_Cassia_BevorLernen_Info;
	permanent   = TRUE;
	description = "�Puedes ense�arme?";
};
FUNC INT DIA_Cassia_BevorLernen_Condition()
{	
	if (Join_Thiefs == TRUE)
	&& (Npc_KnowsInfo (other,DIA_Cassia_Lernen))
	&& ((Cassia_TeachPickpocket == FALSE)
	|| (Cassia_TeachDEX == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_BevorLernen_Info()
{
	AI_Output (other, self, "DIA_Cassia_BevorLernen_15_00");//�Puedes ense�arme?
	
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_01");//Claro, sin problemas. Solo av�same cuando est�s preparado.
		Cassia_TeachPickpocket = TRUE;
		Cassia_TeachDEX = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_16_02");//Claro. Hurtar y la destreza te costar�n 100 monedas de oro cada una.
	
		Info_ClearChoices (DIA_Cassia_BevorLernen);
		Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Puede que despu�s... (ATR�S)",DIA_Cassia_BevorLernen_Spaeter);
		
		if (Cassia_TeachPickpocket == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Quiero aprender a hurtar (pagar 100 de oro).",DIA_Cassia_BevorLernen_Pickpocket);
		};
		
		if (Cassia_TeachDEX == FALSE)
		{
			Info_AddChoice 	  (DIA_Cassia_BevorLernen,"Quiero ser m�s diestro (pagar 100 de oro).",DIA_Cassia_BevorLernen_DEX);
		};
	};
};
FUNC VOID DIA_Cassia_BevorLernen_Spaeter()
{
	Info_ClearChoices (DIA_Cassia_BevorLernen);
};
FUNC VOID DIA_Cassia_BevorLernen_DEX()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Cassia_BevorLernen_DEX_15_00");//Quiero ser m�s diestro. Aqu� tienes el oro.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_DEX_16_01");//Podemos empezar cuando est�s preparado.
		Cassia_TeachDEX = TRUE;
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");//Regresa cuando tengas el oro.
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	};	
};
FUNC VOID DIA_Cassia_BevorLernen_Pickpocket()
{
	if B_GiveInvItems (other, self, ItMi_Gold, 100)
	{
		AI_Output (other, self, "DIA_Cassia_BevorLernen_Pickpocket_15_00");//Quiero aprender a robar bolsillos. Aqu� est� el oro.
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_01");//Podemos empezar cuando est�s preparado.
		Cassia_TeachPickpocket = TRUE;
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_02");//Regresa cuando tengas el oro.
		Info_ClearChoices (DIA_Cassia_BevorLernen);
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_TEACH		(C_INFO)
{
	npc		  	 = 	VLK_447_Cassia;
	nr			 = 	12;
	condition	 = 	DIA_Cassia_TEACH_Condition;
	information	 = 	DIA_Cassia_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Quiero ser m�s diestro.";
};
func int DIA_Cassia_TEACH_Condition ()
{	
	if (Cassia_TeachDEX == TRUE) 
	{
		return TRUE;
	};
};
func void DIA_Cassia_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Cassia_TEACH_15_00"); //Quiero ser m�s diestro.
	
	Info_ClearChoices   (DIA_Cassia_TEACH);
	Info_AddChoice 		(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Cassia_TEACH_5);
	
};
func void DIA_Cassia_TEACH_BACK()
{
	Info_ClearChoices (DIA_Cassia_TEACH);
};
func void DIA_Cassia_TEACH_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MAX);
	
	Info_ClearChoices   (DIA_Cassia_TEACH);
	
	Info_AddChoice 		(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Cassia_TEACH_5);
	
	
};
func void DIA_Cassia_TEACH_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MAX);
	
	Info_ClearChoices   (DIA_Cassia_TEACH);
	
	Info_AddChoice 		(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice		(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Cassia_TEACH_5);
	
	
};
//////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Pickpocket   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 10;
	condition   = DIA_Cassia_Pickpocket_Condition;
	information = DIA_Cassia_Pickpocket_Info;
	permanent   = TRUE;
	description = "Ens��ame a robar a la gente. (10 PA)";
};

FUNC INT DIA_Cassia_Pickpocket_Condition()
{	
	if (Cassia_TeachPickpocket == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKPOCKET) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Pickpocket_Info()
{
	AI_Output (other, self, "DIA_Cassia_Pickpocket_15_00");//Ens��ame a hurtar.
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKPOCKET)
	{
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_01");//Si quieres vaciar los bolsillos de alguien, distr�elo. Empieza a hablar con �l, dale conversaci�n.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_02");//Mientras hablas con �l, exam�nalo. Busca bolsillos abultados, joyas o cordones de cuero alrededor del cuello. Y, sobre todo, f�jate en lo despierto que est� el tipo.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_03");//Robar a un jornalero borracho no es lo mismo que robar a un comerciante receloso, como podr�s imaginarte.
		AI_Output (self, other, "DIA_Cassia_Pickpocket_16_04");//Si eres muy patoso, el t�o oler� a chamusquina, claro. As� que, sobre todo: mant�n la compostura.
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Aufnahme
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Aufnahme   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Aufnahme_Condition;
	information = DIA_Cassia_Aufnahme_Info;
	permanent   = FALSE;
	description = "Tengo el anillo de Constantino.";
};

FUNC INT DIA_Cassia_Aufnahme_Condition()
{	
	if (MIS_CassiaRing == LOG_RUNNING)
	&& (Npc_HasItems (other, ItRi_Prot_Point_01_MIS) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Aufnahme_Info()
{
	AI_Output (other, self, "DIA_Cassia_Aufnahme_15_00");//Tengo el anillo de Constantino.
	B_GiveInvItems (other, self,ItRi_Prot_Point_01_MIS,1);
	
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_01");//Enhorabuena. Has superado tu prueba de iniciaci�n. Ahora eres de verdad uno de los nuestros.
	AI_Output (self, other, "DIA_Cassia_Aufnahme_16_02");//Toma esta llave. Abre la puerta del hotel. As� no tendr�s que nadar cada vez.
	B_GiveInvItems (self, other,ItKe_ThiefGuildKey_Hotel_MIS,1);
	
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_03");//No es todo: deber�as saber que tenemos una se�al secreta. Un gesto particular con la cabeza.
	AI_PlayAni (other,"T_YES");
	AI_Output  (self, other, "DIA_Cassia_Aufnahme_16_04");//Exactamente. Cuando hables con la gente adecuada y hagas este gesto, sabr�n que eres uno de los nuestros.
		
	MIS_CassiaRing = LOG_SUCCESS;
	B_GivePlayerXP (XP_CassiaRing);
	Knows_SecretSign = TRUE;
	Log_CreateTopic (Topic_Diebesgilde, LOG_NOTE);
	B_LogEntry (Topic_Diebesgilde,"He sido aceptado en la cofrad�a de ladrones."); 
	B_LogEntry (Topic_Diebesgilde,"Conozco la se�al de los ladrones. Si se la hago a la gente adecuada, sabr�n que soy uno de ellos.");
	 
	
};
//////////////////////////////////////////////////////////////////////
//	Info Versteck
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Versteck   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Versteck_Condition;
	information = DIA_Cassia_Versteck_Info;
	permanent   = FALSE;
	description = "�Y d�nde escondes el bot�n?";
};

FUNC INT DIA_Cassia_Versteck_Condition()
{	
	if (MIS_CassiaRing == LOG_SUCCESS)
	&& Npc_KnowsInfo (other,DIA_Ramirez_Beute)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Versteck_Info()
{
	AI_Output (other, self, "DIA_Cassia_Versteck_15_00");//�Y d�nde escondes el bot�n?
	AI_Output (self, other, "DIA_Cassia_Versteck_16_01");//Vamos, �no pensar�as en serio que te lo iba a decir?
	AI_Output (self, other, "DIA_Cassia_Versteck_16_02");//Tendr�s oportunidades suficientes de echarle el guante a tu propio bot�n. Recuerda: la avaricia rompe el saco.
};
//////////////////////////////////////////////////////////////////////
//	Info Blutkelche
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Blutkelche   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Blutkelche_Condition;
	information = DIA_Cassia_Blutkelche_Info;
	permanent   = FALSE;
	description = "�Tienes trabajo para m�?";
};

FUNC INT DIA_Cassia_Blutkelche_Condition()
{	
	if (MIS_CassiaRing == LOG_SUCCESS)
	&& (MIS_CassiaKelche != LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Blutkelche_Info()
{
	AI_Output (other, self, "DIA_Cassia_Blutkelche_15_00");//�Tienes trabajo para m�?
	
	if (PETZCOUNTER_City_Theft  > 0)
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_01");//No mientras se te busque en la ciudad por ladr�n.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_02");//Arregla eso: paga la multa o l�brate de los testigos. No me importa mientras lo soluciones.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_03");//S�, hay un juego de c�lices. Seis de ellos.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_04");//El rey Rhobar les ech� el guante una vez durante una campa�a, pero sacrific� a muchos hombres para obtenerlos. Por eso se llaman los c�lices sangrientos.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_05");//Cada uno de los c�lices por separado no tiene mucho valor, pero los seis juntos valen una bonita suma.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_06");//�D�nde est�n esos c�lices?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_07");//Est�n aqu�, en la ciudad. Pertenecen a los ricos comerciantes del barrio alto.
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_08");//Tr�emelos. Mientras, intentar� encontrar un comprador para ellos.
		AI_Output (other, self, "DIA_Cassia_Blutkelche_15_09");//�Qu� obtengo yo a cambio?
		AI_Output (self, other, "DIA_Cassia_Blutkelche_16_10");//O la mitad del beneficio o puedes elegir un objeto especial de mi bot�n.
 		
 		MIS_CassiaKelche = LOG_RUNNING;
 		Log_CreateTopic(Topic_Cassiakelche,LOG_MISSION);
		Log_SetTopicStatus (Topic_CassiaKelche,LOG_RUNNING);
		B_LogEntry 	(Topic_CassiaKelche,"Cassia quiere que le consiga los seis c�lices de sangre. Por lo visto, todos est�n en la ciudad.");
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Kelche abgeben
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_abgeben   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_abgeben_Condition;
	information = DIA_Cassia_abgeben_Info;
	permanent   = TRUE;
	description = "Sobre los C�lices sangrientos...";
};

FUNC INT DIA_Cassia_abgeben_Condition()
{	
	if (MIS_CassiaKelche == LOG_RUNNING)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_abgeben_Info()
{
	AI_Output (other, self, "DIA_Cassia_abgeben_15_00");//Sobre los C�lices sangrientos...
	
	if B_GiveInvItems (other, self, ItMi_BloodCup_MIS,6)
	{
		AI_Output (other, self, "DIA_Cassia_abgeben_15_01");//Ya tengo los seis c�lices.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_02");//Buen trabajo. De mientras, he encontrado un comprador.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_03");//Ahora puedes llevarte tu recompensa. Gracias por hacerme el encargo.
		AI_Output (self, other, "DIA_Cassia_abgeben_16_04");//No hay nada m�s que tenga que hacer para ti, pero puedes aprender de m� en cualquier momento. Adem�s, hay tanto en esta isla esperando a que alguien lo coja. (Sonr�e).
		    
		
		MIS_CassiaKelche = LOG_SUCCESS;
		B_GivePlayerXP (XP_CassiaBlutkelche);
	}
	else 
	{
		AI_Output (self, other, "DIA_Cassia_abgeben_16_05");//Solo puedo vender estos c�lices en grupo. Tr�eme los seis.
	};
};
//////////////////////////////////////////////////////////////////////
//	Info Belohung
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Cassia_Belohnung   (C_INFO)
{
	npc         = VLK_447_Cassia;
	nr          = 2;
	condition   = DIA_Cassia_Belohnung_Condition;
	information = DIA_Cassia_Belohnung_Info;
	permanent   = FALSE;
	description = "He venido a por mi recompensa.";
};

FUNC INT DIA_Cassia_Belohnung_Condition()
{	
	if (MIS_CassiaKelche == LOG_SUCCESS)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cassia_Belohnung_Info()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_00");//He venido a por mi recompensa.
	AI_Output (self, other, "DIA_Cassia_Belohnung_16_01");//�Qu� eliges?
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
	
	Info_AddChoice (DIA_Cassia_Belohnung,"400 piezas de oro.",DIA_Cassia_Belohnung_Gold);
	Info_AddChoice (DIA_Cassia_Belohnung,"4 elixires de curaci�n.",DIA_Cassia_Belohnung_Trank);
	Info_AddChoice (DIA_Cassia_Belohnung, NAME_ADDON_CASSIASBELOHNUNGSRING ,DIA_Cassia_Belohnung_Ring);
	
};
FUNC VOID DIA_Cassia_Belohnung_Gold()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_02");//Dame el oro.
	B_GiveInvItems (self, other, ItmI_Gold,400);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};
FUNC VOID DIA_Cassia_Belohnung_Trank()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_03");//Dame las pociones.
	B_GiveInvItems (self, other, ItPo_Health_03,4);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};
FUNC VOID DIA_Cassia_Belohnung_Ring()
{
	AI_Output (other, self, "DIA_Cassia_Belohnung_15_04");//Dame el anillo.
	B_GiveInvItems (self, other, ItRi_Hp_01,1);
	
	Info_ClearChoices (DIA_Cassia_Belohnung);
};
