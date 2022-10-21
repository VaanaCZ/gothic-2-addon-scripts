// ************************************************************
// 								EXIT
// ************************************************************
INSTANCE DIA_Pepe_EXIT   (C_INFO)
{
	npc         = BAU_912_Pepe;
	nr          = 999;
	condition   = DIA_Pepe_EXIT_Condition;
	information = DIA_Pepe_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pepe_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pepe_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 								Hallo
// ************************************************************
instance DIA_Pepe_Hallo (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 1;
	condition	= DIA_Pepe_Hallo_Condition;
	information	= DIA_Pepe_Hallo_Info;
	permanent	= FALSE;
	description	= "¿Qué estás haciendo aquí?";
};
func int DIA_Pepe_Hallo_Condition ()
{
	return TRUE;
};
func void DIA_Pepe_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Hallo_15_00"); //¿Qué haces aquí?
	AI_Output (self, other, "DIA_Pepe_Hallo_03_01"); //(Aburrido) ¡Vigilar a las ovejas! (suspira) Y, si es posible, no meterme en líos.
	
	if ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		AI_Output (other, self, "DIA_Pepe_Hallo_15_02"); //No siempre se puede, ¿verdad?
		AI_Output (self, other, "DIA_Pepe_Hallo_03_03"); //No, sobre todo con los mercenarios. La verdad es que me alegro de estar en la pradera. Aunque también tiene sus peligros.
	};
};

// ************************************************************
// 								Danger
// ************************************************************
instance DIA_Pepe_Danger (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 2;
	condition	= DIA_Pepe_Danger_Condition;
	information	= DIA_Pepe_Danger_Info;
	permanent 	= FALSE;
	description	= "¿Qué tiene la pradera de peligrosa?";
};
func int DIA_Pepe_Danger_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};
func void DIA_Pepe_Danger_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Danger_15_00"); //¿Qué tiene la pradera de peligrosa?
	AI_Output (self, other, "DIA_Pepe_Danger_03_01"); //Hay una pequeña manada de lobos que ronda la zona. En los últimos tiempos, las malditas bestias devoran una de las ovejas casi todos los días.
	AI_Output (self, other, "DIA_Pepe_Danger_03_02"); //Hace unos días, tenía casi el doble de ovejas. No quiero ni pensar en lo que me hará Onar cuando se entere.
};

// ************************************************************
// 								WhyNotSLD
// ************************************************************
instance DIA_Pepe_WhyNotSLD	(C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 3;
	condition	= DIA_Pepe_WhyNotSLD_Condition;
	information	= DIA_Pepe_WhyNotSLD_Info;
	PERMANENT 	= FALSE;
	description	= "¿Por qué no le contaste a los mercenarios lo de los lobos? Creía que trabajaban para vosotros.";
};
func int DIA_Pepe_WhyNotSLD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Danger))
	&& ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
func void DIA_Pepe_WhyNotSLD_Info ()
{
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_00"); //¿Por qué no le contaste a los mercenarios lo de los lobos? Creía que trabajaban para vosotros.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_01"); //Sí, lo sé. Debería haberlo hecho, pero no lo hice, maldita sea.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_02"); //Y ahora me da miedo contárselo a alguien, ya que han desaparecido muchas ovejas.
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_03"); //Pero me lo acabas de contar...
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_04"); //(Molesto) Y ya me estoy arrepintiendo.
};

// ************************************************************
// 								KillWolves
// ************************************************************
instance DIA_Pepe_KillWolves (C_INFO)
{
	npc		 	= BAU_912_Pepe;
	nr			= 4;
	condition	= DIA_Pepe_KillWolves_Condition;
	information	= DIA_Pepe_KillWolves_Info;
	permanent 	= FALSE;
	description	= "¿Y si mato a los lobos?";
};
func int DIA_Pepe_KillWolves_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Danger))
	{
		return TRUE;
	};
};
func void DIA_Pepe_KillWolves_Info ()
{
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_00"); //¿Y si mato a los lobos?
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_01"); //(Burlón) ¿Tú solo? Ja, ja. No me lo creo. Antes se lo encargaría al carnero.
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_02"); //Olvídalo. No era más que una sugerencia. Iré a ver a los muchachos y veré qué opinan al respecto...
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_03"); //(Asustado) Espera un momento. ¡Vale, vale! Eh... eres el mejor y puedes enfrentarte a un centenar de lobos al mismo tiempo. ¡No hay problema!
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_04"); //Suelen acechar entre los árboles que lindan con la pradera. (Añade despreocupadamente) Creo que solo había cuatro...
	
	AI_StopProcessInfos (self);
	
	Wld_InsertNpc	(PEPES_YWolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01"); 
	Wld_InsertNpc	(PEPES_YWolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02"); 
	Wld_InsertNpc	(PEPES_YWolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03"); 
	Wld_InsertNpc	(PEPES_YWolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04"); 
	
	MIS_Pepe_KillWolves = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PepeWolves,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PepeWolves,LOG_RUNNING);
	B_LogEntry (TOPIC_PepeWolves,"Cuatro lobos amenazan a las ovejas de Pepe. Debería ahuyentarlos.");
};

// ************************************************************
// 								KilledWolves
// ************************************************************
instance DIA_Pepe_KilledWolves		(C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_KilledWolves_Condition;
	information	 = 	DIA_Pepe_KilledWolves_Info;
	permanent	 = 	TRUE;
	description	 = 	"Me he cargado a los lobos.";
};
func int DIA_Pepe_KilledWolves_Condition ()
{
	if  (MIS_Pepe_KillWolves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Pepe_KilledWolves_Info ()
{
	AI_Output (other, self, "DIA_Pepe_KilledWolves_15_00"); //Me he cargado a los lobos.

	if (Npc_IsDead(PEPES_YWolf1))
	&& (Npc_IsDead(PEPES_YWolf2))
	&& (Npc_IsDead(PEPES_YWolf3))
	&& (Npc_IsDead(PEPES_YWolf4))
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_01"); //(Atónito) ¡Lo has conseguido! ¡Gracias a Innos!
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_02"); //No obstante, sigo sin saber cómo contarle a Onar que han muerto todas esas ovejas.
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_03"); //(Para sí) ¡Todo es culpa del maldito Bullco!

		MIS_Pepe_KillWolves = LOG_SUCCESS;
		B_GivePlayerXP (XP_PepeWolves);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_04"); //No hace falta que me tomes el pelo. No todas las bestias están muertas.
	};
};

// ************************************************************
// 					Was hast du über Bullco gesagt?
// ************************************************************
instance DIA_Pepe_Bullco (C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_Bullco_Condition;
	information	 = 	DIA_Pepe_Bullco_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿Qué has dicho de Bullco?";
};
func int DIA_Pepe_Bullco_Condition ()
{
	if (MIS_Pepe_KillWolves == LOG_SUCCESS)
	&& (!Npc_IsDead(Bullco))
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};
func void DIA_Pepe_Bullco_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Bullco_15_00"); //¿Qué has dicho de Bullco?
	AI_Output (self, other, "DIA_Pepe_Bullco_03_01"); //Es uno de los mercenarios. Le correspondía a él vigilar la pradera.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_02"); //Pero en lugar de hacerlo se dedica a rodar a Thekla todo el día en la cocina con su amigo Sylvio.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_03"); //Si me tiro varias semanas sin paga por las ovejas muertas será culpa suya.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_04"); //Ojalá pudiera partirle la cara. Pero nadie tiene ninguna oportunidad contra él. Ese tipo es un asesino.

	MIS_Pepe_KickBullco = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_KickBullco,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_KickBullco,LOG_RUNNING);
	B_LogEntry (TOPIC_KickBullco,"Bullco debería haberse ocupado mejor de las ovejas de Pepe. Pepe quiere que alguien le dé una lección");
};

// ************************************************************
// 						Bullco geschlagen
// ************************************************************
instance DIA_Pepe_BullcoDefeated (C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_BullcoDefeated_Condition;
	information	 = 	DIA_Pepe_BullcoDefeated_Info;
	permanent	 = 	FALSE;
	description	 = 	"Bullco ha recibido su merecido.";
};
func int DIA_Pepe_BullcoDefeated_Condition ()
{
	if (MIS_Pepe_KickBullco == LOG_RUNNING)
	{
		if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
		|| (DJG_Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	};
};
func void DIA_Pepe_BullcoDefeated_Info ()
{
	AI_Output (other, self, "DIA_Pepe_BullcoDefeated_15_00"); //Bullco ha recibido su merecido. Le he dado una lección.
	AI_Output (self, other, "DIA_Pepe_BullcoDefeated_03_01"); //El cerdo se lo merecía.

	MIS_Pepe_KickBullco = LOG_SUCCESS;
	B_GivePlayerXP (XP_KickBullco);
};

// ************************************************************
// 			  					PERM 
// ************************************************************
instance DIA_Pepe_PERM		(C_INFO)
{
	npc		 	= BAU_912_Pepe;
	nr		 	= 6;
	condition	= DIA_Pepe_PERM_Condition;
	information	= DIA_Pepe_PERM_Info;
	permanent	= TRUE;
	description	= "¿Qué tal estáis tú y las ovejas?";
};

func int DIA_Pepe_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_PERM_Info ()
{
	AI_Output (other, self, "DIA_Pepe_PERM_15_00"); //¿Qué tal estáis tú y las ovejas?

	if (kapitel <= 1)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_01"); //Estoy bien, y las ovejas también. Bueno, al menos las que siguen aquí.
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_02"); //Bien. No obstante, los lobos volverán algún día, y probablemente sean más.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_03"); //He oído rumores extrañísimos. Se dice que en casa de Sekob han aparecido unos personajes bastantes siniestros y que están asediándola.
	}
	
	if (kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_04"); //He oído que unos matones se han instalado en la granja de Lobart. Alguien debería echarle una mano.
	};
};

// ************************************************************
// 			  					Liesel 
// ************************************************************
instance DIA_Pepe_Liesel		(C_INFO)
{
	npc			 = 	BAU_912_Pepe;
	nr			 = 	7;
	condition	 = 	DIA_Pepe_Liesel_Condition;
	information	 = 	DIA_Pepe_Liesel_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿Puedo comprar una oveja?";
};
func int DIA_Pepe_Liesel_Condition ()
{
	if Npc_KnowsInfo (hero, DIA_Pepe_Hallo)
	{
		return TRUE;
	};
};
func void DIA_Pepe_Liesel_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Liesel_15_00"); //¿Puedo comprar una oveja?
	AI_Output (self, other, "DIA_Pepe_Liesel_03_01"); //Cuando quieras, si la pagas. Una oveja cuesta 100 monedas de oro.
	AI_Output (self, other, "DIA_Pepe_Liesel_03_02"); //Si pagas la oveja, puedes llevártela. Pero tienes que tratarla bien.
};

// ************************************************************
// 			  				Buy Liesel
// ************************************************************
var int Pepe_SchafGekauft;

instance DIA_Pepe_BuyLiesel	(C_INFO)
{
	npc			 = 	BAU_912_Pepe;
	nr			 = 	8;
	condition	 = 	DIA_Pepe_BuyLiesel_Condition;
	information	 = 	DIA_Pepe_BuyLiesel_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ten las 100 monedas de oro. Ahora dame la oveja.";
};
func int DIA_Pepe_BuyLiesel_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Pepe_LIESEL))
	{
		return TRUE;
	};
};
func void DIA_Pepe_BuyLiesel_Info ()
{
	AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_00"); //Ten las 100 monedas de oro. Ahora dame la oveja.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 100))
	{
		if (Pepe_SchafGekauft == 0)
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_01"); //Bien. Llévate a Betsy. La encontrarás en la pradera.
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_02"); //Te seguirá en cuanto se lo digas. Para ser una oveja, es bastante inteligente. ¡Trátala bien!
		}
		else
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_03"); //¿Otra vez? Vale. Llévate a Betsy.
			AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_04"); //¿A Betsy? Pero la última oveja se llamaba Betsy...
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_05"); //Todas las ovejas se llaman Betsy.
			if (Pepe_SchafGekauft == 3)
			{
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_06"); //Menos los carneros, claro.
				AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_07"); //¿Y ellos cómo se llaman?
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_08"); //Bruce.
			};
		};
		
		Pepe_SchafGekauft = Pepe_SchafGekauft + 1;		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");  // *** FIXME *** noch entsprechenden WP/FP eintragen
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_09"); //No tienes tanto oro. No puedo darte una oveja por menos.
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pepe_PICKPOCKET (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 900;
	condition	= DIA_Pepe_PICKPOCKET_Condition;
	information	= DIA_Pepe_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Pepe_PICKPOCKET_Condition()
{
	C_Beklauen (15, 25);
};
 
FUNC VOID DIA_Pepe_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pepe_PICKPOCKET);
	Info_AddChoice		(DIA_Pepe_PICKPOCKET, DIALOG_BACK 		,DIA_Pepe_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pepe_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pepe_PICKPOCKET_DoIt);
};

func void DIA_Pepe_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pepe_PICKPOCKET);
};
	
func void DIA_Pepe_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pepe_PICKPOCKET);
};















