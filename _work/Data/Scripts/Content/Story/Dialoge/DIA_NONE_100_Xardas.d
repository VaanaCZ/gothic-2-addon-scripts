// ************************************************************
// 			  				FIRST EXIT 
// ************************************************************

INSTANCE DIA_Xardas_FirstEXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_FirstEXIT_Condition;
	information	= DIA_Xardas_FirstEXIT_Info;
	permanent	= FALSE;
	description = "¡Me pondré en marcha lo antes que pueda! (FIN)";
};
                       
FUNC INT DIA_Xardas_FirstEXIT_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Xardas_FirstEXIT_Info()
{	
	AI_Output (other, self,"DIA_Xardas_FirstEXIT_15_00"); //¡Me pondré en marcha lo antes que pueda!
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_01"); //¡Bien! Y una cosa más: no le digas a nadie que has hablado conmigo. Sobre todo, no se lo digas a ningún mago.
	AI_Output (self, other,"DIA_Xardas_FirstEXIT_14_02"); //Desde que me exilié, el Círculo de Fuego me da por muerto... y eso está bien.
	
	AI_StopProcessInfos	(self);
	
	B_Kapitelwechsel (1, NEWWORLD_ZEN);	//Joly: muß auf jeden Fall hier kommen. Allein schon wegen XP_AMBIENT!
	
	Npc_ExchangeRoutine (self,"START");
};

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Xardas_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_EXIT_Condition;
	information	= DIA_Xardas_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_EXIT_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
var int Addon_zuerst;
// ------------------------------------------------------------
instance DIA_Xardas_Hello (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 1;
	condition	= DIA_Xardas_Hello_Condition;
	information	= DIA_Xardas_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       
FUNC INT DIA_Xardas_Hello_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Xardas_Hello_Info()
{	
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_00"); //¡Otra vez tú! (sonriendo) Nunca pensé que volveríamos a encontrarnos.
	AI_Output (other, self, "DIA_Addon_Xardas_Hello_15_01"); //Me siento como si llevara tres semanas bajo un montón de piedras.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_02"); //Y así ha sido. La magia de tu armadura es lo que te ha mantenido con vida. 
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_03"); //Temía no poderte rescatar de entre los escombros del templo.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_04"); //Pero basta de hablar de eso. Ahora estás aquí.
	AI_Output (self ,other, "DIA_Addon_Xardas_Hello_14_05"); //Hay una NUEVA amenaza que debemos resolver

 	Info_ClearChoices	(DIA_Xardas_Hello);
	Info_AddChoice	(DIA_Xardas_Hello, "Ahora tenemos mucho tiempo. El Durmiente ha sido derrotado.", DIA_Addon_Xardas_Hello_Dragons );
	Info_AddChoice	(DIA_Xardas_Hello, "¿De qué NUEVA amenaza estás hablando?", DIA_Addon_Xardas_Hello_Man );
};
func void DIA_Addon_Xardas_Hello_Man ()
{
	PlayVideo ("Intro_ADDON");
	AI_Output (self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_10"); //¡Tienes que aliarte con ellos! Es el único modo de acabar con Beliar.
	
	Addon_zuerst = TRUE;
};
func void DIA_Addon_Xardas_Hello_Dragons ()
{
	AI_Output (other,self ,"DIA_Xardas_Hello_15_03"); //Al menos ahora tenemos tiempo. Lo conseguí. El Durmiente...
	AI_Output (self ,other,"DIA_Xardas_Hello_14_04"); //… ha sido desterrado. Lo venciste, es cierto, pero no está en nuestras manos detener la guerra que va a estallar.
	//AI_Output (other,self ,"DIA_Xardas_Hello_15_05"); //Du redest von den Orks?
	//AI_Output (self ,other,"DIA_Xardas_Hello_14_06"); //Ich rede von weitaus schlimmeren Kreaturen.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_07"); //Con su último grito de furia, el Durmiente ha movilizado a los ejércitos de las tinieblas.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_08"); //Fue una orden para todas las criaturas malignas, una palabra de poder que tienen que obedecer.
 	AI_Output (self ,other,"DIA_Xardas_Hello_14_09"); //Su última orden fue: ¡Venid! Y han venido. Todas ellas... incluso los dragones.
 	AI_Output (other,self ,"DIA_Xardas_Hello_15_10"); //(Atónito) … ¡Los dragones!
	AI_Output (self ,other,"DIA_Xardas_Hello_14_11"); //Son criaturas de poder ancestral. Incluso aquí percibo su presencia.
	AI_Output (self ,other,"DIA_Xardas_Hello_14_12"); //Y han movilizado a todo un ejército de siervos inferiores a su alrededor.
	AI_Output (other,self ,"DIA_Xardas_Hello_15_13"); //¿Dónde se encuentra este ejército?
	AI_Output (self ,other,"DIA_Xardas_Hello_14_14"); //El ejército acampa no muy lejos de aquí, en el Valle de las Minas cerca de Khorinis, y se están preparando para atacar.
		
	if (Addon_zuerst == TRUE)
	{
		AI_Output (self ,other,"DIA_Xardas_Hello_14_15"); //(Pensativo) No nos queda mucho tiempo.
	}
	else
	{
		AI_Output (self ,other, "DIA_Addon_Xardas_Hello_Dragons_14_06"); //Pero eso no es todo. Hay OTRA amenaza de la que me enteré hace poco.
		Info_ClearChoices	(DIA_Xardas_Hello);
		Info_AddChoice	(DIA_Xardas_Hello, "¿De qué OTRA amenaza estás hablando?", DIA_Addon_Xardas_Hello_Man );
	};
};
	
///////////////////////////////////////////////////////////////////////
//	Info AWAY
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_AWAY (C_INFO) 		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	2;
	condition	 = 	DIA_Xardas_AWAY_Condition;
	information	 = 	DIA_Xardas_AWAY_Info;
	Permanent 	 =  FALSE;
	description	 = 	"¡Apresurémonos en salir de aquí!";
};

func int DIA_Xardas_AWAY_Condition ()
{	
	if (!Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (!Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_AWAY_Info ()
{
	AI_Output (other, self, "DIA_Xardas_AWAY_15_00"); //¡En ese caso, apresurémonos en salir de aquí!
	AI_Output (self, other, "DIA_Xardas_AWAY_14_01"); //Si huimos ahora, tendremos que enfrentarnos a los dragones más tarde.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_02"); //Con la ayuda de los soldados y de los magos que viven en los alrededores, podemos detenerlos antes de que su ejército se movilice al completo.
	AI_Output (self, other, "DIA_Xardas_AWAY_14_03"); //No vamos a tener una oportunidad mejor.
};

///////////////////////////////////////////////////////////////////////
//	Info TODO
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_TODO (C_INFO) 		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	1;
	condition	 = 	DIA_Xardas_TODO_Condition;
	information	 = 	DIA_Xardas_TODO_Info;
	Permanent 	 =  FALSE;
	description	 = 	"¿Y ahora qué hacemos?";
};

func int DIA_Xardas_TODO_Condition ()
{	
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_TODO_Info ()
{
	AI_Output (other, self, "DIA_Xardas_TODO_15_00"); //¿Qué podemos hacer?
	AI_Output (self, other, "DIA_Xardas_TODO_14_01"); //Esta vez no nos podemos ocupar por nuestra cuenta. Solo el poder de Innos nos ayudará contra estos dragones.
	AI_Output (self, other, "DIA_Xardas_TODO_14_02"); //Un grupo de paladines está destacado en la ciudad de Khorinis, no muy lejos de aquí.
	AI_Output (self, other, "DIA_Xardas_TODO_14_03"); //Cuentan con un artefacto poderoso que podría ayudarnos a derrotar a los dragones.
	AI_Output (self, other, "DIA_Xardas_TODO_14_04"); //Lo llaman el Ojo de Innos. Tienes que hacerte con este artefacto.
	AI_Output (self, other, "DIA_Xardas_TODO_14_05"); //Informa a los paladines de esta amenaza. ¡Tienes que convencer a su jefe para que nos apoye!
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_07"); //Y cuando hayas hablado con él, tienes que buscar el artefacto de Beliar.
	AI_Output (self, other, "DIA_Addon_Xardas_Add_14_08"); //Es la contraparte del Ojo de Innos. No debe de caer en manos del mal.
	Log_CreateTopic (TOPIC_INNOSEYE, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE, LOG_RUNNING);
	B_LogEntry (TOPIC_INNOSEYE,"Hay un grupo de paladines acampados en la ciudad de Khorinis. Llevan encima un poderoso artefacto: el Ojo de Innos. Su poder debería ayudarnos a acabar con la amenaza de los dragones. Voy a tener que convencer a los paladines de que se unan a nuestra causa."); 
};

///////////////////////////////////////////////////////////////////////
//	Info StonePlate
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Xardas_StonePlate		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Xardas_StonePlate_Condition;
	information	 = 	DIA_Addon_Xardas_StonePlate_Info;

	description	 = 	"¿Puedes decirme algo sobre la tablilla de piedra?";
};
func int DIA_Addon_Xardas_StonePlate_Condition ()
{
	if (Npc_HasItems (other,ItWr_StonePlateCommon_Addon))
	{
		return TRUE;
	};
};
func void DIA_Addon_Xardas_StonePlate_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Xardas_StonePlate_15_00"); //¿Puedes decirme algo sobre la tablilla de piedra?
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_01"); //Ich habe so eine unten in der Höhlen vor meinem Turm gefunden.
	//AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_02"); //Sie sind in einer seltsam alten Sprache geschrieben, die ich in dieser Form noch nirgendwo gesehen habe.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_03"); //Al principio, creía que era un artefacto mágico, pero al final me di cuenta de que no tenía mucha importancia.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_04"); //No he podido descifrar el significado completo de la tablilla, pero parece hablar de la historia de una cultura muy antigua.
	AI_Output	(self, other, "DIA_Addon_Xardas_StonePlate_14_05"); //Si quieres la tablilla, quédatela. A mí no me sirve de nada.

	B_GivePlayerXP (XP_Ambient);
};


// ************************************************************
// ***														***
// 						Addon Report
// ***														***
// ************************************************************
// ------------------------------------------------------------
// 						Portal entdeckt
// ------------------------------------------------------------
instance DIA_Addon_Xardas_Portal (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_Portal_Condition;
	information	= DIA_Addon_Xardas_Portal_Info;

	description	= "Los Magos de Agua han descubierto un portal a una zona desconocida de la isla…";
};

func int DIA_Addon_Xardas_Portal_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_WhatsOrnament))
	&& (!C_SCHasBeliarsWeapon())
	&& (Saturas_KlaueInsMeer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_Portal_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_00"); //Los Magos de Agua han descubierto un portal a una zona desconocida de la isla
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_01"); //Interesante
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_02"); //¡En cuanto encuentres algo REALMENTE interesante, házmelo saber!
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_03"); //El artefacto de Beliar podría estar escondido por allí. ¡Búscalo!
};

// ------------------------------------------------------------
// 						Nochmal wegen Portal
// ------------------------------------------------------------
instance DIA_Addon_Xardas_PortalAgain (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_PortalAgain_Condition;
	information	= DIA_Addon_Xardas_PortalAgain_Info;
	permanent 	= TRUE;
	description	= "Sobre esa zona desconocida de la isla…";
};

func int DIA_Addon_Xardas_PortalAgain_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Xardas_Portal))
	&& (!C_SCHasBeliarsWeapon())
	&& (Saturas_KlaueInsMeer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_PortalAgain_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_17"); //Sobre esa zona desconocida de la isla
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_18"); //No me aburras con detalles. Vuelve cuando encuentres algo realmente útil.
};

// ------------------------------------------------------------
// 						Addon Success
// ------------------------------------------------------------
instance DIA_Addon_Xardas_AddonSuccess (C_INFO)
{
	npc		 	= NONE_100_Xardas;
	nr		 	= 1;
	condition	= DIA_Addon_Xardas_AddonSuccess_Condition;
	information	= DIA_Addon_Xardas_AddonSuccess_Info;

	description	= "He explorado la zona desconocida de la isla.";
};

func int DIA_Addon_Xardas_AddonSuccess_Condition ()
{
	if (C_SCHasBeliarsWeapon())
	|| (Saturas_KlaueInsMeer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Xardas_AddonSuccess_Info ()
{
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_03"); //He explorado la zona desconocida de la isla.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_04"); //¿Y qué has encontrado?
	AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_05"); //Buscaba un artefacto mágico, la Garra de Beliar.
	AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_06"); //¡¿La Garra de Beliar?! ¿Dónde está? ¿La llevas encima?

	if (C_SCHasBeliarsWeapon())
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_07"); //Sí, aquí está.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_08"); //(avaricioso) Qué interesante.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_09"); //Este arma puede sernos de gran utilidad, pero también es muy peligrosa.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_10"); //¡Cuídate mucho! ¡Y sobre todo, no la pierdas!
		B_GivePlayerXP (XP_Ambient*3);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_11"); //Ya no la tengo
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_12"); //Se la he dado a los Magos de Agua para que la tiraran al mar
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_13"); //(despotricando) ¿Estás mal de la cabeza? ¿Tienes idea de lo que has hecho?
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_14"); //¡Ese arma podría habernos sido de gran utilidad!
		AI_Output (other, self, "DIA_Addon_Xardas_AddonSuccess_15_15"); //Creo que es mejor así.
		AI_Output (self, other, "DIA_Addon_Xardas_AddonSuccess_14_16"); //(suspira) Los caminos de los dioses son inescrutables
	};
};

// --------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////

instance DIA_Xardas_WEAPON (C_INFO)		//E1
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	5;
	condition	 = 	DIA_Xardas_WEAPON_Condition;
	information	 = 	DIA_Xardas_WEAPON_Info;
	Permanent 	 =  FALSE;
	description	 = 	"Necesito armas.";
};

func int DIA_Xardas_WEAPON_Condition ()
{	
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_WEAPON_Info ()
{
	AI_Output (other, self, "DIA_Xardas_WEAPON_15_00"); //Necesito armas.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_01"); //Solo puedo darte lo poco que tengo aquí.
	AI_Output (self, other, "DIA_Xardas_WEAPON_14_02"); //Mira en mi torre. Quédate con todo lo que te parezca útil.
};


///////////////////////////////////////////////////////////////////////
//	Info ARTEFAKT
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_ARTEFAKT (C_INFO)	//E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	2;
	condition	 = 	DIA_Xardas_ARTEFAKT_Condition;
	information	 = 	DIA_Xardas_ARTEFAKT_Info;
	Permanent 	 =  FALSE;
	description	 = 	"¿Qué es exactamente el Ojo de Innos?";
};

func int DIA_Xardas_ARTEFAKT_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Xardas_TODO))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_ARTEFAKT_Info ()
{
	AI_Output (other, self, "DIA_Xardas_ARTEFAKT_15_00"); //¿Qué es exactamente el Ojo de Innos?
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_01"); //Es un amuleto. Cuenta la leyenda que el mismísimo Innos ha vertido una parte de su poder en este amuleto.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_02"); //Te devolverá parte de la fuerza que has perdido y nos ayudará a derrotar a los dragones.
	AI_Output (self, other, "DIA_Xardas_ARTEFAKT_14_03"); //También cuenta con otros poderes ocultos. Te contaré más cosas cuando te hagas con él.
};

///////////////////////////////////////////////////////////////////////
//	Info PALADIN
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PALADIN	(C_INFO) //E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	3;
	condition	 = 	DIA_Xardas_PALADIN_Condition;
	information	 = 	DIA_Xardas_PALADIN_Info;
	Permanent 	 =  FALSE;
	description	 = 	"¿Por qué me iban a entregar los paladines el Ojo de Innos?";
};
func int DIA_Xardas_PALADIN_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
func void DIA_Xardas_PALADIN_Info ()
{
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_00"); //¿Por qué me iban a entregar los paladines el Ojo de Innos?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_01"); //Porque eres el predestinado para llevarlo.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_02"); //¿Cómo puedes saberlo?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_03"); //Hay varias razones, y la más importante es que has derrotado al Durmiente. Si no fueras el preferido de los dioses, a estas alturas ya habrías muerto.
	AI_Output (other, self, "DIA_Xardas_PALADIN_15_04"); //Supongamos que tienes razón y que estoy predestinado para llevar el Ojo de Innos. ¿Cómo van a saber los paladines que es cierto?
	AI_Output (self, other, "DIA_Xardas_PALADIN_14_05"); //El Ojo escoge a su portador. Cuando te hagas con él y te lo pongas, los paladines no podrán dudar de tu palabra.
};
///////////////////////////////////////////////////////////////////////
//	Info Khorinis
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_Khorinis (C_INFO) //E2 nach TODO
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	4;
	condition	 = 	DIA_Xardas_Khorinis_Condition;
	information	 = 	DIA_Xardas_Khorinis_Info;
	Permanent 	 =  FALSE;
	description	 = 	"¿Cómo se va a la ciudad?";
};
func int DIA_Xardas_Khorinis_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_TODO))
	&& (Lothar.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};
func void DIA_Xardas_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Khorinis_15_00"); //¿Cómo se va a la ciudad?
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_01"); //Sigue el camino y atraviesa las montañas. La ciudad es grande y no tiene pérdida.
	AI_Output (self, other, "DIA_Xardas_Khorinis_14_02"); //¡Pero ten cuidado! El camino hasta la ciudad no está libre de peligros, y no eres tan fuerte como antes.
};
// ************************************************************
// 			  		Zum zweiten Mal bei Xardas
// ************************************************************

instance DIA_Xardas_WhereEx (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	6;
	condition	 = 	DIA_Xardas_WhereEx_Condition;
	information	 = 	DIA_Xardas_WhereEx_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿Dónde estamos exactamente?";
};

func int DIA_Xardas_WhereEx_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_WhereEx_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Add_15_00"); //¿Dónde estamos exactamente?
	AI_Output (self, other, "DIA_Xardas_Add_14_01"); //Como ya te he dicho, cerca de la ciudad de Khorinis.
	AI_Output (self, other, "DIA_Xardas_Add_14_02"); //Aquí he reconstruido mi torre.
	AI_Output (other, self, "DIA_Xardas_Add_15_03"); //Pero solo han pasado unos días desde la última vez que nos vimos en el Valle de las Minas...
	AI_Output (self, other, "DIA_Xardas_Add_14_04"); //Los sirvientes que he convocado para construir la torre han hecho un gran trabajo...
	AI_Output (other, self, "DIA_Xardas_Add_15_05"); //Y que lo digas.
};

instance DIA_Xardas_EQUIPMENT (C_INFO) //BACK AGAIN
{
	npc			 = 	NONE_100_Xardas;
	nr			 = 	7;
	condition	 = 	DIA_Xardas_EQUIPMENT_Condition;
	information	 = 	DIA_Xardas_EQUIPMENT_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿Dónde puedo encontrar mejor equipo?";
};

func int DIA_Xardas_EQUIPMENT_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_WEAPON))
	&& (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_EQUIPMENT_Info ()
{
	AI_Output (other, self, "DIA_Xardas_EQUIPMENT_15_00"); //¿Dónde puedo encontrar mejor equipo?
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_01"); //El lugar más cercano para encontrar mejores armas y armaduras es la ciudad de Khorinis.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_02"); //Pero en el valle puedes recoger hierbas medicinales que te vendrán bien si resultas herido en un combate.
	AI_Output (self, other, "DIA_Xardas_EQUIPMENT_14_03"); //Mira el lago que hay frente a mi torre. De allí sale un pasadizo secreto que lleva al valle.
};
///////////////////////////////////////////////////////////////////////
//	Info ABOUTLESTER
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_ABOUTLESTER		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	5;
	condition	 = 	DIA_Xardas_ABOUTLESTER_Condition;
	information	 = 	DIA_Xardas_ABOUTLESTER_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿Has hablado ya con Lester?";
};
func int DIA_Xardas_ABOUTLESTER_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lester_SEND_XARDAS)
	&& (Npc_GetDistToWP  (Lester,"NW_XARDAS_TOWER_IN1_31") <= 500)) 
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Xardas_ABOUTLESTER_Info ()
{
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_00"); //¿Has hablado ya con Lester?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_01"); //Sí, le he acribillado a preguntas. Me contó muchas cosas, pero está agotado.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_02"); //Es casi un milagro que haya sobrevivido a esta fuga. Le he mandado a la cama.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_03"); //¿Qué te ha contado?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_04"); //Nada bueno, me temo. No solo ha visto dragones, sino también hombres encapuchados con túnicas negras.
	AI_Output (other, self, "DIA_Xardas_ABOUTLESTER_15_05"); //¿Y?
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_06"); //Si esos hombres existen, su presencia supondrá una posible amenaza.
	AI_Output (self, other, "DIA_Xardas_ABOUTLESTER_14_07"); //Y eso no me gusta. Ten, toma mi anillo. Te protegerá de la magia.
	
	B_GiveInvItems (self, other, ItRi_Prot_Mage_01,1);
	B_GivePlayerXP		(XP_Ambient);

};

// *************************************************************
// -------------------------------------------------------------
//						NACH erstem Exit !!!
// -------------------------------------------------------------
// ************************************************************				//x

///////////////////////////////////////////////////////////////////////
//	Bei Paladinen gewesen
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_FirstPal		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	10;
	condition	 = 	DIA_Xardas_FirstPal_Condition;
	information	 = 	DIA_Xardas_FirstPal_Info;
	permanent	 = 	FALSE;
	description	 = 	"He ido a la ciudad...";
};
func int DIA_Xardas_FirstPal_Condition ()
{	
	if (Lothar.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Xardas_FirstPal_Info ()
{
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_00"); //He ido a la ciudad...
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_01"); //¿Y? ¿Has conseguido hablar con el jefe de los paladines?
	AI_Output (other, self, "DIA_Xardas_FirstPal_15_02"); //No me han dejado verlo...
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_03"); //¡Tonterías! Debes encontrar la manera de verlo.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_04"); //Si todo lo demás falla, ingresa en el monasterio y conviértete en mago.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_05"); //Podría considerarse moralmente cuestionable, pero te permitiría conseguir lo que buscas.
	AI_Output (self, other, "DIA_Xardas_FirstPal_14_06"); //Si fueras mago, sin duda tendría que verte.
};

///////////////////////////////////////////////////////////////////////
//	Info Weiter (Perm)
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_Weiter		(C_INFO)
{	
	npc			 = 	NONE_100_Xardas;
	nr			 = 	99;
	condition	 = 	DIA_Xardas_Weiter_Condition;
	information	 = 	DIA_Xardas_Weiter_Info;
	permanent	 = 	TRUE;
	description	 = 	"¿Y ahora qué hacemos?";
};
func int DIA_Xardas_Weiter_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Xardas_Weiter_Info ()
{
	AI_Output (other, self, "DIA_Xardas_Weiter_15_00"); //¿Y ahora qué hacemos?
	AI_Output (self, other, "DIA_Xardas_Weiter_14_01"); //Seguiremos con el plan. No queda más remedio.
	AI_Output (self, other, "DIA_Xardas_Weiter_14_02"); //Ve a por el Ojo de Innos, y yo seguiré investigando.
};

INSTANCE DIA_Xardas_KdfSecret (C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 9;
	condition	= DIA_Xardas_KdfSecret_Condition;
	information	= DIA_Xardas_KdfSecret_Info;
	permanent	= FALSE;
	description = "¿Por qué no puede saber nada de ti el Círculo de Fuego?";
};                       

FUNC INT DIA_Xardas_KdfSecret_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Xardas_FirstEXIT))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Xardas_KdfSecret_Info()
{	
	AI_Output	(other, self,"DIA_Xardas_KdfSecret_15_00");	//¿Por qué no puede saber nada de ti el Círculo de Fuego?
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_01");	//Yo era un miembro de alto rango del Círculo. En aquel entonces ya sospechaba que la magia demoníaca podría ser la clave de la barrera mágica.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_02"); //Aun así, no logré convencer a los demás miembros del Círculo de que siguieran esa senda.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_03"); //Por eso dejé el Círculo para estudiar las Artes Negras.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_04"); //Ésa es una falta que los magos del fuego, (insidioso) los ''ordenados de Innos'', los siempre ''bondadosos'' y ''virtuosos'', jamás perdonarán.
	AI_Output	(self, other,"DIA_Xardas_KdfSecret_14_05"); //Están seguros de que sigo vivo, pero no tienen ni idea de dónde encontrarme... y eso también es algo bueno.
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

INSTANCE DIA_Xardas_KAP3_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP3_EXIT_Condition;
	information	= DIA_Xardas_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BACKFROMOW		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	31;
	condition	 = 	DIA_Xardas_BACKFROMOW_Condition;
	information	 = 	DIA_Xardas_BACKFROMOW_Info;

	description	 = 	"He vuelto del Valle de las Minas.";
};

func int DIA_Xardas_BACKFROMOW_Condition ()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_BACKFROMOW_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_00"); //He vuelto del Valle de las Minas.
	AI_Output			(self, other, "DIA_Xardas_BACKFROMOW_14_01"); //Ya era hora. ¿Qué has visto?
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_02"); //Tenías razón. La región ha sido invadida por un ejército del enemigo.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_03"); //Los orcos sitian el castillo y los dragones han arrasado por completo varias zonas.
	AI_Output			(other, self, "DIA_Xardas_BACKFROMOW_15_04"); //Si no me equivoco, no tardarán en atacar Khorinis.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info DmtSindDa
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_DMTSINDDA		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	32;
	condition	 = 	DIA_Xardas_DMTSINDDA_Condition;
	information	 = 	DIA_Xardas_DMTSINDDA_Info;

	description	 = 	"¿Qué demonios ha pasado aquí entretanto?";
};

func int DIA_Xardas_DMTSINDDA_Condition ()
{
	if (Kapitel == 3)	
		&& (Npc_KnowsInfo(other, DIA_Xardas_BACKFROMOW))
	{
		return TRUE;
	};
};

func void DIA_Xardas_DMTSINDDA_Info ()
{

 	if (Npc_KnowsInfo(other, DIA_Lester_BACKINTOWN))
	{
		AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_00"); //Lester me dijo que querías verme de inmediato.
	};
	
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_15_01"); //¿Qué demonios ha pasado aquí entretanto?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_02"); //El enemigo ha averiguado quién eres y que planeas hacerte con el Ojo de Innos.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_03"); //Ha reconocido la amenaza, y eso le ha obligado a salir de su escondrijo y atacar abiertamente.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_14_04"); //Se acabó la partida de escondite. Ayer nadie sabía la forma que adoptaría el ataque del enemigo. Hoy ha quedado muy claro.

	B_LogEntry (TOPIC_INNOSEYE, "El enemigo ha descubierto que estoy buscando el Ojo de Innos. Debo encotrarlo ya, antes de que sea demasiado tarde.");
	
	Info_ClearChoices	(DIA_Xardas_DMTSINDDA);
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Me atacaron unos magos de túnicas negras.", DIA_Xardas_DMTSINDDA_DMT );
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "Por fin tengo la prueba que quería lord Hagen.", DIA_Xardas_DMTSINDDA_Beweis );

};

func void DIA_Xardas_DMTSINDDA_DMT ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_15_00"); //Me atacaron unos magos de túnicas negras.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_01"); //El enemigo tiene muchos rostros y los buscadores son algunos de ellos. Son los que preparan el terreno al enemigo.
 	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_02"); //Se han apostado en lugares estratégicos y esperan una oportunidad para activar la trampa.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_14_03"); //Aléjate de ellos. Son seres mágicos muy poderosos y tratarán de detenerte a toda costa.
	
	if (hero.guild == GIL_KDF)
	{
	Log_CreateTopic (TOPIC_DEMENTOREN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
	B_LogEntry (TOPIC_DEMENTOREN,"Xardas conocía a los hombres de las túnicas negras. Parece que los buscadores son los que manejan los hilos en el bando del enemigo y son muy peligrosos."); 
	};
};

func void DIA_Xardas_DMTSINDDA_Beweis ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_00"); //Por fin tengo la prueba que me exigía lord Hagen.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_01"); //¿Qué prueba es ésa?
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_Beweis_15_02"); //He recibido una carta de Garond, el comandante de los paladines del Valle de las Minas, en la que solicita refuerzos.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_Beweis_14_03"); //Eso debería bastar para convencer a ese guerrero batallador. Muy bien.
	
	Info_AddChoice	(DIA_Xardas_DMTSINDDA, "¿Cuál será el siguiente paso?", DIA_Xardas_DMTSINDDA_DMT_WhatToDo );
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Xardas_DMTSINDDA_DMT_WhatToDo ()
{
	AI_Output			(other, self, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00"); //¿Cuál será el siguiente paso?
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01"); //Llévale la carta de Garond a lord Hagen para que te permita acceder al Ojo de Innos.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02"); //Luego ve al monasterio y habla con Pyrokar. Él te dará el Ojo.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03"); //Lo más importante es poner a salvo el artefacto.
	AI_Output			(self, other, "DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04"); //Vete antes de que sea demasiado tarde. El enemigo también intentará apoderarse de él.
	B_LogEntry (TOPIC_INNOSEYE, "El Ojo está en el monasterio de los magos de fuego. Espero que lord Hagen me permita acceder a él cuando le dé el mensaje de lord Garond. El jefe de los magos de fuego, Pyrokar, no me dejará acercarme al amuleto si no cuento con la aprobación de Hagen.");
};

///////////////////////////////////////////////////////////////////////
//	Info InnosEyeBroken
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_INNOSEYEBROKEN		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	33;
	condition	 = 	DIA_Xardas_INNOSEYEBROKEN_Condition;
	information	 = 	DIA_Xardas_INNOSEYEBROKEN_Info;

	description	 = 	"El Ojo de Innos ha sido destruido.";
};

func int DIA_Xardas_INNOSEYEBROKEN_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_KnowsInfo(other, DIA_Xardas_DMTSINDDA))
		&& ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE))	
	{
		return TRUE;
	};
};

func void DIA_Xardas_INNOSEYEBROKEN_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_00"); //El Ojo de Innos ha sido destruido.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_01"); //¿Qué dices? ¡Destruido!
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_15_02"); //Lo encontré en los bosques del norte. Por desgracia, solo he podido recuperar sus fragmentos.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_14_03"); //Era la única posibilidad que teníamos de resistirnos a esos dragones, y la hemos perdido. Hemos fracasado.

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	B_GivePlayerXP (XP_Ambient);
	
	Info_ClearChoices	(DIA_Xardas_INNOSEYEBROKEN);
	Info_AddChoice	(DIA_Xardas_INNOSEYEBROKEN, "¿Y ahora qué?", DIA_Xardas_INNOSEYEBROKEN_wasnun );


};
func void DIA_Xardas_INNOSEYEBROKEN_wasnun ()
{
	AI_Output			(other, self, "DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00"); //¿Y ahora qué?
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01"); //Esto supone un duro golpe. Tenemos que reorientarnos. Me retiraré a meditar.
	AI_Output			(self, other, "DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02"); //Entretanto, ve a la ciudad y habla con Vatras, el mago del agua. No me extrañaría que supiese lo que hay que hacer.

	B_LogEntry (TOPIC_INNOSEYE, "Xardas no estaba muy contento que digamos con las destrucción del Ojo de Innos. Vatras, el mago de agua de la ciudad de Khorinis, parece ser ahora mismo nuestra única esperanza.");

	MIS_Xardas_GoToVatrasInnoseye = LOG_RUNNING;
};


///////////////////////////////////////////////////////////////////////
//	Info RitualRequest
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_RITUALREQUEST		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	34;
	condition	 = 	DIA_Xardas_RITUALREQUEST_Condition;
	information	 = 	DIA_Xardas_RITUALREQUEST_Info;

	description	 = 	"Me manda Vatras.";
};

func int DIA_Xardas_RITUALREQUEST_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Xardas_INNOSEYEBROKEN))
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_RITUALREQUEST_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_00"); //Me manda Vatras.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_01"); //Muy bien. ¿Qué ha dicho?
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_02"); //Dijo algo de un ritual de inversión en el Círculo del Sol.
	AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_03"); //(Se ríe) Qué viejo más astuto. Creo que sé lo que pretende. Has venido para decirme que vaya a verle.
	AI_Output			(other, self, "DIA_Xardas_RITUALREQUEST_15_04"); //Eso parece. ¿Cuándo te marchas?

	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_DJG)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_05"); //No debo hacer esperar a Vatras. Me pondré en marcha de inmediato. Cumple con tus obligaciones y luego reúnete conmigo.
		AI_StopProcessInfos (self);
		B_LogEntry (TOPIC_INNOSEYE, "Xardas ha accedido a acudir al ritual del círculo del sol.");
		B_GivePlayerXP (XP_Ambient);
		Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair");
		Xardas_GoesToRitualInnosEye = TRUE; 
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_RITUALREQUEST_14_06"); //Solo colaboraré en el ritual cuando tenga claro que estás preparado para enfrentarte a los dragones.
	};	
	B_GivePlayerXP (XP_Ambient);

};


///////////////////////////////////////////////////////////////////////
//	Info warumnichtjetzt
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WARUMNICHTJETZT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	34;
	condition	 = 	DIA_Xardas_WARUMNICHTJETZT_Condition;
	information	 = 	DIA_Xardas_WARUMNICHTJETZT_Info;

	description	 = 	"¿Por qué no vas a ver a Vatras ahora mismo?";
};

func int DIA_Xardas_WARUMNICHTJETZT_Condition ()
{
	if  (Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
	&&	(Xardas_GoesToRitualInnosEye == FALSE)
	&& 	((hero.guild == GIL_MIL)
	|| 	 (hero.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Xardas_WARUMNICHTJETZT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_00"); //¿Por qué no vas a ver a Vatras ahora mismo?
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_15_01"); //En ocasiones no te entiendo.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_14_02"); //(Molesto) No me hables en ese tono. Si no fuera por mí, tu cuerpo maltrecho aún se estaría pudriendo en aquel templo.

	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Da igual. Dime qué tengo que hacer.", DIA_Xardas_WARUMNICHTJETZT_wastun );
	Info_AddChoice	(DIA_Xardas_WARUMNICHTJETZT, "Al menos explícame por qué dudas.", DIA_Xardas_WARUMNICHTJETZT_grund );
};
func void DIA_Xardas_WARUMNICHTJETZT_grund ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_grund_15_00"); //Al menos explícame por qué dudas.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_01"); //Desde que abandoné a los magos del fuego, me he mantenido bien lejos de ellos.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_02"); //Y, a menos que no me quede más remedio, no quiero que eso cambie.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_03"); //Pero antes de exponerme a las miradas de reproche de los magos, quiero asegurarme de que tienes alguna posibilidad contra los dragones.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_grund_14_04"); //Sin embargo, no llegarás lejos con tu pésimo equipo. Vuelve, pero solo cuando seas lo bastante fuerte.
  	AI_StopProcessInfos (self);
};

func void DIA_Xardas_WARUMNICHTJETZT_wastun  ()
{
	AI_Output			(other, self, "DIA_Xardas_WARUMNICHTJETZT_wastun_15_00"); //Da igual. Dime qué tengo que hacer.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_01"); //Todavía eres demasiado débil para luchar contra los dragones. Con este equipo no tienes ninguna posibilidad.
	AI_Output			(self, other, "DIA_Xardas_WARUMNICHTJETZT_wastun_14_02"); //No vuelvas hasta que estés mejor preparado. Solo entonces iré a reunirme con Vatras.
 	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info bereit
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BEREIT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	condition	 = 	DIA_Xardas_BEREIT_Condition;
	information	 = 	DIA_Xardas_BEREIT_Info;

	description	 = 	"Estoy listo para luchar contra los dragones.";
};

func int DIA_Xardas_BEREIT_Condition ()
{
	if  (Xardas_GoesToRitualInnosEye == FALSE)
	&& 	(Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))	
	&&	((hero.guild == GIL_DJG)
	||   (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Xardas_BEREIT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BEREIT_15_00"); //Estoy listo para luchar contra los dragones.
	AI_Output			(self, other, "DIA_Xardas_BEREIT_14_01"); //En ese caso, no debemos perder más tiempo. Saldré de inmediato hacia el Círculo del Sol. Cumple con tus obligaciones. Te veré allí.
	AI_StopProcessInfos (self);
	B_LogEntry (TOPIC_INNOSEYE, "Xardas ha accedido a acudir al ritual del círculo del sol.");
	B_GivePlayerXP (XP_Ambient);
	Npc_ExchangeRoutine	(self,"RitualInnosEyeRepair"); 
	Xardas_GoesToRitualInnosEye = TRUE; 
};

///////////////////////////////////////////////////////////////////////
//	Info bingespannt
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_BINGESPANNT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	35;
	condition	 = 	DIA_Xardas_BINGESPANNT_Condition;
	information	 = 	DIA_Xardas_BINGESPANNT_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿El ritual de inversión va a funcionar?";
};

func int DIA_Xardas_BINGESPANNT_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		&& 	(Xardas_GoesToRitualInnosEye == TRUE)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_BINGESPANNT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_BINGESPANNT_15_00"); //¿El ritual de inversión va a funcionar?
	AI_Output			(self, other, "DIA_Xardas_BINGESPANNT_14_01"); //No estoy seguro. Depende de lo que vaya a hacer Vatras.
};

///////////////////////////////////////////////////////////////////////
//	Info PyroWillNicht
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PYROWILLNICHT		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	37;
	condition	 = 	DIA_Xardas_PYROWILLNICHT_Condition;
	information	 = 	DIA_Xardas_PYROWILLNICHT_Info;

	description	 = 	"Pyrokar se niega a presentarse en el ritual.";
};

func int DIA_Xardas_PYROWILLNICHT_Condition ()
{
	if (Pyrokar_DeniesInnosEyeRitual == TRUE)
		&& (Npc_KnowsInfo(other, DIA_Xardas_RITUALREQUEST))
		&& (Kapitel == 3)
		{
				return TRUE;
		};
};

func void DIA_Xardas_PYROWILLNICHT_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_00"); //Pyrokar se niega a presentarse en el ritual.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_01"); //Primero quiere pruebas de que puede fiarse de ti.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_02"); //¿Ah, sí? Pyrokar... qué interesante.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_03"); //Ese vejestorio se está convirtiendo en un incordio, pero creo que tengo algo para ti que será de utilidad.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_04"); //Cuando abandoné la orden de los magos del fuego, me llevé unas cuantas cosas del monasterio.
	//AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_05"); //Jetzt, da ich meinen Turm so nahe der Stadt errichtet habe, muss ich ständig damit rechnen, dass jemand hierher kommt, um danach zu suchen.
	//"hier" passt nicht, weil Xardas am Steinkreis stehen könnte - Satz ist eh überflüssig
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_06"); //No quería que un pelotón de paladines o de magos del fuego pusieran patas arriba la torre y las encontraran.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_07"); //Por eso las escondí en lugares seguros donde los magos no las buscarían.
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_08"); //¿Dónde?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_09"); //Algunas están guardadas en un cofre en la granja de Sekob.
	Sekob_RoomFree = TRUE;
	AI_Output			(other, self, "DIA_Xardas_PYROWILLNICHT_15_10"); //¿Confías en ese tal Sekob?
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_11"); //No, pero se deja sobornar y no hace preguntas embarazosas. Además, el cofre está cerrado con llave. Aquí tienes la llave.

	CreateInvItems 		(self, ItKe_CHEST_SEKOB_XARDASBOOK_MIS, 1);					
	B_GiveInvItems 		(self, other, ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);

	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_12"); //Entre esas cosas hay un libro muy antiguo. Cuando Pyrokar lo vea, sabrá que viene de mí.
	AI_Output			(self, other, "DIA_Xardas_PYROWILLNICHT_14_13"); //Ya no me sirve de nada, y al menos puede ser útil para esto.
	B_LogEntry (TOPIC_INNOSEYE, "Xardas me ha dado la llave del cofre de la granja de Sekob. Debo darle a Pyrokar el libro que está en su interior.");
};


///////////////////////////////////////////////////////////////////////
//	Info RitualInnosEyeRepairImportant
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_RitualInnosEyeRepairImportant		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	36;
	condition	 = 	DIA_Xardas_RitualInnosEyeRepairImportant_Condition;
	information	 = 	DIA_Xardas_RitualInnosEyeRepairImportant_Info;
	important	 = 	TRUE;

};

func int DIA_Xardas_RitualInnosEyeRepairImportant_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_RitualInnosEyeRepairImportant_Info ()
{
	AI_Output (self, other, "DIA_Xardas_Add_14_06"); //¡Ahora que el Ojo de Innos está curado, debes enfrentarte a los dragones!
	AI_Output (self, other, "DIA_Xardas_Add_14_07"); //Todos sirven a Beliar, el dios de las tinieblas.
	AI_Output (self, other, "DIA_Xardas_Add_14_08"); //Pero debe de haber un poder terrenal que los controla. Ese particular me ha quedado claro.
	AI_Output (self, other, "DIA_Xardas_Add_14_09"); //Averigua cuál es el origen de su poder.
	AI_Output (self, other, "DIA_Xardas_Add_14_10"); //En cuanto lo hayas averiguado, vuelve conmigo.
	
	Info_ClearChoices	(DIA_Xardas_RitualInnosEyeRepairImportant);
	Info_AddChoice	(DIA_Xardas_RitualInnosEyeRepairImportant, DIALOG_ENDE, DIA_Xardas_RitualInnosEyeRepairImportant_weiter );

};		

 func void DIA_Xardas_RitualInnosEyeRepairImportant_weiter()
 {
	AI_StopProcessInfos (self);
	B_StartOtherRoutine (Xardas,"Start");
  	B_StartOtherRoutine	(Vatras,"Start");

 };

///////////////////////////////////////////////////////////////////////
//	Info wasnun
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_WASNUN		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	36;
	condition	 = 	DIA_Xardas_WASNUN_Condition;
	information	 = 	DIA_Xardas_WASNUN_Info;
	permanent	 = 	TRUE;

	description	 = 	"El Ojo de Innos está curado. ¿Qué viene a continuación?";
};

func int DIA_Xardas_WASNUN_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Xardas_WASNUN_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_WASNUN_15_00"); //El Ojo de Innos está curado. ¿Qué viene a continuación?
	AI_Output			(self, other, "DIA_Xardas_WASNUN_14_01"); //No te olvides de llevarlo puesto cuando te enfrentes a los dragones.

	if (MIS_ReadyforChapter4 == TRUE)
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_02"); //No pierdas tiempo. Ve al Valle de las Minas y mata a esos dragones.
	}
	else
	{
		AI_Output			(self, other, "DIA_Xardas_WASNUN_14_03"); //Ve a ver a Pyrokar y haz que te explique cómo se usa el Ojo.
	};
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

INSTANCE DIA_Xardas_KAP4_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP4_EXIT_Condition;
	information	= DIA_Xardas_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Xardas_PERM4		(C_INFO)
{
	npc		 = 	NONE_100_Xardas;
	nr		 = 	40;
	condition	 = 	DIA_Xardas_PERM4_Condition;
	information	 = 	DIA_Xardas_PERM4_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Qué hay de nuevo?";
};

func int DIA_Xardas_PERM4_Condition ()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};

func void DIA_Xardas_PERM4_Info ()
{
	AI_Output			(other, self, "DIA_Xardas_PERM4_15_00"); //¿Qué hay de nuevo?
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_01"); //Los buscadores todavía no se han marchado. No descansarán hasta que no te hayan dado caza.
	AI_Output			(self, other, "DIA_Xardas_PERM4_14_02"); //Mata a los dragones del Valle de las Minas y averigua quién está detrás de esos ataques. Si no, su fuerza no dejará de aumentar.

};


//#####################################################################
//##
//##
//##							KAPITEL 5 //Xardas ist weg!!
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Xardas_KAP5_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP5_EXIT_Condition;
	information	= DIA_Xardas_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6 //Xardas ist auf der Dracheninsel ->neue Instanz!!!
//##
//##
//#####################################################################



INSTANCE DIA_Xardas_KAP6_EXIT(C_INFO)
{
	npc			= NONE_100_Xardas;
	nr			= 999;
	condition	= DIA_Xardas_KAP6_EXIT_Condition;
	information	= DIA_Xardas_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Xardas_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Xardas_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



























































