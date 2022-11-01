///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Orlan_EXIT   (C_INFO)
{
	npc         = BAU_970_Orlan;
	nr          = 999;
	condition   = DIA_Orlan_EXIT_Condition;
	information = DIA_Orlan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Orlan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Orlan_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Wein
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_Wein		(C_INFO)
{
	npc			 = 	BAU_970_Orlan;
	nr			 = 	3;
	condition	 = 	DIA_Orlan_Wein_Condition;
	information	 = 	DIA_Orlan_Wein_Info;
	permanent 	 =  FALSE;
	description	 = 	"Traigo el vino del monasterio.";
};
func int DIA_Orlan_Wein_Condition ()
{	
	if (MIS_GoraxWein == LOG_RUNNING)
	&& (Npc_HasItems (other, ItFo_Wine) >= 12)
	{
		return TRUE;
	};
};
func void DIA_Orlan_Wein_Info ()
{
	AI_Output (other, self, "DIA_Orlan_Wein_15_00"); //Traigo el vino del monasterio.
	AI_Output (self, other, "DIA_Orlan_Wein_05_01"); //Magnífico. Lo estaba esperando.
	AI_Output (self, other, "DIA_Orlan_Wein_05_02"); //Ya he acordado el precio con maese Gorax. Ahora mismo te doy las 100 monedas de oro.
	
	Info_ClearChoices (DIA_Orlan_Wein);
	
	Info_AddChoice (DIA_Orlan_Wein,"Muy bien. Entonces, dame el oro.",DIA_Orlan_Wein_JA);
	Info_AddChoice (DIA_Orlan_Wein,"¿Quieres hacerme una jugarreta?",DIA_Orlan_Wein_NEIN);
};
FUNC VOID DIA_Orlan_Wein_JA()
{
	AI_Output (other, self, "DIA_Orlan_Wein_JA_15_00"); //Muy bien. Entonces, dame el oro.
	AI_Output (self, other, "DIA_Orlan_Wein_JA_05_01"); //Aquí tienes. Ha sido un placer hacer negocios contigo.
	
	B_GiveInvItems (self, other, ItmI_Gold, 100);
	B_GiveInvItems (other, self, ItFo_Wine, 12);
	
	Info_ClearChoices (DIA_Orlan_Wein);
};
FUNC VOID DIA_Orlan_Wein_NEIN()
{
	AI_Output (other, self, "DIA_Orlan_Wein_NEIN_15_00"); //¿Quieres hacerme una jugarreta? Son 240 monedas de oro.
	AI_Output (self, other, "DIA_Orlan_Wein_NEIN_05_01"); //Así que Gorax te ha avisado, ¿eh? Muy bien. A lo mejor podemos llegar a un acuerdo. Mira, voy a darte 100 monedas de oro por el vino.
	AI_Output (self, other, "DIA_Orlan_Wein_NEIN_05_02"); //Si le dices a Gorax que te he engañado, te doy cuatro pergaminos de hechizos.
	
	Info_ClearChoices (DIA_Orlan_Wein);
	Info_AddChoice (DIA_Orlan_Wein,"Limítate a darme las 240 monedas de oro.",DIA_Orlan_Wein_Nie);
	Info_AddChoice (DIA_Orlan_Wein,"Vale, me parece justo. Dame esos pergaminos de hechizos.",DIA_Orlan_Wein_Okay);
	Info_AddChoice (DIA_Orlan_Wein,"¿Qué clase de pergaminos son?",DIA_Orlan_Wein_Was);
};
FUNC VOID DIA_Orlan_Wein_Nie()
{
	AI_Output (other, self, "DIA_Orlan_Wein_Nie_15_00"); //Limítate a darme las 240 monedas de oro.
	AI_Output (self, other, "DIA_Orlan_Wein_Nie_05_01"); //No quieres hacer negocios, ¿eh? Muy bien, aquí tienes el oro.
	
	B_GiveInvItems (self, other, ItmI_Gold, 240);
	B_GiveInvItems (other, self, ItFo_Wine, 12);
	
	Info_ClearChoices (DIA_Orlan_Wein);
};
FUNC VOID DIA_Orlan_Wein_Okay()
{
	var string Text;
		
	Text = ConcatStrings( "4" , PRINT_ItemsErhalten);		
	PrintScreen	(Text, -1, -1, FONT_ScreenSmall, 2);
	
	B_GiveInvItems (self, other, ItmI_Gold, 100);
	
	AI_Output (other, self, "DIA_Orlan_Wein_Okay_15_00"); //Vale, me parece justo. Dame esos pergaminos de hechizos.
	AI_Output (self, other, "DIA_Orlan_Wein_Okay_05_01"); //Aquí tienes los pergaminos de hechizos y el oro.
	
	B_GiveInvItems (other, self, ItFo_Wine, 12);
	
	
	CreateInvItems  (hero,ITSC_Light,2);
	CreateInvItems  (hero,ItSc_LightHeal,1);
	CreateInvItems  (hero,ItSc_SumGobSkel,1);
	
	Info_ClearChoices (DIA_Orlan_Wein);
};
FUNC VOID DIA_Orlan_Wein_Was()
{
	AI_Output (other, self, "DIA_Orlan_Wein_Was_15_00"); //¿Qué clase de pergaminos son?
	AI_Output (self, other, "DIA_Orlan_Wein_Was_05_01"); //No tengo ni la menor idea. Son de un huésped que... eh... se los dejó olvidados... eso es.
};
///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_WERBISTDU		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	2;
	condition	 = 	DIA_Orlan_WERBISTDU_Condition;
	information	 = 	DIA_Orlan_WERBISTDU_Info;

	description	 = 	"¿Quién eres tú?";
};

func int DIA_Orlan_WERBISTDU_Condition ()
{
	return TRUE;
};

func void DIA_Orlan_WERBISTDU_Info ()
{
	AI_Output			(other, self, "DIA_Orlan_WERBISTDU_15_00"); //¿Quién eres tú?
	AI_Output			(self, other, "DIA_Orlan_WERBISTDU_05_01"); //Soy Orlan, el dueño de este modesto mesón.
	AI_Output			(self, other, "DIA_Orlan_WERBISTDU_05_02"); //¿Qué buscas, forastero? ¿Una espada decente o una armadura de calidad?
	AI_Output			(self, other, "DIA_Orlan_WERBISTDU_05_03"); //¿Un buen trago de los alambiques del campo o algo de información?
	AI_Output			(self, other, "DIA_Orlan_WERBISTDU_05_04"); //Si oigo el sonido de tus monedas, puedo ofrecerte todo esto y mucho más.

};

///////////////////////////////////////////////////////////////////////
//	Info Greg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_Greg		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Orlan_Greg_Condition;
	information	 = 	DIA_Addon_Orlan_Greg_Info;

	description	 = 	"¿Conoces a ese tipo con parche?";
};

func int DIA_Addon_Orlan_Greg_Condition ()
{
	if (SC_SawGregInTaverne == TRUE)
	&& (Kapitel <= 3)
	&& (Npc_KnowsInfo (other, DIA_Orlan_WERBISTDU))
		{
			return TRUE;
		};
};

func void DIA_Addon_Orlan_Greg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Orlan_Greg_15_00"); //¿Conoces a ese tipo con parche?
	AI_Output	(self, other, "DIA_Addon_Orlan_Greg_05_01"); //Lo he visto antes por aquí. Menudo elemento.
	AI_Output	(self, other, "DIA_Addon_Orlan_Greg_05_02"); //Cuando vino, se mudó a una de mis habitaciones de arriba, con una caja grande.
	AI_Output	(self, other, "DIA_Addon_Orlan_Greg_05_03"); //Teníamos que reclamarle constantemente que pagara el alquiler de la habitación. Y aún así, se tomó su tiempecito.
	AI_Output	(self, other, "DIA_Addon_Orlan_Greg_05_04"); //Entonces, un día, desapareció sin más junto con su caja. No quiero tener nada que ver con tipos así.
};

///////////////////////////////////////////////////////////////////////
//	Info Ranger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_Ranger		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Orlan_Ranger_Condition;
	information	 = 	DIA_Addon_Orlan_Ranger_Info;

	description	 = 	"¿Estoy paranoico o no dejas de mirar mi anillo?";
};
func int DIA_Addon_Orlan_Ranger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Orlan_WERBISTDU))
	&& (SCIsWearingRangerRing == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Orlan_Ranger_Info ()
{
	AI_Output (other, self, "DIA_Addon_Orlan_Ranger_15_00"); //¿Estoy paranoico o no dejas de mirar mi anillo?
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_05_01"); //No sé muy bien cómo interpretarlo.

	Orlan_KnowsSCAsRanger = TRUE;

	Info_ClearChoices	(DIA_Addon_Orlan_Ranger);
	Info_AddChoice	(DIA_Addon_Orlan_Ranger, "¡Amigo! ¡Pertenezco al 'Anillo de Agua'!", DIA_Addon_Orlan_Ranger_Idiot);
	Info_AddChoice	(DIA_Addon_Orlan_Ranger, "Es una aguamarina. ¿Has visto ya alguna?", DIA_Addon_Orlan_Ranger_Aqua);
};
func void DIA_Addon_Orlan_Ranger_Aqua()
{
	AI_Output (other, self, "DIA_Addon_Orlan_Ranger_Aqua_15_00"); //Es una aguamarina. ¿Habías visto alguna antes?
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Aqua_05_01"); //Pues sí. Bienvenido a nuestra sede, Hermano del Anillo.
	if (Npc_KnowsInfo (other, DIA_Addon_Orlan_NoMeeting)) //verrissen
	{
		AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Aqua_05_02"); //…aunque no pareces precisamente un santo.
	};
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Aqua_05_03"); //¿Qué puedo hacer por ti?
	Info_ClearChoices	(DIA_Addon_Orlan_Ranger);
	B_GivePlayerXP (XP_Ambient);
};
func void DIA_Addon_Orlan_Ranger_Idiot ()
{
	AI_Output (other, self, "DIA_Addon_Orlan_Ranger_Lares_15_00"); //¡Amigo! ¡Pertenezco al 'Anillo de Agua'!
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Lares_05_01"); //¿Sabes? Me sorprende que hayan cogido a un idiota como tú.
	AI_Output (self, other, "DIA_Addon_Orlan_Ranger_Lares_05_02"); //¿Qué quieres?
	Info_ClearChoices	(DIA_Addon_Orlan_Ranger);	
};

///////////////////////////////////////////////////////////////////////
//	Info Teleportstein
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_Teleportstein		(C_INFO)
{
	npc		 	= BAU_970_Orlan;
	nr		 	= 2;
	condition	= DIA_Addon_Orlan_Teleportstein_Condition;
	information	= DIA_Addon_Orlan_Teleportstein_Info;

	description	= "¿Has usado alguna piedra de teletransporte?";
};

func int DIA_Addon_Orlan_Teleportstein_Condition ()
{
	if (Orlan_KnowsSCAsRanger == TRUE)
	&& (SCUsed_TELEPORTER == TRUE)			//SC hat schon mal einen Teleporter benutzt
		{
			return TRUE;
		};
};

func void DIA_Addon_Orlan_Teleportstein_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Orlan_Teleportstein_15_00"); //¿Has usado alguna vez una piedra de teletransporte?
	AI_Output	(self, other, "DIA_Addon_Orlan_Teleportstein_05_01"); //¿Estás mal de la cabeza? Mientras algún Mago de Agua no me jure que no hay ningún peligro, no pienso acercarme a esas cosas.
	AI_Output	(self, other, "DIA_Addon_Orlan_Teleportstein_05_02"); //Me ordenaron esconder una de esas piedras de teletransporte, pero, aparte de eso, procuro mantenerme alejado.

	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_Addon_Orlan_Teleportstein);
	Info_AddChoice	(DIA_Addon_Orlan_Teleportstein, "¿Puedo echar un vistazo a esta piedra de teletransporte?", DIA_Addon_Orlan_Teleportstein_sehen );
	Info_AddChoice	(DIA_Addon_Orlan_Teleportstein, "¿Dónde está esta piedra de teletransporte?", DIA_Addon_Orlan_Teleportstein_wo );
};
func void DIA_Addon_Orlan_Teleportstein_sehen ()
{
	AI_Output			(other, self, "DIA_Addon_Orlan_Teleportstein_sehen_15_00"); //¿Puedo echarle un vistazo a esa piedra de teletransporte?
	AI_Output			(self, other, "DIA_Addon_Orlan_Teleportstein_sehen_05_01"); //Por mí… Toma la llave. He cerrado la entrada.
	CreateInvItems (self, ITKE_ORLAN_TELEPORTSTATION, 1);									
	B_GiveInvItems (self, other, ITKE_ORLAN_TELEPORTSTATION, 1);
	
	Log_CreateTopic (TOPIC_Addon_TeleportsNW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_TeleportsNW,"Orlan ha escondido una piedra de teletransporte en una cueva al suroeste de su taberna."); 
};

func void DIA_Addon_Orlan_Teleportstein_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Orlan_Teleportstein_wo_15_00"); //¿Dónde está la piedra de teletransporte?
	AI_Output			(self, other, "DIA_Addon_Orlan_Teleportstein_wo_05_01"); //Hay una cueva al sur, cerca de mi taberna. Allí es donde los Magos de Agua la encontraron.
};

///////////////////////////////////////////////////////////////////////
//	Info Meeting OHNE RING
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_NoMeeting (C_INFO)
{
	npc		 	= BAU_970_Orlan;
	nr		 	= 2;
	condition	= DIA_Addon_Orlan_NoMeeting_Condition;
	information	= DIA_Addon_Orlan_NoMeeting_Info;

	description	= "¡He venido a unirme al Anillo de Agua!";
};
func int DIA_Addon_Orlan_NoMeeting_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Orlan_WERBISTDU))
	&& (!Npc_KnowsInfo (other, DIA_Addon_Orlan_Ranger))
	&& (SCIsWearingRangerRing == FALSE)
	&& (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Orlan_NoMeeting_Info ()
{
	AI_Output (other, self, "DIA_Addon_Orlan_NoMeeting_15_00"); //¡He venido a unirme al Anillo de Agua!
	AI_Output (self, other, "DIA_Addon_Orlan_NoMeeting_05_01"); //(brusco) Yo no veo ningún anillo. ¿Quieres beber algo?
};

///////////////////////////////////////////////////////////////////////
//	Info WhenRangerMeeting
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_WhenRangerMeeting		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Orlan_WhenRangerMeeting_Condition;
	information	 = 	DIA_Addon_Orlan_WhenRangerMeeting_Info;

	description	 = 	"He oído que el 'Anillo' va a reunirse contigo en la taberna.";
};

func int DIA_Addon_Orlan_WhenRangerMeeting_Condition ()
{
	if (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING)
 	&& (Npc_KnowsInfo (other, DIA_Addon_Orlan_Ranger))
 	{
		return TRUE;
 	};
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Orlan_WhenRangerMeeting_15_00"); //He oído que el 'Anillo' va a reunirse contigo en la taberna.
	AI_Output	(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_05_01"); //Eso es. Deberían estar a punto de empezar.
	AI_Output	(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_05_02"); //Me pregunto qué les habrá retrasado

	B_GivePlayerXP (XP_Ambient);
	B_Addon_Orlan_RangersReadyForcoming ();
	self.flags = 0;

	Info_ClearChoices	(DIA_Addon_Orlan_WhenRangerMeeting);	
	Info_AddChoice	(DIA_Addon_Orlan_WhenRangerMeeting, "No deberían tardar en llegar.", DIA_Addon_Orlan_WhenRangerMeeting_theyCome );
	Info_AddChoice	(DIA_Addon_Orlan_WhenRangerMeeting, "¿La reunión es hoy?", DIA_Addon_Orlan_WhenRangerMeeting_Today );
};
func void DIA_Addon_Orlan_WhenRangerMeeting_Today ()
{
	AI_Output			(other, self, "DIA_Addon_Orlan_WhenRangerMeeting_Today_15_00"); //¿La reunión es hoy?
	AI_Output			(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_Today_05_01"); //Sí, al menos que yo recuerde.
	AI_Output			(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_Today_05_02"); //Espero que no se vuelva a retrasar tanto.
	B_MakeRangerReadyForMeetingALL ();
	Info_ClearChoices	(DIA_Addon_Orlan_WhenRangerMeeting);	
	Info_AddChoice	(DIA_Addon_Orlan_WhenRangerMeeting, "(más)", DIA_Addon_Orlan_WhenRangerMeeting_Los );
};
func void DIA_Addon_Orlan_WhenRangerMeeting_theyCome ()
{
	AI_Output			(other, self, "DIA_Addon_Orlan_WhenRangerMeeting_theyCome_15_00"); //No deberían tardar en llegar.
	AI_Output			(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_theyCome_05_01"); //Ya veremos.
	B_MakeRangerReadyForMeetingALL ();
	Info_ClearChoices	(DIA_Addon_Orlan_WhenRangerMeeting);	
	Info_AddChoice	(DIA_Addon_Orlan_WhenRangerMeeting, "(más)", DIA_Addon_Orlan_WhenRangerMeeting_Los );
};
func void DIA_Addon_Orlan_WhenRangerMeeting_Los ()
{
	AI_StopProcessInfos (self);
	B_Addon_Orlan_ComingRanger ();
};

//-----------------------------------------------------
// BESSERE RÜSTUNG
//-----------------------------------------------------

instance DIA_Orlan_RUESTUNG		(C_INFO)
{
	npc		= 	BAU_970_Orlan;
	nr		= 	5;
	condition	 = 	DIA_Orlan_RUESTUNG_Condition;
	information	 = 	DIA_Orlan_RUESTUNG_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Qué tipo de armadura puedes ofrecerme?";
};

var int DIA_Orlan_RUESTUNG_noPerm;

func int DIA_Orlan_RUESTUNG_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
		&& (DIA_Orlan_RUESTUNG_noPerm == FALSE)
		&& (hero.guild == GIL_NONE)
		)
		{
				return TRUE;
		};
};

func void DIA_Orlan_RUESTUNG_Info ()
{
	AI_Output			(other, self, "DIA_Orlan_RUESTUNG_15_00"); //¿Qué tipo de armadura puedes ofrecerme?
	AI_Output			(self, other, "DIA_Orlan_RUESTUNG_05_01"); //Aquí tengo una que seguro que te gusta.

	Info_ClearChoices		(DIA_Orlan_RUESTUNG);

	Info_AddChoice			(DIA_Orlan_RUESTUNG, DIALOG_BACK	,	DIA_Orlan_RUESTUNG_BACK);	
	Info_AddChoice			(DIA_Orlan_RUESTUNG, "Armadura de cuero. Protección: armas 25, flechas 20, fuego 5 (250 de oro)" , DIA_Orlan_RUESTUNG_Buy);	
};  

func void DIA_Orlan_RUESTUNG_Buy ()
{
	AI_Output				(other, self,"DIA_Orlan_RUESTUNG_Buy_15_00"); //Me gustaría comprar una armadura de cuero.

	if (B_GiveInvItems		(other, self, ItMi_Gold, VALUE_ITAR_Leather_L))
		{
			AI_Output			(self, other,"DIA_Orlan_RUESTUNG_Buy_05_01"); //Sabia decisión.

			CreateInvItems 		(self, ItAr_Leather_L, 1);
			B_GiveInvItems		(self, other, ItAr_Leather_L, 1);
			AI_EquipBestArmor	(other);
			DIA_Orlan_RUESTUNG_noPerm = TRUE;
		}
	else
		{
			AI_Output			(self, other,"DIA_Orlan_RUESTUNG_Buy_05_02"); //Lo siento. Cuando dispongas de medios, hablaremos.
		};

	Info_ClearChoices		(DIA_Orlan_RUESTUNG);
};

func void DIA_Orlan_RUESTUNG_BACK ()
{
	AI_Output				(other, self,"DIA_Orlan_RUESTUNG_BACK_15_00"); //Me lo pensaré.
	AI_Output				(self, other,"DIA_Orlan_RUESTUNG_BACK_05_01"); //Como quieras. Pero no esperes demasiado.

	Info_ClearChoices		(DIA_Orlan_RUESTUNG);
};


///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_TRADE		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	70;
	condition	 = 	DIA_Orlan_TRADE_Condition;
	information	 = 	DIA_Orlan_TRADE_Info;
	trade		 = 	TRUE;
	permanent	 = 	TRUE;

	description	 = 	"Enséñame tu mercancía.";
};

func int DIA_Orlan_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
		{
				return TRUE;
		};
};

func void DIA_Orlan_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Orlan_TRADE_15_00"); //Muéstrame tu mercancía.
	B_GiveTradeInv (self);
	
		//ADDON>
		if ((SC_IsRanger == TRUE) || (Orlan_KnowsSCAsRanger == TRUE)||(SCIsWearingRangerRing == TRUE))
			{
				AI_Output			(self, other, "DIA_Addon_Orlan_TRADE_05_00"); //Claro, Hermano del Anillo.
				Orlan_KnowsSCAsRanger = TRUE;
			}
		//ADDON<
		else if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output			(self, other, "DIA_Orlan_TRADE_05_01"); //Por supuesto. Es un honor para mí recibir a un invitado tan importante.
			}
		else if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_MIL))
			{
				AI_Output			(self, other, "DIA_Orlan_TRADE_05_02"); //Por supuesto, señor.
			}
		else
			{
				AI_Output			(self, other, "DIA_Orlan_TRADE_05_03"); //Si puedes pagarlo.
			};
};


///////////////////////////////////////////////////////////////////////
//	Info HotelZimmer
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_HotelZimmer		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	6;
	condition	 = 	DIA_Orlan_HotelZimmer_Condition;
	information	 = 	DIA_Orlan_HotelZimmer_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Cuánto cobras por una habitación?";
};
var int Orlan_SCGotHotelZimmer;
var int Orlan_SCGotHotelZimmerDay;
func int DIA_Orlan_HotelZimmer_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
	&& (Orlan_SCGotHotelZimmer == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Orlan_HotelZimmer_Info ()
{
	AI_Output			(other, self, "DIA_Orlan_HotelZimmer_15_00"); //¿Cuánto cobras por una habitación?
	
	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)|| (SC_IsRanger == TRUE)||(SCIsWearingRangerRing == TRUE)|| (Orlan_KnowsSCAsRanger == TRUE))
		{
			//ADDON>
			if ((SC_IsRanger == TRUE)||(SCIsWearingRangerRing == TRUE)|| (Orlan_KnowsSCAsRanger == TRUE))
			{
				AI_Output			(self, other, "DIA_Addon_Orlan_HotelZimmer_05_00"); //¿A un Hermano del Anillo? Nada.
				Orlan_RangerHelpZimmer = TRUE;
				Orlan_KnowsSCAsRanger = TRUE;
			}
			//ADDON<
			else if (hero.guild == GIL_PAL)
			{
				AI_Output			(self, other, "DIA_Orlan_HotelZimmer_05_01"); //Para un caballero del rey siempre hay sitio. Gratis, por supuesto.
			}
			else
			{
				AI_Output			(self, other, "DIA_Orlan_HotelZimmer_05_02"); //No osaría aceptar dinero de uno de los representantes de Innos en la tierra por mis servicios.
			};
			
			AI_Output			(self, other, "DIA_Orlan_HotelZimmer_05_03"); //Aquí está la llave de las habitaciones de arriba. Elige la que más te guste.
			CreateInvItems (self, ITKE_ORLAN_HOTELZIMMER, 1);									
			B_GiveInvItems (self, other, ITKE_ORLAN_HOTELZIMMER, 1);					
			Orlan_SCGotHotelZimmer = TRUE;
			Orlan_SCGotHotelZimmerDay = Wld_GetDay();
		}
		else
		{
			AI_Output			(self, other, "DIA_Orlan_HotelZimmer_05_04"); //Dame 50 monedas de oro por una semana, y elige tú la habitación.
		
			Info_ClearChoices	(DIA_Orlan_HotelZimmer);
			Info_AddChoice	(DIA_Orlan_HotelZimmer, "Caro de narices.", DIA_Orlan_HotelZimmer_nein );
			Info_AddChoice	(DIA_Orlan_HotelZimmer, "Muy bien. Aquí tienes la pasta.", DIA_Orlan_HotelZimmer_ja );
		};	
};
func void DIA_Orlan_HotelZimmer_ja ()
{
		if (B_GiveInvItems (other, self, ItMi_Gold,50))
		{
			AI_Output			(other, self, "DIA_Orlan_HotelZimmer_ja_15_00"); //Muy bien. Aquí tienes la pasta.
			AI_Output			(self, other, "DIA_Orlan_HotelZimmer_ja_05_01"); //Toma la llave. Las habitaciones están arriba. No ensucies y paga a tiempo, ¿me oyes?
			CreateInvItems (self, ITKE_ORLAN_HOTELZIMMER, 1);									
			B_GiveInvItems (self, other, ITKE_ORLAN_HOTELZIMMER, 1);					
			Orlan_SCGotHotelZimmerDay = Wld_GetDay(); 
			Orlan_SCGotHotelZimmer = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Orlan_HotelZimmer_ja_05_02"); //No tienes las 50. Lo primero es el dinero, y luego el placer.
		};
	Info_ClearChoices	(DIA_Orlan_HotelZimmer);
};

func void DIA_Orlan_HotelZimmer_nein ()
{
	AI_Output			(other, self, "DIA_Orlan_HotelZimmer_nein_15_00"); //Es muy caro.
	AI_Output			(self, other, "DIA_Orlan_HotelZimmer_nein_05_01"); //Entonces tendrás que buscar en otro lugar, amigo mío.
	Info_ClearChoices	(DIA_Orlan_HotelZimmer);
};

///////////////////////////////////////////////////////////////////////
//	Info MieteFaellig
///////////////////////////////////////////////////////////////////////

var int Orlan_AngriffWegenMiete;
////////////////////////////////

instance DIA_Orlan_MieteFaellig		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	10;
	condition	 = 	DIA_Orlan_MieteFaellig_Condition;
	information	 = 	DIA_Orlan_MieteFaellig_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

var int DIA_Orlan_MieteFaellig_NoMore;
func int DIA_Orlan_MieteFaellig_Condition ()
{
	//ADDON>
	if ((SC_IsRanger == TRUE)|| (Orlan_RangerHelpZimmer == TRUE))
	{
		return FALSE;
	};
	//ADDON<
	
	// GEFRUDEL wegen kein Labern nach Kampf!
	
	if (Orlan_AngriffWegenMiete == TRUE)
	&& (DIA_Orlan_MieteFaellig_NoMore == FALSE)
	{	
		// ------ keine Miete, wenn Kampf verloren ------
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			return FALSE;
		};
		
		// ------ wenn gewonnen, Gold genommen --> Miete in 7 Tagen ------
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			Orlan_SCGotHotelZimmerDay = Wld_GetDay();
			Orlan_AngriffWegenMiete = FALSE;
			return FALSE;
		};
	};
	
	// CONDITION
	
	if (Orlan_SCGotHotelZimmer == TRUE)
	&& (Orlan_SCGotHotelZimmerDay <= (Wld_GetDay()-7))
	&& (DIA_Orlan_MieteFaellig_NoMore == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Orlan_MieteFaellig_Info ()
{
	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output	(self, other, "DIA_Orlan_MieteFaellig_05_00"); //(Baboseando) Tu distinguida visita me llena de alegría. Quédate todo el tiempo que quieras. Es un honor.
		DIA_Orlan_MieteFaellig_NoMore = TRUE;
	}
	else
	{
		AI_Output	(self, other, "DIA_Orlan_MieteFaellig_05_01"); //¿Cuándo voy a cobrar?
	
		Info_ClearChoices	(DIA_Orlan_MieteFaellig);
		Info_AddChoice	(DIA_Orlan_MieteFaellig, "No voy a pagarte nada más.", DIA_Orlan_MieteFaellig_nein );
		Info_AddChoice	(DIA_Orlan_MieteFaellig, "Ten las 50 monedas de oro.", DIA_Orlan_MieteFaellig_ja );
	};
};

var int DIA_Orlan_MieteFaellig_OneTime;
func void DIA_Orlan_MieteFaellig_ja ()
{
		AI_Output			(other, self, "DIA_Orlan_MieteFaellig_ja_15_00"); //Ten las 50 monedas de oro.
	
		if (B_GiveInvItems (other, self, ItMi_Gold,50))
		{
			AI_Output			(self, other, "DIA_Orlan_MieteFaellig_ja_05_01"); //Ya era hora.

			if (DIA_Orlan_MieteFaellig_OneTime == FALSE)
			{
				AI_Output			(self, other, "DIA_Orlan_MieteFaellig_ja_05_02"); //¿Dónde andas todo el día?
				AI_Output			(other, self, "DIA_Orlan_MieteFaellig_ja_15_03"); //No querrás saberlo.
				AI_Output			(self, other, "DIA_Orlan_MieteFaellig_ja_05_04"); //Um. Bueno, de todos modos no es de mi incumbencia.
				DIA_Orlan_MieteFaellig_OneTime = TRUE;
			};
			
			Orlan_SCGotHotelZimmerDay = Wld_GetDay(); 
			Info_ClearChoices	(DIA_Orlan_MieteFaellig);
		}
		else
		{
			AI_Output			(self, other, "DIA_Orlan_MieteFaellig_ja_05_05"); //Oye, ¿intentas engañarme? Ni siquiera tienes dinero para pagar esa comida. Te vas a enterar...
			AI_StopProcessInfos (self);
			B_Attack (self, other, AR_NONE, 1);
		};
};

func void DIA_Orlan_MieteFaellig_nein ()
{
	AI_Output			(other, self, "DIA_Orlan_MieteFaellig_nein_15_00"); //Ni hablar. No voy a pagarte nada más.
	AI_Output			(self, other, "DIA_Orlan_MieteFaellig_nein_05_01"); //Te vas a enterar, estafador.
	Orlan_AngriffWegenMiete = TRUE;
	
	Info_ClearChoices	(DIA_Orlan_MieteFaellig);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info WettkampfLaeuft
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_WETTKAMPFLAEUFT		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	7;
	condition	 = 	DIA_Orlan_WETTKAMPFLAEUFT_Condition;
	information	 = 	DIA_Orlan_WETTKAMPFLAEUFT_Info;
	important	 = 	TRUE;
	 
};

func int DIA_Orlan_WETTKAMPFLAEUFT_Condition ()
{
	if 	(
		(DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE)
		&& (MIS_Rukhar_Wettkampf_Day <= (Wld_GetDay()-2))
		)
			{
					return TRUE;
			};
};

func void DIA_Orlan_WETTKAMPFLAEUFT_Info ()
{
			AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_00"); //Por fin has venido. Te he estado esperando.
			AI_Output			(other, self, "DIA_Orlan_WETTKAMPFLAEUFT_15_01"); //¿Qué ha pasado?
			AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_02"); //Ya ha acabado el concurso de bebida.
			AI_Output			(other, self, "DIA_Orlan_WETTKAMPFLAEUFT_15_03"); //¿Quién ha ganado?
	
			if 	(
				((Mob_HasItems	("CHEST_RUKHAR", ItFo_Booze)) == FALSE)
				&& ((Mob_HasItems	("CHEST_RUKHAR", ItFo_Water)) == TRUE)
				)
					{
						AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_04"); //Esta vez ha ganado Randolph. Rukhar ha debido de tener un mal día.
					}
				else
				{
					AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_05"); //Rukhar ha vuelto a emborrachar a Randolph, como era de esperar.
					Rukhar_Won_Wettkampf = TRUE;
				};
			
			if ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
				{
					AI_Output			(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_06"); //Bueno, espero que fuera la última vez. No quiero que vuelva a repetirse ese tipo de follón en mi casa. Acuérdate.
				};
			
			B_GivePlayerXP (XP_Rukhar_WettkampfVorbei);	

			AI_StopProcessInfos (self);
		
			Npc_ExchangeRoutine	(self,"Start"); 
			B_StartotherRoutine	(Randolph,"Start");

			if (Hlp_IsValidNpc (Rukhar))
				{
				 if (Rukhar_Won_Wettkampf == TRUE)
				 	{
						B_StartotherRoutine (Rukhar,"WettkampfRukharWon");
					}
					else
					{
						B_StartotherRoutine (Rukhar,"WettkampfRukharLost");
					};
				};		
			
			MIS_Rukhar_Wettkampf = LOG_SUCCESS;
			B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info Eingebrockt
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_EINGEBROCKT		(C_INFO)
{
	npc		 = 	BAU_970_Orlan;
	nr		 = 	8;
	condition	 = 	DIA_Orlan_EINGEBROCKT_Condition;
	information	 = 	DIA_Orlan_EINGEBROCKT_Info;
	important	 = 	TRUE;
};

func int DIA_Orlan_EINGEBROCKT_Condition ()
{
	if 	(
		(DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE)
		&& (MIS_Rukhar_Wettkampf == LOG_RUNNING)
		)
			{
					return TRUE;
			};
};

func void DIA_Orlan_EINGEBROCKT_Info ()
{
			AI_Output	(self, other, "DIA_Orlan_EINGEBROCKT_05_00"); //En menudo lío me has metido. Ahora puedo volver a hacer de vigía para Rukhar.
			AI_Output	(other, self, "DIA_Orlan_EINGEBROCKT_15_01"); //¿Por qué?
			AI_Output	(self, other, "DIA_Orlan_EINGEBROCKT_05_02"); //Mientras celebre sus concursos ahí dentro, lo mejor es que no se entere ningún forastero. No es bueno para el negocio.
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_Perm		(C_INFO)
{
	npc			 = 	BAU_970_Orlan;
	nr			 = 	99;
	condition	 = 	DIA_Orlan_Perm_Condition;
	information	 = 	DIA_Orlan_Perm_Info;
	permanent	 = 	TRUE;
	description	 = 	"¿Cómo va la taberna?";
};

func int DIA_Orlan_Perm_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
		{
				return TRUE;
		};
};

func void DIA_Orlan_Perm_Info ()
{
	AI_Output (other, self, "DIA_Orlan_Perm_15_00"); //¿Cómo va la taberna?
	
	if (Kapitel <= 2)
	{
		AI_Output (self, other, "DIA_Orlan_Perm_05_01"); //Ha habido tiempos mejores.
		AI_Output (self, other, "DIA_Orlan_Perm_05_02"); //Los bolsillos de la gente no están tan abiertos como antes.
	}
	else if (Kapitel >= 3)
	{
		AI_Output (self, other, "DIA_Orlan_Perm_05_03"); //Espero que los magos negros se vayan pronto. Si no, tendré que cerrar la taberna.
		AI_Output (self, other, "DIA_Orlan_Perm_05_04"); //Casi nadie se atreve a venir.
	};
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Orlan_Minenanteil (C_INFO)
{
	npc			= BAU_970_Orlan;
	nr			= 3;
	condition	= DIA_Orlan_Minenanteil_Condition;
	information	= DIA_Orlan_Minenanteil_Info;

	description = "¿Vendes participaciones de las minas?";
};   
                    
FUNC INT DIA_Orlan_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

FUNC VOID DIA_Orlan_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Orlan_Minenanteil_15_00"); //¿Vendes participaciones de las minas?
	AI_Output (self, other, "DIA_Orlan_Minenanteil_05_01"); //Claro. Por el precio adecuado, puedes comprarme de todo.
	B_GivePlayerXP (XP_Ambient);
};	

 
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Orlan_PICKPOCKET (C_INFO)
{
	npc			= BAU_970_Orlan;
	nr			= 900;
	condition	= DIA_Orlan_PICKPOCKET_Condition;
	information	= DIA_Orlan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Orlan_PICKPOCKET_Condition()
{
	C_Beklauen (89, 260);
};
 
FUNC VOID DIA_Orlan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Orlan_PICKPOCKET);
	Info_AddChoice		(DIA_Orlan_PICKPOCKET, DIALOG_BACK 		,DIA_Orlan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Orlan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Orlan_PICKPOCKET_DoIt);
};

func void DIA_Orlan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Orlan_PICKPOCKET);
};
	
func void DIA_Orlan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Orlan_PICKPOCKET);
};








			

























