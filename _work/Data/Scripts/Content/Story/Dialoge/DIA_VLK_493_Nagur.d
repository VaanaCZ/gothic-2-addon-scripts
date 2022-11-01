///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_EXIT   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 999;
	condition   = DIA_Nagur_EXIT_Condition;
	information = DIA_Nagur_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Nagur_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Nagur_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Nagur_PICKPOCKET (C_INFO)
{
	npc			= VLK_493_Nagur;
	nr			= 900;
	condition	= DIA_Nagur_PICKPOCKET_Condition;
	information	= DIA_Nagur_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Nagur_PICKPOCKET_Condition()
{
	C_Beklauen (75, 150);
};
 
FUNC VOID DIA_Nagur_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Nagur_PICKPOCKET);
	Info_AddChoice		(DIA_Nagur_PICKPOCKET, DIALOG_BACK 		,DIA_Nagur_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Nagur_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Nagur_PICKPOCKET_DoIt);
};

func void DIA_Nagur_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Nagur_PICKPOCKET);
};
	
func void DIA_Nagur_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Nagur_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info vor dem Auftrag (Spieler hat noch nicht mit Kardif geredet)
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Hallo   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 2;
	condition   = DIA_Nagur_Hallo_Condition;
	information = DIA_Nagur_Hallo_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk)
	&& (DIA_Kardif_Diebeswerk_permanent == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Hallo_Info()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Nagur_Hallo_08_00");//Oye, no tengo tiempo para charlar contigo. Habla con Kardif si quieres información.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Nagur_Hallo_08_01");//Tío, déjame en paz, ¿vale?
		AI_StopProcessInfos (self);
	};
};
///////////////////////////////////////////////////////////////////////
//	Job Angebot
///////////////////////////////////////////////////////////////////////
	var int NagurHack;
	
	func void B_Nagur_Abfertigen()
	{
		var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
		if (Hlp_IsItem (heroArmor, ItAr_MIL_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_MIL_M) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_PAL_M) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_PAL_H) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_NOV_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_KDF_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_KDF_H) == FALSE)
		{
			AI_Output (self ,other,"DIA_Nagur_Add_08_02"); //¡Y no creas que no te reconozco porque lleves distinta ropa!
		};
		
		AI_Output (self ,other,"DIA_Nagur_Add_08_03"); //(Con aire conspiratorio) ¡Estás a punto de meter la nariz en cosas que no son asunto tuyo!
		AI_Output (self ,other,"DIA_Nagur_Add_08_04"); //¡Piérdete!
		
		MIS_Nagur_Bote = LOG_SUCCESS; //HACK: Attila kommt bei 3* Success oder 1* suckt --> nur noch die anderen beiden Missionen sind Trigger
		NagurHack = TRUE;
		AI_StopProcessInfos (self);
	};

INSTANCE DIA_Nagur_Job   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 3;
	condition   = DIA_Nagur_Job_Condition;
	information = DIA_Nagur_Job_Info;
	permanent   = FALSE;
	description = "Kardif dice que podrías tener un trabajo para mí.";
};
FUNC INT DIA_Nagur_Job_Condition()
{	
	if (DIA_Kardif_Diebeswerk_permanent == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Job_Info()
{
	AI_Output (other, self, "DIA_Nagur_Job_15_00");//Kardif dice que podrías tener un trabajo para mí.
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Nagur_Add_08_00"); //¡No HAY trabajos para gente del monasterio aquí abajo en el puerto! (Se ríe)
		B_Nagur_Abfertigen();
	}
	else if (other.guild == GIL_MIL)
	|| 		(other.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Nagur_Add_08_01"); //¡No HAY trabajos para los soldados del rey aquí abajo en el puerto!
		B_Nagur_Abfertigen();
	}
	else
	{
		AI_Output (self, other, "DIA_Nagur_Job_08_01");//(Pensativamente) Vaya, vaya... así que buscas un trabajo especial. De acuerdo, pero jugamos con mis reglas, ¿entendido?
		AI_Output (other, self, "DIA_Nagur_Job_15_02");//¿Qué quieres decir con eso?
		AI_Output (self, other, "DIA_Nagur_Job_08_03");//Eso significa que haces lo que yo diga y obtienes un tercio de los beneficios.
		AI_Output (self, other, "DIA_Nagur_Job_08_04");//Si no te gusta, no hay trabajo.
	
		Info_ClearChoices (DIA_Nagur_Job);
		Info_AddChoice  (DIA_Nagur_Job,"Somos compañeros de negocios, así que vamos a medias.",DIA_Nagur_Job_Halbe);
		Info_AddChoice  (DIA_Nagur_Job,"De acuerdo, tú mandas.",DIA_Nagur_Job_Klar);
	};
};
FUNC VOID DIA_Nagur_Job_Klar()
{
	AI_Output (other, self, "DIA_Nagur_Job_Klar_15_00");//De acuerdo, tú mandas.
	AI_Output (self, other, "DIA_Nagur_Job_Klar_08_01");//Bien. Pues avísame cuando estés listo para hacerte con un montón de oro.
	Nagur_Deal = 80;
	Info_ClearChoices (DIA_Nagur_Job);
};
FUNC VOID DIA_Nagur_Job_Halbe()
{
	AI_Output (other, self, "DIA_Nagur_Job_Halbe_15_00");//Somos compañeros de negocios, así que vamos a medias.
	AI_Output (self, other, "DIA_Nagur_Job_Halbe_08_01");//De acuerdo, tenía que intentarlo. Naturalmente, nos repartiremos los beneficios equitativamente.
	Nagur_Deal = 120;
	Info_ClearChoices (DIA_Nagur_Job);
};
///////////////////////////////////////////////////////////////////////
//	Info Auftrag
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Auftrag   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 4;
	condition   = DIA_Nagur_Auftrag_Condition;
	information = DIA_Nagur_Auftrag_Info;
	permanent   = FALSE;
	description = "Muy bien, ¿cuál es tu plan?";
};

FUNC INT DIA_Nagur_Auftrag_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Nagur_Job))
	&& (MIS_Nagur_Bote != LOG_SUCCESS) //also hier NICHT B_Nagur_Abfertigen durchlaufen
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Auftrag_Info()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_15_00");//Muy bien, ¿cuál es tu plan?
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_01");//Conoces al comerciante Baltram, ¿no? Si no, ya es hora de que hables con él.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_02");//Este Baltram tiene un mensajero que lo abastece de suministros de la granja de Akil.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_03");//O sea, TENÍA un mensajero hasta que le corté el cuello. Y ahora Baltram tiene que conseguir uno nuevo. Y ése serás tú.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_04");//Tu trabajo es ser contratado por Baltram y recoger la entrega de Akil.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_05");//Me la traes a mí y luego yo se la vendo a un cliente interesado. Soltará una buena cantidad por ella.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_06");//Y no intentes vender las cosas por tu cuenta. ¿Te has enterado?
	
	Info_ClearChoices (DIA_Nagur_Auftrag);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Bueno, estoy listo (FIN)",DIA_Nagur_Auftrag_Okay);
	Info_AddChoice    (DIA_Nagur_Auftrag,"¿Dónde puedo encontrar a Baltram?",DIA_Nagur_Auftrag_Baltram);
	Info_AddChoice    (DIA_Nagur_Auftrag,"¿Cuándo debería hablar con Baltram?",DIA_Nagur_Auftrag_Wann);
	Info_AddChoice    (DIA_Nagur_Auftrag,"¿Dónde está la granja de Akil?",DIA_Nagur_Auftrag_Akil);
	Info_AddChoice    (DIA_Nagur_Auftrag,"¿Cuánto se ganará?",DIA_Nagur_Auftrag_Gewinn);

};
FUNC VOID DIA_Nagur_Auftrag_Akil()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Akil_15_00");//¿Dónde está la granja de Akil?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_01");//Sal de la ciudad por la puerta este, la que está justo en el mercado.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_02");//Si sigues el camino hacia la derecha, pronto llegarás a unos cuantos peldaños tallados en la roca.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_03");//Sube por ahí y llegarás a la granja de Akil.
};
FUNC VOID DIA_Nagur_Auftrag_Gewinn()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Gewinn_15_00");//¿Cuánto será el beneficio?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Gewinn_08_01");//No puedo decirlo exactamente. Pero estimo que unas 400 monedas de oro.
};
FUNC VOID DIA_Nagur_Auftrag_Baltram()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Baltram_15_00");//¿Dónde puedo encontrar a Baltram?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Baltram_08_01");//Tiene un puesto en el mercado.
};
FUNC VOID DIA_Nagur_Auftrag_Wann()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Wann_15_00");//¿Cuándo debería hablar con Baltram?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Wann_08_01");//Puedes ir ahora mismo. Ya debería saber que su mensajero no va a volver nunca más. (Sonríe nauseabundamente).
};
FUNC VOID DIA_Nagur_Auftrag_Okay()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Okay_15_00");//Bueno, estoy listo.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Okay_08_01");//Vale, pues ponte en camino. Pero si intentas engañarme, ¡pronto estarás tan muerto como el mensajero! ¡No lo olvides!
	MIS_Nagur_Bote = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Nagur,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Nagur,LOG_RUNNING);
	B_LogEntry (TOPIC_Nagur,"Tengo que conseguir que Baltram me coja como su nuevo chico de los recados. Entonces tendré que recoger el envío de Agil, el granjero, y llevárselo a Nagur.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Success   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 5;
	condition   = DIA_Nagur_Success_Condition;
	information = DIA_Nagur_Success_Info;
	permanent   = FALSE;
	description = "He traído el paquete.";
};

FUNC INT DIA_Nagur_Success_Condition()
{	
	if (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_BaltramPaket) >=1)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Success_Info()
{
	AI_Output (other, self, "DIA_Nagur_Success_15_00");//He traído el paquete.
	AI_Output (self, other, "DIA_Nagur_Success_08_01");//Bien hecho. Me encargaré de venderlo. Vuelve mañana.
	
	B_LogEntry (TOPIC_Nagur,   "Nagur ha recibido el envío. Me pagará mañana el oro que me debe.");
	
	AI_StopProcessInfos (self);
	
	if B_GiveInvItems (other, self,ItMi_BaltramPaket ,1)
	{
		Npc_RemoveInvItems (self, ItMi_BaltramPaket,1);
	};
	NagurDay = B_GetDayPlus();  
};
///////////////////////////////////////////////////////////////////////
//	Info Deal
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Deal   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 6;
	condition   = DIA_Nagur_Deal_Condition;
	information = DIA_Nagur_Deal_Info;
	permanent   = TRUE;
	description = "¿Vendiste la mercancía?";
};
//---------------------------------
var int DIA_Nagur_Deal_permanent; 
//---------------------------------
FUNC INT DIA_Nagur_Deal_Condition()
{	
	if (DIA_Nagur_Deal_permanent == FALSE)
	&& (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	&& Npc_KnowsInfo (other,DIA_Nagur_Success)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Deal_Info()
{
	AI_Output (other, self, "DIA_Nagur_Deal_15_00");//¿Vendiste la mercancía?
	
	if (B_GetDayPlus() > NagurDay) 
	{
		AI_Output (self, other, "DIA_Nagur_Deal_08_01");//Sí, pero por menos de lo que pensaba. Solo obtuve 300 monedas de oro.
		AI_Output (self, other, "DIA_Nagur_Deal_08_02");//Parte de eso es para mis superiores...
		AI_Output (self, other, "DIA_Nagur_Deal_08_03");//Y Kardif recibe su porcentaje habitual, además del dinero de tu comisión.
		AI_Output (self, other, "DIA_Nagur_Deal_08_04");//Lo que deja un total de 240 monedas de oro. Nos las repartiremos como acordamos. Aquí está tu parte.
		AI_Output (self, other, "DIA_Nagur_Deal_08_05");//Hiciste un buen trabajo. Se lo he comentado a mis jefes.
		AI_Output (self, other, "DIA_Nagur_Deal_08_06");//Lo que ocurra ahora no está en mis manos.
		
		B_GiveInvItems (self,other,ItMi_Gold,Nagur_Deal);
		MIS_Nagur_Bote = LOG_SUCCESS;
		MIS_Baltram_ScoutAkil = LOG_FAILED;
		B_GivePlayerXP (XP_Nagur_Bote);
		DIA_Nagur_Deal_permanent = TRUE;
		Diebesgilde_Okay = (Diebesgilde_Okay + 1);
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Nagur_Deal_08_07");//No, aún no. Esas cosas llevan su tiempo. Quiero conseguir un buen precio, después de todo.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info erneutes ansprechen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Auftraggeber   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Auftraggeber_Condition;
	information = DIA_Nagur_Auftraggeber_Info;
	permanent   = FALSE;
	description = "¿Quiénes son tus superiores?";
};

FUNC INT DIA_Nagur_Auftraggeber_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Auftraggeber_Info()
{
	AI_Output (other, self, "DIA_Nagur_Auftraggeber_15_00");//¿Quiénes son tus superiores?
	AI_Output (self, other, "DIA_Nagur_Auftraggeber_08_01");//¿No pensarás que te lo voy a decir, no?
};
///////////////////////////////////////////////////////////////////////
//	Info erneutes ansprechen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Fazit   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Fazit_Condition;
	information = DIA_Nagur_Fazit_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Fazit_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Nagur_Auftraggeber)
	&& Npc_IsInState (self,ZS_Talk))
	&& (Knows_SecretSign == FALSE) 
	&& (NagurHack == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Fazit_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Fazit_08_00");//El trabajo salió bien, pero no hablo de mis superiores. Así que tranquilízate.
	AI_StopProcessInfos  (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Nagur im Knast
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Knast   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Knast_Condition;
	information = DIA_Nagur_Knast_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Knast_Condition()
{	
	if Npc_IsInState (self,ZS_Talk)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_KASERN_NAGUR") <= 1000)
	&& (Nagur_ausgeliefert == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Knast_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Knast_08_00");//¡Me traicionaste! Eso ha sido un gran error. ¡Ahora desaparece!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
/////////////////////////////////////////
INSTANCE DIA_Nagur_Sign   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Sign_Condition;
	information = DIA_Nagur_Sign_Info;
	permanent   = FALSE;
	description	= "(Hacer la señal de los ladrones)";
};

FUNC INT DIA_Nagur_Sign_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	&& (Knows_SecretSign == TRUE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Sign_Info()
{	
	AI_PlayAni (other,"T_YES");
	AI_Output (self, other, "DIA_Nagur_Sign_08_00");//Así que lo hiciste. Ahora sabes quiénes son mis superiores.
	AI_Output (self, other, "DIA_Nagur_Sign_08_01");//Haz caso de lo que te diga Cassia. No nos importa quién eres. Eres de los nuestros y eso es todo lo que importa.
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Perm   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Perm_Condition;
	information = DIA_Nagur_Perm_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Perm_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	&&  Npc_KnowsInfo (other,DIA_Nagur_Sign) 
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Perm_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Perm_08_00");//Busca a alguien más. Ya hay suficiente gente correteando. No tengo nada más para ti.
	AI_StopProcessInfos (self);
};
























