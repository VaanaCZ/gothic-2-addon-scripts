// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Thekla_EXIT (C_INFO)
{
	npc         = BAU_913_Thekla;
	nr          = 999;
	condition   = DIA_Thekla_EXIT_Condition;
	information = DIA_Thekla_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Thekla_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Thekla_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
instance DIA_Thekla_HALLO		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 1;
	condition	= DIA_Thekla_HALLO_Condition;
	information	= DIA_Thekla_HALLO_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Thekla_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Thekla_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Thekla_HALLO_17_00"); //¿Qué haces en mi cocina?
};

// ************************************************************
// 			  				   Lecker
// ************************************************************
instance DIA_Thekla_Lecker		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 2;
	condition	= DIA_Thekla_Lecker_Condition;
	information	= DIA_Thekla_Lecker_Info;
	permanent 	= FALSE;
	description	= "¡Aquí hay algo que huele a gloria!";
};

func int DIA_Thekla_Lecker_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Lecker_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Lecker_15_00"); //¡Aquí hay algo que huele a gloria!
	AI_Output (self, other, "DIA_Thekla_Lecker_17_01"); //¡Oh, sí! ¡Conozco a los de tu calaña! Pululan por todas partes.
	AI_Output (self, other, "DIA_Thekla_Lecker_17_02"); //Primero intentan congraciarse contigo y, luego, cuando los necesitas, desaparecen.
};

// ************************************************************
// 			  				   Hunger
// ************************************************************
var int Thekla_GaveStew;
// ---------------------

instance DIA_Thekla_Hunger		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 3;
	condition	= DIA_Thekla_Hunger_Condition;
	information	= DIA_Thekla_Hunger_Info;
	permanent 	= FALSE;
	description	= "¡Tengo hambre!";
};

func int DIA_Thekla_Hunger_Condition ()
{
	if (Thekla_GaveStew == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Hunger_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Hunger_15_00"); //¡Tengo hambre!
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_01"); //No sirvo a los vagabundos. Solo alimento a la gente que trabaja.
		AI_Output (self, other, "DIA_Thekla_Hunger_17_02"); //(Con desprecio) Y a esa chusma mercenaria, por supuesto.
	}
	else if (other.guild == GIL_SLD)
	|| 		(other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_03"); //Ten, tu manduca.
		B_GiveInvItems (self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_04"); //Aquí no servimos a los milicianos.
	}
	else //Pal, Kdf oder Nov
	{
		AI_Output (self, other, "DIA_Thekla_Hunger_17_05"); //¿Cómo voy a negarme si me lo pide un representante de Innos?
		B_GiveInvItems (self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	};
};

// ************************************************************
// 			  				   Arbeit
// ************************************************************

instance DIA_Thekla_Arbeit		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 4;
	condition	= DIA_Thekla_Arbeit_Condition;
	information	= DIA_Thekla_Arbeit_Info;
	permanent 	= FALSE;
	description	= "Busco trabajo.";
};

func int DIA_Thekla_Arbeit_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Arbeit_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Arbeit_15_00"); //Busco trabajo...
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_01"); //¿Quieres trabajar aquí en la granja?
	AI_Output (self, other, "DIA_Thekla_Arbeit_17_02"); //Onar es el único que puede decidirlo. La granja es suya, como todo el valle.
};

// ************************************************************
// 			  				   WannaJoin
// ************************************************************

instance DIA_Thekla_WannaJoin		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 5;
	condition	= DIA_Thekla_WannaJoin_Condition;
	information	= DIA_Thekla_WannaJoin_Info;
	permanent 	= FALSE;
	description	= "La verdad es que tenía pensado unirme a los mercenarios...";
};

func int DIA_Thekla_WannaJoin_Condition ()
{
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Thekla_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Thekla_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Thekla_WannaJoin_15_00"); //La verdad es que tenía pensado unirme a los mercenarios...
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_01"); //¿Así que eres otro de los delincuentes de la colonia penal?
	AI_Output (self, other, "DIA_Thekla_WannaJoin_17_02"); //¡Me lo tenía que haber imaginado! ¡Déjame en paz! ¡Ya hay bastantes de los de tu calaña por aquí!
};

// ************************************************************
// 			  				   Schlafen
// ************************************************************

instance DIA_Thekla_Schlafen		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 6;
	condition	= DIA_Thekla_Schlafen_Condition;
	information	= DIA_Thekla_Schlafen_Info;
	permanent 	= FALSE;
	description	= "Necesito algún lugar en donde dormir.";
};

func int DIA_Thekla_Schlafen_Condition ()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Schlafen_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Schlafen_15_00"); //Necesito algún lugar en donde dormir.
	AI_Output (self, other, "DIA_Thekla_Schlafen_17_01"); //Ni se te ocurra dormir en mi cocina. Búscate un lugar en el granero.
};
		
// ************************************************************
// 			  				   Problem
// ************************************************************

instance DIA_Thekla_Problem		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_Problem_Condition;
	information	= DIA_Thekla_Problem_Info;
	permanent 	= FALSE;
	description	= "¿Qué problema tienes con los mercenarios?";
};

func int DIA_Thekla_Problem_Condition ()
{
	if (kapitel <= 3)
	&& (Npc_KnowsInfo (other, DIA_Thekla_WannaJoin))
	{
		return TRUE;
	};
};

func void DIA_Thekla_Problem_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Problem_15_00"); //¿Qué problema tienes con los mercenarios?
	AI_Output (self, other, "DIA_Thekla_Problem_17_01"); //¡Esos imbéciles me sacan de quicio! Sobre todo Sylvio y su gordo amigo Bullco.
	AI_Output (self, other, "DIA_Thekla_Problem_17_02"); //Esos dos llevan días sentados en su rincón y haciéndome la vida imposible.
	AI_Output (self, other, "DIA_Thekla_Problem_17_03"); //La sopa está muy caliente, la carne está muy dura, etcétera, etcétera.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Thekla_Problem_15_04"); //¿Y por qué no haces algo al respecto?
		AI_Output (self, other, "DIA_Thekla_Problem_17_05"); //¿Y qué voy a hacer, listillo? ¿Sacudirles con el rodillo? A los granjeros sí puedo hacérselo, pero esos bastardos devuelven los golpes.
	};
};

// ************************************************************
// 			  				   Manieren
// ************************************************************

instance DIA_Thekla_Manieren		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_Manieren_Condition;
	information	= DIA_Thekla_Manieren_Info;
	permanent 	= FALSE;
	description	= "¿Quieres que les enseñe modales a esos dos?";
};

func int DIA_Thekla_Manieren_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Thekla_Problem)) 
	&& (Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Manieren_Info ()
{
	AI_Output (other, self, "DIA_Thekla_Manieren_15_00"); //¿Quieres que les enseñe modales a esos dos?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_01"); //Ni lo intentes, querido. Tengo entendido que Sylvio tiene una armadura mágica. Es invencible.
	AI_Output (other, self, "DIA_Thekla_Manieren_15_02"); //¿Y Bullco?
	AI_Output (self, other, "DIA_Thekla_Manieren_17_03"); //Ese tipo es fuerte como un toro. Hasta la fecha ha aplastado a todos los que se han metido con él o con Sylvio.
};
		
// ************************************************************
// 			  				  After Fight
// ************************************************************

instance DIA_Thekla_AfterFight (C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 7;
	condition	= DIA_Thekla_AfterFight_Condition;
	information	= DIA_Thekla_AfterFight_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Thekla_AfterFight_Condition ()
{
	if (Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Thekla_AfterFight_Info ()
{
	if (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_00"); //Le has dado una buena a Bullco, cielo.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_01"); //Tiene que ser agotador darle una paliza a ese cerdo.
	}
	else //Sylvio oder Bullco gewonnen
	{
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_02"); //Menuda paliza te han dado, majo.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_03"); //¿No te lo advertí? Ahora ya sabes a lo que me refería.
		AI_Output (other, self, "DIA_Thekla_AfterFight_15_04"); //Me alegra ver que te lo estás pasando bien.
		AI_Output (self, other, "DIA_Thekla_AfterFight_17_05"); //No pongas esa cara. No eres el primero que recibe una paliza de ese tipejo.
	};
	
	AI_Output (self, other, "DIA_Thekla_AfterFight_17_06"); //Ten, come algo para recuperar fuerzas.
	B_GiveInvItems (self, other, ItFo_XPStew, 1);	
	Thekla_GaveStew = TRUE;
};

// ************************************************************
// 			  				 PaketSuccess 
// ************************************************************
instance DIA_Thekla_SagittaPaket (C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 4;
	condition	= DIA_Thekla_SagittaPaket_Condition;
	information	= DIA_Thekla_SagittaPaket_Info;
	permanent 	= TRUE;
	description	= "Aquí tienes el paquete de Sagitta.";
};

func int DIA_Thekla_SagittaPaket_Condition ()
{
	if (Npc_HasItems (other,ItMi_TheklasPaket))
	&& (MIS_Thekla_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Thekla_SagittaPaket_Info ()
{
	B_GiveInvItems (other, self, ItMi_TheklasPaket, 1);
	AI_Output (other, self, "DIA_Thekla_SagittaPaket_15_00"); //Aquí tienes el paquete de Sagitta.
	AI_Output (self, other, "DIA_Thekla_SagittaPaket_17_01"); //Muchas gracias. Por lo menos sabes echar una mano.
	MIS_Thekla_Paket = LOG_SUCCESS;
	B_GivePlayerXP (XP_TheklasPaket);		
};

// ************************************************************
// 			  				   PERM 
// ************************************************************
var int Thekla_MehrEintopfKap1;
var int Thekla_MehrEintopfKap3;
var int Thekla_MehrEintopfKap5;
// ------------------------

instance DIA_Thekla_PERM		(C_INFO)
{
	npc		 	= BAU_913_Thekla;
	nr		 	= 900;
	condition	= DIA_Thekla_PERM_Condition;
	information	= DIA_Thekla_PERM_Info;
	permanent	= TRUE;
	description	= "¿Me sirves más estofado?";
};
func int DIA_Thekla_PERM_Condition()
{
	if (Thekla_GaveStew == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_PERM_Info()
{
	AI_Output (other, self, "DIA_Thekla_PERM_15_00"); //¿Me sirves más estofado?
	
	if (MIS_Thekla_Paket == FALSE)
	{	
		AI_Output (self, other, "DIA_Thekla_PERM_17_01"); //No me queda.
		AI_Output (other, self, "DIA_Thekla_PERM_15_02"); //¿Ni un platito?
		AI_Output (self, other, "DIA_Thekla_PERM_17_03"); //No.
		AI_Output (other, self, "DIA_Thekla_PERM_15_04"); //¿Me dejas lamer la cacerola?
		AI_Output (self, other, "DIA_Thekla_PERM_17_05"); //¡Basta ya!
		AI_Output (self, other, "DIA_Thekla_PERM_17_06"); //Si tanto te gusta el estofado, tendrás que hacer algo para ganártelo.
		AI_Output (other, self, "DIA_Thekla_PERM_15_07"); //¿Qué?
		AI_Output (self, other, "DIA_Thekla_PERM_17_08"); //Ve a ver a Sagitta, la curandera que vive detrás de la granja de Sekob y tráeme un paquete de sus hierbas.
		AI_Output (self, other, "DIA_Thekla_PERM_17_09"); //Si me traes las hierbas, te hago estofado.
		
		MIS_Thekla_Paket = LOG_RUNNING;
		
		CreateInvItems (Sagitta,ItMi_TheklasPaket,1);
		
		Log_CreateTopic (TOPIC_TheklaEintopf,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_TheklaEintopf,LOG_RUNNING);
		B_LogEntry (TOPIC_TheklaEintopf,"Si llevo a Thekla las hierbas de Sagitta, la sanadora, me hará otro estofado. Sagitta vive detrás de la granja de Sekob.");
		
	}
	else if (MIS_Thekla_Paket == LOG_SUCCESS)
	{
		if (Kapitel <= 2)
		{
			if (Thekla_MehrEintopfKap1 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_10"); //Muy bien, seré buena. Ten. Para que no te me mueras de hambre aquí mismo.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap1 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_11"); //¡Eh, eh, eh, no seas tan tragón! Ya te avisaré cuando quiera que hagas algo más.
				AI_Output (self, other, "DIA_Thekla_PERM_17_12"); //Y luego te serviré más estofado, ¿te enteras?
			};
		};
		
		if (Kapitel == 3)
		|| (Kapitel == 4)
		{
			if (Thekla_MehrEintopfKap3 == FALSE)
			&& (MIS_RescueBennet == LOG_SUCCESS)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_13"); //Tengo entendido que sacaste de la cárcel a Bennet. Buen trabajo, chaval.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap3 = TRUE;
			}
			else 
			{
				if (MIS_RescueBennet != LOG_SUCCESS)
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_14"); //Esos cerdos de la milicia han metido en chirona a Bennet.
					AI_Output (self, other, "DIA_Thekla_PERM_17_15"); //Hazme el favor de sacarlo, ¿quieres? Mientras tanto, te prepararé un sabroso estofado.
				}
				else
				{
					AI_Output (self, other, "DIA_Thekla_PERM_17_16"); //No me queda. Vuelve luego.
				};
			};
		};
		
		if (Kapitel >= 5)	
		{
			if (Thekla_MehrEintopfKap5 == FALSE)
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_17"); //Siempre tienes hambre, ¿no? ¿Se puede saber a qué te dedicas?
				AI_Output (other, self, "DIA_Thekla_PERM_15_18"); //Me he cargado unos cuantos dragones.
				AI_Output (self, other, "DIA_Thekla_PERM_17_19"); //¡Oh! Entonces, supongo que es hora de servirte un suculento cuenco de estofado.
				B_GiveInvItems (self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap5 = TRUE;
			}
			else 
			{
				AI_Output (self, other, "DIA_Thekla_PERM_17_20"); //Se ha acabado. No queda más estofado.
			};
		};
	}
	else //Running oder Failed
	{
		AI_Output (self, other, "DIA_Thekla_PERM_17_21"); //Sin hierbas, no hay estofado. ¿Te enteras?
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thekla_PICKPOCKET (C_INFO)
{
	npc			= BAU_913_Thekla;
	nr			= 900;
	condition	= DIA_Thekla_PICKPOCKET_Condition;
	information	= DIA_Thekla_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Thekla_PICKPOCKET_Condition()
{
	C_Beklauen (53, 60);
};
 
FUNC VOID DIA_Thekla_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thekla_PICKPOCKET);
	Info_AddChoice		(DIA_Thekla_PICKPOCKET, DIALOG_BACK 		,DIA_Thekla_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thekla_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thekla_PICKPOCKET_DoIt);
};

func void DIA_Thekla_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thekla_PICKPOCKET);
};
	
func void DIA_Thekla_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thekla_PICKPOCKET);
};























