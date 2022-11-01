///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Maleth_EXIT   (C_INFO)
{
	npc         = BAU_954_Maleth;
	nr          = 999;
	condition   = DIA_Maleth_EXIT_Condition;
	information = DIA_Maleth_EXIT_Info;
	permanent   = TRUE;
	description = "¡Tengo que irme!";
};
FUNC INT DIA_Maleth_EXIT_Condition()
{
	if (Kapitel	< 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	if (Maleth_ersterWolf == FALSE)
	{
		Wld_InsertNpc		(YWolf,	"NW_FARM1_PATH_CITY_SHEEP_06");
		Maleth_ersterWolf = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_Hallo (C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_Hallo_Condition;
	information	= DIA_Maleth_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};

func int DIA_Maleth_Hallo_Condition ()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Maleth_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Maleth_Hallo_08_00"); //¡Eh, forastero!

	if (hero.guild == GIL_NONE)
		{
		
			if (Npc_GetDistToWP(self,"NW_FARM1_PATH_CITY_SHEEP_09") < 500)
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_01"); //He visto que salías de las montañas.
			};
			AI_Output (self, other, "DIA_Maleth_Hallo_08_02"); //Alégrate de no haber pasado por aquí hace tres semanas.
			AI_Output (self, other, "DIA_Maleth_Hallo_08_03"); //Te habríamos tomado por un preso fugado. ¡Nos los cargamos en un periquete!
			
			if (Npc_HasEquippedArmor(other) == FALSE) 
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_04"); //Pareces hecho polvo.
			}
			else
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_05"); //Cuando llegaste, parecías agotado.
				AI_Output (self, other, "DIA_Maleth_Hallo_08_06"); //¡Ya casi vuelves a parecer humano!
			};
		};

	AI_Output (self, other, "DIA_Maleth_Hallo_08_07"); //(Con desconfianza) ¿Qué quieres?
};

///////////////////////////////////////////////////////////////////////
//	Banditen Überfall
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BANDITS		(C_INFO) //E1
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BANDITS_Condition;
	information	= DIA_Maleth_BANDITS_Info;
	permanent   = FALSE;
	description	= "Los bandidos me atacaron en las montañas.";
};

func int DIA_Maleth_BANDITS_Condition ()
{
	if (Kapitel < 3)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_BANDITS_Info ()
{
	AI_Output (other, self, "DIA_Maleth_BANDITS_15_00"); //Los bandidos me atacaron en las montañas.
	AI_Output (self, other, "DIA_Maleth_BANDITS_08_01"); //¡Chusma asquerosa! ¡Seguramente sean los mismos bastardos que se llevaron anoche una de nuestras ovejas!
	AI_Output (self, other, "DIA_Maleth_BANDITS_08_02"); //Has tenido mucha suerte. La mayoría de la gente no sale viva.
};

///////////////////////////////////////////////////////////////////////
//	Banditen tot
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BanditsDEAD	(C_INFO) //E2
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BanditsDEAD_Condition;
	information	= DIA_Maleth_BanditsDEAD_Info;
	permanent   = FALSE;
	description	= "Esos bandidos ya no te incordiarán...";
};

func int DIA_Maleth_BanditsDEAD_Condition ()
{
	if ( Npc_IsDead (Ambusher_1013) || (Bdt_1013_Away == TRUE) )
	&& (Npc_IsDead (Ambusher_1014)) 
	&& (Npc_IsDead (Ambusher_1015))
	&& (Npc_KnowsInfo (other, DIA_Maleth_BANDITS))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsDEAD_Info ()
{
	AI_Output (other, self, "DIA_Maleth_BanditsDEAD_15_00"); //Esos bandidos ya no te incordiarán...
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_01"); //¿Por qué? ¿Han muerto?
	AI_Output (other, self, "DIA_Maleth_BanditsDEAD_15_02"); //Se pelearon con la persona equivocada...
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_03"); //¡Gracias a Innos! Ten. No es gran cosa, pero quiero que te lo quedes.
	B_GiveInvItems (self, other, ItFo_Wine, 3);
	
	MIS_Maleth_Bandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_MalethKillBandits);
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_04"); //¡Se lo contaré a los demás!
};

///////////////////////////////////////////////////////////////////////
//	Banditen leben noch
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BanditsALIVE (C_INFO) //E2
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BanditsALIVE_Condition;
	information	= DIA_Maleth_BanditsALIVE_Info;
	permanent   = FALSE;
	description	= "Sé dónde está el escondite de los bandidos...";
};

func int DIA_Maleth_BanditsALIVE_Condition ()
{
	var C_NPC b13; b13 = Hlp_GetNpc(Bdt_1013_Bandit_L);
	var C_NPC b14; b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	var C_NPC b15; b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);
	
	if ( (!Npc_IsDead (b13)) || (!Npc_IsDead (b14)) || (!Npc_IsDead (b15)) )
	&& (Npc_KnowsInfo (other, DIA_Maleth_BANDITS))
	&& (MIS_Maleth_Bandits != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsALIVE_Info ()
{
	AI_Output (other, self, "DIA_Maleth_BanditsALIVE_15_00"); //Sé dónde está el escondite de los bandidos...
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_01"); //¿Quieres atacarlos? ¡No cuentes conmigo! ¡Es demasiado peligroso!
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_02"); //¡Además, tengo que cuidar de mis ovejas!
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_03"); //Pero si crees que puedes librarte de esa gentuza, todos los habitantes de la granja te estarían muy agradecidos.
	MIS_Maleth_Bandits = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Maleth,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Maleth,LOG_RUNNING);
	B_LogEntry (TOPIC_Maleth,"Si derroto al jefe de los bandidos mientras voy de la torre de Xardas a la granja de Lobart, todos los de la granja me lo agradecerán.");
	
};


///////////////////////////////////////////////////////////////////////
//	Auf dem Weg in die Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_ToTheCity (C_INFO) //E1
{
	npc			= BAU_954_Maleth;
	nr          = 2;
	condition	= DIA_Maleth_ToTheCity_Condition;
	information	= DIA_Maleth_ToTheCity_Info;
	permanent   = FALSE;
	description	= "Me voy a la ciudad.";
};

func int DIA_Maleth_ToTheCity_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_Hallo))
	&& (Kapitel < 3)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_ToTheCity_Info ()
{
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_00"); //Me voy a la ciudad.
	
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_01"); //Con esa pinta, tendrás que sobornar a los guardias para que te dejen entrar.
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_02"); //Y tienes que saber lo que quieren oír.
	}
	else
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_03"); //A lo mejor te dejan entrar... si les dices lo que quieren oír...
	};
	
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_04"); //¿Y qué es?
	AI_Output (self, other, "DIA_Maleth_ToTheCity_08_05"); //Bueno, por ejemplo, que eres de la granja de Lobart y quieres ir al herrero de la ciudad.
	
	Log_CreateTopic (TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
	B_LogEntry (TOPIC_City,"Para entrar en la ciudad puedo decirles a los guardias de la puerta que vengo de la granja de Lobart y que quiero ver al herrero.");
	
	
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_06"); //Pero eso no te servirá de nada. No tienes pinta de granjero.
		B_LogEntry (TOPIC_City,"Por supuesto, antes tendré que disfrazarme de granjero.");
		
	};
	
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_07"); //Entiendo.
};
	
	
	

///////////////////////////////////////////////////////////////////////
//	Bessere Ausrüstung
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_Equipment		(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 3;
	condition	= DIA_Maleth_Equipment_Condition;
	information	= DIA_Maleth_Equipment_Info;
	permanent   = FALSE;
	description	= "¡Necesito mejor equipo!";
};

func int DIA_Maleth_Equipment_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_Hallo))
	&& (Kapitel < 3)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_Equipment_Info ()
{
	AI_Output (other, self, "DIA_Maleth_Equipment_15_00"); //¡Necesito mejor equipo!
	AI_Output (self, other, "DIA_Maleth_Equipment_08_01"); //Ya me imagino, pero ahora mismo no podemos prescindir de nada.
	if (!Npc_IsDead(Lobart))
	{
		AI_Output (self, other, "DIA_Maleth_Equipment_08_02"); //Si puedes pagarlo, Lobart te venderá algo.
		AI_Output (self, other, "DIA_Maleth_Equipment_08_03"); //Si no, ve a preguntarle si te puede dar trabajo.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Lobart
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_LOBART		(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 3;
	condition	= DIA_Maleth_LOBART_Condition;
	information	= DIA_Maleth_LOBART_Info;
	permanent   = FALSE;
	description	= "¿Dónde está Lobart?";
};

func int DIA_Maleth_LOBART_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_Equipment))
	&& (!Npc_IsDead(Lobart))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_LOBART_Info ()
{
	AI_Output (other, self, "DIA_Maleth_LOBART_15_00"); //¿Dónde está Lobart?
	AI_Output (self, other, "DIA_Maleth_LOBART_08_01"); //¡Pues en la granja! ¡La granja es suya!
	AI_Output (self, other, "DIA_Maleth_LOBART_08_02"); //¡Y no le toques las narices! Ha sacudido y echado de la granja a un montón de vagos.
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

INSTANCE DIA_Maleth_KAP3_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP3_EXIT_Condition;
	information	= DIA_Maleth_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info probleme
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_PROBLEME		(C_INFO)
{
	npc		 = 	BAU_954_Maleth;
	nr		 = 	30;
	condition	 = 	DIA_Maleth_PROBLEME_Condition;
	information	 = 	DIA_Maleth_PROBLEME_Info;

	description	 = 	"¿Alguna novedad en los últimos días?";
};

func int DIA_Maleth_PROBLEME_Condition ()
{
	if (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Maleth_PROBLEME_Info ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_15_00"); //¿Alguna novedad en los últimos días?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_08_01"); //Recorre el camino que lleva a la ciudad.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_08_02"); //Si te topas con un tipo que tiene una túnica negra, te enterarás de las novedades.
	Info_ClearChoices	(DIA_Maleth_PROBLEME);
	Info_AddChoice	(DIA_Maleth_PROBLEME, DIALOG_BACK, DIA_Maleth_PROBLEME_Back );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "¿Cómo están las ovejas?", DIA_Maleth_PROBLEME_schafe );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "¿Ya han venido a verte los de las túnicas negras?", DIA_Maleth_PROBLEME_beidir );
	
};
func void DIA_Maleth_PROBLEME_beidir ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_beidir_15_00"); //¿Ya han venido a verte los de las túnicas negras?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_beidir_08_01"); //Sí. Llevan unos días por aquí. En mi opinión, han salido directamente del infierno.

};

func void DIA_Maleth_PROBLEME_schafe ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_15_00"); //¿Cómo están las ovejas?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_08_01"); //(Enojado) No finjas que te interesa. Tienes otros problemas.
	Info_AddChoice	(DIA_Maleth_PROBLEME, "¿Problemas yo? ¿Y tú qué sabes?", DIA_Maleth_PROBLEME_schafe_probleme );

};
func void DIA_Maleth_PROBLEME_schafe_probleme ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_15_00"); //¿Problemas yo? ¿Y tú qué sabes?
	
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_01"); //(Brusco) ¿Eres de la guardia de la ciudad o no? Entonces, haz algo con respecto a esos bastardos de las túnicas negras.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_02"); //(Enojado) Los malditos mercenarios solo pensáis en una cosa: cómo meteros en el bolsillo el dinero de los demás.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_03"); //Los nobles señores del monasterio deberíais hacer algo con respecto a esos encapuchados.
		};

	Info_ClearChoices	(DIA_Maleth_PROBLEME);
	Info_AddChoice	(DIA_Maleth_PROBLEME, DIALOG_BACK, DIA_Maleth_PROBLEME_Back );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Eh, cuidado con lo que dices, colega.", DIA_Maleth_PROBLEME_schafe_probleme_drohen );

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			Info_AddChoice	(DIA_Maleth_PROBLEME, "¿Qué te pasa?", DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag );
		};
};

func void DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00"); //¿Qué te pasa?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01"); //La culpa la tiene ese aguardiente clandestino que me colocó Vino hace unas semanas.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02"); //Apenas me acuerdo de nada, tío. Solo sé que desde entonces mi bastón ha desaparecido.
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03"); //¿Y por eso montas tanto follón?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04"); //Para ti resulta fácil decirlo. Como no es tuyo...
	
	Log_CreateTopic (TOPIC_MalethsGehstock, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MalethsGehstock, LOG_RUNNING);
	B_LogEntry (TOPIC_MalethsGehstock,"Maleth ha perdido su cayado. Estaba borracho como una cuba. Por lo que sé de él, nunca se aleja mucho de la granja de Lobart. Debería encontrarlo no muy lejos de allí."); 

	Info_ClearChoices	(DIA_Maleth_PROBLEME);
};

func void DIA_Maleth_PROBLEME_schafe_probleme_drohen ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00"); //Eh, cuidado con lo que dices, colega.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01"); //No haces más que fanfarronear. Sería mejor que te fueras.
};

func void DIA_Maleth_PROBLEME_Back ()
{
	Info_ClearChoices	(DIA_Maleth_PROBLEME);
};

///////////////////////////////////////////////////////////////////////
//	Info Gehstock
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_GEHSTOCK		(C_INFO)
{
	npc		 = 	BAU_954_Maleth;
	nr		 = 	33;
	condition	 = 	DIA_Maleth_GEHSTOCK_Condition;
	information	 = 	DIA_Maleth_GEHSTOCK_Info;

	description	 = 	"Creo que este bastón es tuyo.";
};

func int DIA_Maleth_GEHSTOCK_Condition ()
{
	if (Npc_HasItems (other,ItMw_MalethsGehstock_MIS))
	&& (Npc_KnowsInfo(other, DIA_Maleth_PROBLEME))
		{
				return TRUE;
		};
};

func void DIA_Maleth_GEHSTOCK_Info ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_00"); //Creo que este bastón es tuyo.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_01"); //Magnífico. Yo...
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_02"); //Un momento. Antes paga por él.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_03"); //Pero... no tengo gran cosa.
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_04"); //Entonces piensa en algo.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_05"); //Muy bien, a ver qué te parece esto. Ayer vi pasar unos bandidos con unas bolsas de oro.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_06"); //¿Si te digo dónde guardan el botón me devuelves el bastón?
	TOPIC_END_MalethsGehstock = TRUE;
	B_GivePlayerXP (XP_FoundMalethsGehstock);

	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
	Info_AddChoice	(DIA_Maleth_GEHSTOCK, "Lo siento, no me interesa. Quiero tu oro.", DIA_Maleth_GEHSTOCK_gold );
	Info_AddChoice	(DIA_Maleth_GEHSTOCK, "De acuerdo.", DIA_Maleth_GEHSTOCK_ok );
};
func void DIA_Maleth_GEHSTOCK_ok ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_ok_15_00"); //De acuerdo.
	B_GiveInvItems 		(other, self, ItMw_MalethsGehstock_MIS,1);
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_ok_08_01"); //Muy bien. Ve al oeste, a ese bosquecillo. Allí encontrarás un barranco.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_ok_08_02"); //En una cueva deberías encontrar algo.

	B_LogEntry (TOPIC_MalethsGehstock,"Maleth me ha dicho que hay un gran campamento de bandidos en los bosques que quedan al oeste de la granja de Lobart."); 
	CreateInvItems 		(BDT_1024_MalethsBandit, ItMi_MalethsBanditGold,1);
	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
	AI_StopProcessInfos (self);
};

func void DIA_Maleth_GEHSTOCK_gold ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_gold_15_00"); //Lo siento, no me interesa. Quiero tu oro.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_gold_08_01"); //Esto es todo lo que tengo. Tiene que bastar.
	CreateInvItems 		(self, Itmi_Gold, 35);
	B_GiveInvItems 		(self, other, Itmi_Gold,35);
	B_GiveInvItems 		(other, self, ItMw_MalethsGehstock_MIS,1);
	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
};

///////////////////////////////////////////////////////////////////////
//	Info perm3
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_PERM3		(C_INFO)
{
	npc		 = 	BAU_954_Maleth;
	nr		 = 	33;
	condition	 = 	DIA_Maleth_PERM3_Condition;
	information	 = 	DIA_Maleth_PERM3_Info;
	permanent	 = 	TRUE;

	description	 = 	"No te enfades tanto.";
};

func int DIA_Maleth_PERM3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_PROBLEME))
	&& (Kapitel >= 3)
			{
					return TRUE;
			};
};

func void DIA_Maleth_PERM3_Info ()
{
	AI_Output			(other, self, "DIA_Maleth_PERM3_15_00"); //No te enfades tanto.
	AI_Output			(self, other, "DIA_Maleth_PERM3_08_01"); //(Molesto) Lárgate.
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Maleth_KAP4_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP4_EXIT_Condition;
	information	= DIA_Maleth_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP4_EXIT_Info()
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

INSTANCE DIA_Maleth_KAP5_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP5_EXIT_Condition;
	information	= DIA_Maleth_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP5_EXIT_Info()
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


INSTANCE DIA_Maleth_KAP6_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP6_EXIT_Condition;
	information	= DIA_Maleth_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Maleth_PICKPOCKET (C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 900;
	condition	= DIA_Maleth_PICKPOCKET_Condition;
	information	= DIA_Maleth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Maleth_PICKPOCKET_Condition()
{
	C_Beklauen (10, 10);
};
 
FUNC VOID DIA_Maleth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Maleth_PICKPOCKET);
	Info_AddChoice		(DIA_Maleth_PICKPOCKET, DIALOG_BACK 		,DIA_Maleth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Maleth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Maleth_PICKPOCKET_DoIt);
};

func void DIA_Maleth_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Maleth_PICKPOCKET);
};
	
func void DIA_Maleth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Maleth_PICKPOCKET);
};






































































