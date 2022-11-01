///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_EXIT		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 = 	999;
	condition	 = 	DIA_Akil_EXIT_Condition;
	information	 = 	DIA_Akil_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Akil_EXIT_Condition ()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Akil_EXIT_Info ()
{
	AI_Output			(other, self, "DIA_Akil_EXIT_15_00"); //Tengo cosas que hacer.

	if (Akil_Sauer == TRUE)
		{
			AI_Output			(self, other, "DIA_Akil_EXIT_13_01"); //No voy a impedírtelo.
		}
	else
		{
			AI_Output			(self, other, "DIA_Akil_EXIT_13_02"); //Hasta luego. Ojalá pudiera haber hecho algo más por ti.
		};
		
		AI_StopProcessInfos (self);
};

//////////////////////////////////////////////////////////////////////
//	Info Hallo mit Söldnern
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Hallo	(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 = 	4;
	condition	 = 	DIA_Akil_Hallo_Condition;
	information	 = 	DIA_Akil_Hallo_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿Pasa algo?";
};
func int DIA_Akil_Hallo_Condition ()
{
	if 	!(Npc_IsDead (Alvares))
	&&  !(Npc_IsDead (Engardo))	
	{
		return TRUE;
	};
};
func void DIA_Akil_Hallo_Info ()
{
	AI_Output  (other, self, "DIA_Akil_Hallo_15_00"); //¿Pasa algo?
	AI_Output  (self, other, "DIA_Akil_Hallo_13_01"); //(Preocupado) Eh... no, no... todo va bien. (Nervioso) Es mejor... que te vayas.
	AI_Output  (other, self, "DIA_Akil_Hallo_15_02"); //¿Estás seguro?
	AI_Output  (self, other, "DIA_Akil_Hallo_13_03"); //Eh... sí, sí... todo va bien. Tú... eh... yo... ahora no puedo hablar contigo.
	
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"La granja de Akil está amenazada por mercenarios."); 

	Akils_SLDStillthere = TRUE;
	AI_StopProcessInfos (self);
};	
///////////////////////////////////////////////////////////////////////
//	Info Kann nicht reden
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Nichtjetzt		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 = 	7;
	condition	 = 	DIA_Akil_Nichtjetzt_Condition;
	information	 = 	DIA_Akil_Nichtjetzt_Info;
	permanent    =  TRUE;
	important 	 =  TRUE;
};

func int DIA_Akil_Nichtjetzt_Condition ()
{
	if 	  Npc_IsInState (self, ZS_Talk)
	&&  !(Npc_IsDead (Alvares))
	&&  !(Npc_IsDead (Engardo))
	&&    Npc_KnowsInfo (other, DIA_Akil_Hallo)
	{
		return TRUE;
	};
};
func void DIA_Akil_Nichtjetzt_Info ()
{
	AI_Output (self, other, "DIA_Akil_Nichtjetzt_13_00"); //Eh... ahora no, ahora no puedo hablar contigo.
	AI_StopProcessInfos (self);
};	
///////////////////////////////////////////////////////////////////////
//	Info Nach dem Kampf 
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_NachKampf		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 = 	5;
	condition	 = 	DIA_Akil_NachKampf_Condition;
	information	 = 	DIA_Akil_NachKampf_Info;
	permanent	 =  FALSE; 
	important 	 = 	TRUE;
};
func int DIA_Akil_NachKampf_Condition ()
{
	if 	(Npc_IsDead (Alvares))
	&&  (Npc_IsDead (Engardo))
	{
		return TRUE;
	};
};
func void DIA_Akil_NachKampf_Info ()
{
	AI_Output (self, other, "DIA_Akil_NachKampf_13_00"); //Gracias a Innos. Creía que había llegado mi hora.
	AI_Output (self, other, "DIA_Akil_NachKampf_13_01"); //Me llamo Akil y cultivo esta humilde parcela.
	AI_Output (other, self, "DIA_Akil_NachKampf_15_02"); //¿Quiénes eran ésos?

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Akil_NachKampf_13_03"); //Deberías reconocerlos. Eran mercenarios de la granja de Onar, como tú.
		}
		else
		{
			AI_Output (self, other, "DIA_Akil_NachKampf_13_04"); //Eran mercenarios de la granja de Onar. Esos cerdos no saben hacer otra cosa que no sea saquear y asesinar.
		};
		
	AI_Output (self, other, "DIA_Akil_NachKampf_13_05"); //Me temía lo peor...
	AI_Output (self, other, "DIA_Akil_NachKampf_13_06"); //(Tras respirar hondo) Bueno, gracias a Innos no ha sucedido. Dime en qué puedo ayudarte.
	
	Info_ClearChoices (DIA_Akil_NachKampf);
	Info_AddChoice (DIA_Akil_NachKampf,"En nada. Solo quería que salieras bien de ésta.",DIA_Akil_NachKampf_Ehre);
	Info_AddChoice (DIA_Akil_NachKampf,"¿Qué tal si me das unas cuantas monedas de oro?",DIA_Akil_NachKampf_Gold);
	
	Npc_ExchangeRoutine	(self,"Start"); 

	self.flags = 0;

	if ((Hlp_IsValidNpc (Kati))
	&& (!Npc_IsDead (Kati)))
	{
		Npc_ExchangeRoutine	(Kati,"Start");
		AI_ContinueRoutine (Kati);
		Kati.flags = 0;
	};
	
	if ((Hlp_IsValidNpc (Randolph))
	&& (!Npc_IsDead (Randolph)))
	{
		Npc_ExchangeRoutine	(Randolph,"Start");
		AI_ContinueRoutine (Randolph);
		Randolph.flags = 0;
	};
	
	TOPIC_END_AkilsSLDStillthere = TRUE;
	B_GivePlayerXP (XP_Ambient);
};
FUNC VOID DIA_Akil_NachKampf_Ehre()
{
	AI_Output (other, self, "DIA_Akil_NachKampf_Ehre_15_00"); //En nada. Solo quería que salieras bien de ésta.
	AI_Output (self, other, "DIA_Akil_NachKampf_Ehre_13_01"); //Eres un fuera de serie. Que Innos te proteja en tu camino.
	
	B_GivePlayerXP (XP_Akil_SLDWegVomHofEhre);
	Info_ClearChoices (DIA_Akil_NachKampf);
};
FUNC VOID DIA_Akil_NachKampf_Gold()
{
	AI_Output (other, self, "DIA_Akil_NachKampf_Gold_15_00"); //¿Qué tal si me das unas cuantas monedas de oro?
	AI_Output (self, other, "DIA_Akil_NachKampf_Gold_13_01"); //Me temo que te voy a decepcionar. Somos pobres, y apenas tenemos para sobrevivir.
	AI_Output (self, other, "DIA_Akil_NachKampf_Gold_13_02"); //Solo puedo ofrecerte comida. Ve a Kati y deja que se ocupe de ti.
	
	B_GivePlayerXP (XP_Akil_SLDWegVomHof);
	Info_ClearChoices (DIA_Akil_NachKampf);
	Kati_Mahlzeit = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info infos
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Soeldner		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 = 	7;
	condition	 = 	DIA_Akil_Soeldner_Condition;
	information	 = 	DIA_Akil_Soeldner_Info;
	permanent    =  FALSE;
	description	 = 	"¿Qué quieren de ti los mercenarios?";
};

func int DIA_Akil_Soeldner_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Akil_NachKampf))
	{
		return TRUE;
	};
};
func void DIA_Akil_Soeldner_Info ()
{
	AI_Output (other, self, "DIA_Akil_Soeldner_15_00"); //¿Qué quieren de ti los mercenarios?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
				AI_Output (self, other, "DIA_Akil_Soeldner_13_01"); //¿Me tomas el pelo? Los mercenarios querían cobrar la renta.
		}
	else
		{
				AI_Output (self, other, "DIA_Akil_Soeldner_13_02"); //¿No lo sabes? Les contrató Onar, el terrateniente. Protegen su granja y se dedican a cobrar las rentas.
				AI_Output (self, other, "DIA_Akil_Soeldner_13_03"); //Eso significa que van de granja en granja y se quedan con lo que les da la gana. Y todo aquel que no puede pagar prueba su acero.
		};
};
///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Akil_MissingPeople		(C_INFO)
{
	npc		 = 	BAU_940_Akil;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Akil_MissingPeople_Condition;
	information	 = 	DIA_Addon_Akil_MissingPeople_Info;

	description	 = 	"¿Has oído hablar de los ciudadanos perdidos?";
};

func int DIA_Addon_Akil_MissingPeople_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Akil_NachKampf))
	&& (SC_HearedAboutMissingPeople == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Akil_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Akil_MissingPeople_15_00"); //¿Has oído hablar de los ciudadanos perdidos?
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_01"); //No me hagas reír. ¿Que si he oído hablar? Algunos de ellos eran de los míos.
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_02"); //Tonak y Telbor trabajan en mis tierras hasta hace 3 días.
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_03"); //Y estoy seguro de que ellos no se marcharían y dejarían la granja así como así.
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_04"); //Sin embargo, han desaparecido sin más y nadie sabe decirme dónde se han ido.
	AI_Output	(self, other, "DIA_Addon_Akil_MissingPeople_13_05"); //Si averiguas qué ha sido de ellos, infórmame, por favor.
	B_GivePlayerXP (XP_Ambient);

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"El granjero Akil echa en falta a sus dos braceros, Tonak y Telbor."); 

	MIS_Akil_BringMissPeopleBack = LOG_RUNNING;
};
///////////////////////////////////////////////////////////////////////
//	Info ReturnPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Akil_ReturnPeople		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 = 	5;
	condition	 = 	DIA_Addon_Akil_ReturnPeople_Condition;
	information	 = 	DIA_Addon_Akil_ReturnPeople_Info;
	permanent	 =  FALSE;
	description	 = 	"Sobre tus mozos…";
};

func int DIA_Addon_Akil_ReturnPeople_Condition ()
{
	if (MIS_Akil_BringMissPeopleBack == LOG_RUNNING) 
	&& (MissingPeopleReturnedHome == TRUE)
	&& ((Npc_GetDistToWP (Tonak_NW,"NW_FARM2_FIELD_TANOK")<= 1000) || (Npc_GetDistToWP (Telbor_NW,"NW_FARM2_FIELD_TELBOR")<= 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Akil_ReturnPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Akil_ReturnPeople_15_00"); //Sobre los jornaleros
	
	if (Npc_GetDistToWP (Tonak_NW,"NW_FARM2_FIELD_TANOK")<= 1000)
	&& (Npc_GetDistToWP (Telbor_NW,"NW_FARM2_FIELD_TELBOR")<= 1000)
	{
		AI_Output	(self, other, "DIA_Addon_Akil_ReturnPeople_13_01"); //Los has traído de vuelta: eres un hombre valiente.
	}
	else 
	{
		AI_Output	(self, other, "DIA_Addon_Akil_ReturnPeople_13_02"); //Al menos uno de ellos ha sobrevivido.
	};
	AI_Output	(self, other, "DIA_Addon_Akil_ReturnPeople_13_03"); //Acepta esta pequeña muestra de mi gratitud.
	B_GiveInvItems (self, other, itmi_Gold, 100);
	
	B_GivePlayerXP (XP_Ambient);
	MIS_Akil_BringMissPeopleBack = LOG_SUCCESS;
};
///////////////////////////////////////////////////////////////////////
//	Info Baltrams Lieferung
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Lieferung		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 =	20;
	condition	 = 	DIA_Akil_Lieferung_Condition;
	information	 = 	DIA_Akil_Lieferung_Info;
	permanent	 =  FALSE; 	 
	description	 = 	"Me manda Baltram...";
};

func int DIA_Akil_Lieferung_Condition ()
{
	if  Npc_KnowsInfo(other, DIA_Akil_NachKampf)
	&& (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Akil_Lieferung_Info ()
{
	AI_Output (other, self, "DIA_Akil_Lieferung_15_00"); //Me manda Baltram. Se supone que tengo que recoger un pedido para él.
	AI_Output (self, other, "DIA_Akil_Lieferung_13_01"); //Así que eres su nuevo mensajero. Muy bien, ya he preparado el paquete.
	CreateInvItems 	(self, ItMi_BaltramPaket, 1 );
	B_GiveInvItems (self, other, ItMi_BaltramPaket,1);
	Lieferung_Geholt = TRUE;
	
	B_LogEntry (TOPIC_Baltram, "He conseguido el envío y ahora podría llevárselo a Baltram...");
	B_LogEntry (TOPIC_Nagur,   "He conseguido el envío y ahora podría llevárselo a Nagur...");
};

///////////////////////////////////////////////////////////////////////
//	Info Die Gegend
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Gegend		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 =	90;
	condition	 = 	DIA_Akil_Gegend_Condition;
	information	 = 	DIA_Akil_Gegend_Info;
	permanent	 =  FALSE; 	 
	description	 = 	"¿Conoces la zona?";
};

func int DIA_Akil_Gegend_Condition ()
{
	if  Npc_KnowsInfo(other, DIA_Akil_Soeldner)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
//-------------------------------
var int Knows_Taverne;
//-------------------------------
func void DIA_Akil_Gegend_Info ()
{
	AI_Output (other, self, "DIA_Akil_Gegend_15_00"); //¿Conoces la zona?
	AI_Output (self, other, "DIA_Akil_Gegend_13_01"); //Claro, ¿qué quieres saber?
};
/*
FUNC VOID DIA_Akil_Gegend_BACK()
{
	Info_ClearChoices (DIA_Akil_Gegend);
};
FUNC VOID DIA_Akil_Gegend_Onar()
{
	AI_Output (other, self, "DIA_Akil_Gegend_Onar_15_00"); //Wo finde ich den Hof von Onar?
	AI_Output (self, other, "DIA_Akil_Gegend_Onar_13_01"); //Geh einfach wieder die Steinstufen runter und folge dem Weg weiter nach Osten.
	AI_Output (self, other, "DIA_Akil_Gegend_Onar_13_02"); //Irgendwann kommt eine Taverne. Da gehst du weiter nach Osten bis du zu den großen Feldern kommst. Da lungern dann schon die Söldner rum.
	Knows_Taverne = TRUE;
};
FUNC VOID DIA_Akil_Gegend_Wald()
{
	AI_Output (other, self, "DIA_Akil_Gegend_Wald_15_00"); //Was finde ich in dem Wald hinter deinem Hof?
	AI_Output (self, other, "DIA_Akil_Gegend_Wald_13_01"); //Da gibt's nur jede Menge Monster - wobei die Wölfe noch die ungefährlichsten sind.
	AI_Output (self, other, "DIA_Akil_Gegend_Wald_13_02"); //Angeblich sollen da auch ein paar Banditen ihre Höhle haben. Na - meinen Hof haben sie bis jetzt in Ruhe gelassen.
};
FUNC VOID DIA_Akil_Gegend_Taverne ()
{
	AI_Output (other, self, "DIA_Akil_Gegend_Taverne_15_00"); //Was ist das für eine Taverne im Osten?
	AI_Output (self, other, "DIA_Akil_Gegend_Taverne_13_01"); //Frag mal Randolph. Er weiß mehr darüber als ich. Er war schon ein paar mal dort.
};
*/
///////////////////////////////////////////////////////////////////////
//	Info Onars Hof
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Hof		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 =	20;
	condition	 = 	DIA_Akil_Hof_Condition;
	information	 = 	DIA_Akil_Hof_Info;
	permanent	 =  FALSE; 	 
	description	 = 	"¿Dónde está la granja de Onar?";
};

func int DIA_Akil_Hof_Condition ()
{
	if  Npc_KnowsInfo(other, DIA_Akil_Gegend)
	{
		return TRUE;
	};
};
func void DIA_Akil_Hof_Info ()
{
	AI_Output (other, self, "DIA_Akil_Gegend_Onar_15_00"); //¿Dónde está la granja de Onar?
	AI_Output (self, other, "DIA_Akil_Gegend_Onar_13_01"); //Baja los escalones de piedra y sigue el camino hacia el este.
	AI_Output (self, other, "DIA_Akil_Gegend_Onar_13_02"); //En algún momento llegarás a una taberna. Desde allí, sigue al este hasta que llegues a las parcelas grandes. Allí es donde suelen andar los mercenarios.
	Knows_Taverne = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info Taverne
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Taverne		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 =	20;
	condition	 = 	DIA_Akil_Taverne_Condition;
	information	 = 	DIA_Akil_Taverne_Info;
	permanent	 =  FALSE; 	 
	description	 = 	"¿Qué es esa taberna que está al este de aquí?";
};

func int DIA_Akil_Taverne_Condition ()
{
	if (Knows_Taverne == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Akil_Taverne_Info ()
{
	AI_Output (other, self, "DIA_Akil_Gegend_Taverne_15_00"); //¿Qué es esa taberna que está al este de aquí?
	AI_Output (self, other, "DIA_Akil_Gegend_Taverne_13_01"); //Pregúntale a Randolph. La conoce mejor que yo, y ha ido unas cuantas veces.
};
///////////////////////////////////////////////////////////////////////
//	Info Wald
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Wald		(C_INFO)
{
	npc			 = 	BAU_940_Akil;
	nr			 =	20;
	condition	 = 	DIA_Akil_Wald_Condition;
	information	 = 	DIA_Akil_Wald_Info;
	permanent	 =  FALSE; 	 
	description	 = 	"¿Qué hay en los bosques que lindan con tu granja?";
};
func int DIA_Akil_Wald_Condition ()
{

	if  Npc_KnowsInfo(other, DIA_Akil_Gegend)
	{
		return TRUE;
	};

};
func void DIA_Akil_Wald_Info ()
{
	AI_Output (other, self, "DIA_Akil_Gegend_Wald_15_00"); //¿Qué hay en los bosques que lindan con tu granja?
	AI_Output (self, other, "DIA_Akil_Gegend_Wald_13_01"); //Hay un montón de monstruos... y los lobos son los menos peligrosos.
	AI_Output (self, other, "DIA_Akil_Gegend_Wald_13_02"); //Se rumorea que allí también están las cuevas de unos cuantos bandidos. Bueno, por ahora han dejado en paz mi granja.
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Perm		(C_INFO)
{
	npc		 = 	BAU_940_Akil;
	nr		 = 	32;
	condition	 = 	DIA_Akil_Perm_Condition;
	information	 = 	DIA_Akil_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Ha pasado algo más?";
};

func int DIA_Akil_Perm_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Akil_Soeldner))
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Akil_Perm_Info ()
{
	AI_Output (other, self, "DIA_Akil_Perm_15_00"); //¿Ha pasado algo más?

	if (Kapitel == 3)
	{
		if (MIS_Akil_SchafDiebe == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Akil_Perm_13_01"); //No. Espero que las ovejas se queden donde están ahora mismo.
		}
		else
		{
			AI_Output (self, other, "DIA_Akil_Perm_13_02"); //Mis ovejas siguen desapareciendo. Dentro de poco ya no tendré suficiente para alimentarnos.
		};
	}
	else //Kapitel 4 & 5
	{
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output (self, other, "DIA_Akil_Perm_13_03"); //Han aparecido orcos por todas partes. Alguien ha llegado a mencionar su base. Pregúntale al granjero Lobart.

		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Akil_Perm_13_04"); //En la zona se han visto muchos hombres lagarto. Yo que tú no me metería en las cuevas.

		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Akil_Perm_13_05"); //Los de las túnicas negras te buscan.
			AI_Output (other, self, "DIA_Akil_Perm_15_06"); //Menuda novedad.
			AI_Output (self, other, "DIA_Akil_Perm_13_07"); //Pues vale. Pensé que debía comentártelo.
		};		
	};
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Akil_KAP3_EXIT(C_INFO)
{
	npc			= BAU_940_Akil;
	nr			= 999;
	condition	= DIA_Akil_KAP3_EXIT_Condition;
	information	= DIA_Akil_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Akil_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Akil_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SchafDieb
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_SCHAFDIEB		(C_INFO)
{
	npc		 = 	BAU_940_Akil;
	nr		 = 	2;
	condition	 = 	DIA_Akil_SCHAFDIEB_Condition;
	information	 = 	DIA_Akil_SCHAFDIEB_Info;

	description	 = 	"Menuda novedad.";
};

func int DIA_Akil_SCHAFDIEB_Condition ()
{
	if (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Akil_SCHAFDIEB_Info ()
{
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEB_15_00"); //¿Hay alguna otra novedad?
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_13_01"); //Últimamente alguien se dedica a robarme las ovejas. Llevo varias noches sin poder dormir.

	Info_ClearChoices	(DIA_Akil_SCHAFDIEB);
	Info_AddChoice	(DIA_Akil_SCHAFDIEB, "No es mi problema.", DIA_Akil_SCHAFDIEB_nein );
	Info_AddChoice	(DIA_Akil_SCHAFDIEB, "¿Cuántas ovejas te faltan?", DIA_Akil_SCHAFDIEB_wieviel );
	Info_AddChoice	(DIA_Akil_SCHAFDIEB, "¿Quién puede haber sido?", DIA_Akil_SCHAFDIEB_wer );
	MIS_Akil_SchafDiebe	= LOG_RUNNING;
	Log_CreateTopic (TOPIC_AkilSchafDiebe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilSchafDiebe, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilSchafDiebe,"Siguen robando las ovejas de Akil. Sospecha que los bandidos de la cueva del bosque cercano están detrás de esto."); 
};

func void DIA_Akil_SCHAFDIEB_wer ()
{
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEB_wer_15_00"); //¿Quién puede haber sido?
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_wer_13_01"); //Tengo un presentimiento.
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_wer_13_02"); //En las cuevas del bosque se han instalado unos tipos bastante desagradables.
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_wer_13_03"); //Me cuesta creer que se alimenten solo de bayas. Estoy casi seguro de que son la causa de la desaparición de las ovejas.
	Info_ClearChoices	(DIA_Akil_SCHAFDIEB);
};

func void DIA_Akil_SCHAFDIEB_wieviel ()
{
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEB_wieviel_15_00"); //¿Cuántas ovejas te faltan?
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_wieviel_13_01"); //Hasta el momento por lo menos han desaparecido tres.

};

func void DIA_Akil_SCHAFDIEB_nein ()
{
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEB_nein_15_00"); //No es mi problema.
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEB_nein_13_01"); //Lo entiendo. Tienes que ocuparte de otras cosas.
	Info_ClearChoices	(DIA_Akil_SCHAFDIEB);

};

///////////////////////////////////////////////////////////////////////
//	Info Schafdiebeplatt
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_SCHAFDIEBEPLATT		(C_INFO)
{
	npc		 = 	BAU_940_Akil;
	nr		 = 	2;
	condition	 = 	DIA_Akil_SCHAFDIEBEPLATT_Condition;
	information	 = 	DIA_Akil_SCHAFDIEBEPLATT_Info;

	description	 = 	"Encontré a los ladrones de ovejas.";
};

func int DIA_Akil_SCHAFDIEBEPLATT_Condition ()
{
	if (Kapitel >= 3)
	&& (MIS_Akil_SchafDiebe == LOG_RUNNING)
	&& (Npc_IsDead(BDT_1025_Bandit_H)) 
	&& (Npc_IsDead(BDT_1026_Bandit_H)) 
	&& (Npc_IsDead(BDT_1027_Bandit_H)) 
		{
				return TRUE;
		};
};

func void DIA_Akil_SCHAFDIEBEPLATT_Info ()
{
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEBEPLATT_15_00"); //Encontré a los ladrones de ovejas.
	AI_Output			(other, self, "DIA_Akil_SCHAFDIEBEPLATT_15_01"); //Tenías razón, fueron los tipos del bosque. No volverán a robarte ovejas.

	if 		((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output			(self, other, "DIA_Akil_SCHAFDIEBEPLATT_13_02"); //Gracias, noble siervo de Innos.
			}
	else if (hero.guild == GIL_MIL)
			{
				AI_Output			(self, other, "DIA_Akil_SCHAFDIEBEPLATT_13_03"); //Gracias. Parece que la milicia sí se preocupa de los humildes granjeros.
			}
	else 
			{
				AI_Output			(self, other, "DIA_Akil_SCHAFDIEBEPLATT_13_04"); //Gracias. Desde luego, eres un mercenario bastante peculiar. No te pareces a los demás.
			};
		
	AI_Output			(self, other, "DIA_Akil_SCHAFDIEBEPLATT_13_05"); //Considera esto una pequeña muestra de gratitud por el favor desinteresado que me has hecho.

	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);					
	MIS_Akil_SchafDiebe	= LOG_SUCCESS;
	B_GivePlayerXP (XP_Akil_SchafDiebe);
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsSchaf
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_AkilsSchaf		(C_INFO)
{
	npc		 = 	BAU_940_Akil;
	nr		 = 	2;
	condition	 = 	DIA_Akil_AkilsSchaf_Condition;
	information	 = 	DIA_Akil_AkilsSchaf_Info;

	description	 = 	"(Devolver la oveja de Akil)";
};

func int DIA_Akil_AkilsSchaf_Condition ()
{
	if (Kapitel >= 3)
	&& (Npc_GetDistToNpc(self, Follow_Sheep_AKIL) < 1000 )
	&& (MIS_Akil_SchafDiebe != 0)
		{
				return TRUE;
		};
};

func void DIA_Akil_AkilsSchaf_Info ()
{
	//Joly: AI_Output			(other, self, "DIA_Akil_AkilsSchaf_15_00"); //Ich habe die Schafdiebe gefunden.
	AI_Output			(self, other, "DIA_Akil_AkilsSchaf_13_01"); //Muy bien. Ten unas cuantas monedas de oro. Espero que basten.
	
	CreateInvItems (self, ItMi_Gold, 150);									
	B_GiveInvItems (self, other, ItMi_Gold, 150);					
	
	Follow_Sheep_AKIL.aivar[AIV_PARTYMEMBER] = FALSE;
	Follow_Sheep_AKIL.wp = "NW_FARM2_OUT_02";
	Follow_Sheep_AKIL.start_aistate = ZS_MM_AllScheduler; 
	
	B_GivePlayerXP (XP_AkilsSchaf);
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

INSTANCE DIA_Akil_KAP4_EXIT(C_INFO)
{
	npc			= BAU_940_Akil;
	nr			= 999;
	condition	= DIA_Akil_KAP4_EXIT_Condition;
	information	= DIA_Akil_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Akil_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Akil_KAP4_EXIT_Info()
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

INSTANCE DIA_Akil_KAP5_EXIT(C_INFO)
{
	npc			= BAU_940_Akil;
	nr			= 999;
	condition	= DIA_Akil_KAP5_EXIT_Condition;
	information	= DIA_Akil_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Akil_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Akil_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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


INSTANCE DIA_Akil_KAP6_EXIT(C_INFO)
{
	npc			= BAU_940_Akil;
	nr			= 999;
	condition	= DIA_Akil_KAP6_EXIT_Condition;
	information	= DIA_Akil_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Akil_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Akil_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Akil_PICKPOCKET (C_INFO)
{
	npc			= BAU_940_Akil;
	nr			= 900;
	condition	= DIA_Akil_PICKPOCKET_Condition;
	information	= DIA_Akil_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Akil_PICKPOCKET_Condition()
{
	C_Beklauen (37, 30);
};
 
FUNC VOID DIA_Akil_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Akil_PICKPOCKET);
	Info_AddChoice		(DIA_Akil_PICKPOCKET, DIALOG_BACK 		,DIA_Akil_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Akil_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Akil_PICKPOCKET_DoIt);
};

func void DIA_Akil_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Akil_PICKPOCKET);
};
	
func void DIA_Akil_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Akil_PICKPOCKET);
};


























































