// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Dexter_EXIT   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 999;
	condition   = DIA_Dexter_EXIT_Condition;
	information = DIA_Dexter_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Dexter_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Dexter_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  Hallo
// ************************************************************
INSTANCE DIA_Dexter_Hallo   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 1;
	condition   = DIA_Dexter_Hallo_Condition;
	information = DIA_Dexter_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Dexter_Hallo_Condition()
{	
	if (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Hallo_Info()
{
	AI_Output (self, other, "DIA_Dexter_Hallo_09_00");//Mira qui�n ha venido. El gran libertador. Y bien, h�roe, �qu� haces aqu�?
	AI_Output (other, self, "DIA_Dexter_Hallo_15_01");//Busco algunas preguntas.
	
	if (Ranger_SCKnowsDexter == TRUE)//ADDON
	{
		//ADDON>
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_00");//Nunca pens� que vendr�as voluntariamente.
		AI_Output (other, self, "DIA_Addon_Dexter_Hallo_15_01");//�Qu� quieres decir con eso?
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_02");//Que te he estado buscando. �Has visto los carteles de 'se busca' que he puesto?
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_03");//Todos llevan TU careto. Oh, s� te andamos buscando. �Lo sab�as?
		//ADDON<
	}
	else // (Bdt13_Dexter_verraten == TRUE) //Gothic2
	{
		AI_Output (other, self, "DIA_Dexter_Hallo_15_02");//Alguien est� repartiendo papeles con mi retrato. Alguien me ha dicho que eres t�.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_03");//Alguien habla demasiado.
		
		AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_04");//Pero tienes raz�n. Yo repart� esos carteles. Y, mira t� por donde, est�s aqu�.
		
		/*//ADDON>
		AI_Output (self, other, "DIA_Dexter_Hallo_09_04");//Aber es stimmt. Ich habe meinen Jungs die Steckbriefe gegeben. Ich hatte keine andere Wahl.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_05");//Als ich versuchte, aus dem Minental zu entfliehen, entdeckten mich die Soldaten und trieben mich in eine Falle.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_06");//Ich dachte schon, das w�re mein Ende, aber dann tauchte pl�tzlich aus der Dunkelheit diese ... Gestalt auf.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_07");//Er trug eine schwarze Robe mit Kapuze und eine Maske �berm Gesicht. Und er sprach mit einer Stimme, die alles andere als menschlich war.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_08");//Aber er bot mir seine Hilfe an. Er brachte mich aus dem Tal und bot mir eintausend Goldst�cke f�r deinen Kopf.
		AI_Output (self, other, "DIA_Dexter_Hallo_09_09");//Hey, was sollte ich machen? Wenn ich abgelehnt h�tte, dann h�tte er mich get�tet!
		*///ADDON<
		//ADDON B_LogEntry (Topic_Bandits,"Dexter hat die Steckbriefe verteilt. Typen mit schwarzen Kapuzen haben ihn damit beauftragt.");
		
		
		MIS_Steckbriefe = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient);
	};
	AI_Output (other, self, "DIA_Addon_Dexter_Hallo_15_05");//�Qu� quieres de m�?
	AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_06");//�Yo? Nada en absoluto. Pero mi jefe est� deseando verte muerto.
	AI_Output (self, other, "DIA_Addon_Dexter_Hallo_09_07");//As� que quiere que te encuentre y que le lleve tu cabeza.
};

// ************************************************************
// 			Glaube 
// ************************************************************
INSTANCE DIA_Dexter_Glaube   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Glaube_Condition;
	information = DIA_Dexter_Glaube_Info;
	permanent   = FALSE;
	description = "No me creo ni una palabra.";
};
FUNC INT DIA_Dexter_Glaube_Condition()
{	
	if (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Glaube_Info()
{
	AI_Output (other, self, "DIA_Dexter_Glaube_15_00");//No me creo ni una palabra.
	AI_Output (self, other, "DIA_Dexter_Glaube_09_01");//Eh, es cierto. �Te lo juro sobre la tumba de mi madre!
};

///////////////////////////////////////////////////////////////////////
//	Info Patrick
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Patrick		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Dexter_Patrick_Condition;
	information	 = 	DIA_Addon_Dexter_Patrick_Info;

	description	 = 	"Han visto por aqu� a un mercenario llamado Patrick.";
};

func int DIA_Addon_Dexter_Patrick_Condition ()
{
	if (MIS_Addon_Cord_Look4Patrick == LOG_RUNNING)
	&& (Knows_Dexter == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Dexter_Patrick_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Patrick_15_00"); //Han visto por aqu� a un mercenario llamado Patrick.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_01"); //Patrick, �eh? No s� de qu� me hablas.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_02"); //Si que recuerdo a un mercenario bocazas que se dejaba ver a veces por aqu�.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_03"); //(mintiendo descaradamente) Pero hace siglos que no lo veo.
	AI_Output	(self, other, "DIA_Addon_Dexter_Patrick_09_04"); //(haci�ndose el inocente) Tal vez lo hayan colgado ya. No tengo ni idea.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Dexter dice que no conoce al mercenario Patrick."); 

	Dexter_KnowsPatrick = TRUE;
	B_GivePlayerXP (XP_Addon_Dexter_KnowsPatrick);
};
///////////////////////////////////////////////////////////////////////
//	Info Greg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Greg		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Dexter_Greg_Condition;
	information	 = 	DIA_Addon_Dexter_Greg_Info;

	description	 = 	"Est� ese tipo con parche. �Anda BUSC�NDOTE!";
};

func int DIA_Addon_Dexter_Greg_Condition ()
{
	if (SC_KnowsGregsSearchsDexter == TRUE)
	&& (Knows_Dexter == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Addon_Dexter_Greg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Greg_15_00"); //Est� ese tipo del parche. �Anda BUSC�NDOTE!
	AI_Output	(self, other, "DIA_Addon_Dexter_Greg_09_01"); //Todos me buscan. Me importa un bledo.
	AI_Output	(self, other, "DIA_Addon_Dexter_Greg_09_02"); //Si ese tipo quiere algo  conmigo, que venga.
	B_GivePlayerXP (XP_Ambient);
};
///////////////////////////////////////////////////////////////////////
//	Info missingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_missingPeople		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Dexter_missingPeople_Condition;
	information	 = 	DIA_Addon_Dexter_missingPeople_Info;

	description	 = 	"Dicen que est�s secuestrando a gente de Khorinis.";
};

func int DIA_Addon_Dexter_missingPeople_Condition ()
{
	if (SC_KnowsDexterAsKidnapper == TRUE)
	&& (Knows_Dexter == TRUE)
		{
			return TRUE;
		};
};
func void DIA_Addon_Dexter_missingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_missingPeople_15_00"); //Dicen que est�s secuestrando a gente de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Dexter_missingPeople_09_01"); //As� que tambi�n sabes eso. Buen trabajo, sabueso.
	AI_Output	(self, other, "DIA_Addon_Dexter_missingPeople_09_02"); //Y yo pensando que no hab�a dejado rastro.
	
	Info_ClearChoices	(DIA_Addon_Dexter_missingPeople);
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "�Qui�n te dio esa orden?", DIA_Addon_Dexter_missingPeople_wer );
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "�Qu� ha pasado con la gente?", DIA_Addon_Dexter_missingPeople_Wo );
};
func void DIA_Addon_Dexter_missingPeople_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_Wo_15_00"); //�D�nde est� esa gente? �En las minas quiz�s o por aqu�?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Wo_09_01"); //(r�e) Andar�n lejos, al noreste, donde no puedas ya alcanzarles.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Wo_09_02"); //Te dir�a d�nde exactamente, pero no s� qu� sacar�a yo en claro.
};
func void DIA_Addon_Dexter_missingPeople_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_wer_15_00"); //�Qui�n te dio esa orden?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_wer_09_01"); //Mi jefe. Es un tipo peligroso. Lo conoces, es Raven, uno de los antiguos Magnates del Mineral del Campamento Viejo en el Valle de Minas.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_wer_09_02"); //Necesita a esa gente para cumplir sus planes. Y no necesitas saber m�s.

	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "�Raven, peligroso? En fin�", DIA_Addon_Dexter_missingPeople_Raven );
	Info_AddChoice	(DIA_Addon_Dexter_missingPeople, "�Un Magnate del Mineral aqu�, en Khorinis?", DIA_Addon_Dexter_missingPeople_RavenTot );
		 
};
func void DIA_Addon_Dexter_missingPeople_Raven ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_Raven_15_00"); //�Raven, peligroso? En fin
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_01"); //(irritado) �Y T� qu� sabes? No le conoces como yo.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_02"); //(inseguro) Ya era un miserable bastardo antes, pero �ltimamente
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_03"); //Ha cambiado desde que cay� la Barrera. Su rostro de ha ensombrecido.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_04"); //(intimidado) Su terrible mirada te atraviesa como las garras de un raptor si lo miras fijamente a los ojos.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_05"); //S�lo te doy un consejo: vete de Khorinis lo antes que puedas, antes de que sea tarde.
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_06"); //(pesimista) Aqu� no hallar�s nada. Excepto la muerte.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Dexter tiene un cliente. Se llama Raven. Raven es un antiguo Magnate del Mineral y parece que anda detr�s del asunto de los secuestros. Ahora tengo que demostrarlo."); 

	Info_ClearChoices	(DIA_Addon_Dexter_missingPeople);
};
func void DIA_Addon_Dexter_missingPeople_RavenTot ()
{
	AI_Output			(other, self, "DIA_Addon_Dexter_missingPeople_RavenTot_15_00"); //�Un Magnate del Mineral aqu�, en Khorinis?
	AI_Output			(self, other, "DIA_Addon_Dexter_missingPeople_RavenTot_09_01"); //Ya no es un Magnate del Mineral. Tiene sus propios planes, que pronto compartir� con Khorinis.
};

///////////////////////////////////////////////////////////////////////
//	Info Boss
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Boss		(C_INFO)
{
	npc		 = 	BDT_1060_Dexter;
	nr		 = 	3;
	condition	 = 	DIA_Addon_Dexter_Boss_Condition;
	information	 = 	DIA_Addon_Dexter_Boss_Info;

	description	 = 	"�Tu jefe? �Y qui�n se supone que es?";
};

func int DIA_Addon_Dexter_Boss_Condition ()
{
	if (Knows_Dexter == TRUE)
	&& (SC_KnowsDexterAsKidnapper == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Dexter_Boss_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Dexter_Boss_15_00"); //�Tu jefe? �Y qui�n se supone que es?
	AI_Output	(self, other, "DIA_Addon_Dexter_Boss_09_01"); //(r�e) Te encantar�a saberlo, �verdad? Me lo imagino.
	AI_Output	(self, other, "DIA_Addon_Dexter_Boss_09_02"); //(serio) No veo raz�n alguna para cont�rtelo.
};

// ************************************************************
// 			Vor 
// ************************************************************
INSTANCE DIA_Dexter_Vor   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Vor_Condition;
	information = DIA_Dexter_Vor_Info;
	permanent   = FALSE;
	description = "�Y ahora qu� vas a hacer?";
};
FUNC INT DIA_Dexter_Vor_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Dexter_missingPeople))
		{
			return TRUE;
		};
};
FUNC VOID DIA_Dexter_Vor_Info()
{
	AI_Output (other, self, "DIA_Dexter_Vor_15_00");//�Y ahora qu� tienes pensado hacer? �Matarme?
	AI_Output (self, other, "DIA_Dexter_Vor_09_01");//S�. Pero nos has liberado y por eso te voy a dar otra oportunidad. L�rgate... Desaparece, vu�lvete invisible. No te vuelvas a cruzar en mi camino.
	AI_Output (other, self, "DIA_Addon_Dexter_Vor_15_00");//Tengo que saber d�nde est� esa gente.
	AI_Output (self, other, "DIA_Addon_Dexter_Vor_09_01");//(r�e) Bien. Intenta sac�rmelo a la fuerza.
	AI_Output (self, other, "DIA_Addon_Dexter_Vor_09_02");//(amenazante) Ser� mejor que te largues ya.
	AI_Output (self, other, "DIA_Dexter_Vor_09_02");//Como vuelva a verte por aqu�, no dudar� en matarte.
	Dexter_NoMoreSmallTalk = TRUE;
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			Kill
// ************************************************************
INSTANCE DIA_Dexter_Kill   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 2;
	condition   = DIA_Dexter_Kill_Condition;
	information = DIA_Dexter_Kill_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Dexter_Kill_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& ((Dexter_NoMoreSmallTalk == TRUE)
	|| (Knows_Dexter == FALSE)) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Kill_Info()
{
	if (Knows_Dexter == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Dexter_Add_09_02"); //(atacando) T� lo has querido.
	}
	else
	{
		AI_Output (self, other, "DIA_Dexter_Kill_09_01");//Oh, ser�a mejor que no hubieras venido. Eres el hombre equivocado en el lugar incorrecto.
	};
	
	MIS_Steckbriefe = LOG_OBSOLETE;
	B_CheckLog();
	B_Greg_ComesToDexter ();
	Info_ClearChoices	(DIA_Dexter_Kill);
	Info_AddChoice	(DIA_Dexter_Kill, DIALOG_ENDE, DIA_Dexter_Kill_ENDE );
};
func void DIA_Dexter_Kill_ENDE ()
{
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(Greg_NW);

	if (Hlp_IsItem(itm, ITAR_PIR_H_Addon) == FALSE)
	{
		AI_EquipArmor	(Greg_NW, ITAR_PIR_H_Addon);	
	};
};


// ************************************************************
// 			Mein Kopf? 
// ************************************************************
INSTANCE DIA_Dexter_Kopf (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 5;
	condition   = DIA_Dexter_Kopf_Condition;
	information = DIA_Dexter_Kopf_Info;
	permanent   = FALSE;
	description = "�Quieres mi cabeza? �Pues ven a por ella!";
};
FUNC INT DIA_Dexter_Kopf_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Dexter_Hallo))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Kopf_Info()
{
	AI_Output (other, self, "DIA_Addon_Dexter_Add_15_00"); //�Quieres mi cabeza? �Pues ven a por ella!
	AI_Output (self, other, "DIA_Addon_Dexter_Add_09_01"); //(atacando) Si eso es lo que quieres

	DIA_Dexter_Kill_ENDE();
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dexter_PICKPOCKET (C_INFO)
{
	npc			= BDT_1060_Dexter;
	nr			= 900;
	condition	= DIA_Dexter_PICKPOCKET_Condition;
	information	= DIA_Dexter_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Dexter_PICKPOCKET_Condition()
{
	C_Beklauen (96, 370);
};
 
FUNC VOID DIA_Dexter_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dexter_PICKPOCKET);
	Info_AddChoice		(DIA_Dexter_PICKPOCKET, DIALOG_BACK 		,DIA_Dexter_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dexter_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dexter_PICKPOCKET_DoIt);
};

func void DIA_Dexter_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Dexter_PICKPOCKET);
};
	
func void DIA_Dexter_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dexter_PICKPOCKET);
};





/*
// ************************************************************
// 			Wo
// ************************************************************
INSTANCE DIA_Dexter_Wo   (C_INFO)
{
	npc         = BDT_1060_Dexter;
	nr          = 3;
	condition   = DIA_Dexter_Wo_Condition;
	information = DIA_Dexter_Wo_Info;
	permanent   = FALSE;
	description = "Wo finde ich diesen Mann?";
};
FUNC INT DIA_Dexter_Wo_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Dexter_Glaube) == FALSE)
	&& (Knows_Dexter == TRUE)
	&& (Bdt13_Dexter_verraten == TRUE) 
	&& (Ranger_SCKnowsDexter == FALSE)
	&& (SC_KnowsDexterAsKidnapper == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Dexter_Wo_Info()
{
	AI_Output (other, self, "DIA_Dexter_Wo_15_00");//Wo finde ich diesen Mann?
	
	if (Kapitel < 3)
	{
		AI_Output (self, other, "DIA_Dexter_Wo_09_01");//Ich glaube, der sitzt irgendwo im Minental.
	}
	else
	{
		AI_Output (self, other, "DIA_Dexter_Wo_09_02");//Der Typ ist hier! Und nicht alleine. Da ist ein ganzer Haufen dieser Kerle �berall unterwegs! Und die suchen dich.
	};
};
*/
