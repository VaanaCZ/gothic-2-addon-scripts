// ************************************************************
// 			  				   EXIT 
// ************************************************************
instance DIA_Jarvis_EXIT(C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************
instance DIA_Jarvis_Hello (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_Hello_Condition;
	information	= DIA_Jarvis_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Jarvis_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_Hello_Info()
{	
	AI_Output (self, other, "DIA_Jarvis_Hello_04_00"); //¡Eh! ¿No te conozco de algo?
	AI_Output (other, self, "DIA_Jarvis_Hello_15_01"); //Es posible. También estaba en la colonia.
	AI_Output (self, other, "DIA_Jarvis_Hello_04_02"); //Eso es... ¿Qué quieres?
};
	
// ************************************************************
// 			  					DieLage 
// ************************************************************
instance DIA_Jarvis_DieLage (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_DieLage_Condition;
	information	= DIA_Jarvis_DieLage_Info;
	permanent	= FALSE;
	description = "¿Cómo van las cosas?";
};                       

FUNC INT DIA_Jarvis_DieLage_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Jarvis_DieLage_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DieLage_15_00"); //¿Cuál es la situación?
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_01"); //Ahora mismo tenemos problemas de verdad. Se están formando dos facciones entre los mercenarios.
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_02"); //Sylvio y su gente no tienen claro que Lee siga el plan correcto.
};
	
// ************************************************************
// 			  					TwoFronts 
// ************************************************************
instance DIA_Jarvis_TwoFronts (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_TwoFronts_Condition;
	information	= DIA_Jarvis_TwoFronts_Info;
	permanent	= FALSE;
	description = "¿Cómo se han formado dos facciones?";
};                       

FUNC INT DIA_Jarvis_TwoFronts_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_TwoFronts_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_TwoFronts_15_00"); //¿Cómo se han formado dos facciones?
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_01"); //La mayoría de nosotros salimos de la colonia con Lee.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_02"); //Pero algunos mercenarios se han apuntado después.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_03"); //Ellos no vienen de la colonia, sino del sur, donde luchaban con los orcos.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_04"); //De alguna manera se enteraron de que Lee necesitaba gente. Su líder era Sylvio.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_05"); //Accedió a que mandara Lee, pero ahora está intentando poner a los mercenarios contra él y contra su plan.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_06"); //Mucha de la gente de Lee no cree que sea un gran problema, pero conozco a los tipos como Sylvio.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_07"); //Hará lo que sea para salirse con la suya.
};
	
// ************************************************************
// 			  					LeesPlan 
// ************************************************************
instance DIA_Jarvis_LeesPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 4;
	condition	= DIA_Jarvis_LeesPlan_Condition;
	information	= DIA_Jarvis_LeesPlan_Info;
	permanent	= FALSE;
	description = "¿Sabes cuáles son las intenciones de Lee?";
};                       

FUNC INT DIA_Jarvis_LeesPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_LeesPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_LeesPlan_15_00"); //¿Sabes cuáles son las intenciones de Lee?
	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_01"); //Lee quiere que esperemos y dejemos que los paladines de la ciudad pasen hambre.
	};
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_02"); //Está planeando sacarnos a todos de la isla. Y bien sabe Innos que no tengo nada en contra de irme de aquí.
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_03"); //No estoy seguro de cómo planea hacerlo, pero confío en él. Hasta ahora nos ha liderado bien.
};

// ************************************************************
// 			  				SylviosPlan 
// ************************************************************
instance DIA_Jarvis_SylviosPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 5;
	condition	= DIA_Jarvis_SylviosPlan_Condition;
	information	= DIA_Jarvis_SylviosPlan_Info;
	permanent	= FALSE;
	description = "¿Sabes qué es lo que está haciendo Sylvio?";
};                       

FUNC INT DIA_Jarvis_SylviosPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosPlan_15_00"); //¿Sabes qué es lo que trama Sylvio?
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_01"); //Sylvio ha descubierto que algunos de los paladines se han ido a la antigua colonia.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_02"); //Dice que el resto de los paladines no se atreverán a atacarnos aquí y quiere que nos aprovechemos de la situación.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_03"); //Saquear las granjas pequeñas, emboscar las patrullas de la milicia que salgan de la ciudad, atracar a los viajeros... cosas así.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_04"); //Pero Lee cree que eso es lo peor que podemos hacer en nuestra situación.
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Jarvis_WannaJoin (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 6;
	condition	= DIA_Jarvis_WannaJoin_Condition;
	information	= DIA_Jarvis_WannaJoin_Info;
	permanent	= FALSE;
	description = "¡Quiero ser un mercenario!";
};                       

FUNC INT DIA_Jarvis_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_WannaJoin_15_00"); //¡Quiero ser mercenario!
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_01"); //No estoy seguro de que sea buena idea...
	AI_Output (other,self , "DIA_Jarvis_WannaJoin_15_02"); //¿Cuál es el problema?
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_03"); //Bueno, tengo que votar a favor o en contra de ti.
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_04"); //Y teniendo en cuenta nuestra situación, ¡solo votaría por ti si supiera que estás del lado de Lee!
};

// ************************************************************
// 			  				Mission KO
// ************************************************************
instance DIA_Jarvis_MissionKO (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 7;
	condition	= DIA_Jarvis_MissionKO_Condition;
	information	= DIA_Jarvis_MissionKO_Info;
	permanent	= FALSE;
	description = "¿Y qué debería hacer?";
};                       

FUNC INT DIA_Jarvis_MissionKO_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Jarvis_WannaJoin))
	&& (Npc_KnowsInfo (other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_MissionKO_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_MissionKO_15_00"); //¿Y qué debería hacer?
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_01"); //Es sencillo. ¡Sacude a algunos de los chicos de Sylvio! De esa manera los dos bandos sabríamos de qué lado estás.
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_02"); //Y si te atienes a las reglas de los duelos, además te ganarás el respeto de los demás.
	
	MIS_Jarvis_SldKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	Log_CreateTopic (TOPIC_JarvisSLDKo,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JarvisSLDKo,LOG_RUNNING);
	B_LogEntry (TOPIC_JarvisSLDKo,"Jarvis quiere que tumbe a un par de los chicos de Sylvio y luego me dará su voto.");
};

// ************************************************************
// 			  				DuellRegeln
// ************************************************************
instance DIA_Jarvis_DuellRegeln (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_DuellRegeln_Condition;
	information	= DIA_Jarvis_DuellRegeln_Info;
	permanent	= FALSE;
	description = "¿Cuáles son las reglas de los duelos?";
};                       

FUNC INT DIA_Jarvis_DuellRegeln_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_DuellRegeln_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DuellRegeln_15_00"); //¿Cuáles son las reglas de un duelo?
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_01"); //Si te interesa, ve a ver a Torlof y que te las explique.
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_02"); //A ver si nos entendemos: me da igual si te atienes o no a las reglas, ¡siempre que hagas que muerdan el polvo!
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Y ni siquiera tengo que atenerme a las reglas de los duelos...");
};

// ************************************************************
// 			  				SylviosMen
// ************************************************************
instance DIA_Jarvis_SylviosMen (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_SylviosMen_Condition;
	information	= DIA_Jarvis_SylviosMen_Info;
	permanent	= FALSE;
	description = "¿Cuáles son los hombres de Sylvio?";
};                       

FUNC INT DIA_Jarvis_SylviosMen_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosMen_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosMen_15_00"); //¿Cuáles de entre los mercenarios son los hombres de Sylvio?
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_01"); //Hay seis hombres. Ante todo, están Sylvio y su mano derecha, Bullco.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_02"); //Luego están Rod, Sentenza, Fester y Raoul.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_03"); //El resto o son neutrales o están del lado de Lee.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Los hombres de Sylvio son el propio Sylvio, su teniente Bullco, Rod, Sentenza, Fester y Raoul.");
};

// ************************************************************
// 			  				HowMany
// ************************************************************
instance DIA_Jarvis_HowMany (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowMany_Condition;
	information	= DIA_Jarvis_HowMany_Info;
	permanent	= FALSE;
	description = "¿A cúantos de los hombres de Sylvio tengo que derrotar?";
};                       

FUNC INT DIA_Jarvis_HowMany_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowMany_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowMany_15_00"); //¿Cuántos de los hombres de Sylvio debo derrotar?
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_01"); //Si tumbas a tres de ellos, entonces habrás probado de qué lado estás.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_02"); //A quién elijas, es asunto tuyo.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_03"); //Solo un pequeño consejo: no se trata de probar tu valentía. No vayas contra Sylvio. Te haría picadillo.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Basta con que tumbe a tres de los hombres de Sylvio. Lo mejor será que no me meta con el mismo Sylvio.");
};

// ************************************************************
// 			  				HowManyLeft
// ************************************************************
instance DIA_Jarvis_HowManyLeft (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowManyLeft_Condition;
	information	= DIA_Jarvis_HowManyLeft_Info;
	permanent	= TRUE;
	description = "¿Cuántos de los hombres de Sylvio están en mi lista?";
};                       

FUNC INT DIA_Jarvis_HowManyLeft_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jarvis_HowMany))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowManyLeft_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_00"); //¿Cuántos de los hombres de Sylvio siguen en mi lista?
	
	var int victories;
	victories = 0;
	
	if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Bullco.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_01"); //He podido con Bullco.
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_02"); //Lo he oído, no está mal.
		victories = victories + 1; 

	};
	if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Rod.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_03"); //Rod parece que está un poco perjudicado.
		victories = victories + 1;
	};
	if (Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Sentenza.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (Npc_KnowsInfo (other, DIA_Sentenza_Hello))
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_04"); //Sentenza intentó sacarme algo de oro. No fue una buena idea.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_05"); //He tumbado a Sentenza.
		};

		victories = victories + 1;
	};

	if (Fester.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Fester.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (MIS_Fester_KillBugs == LOG_OBSOLETE)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_06"); //Fester intentó acabar conmigo. Fue un gran error.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_07"); //Fester ha conseguido lo que se merecía.
		};
		victories = victories + 1;
	};
	
	if (Raoul.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Raoul.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (victories == 0)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_08"); //Y con respecto a Raoul...
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_09"); //Fui a ver a Raoul...
		};
	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_10"); //¿Y?
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_11"); //Le hacía mucha falta una buena paliza.
		victories = victories + 1;
	};
	
	
	// ------------------------
	if (victories < 3)
	{	
		if (victories == 0)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_12"); //Hasta ahora no has tumbado a ninguno de los hombres de Sylvio.
		}
		else // 1-2
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_13"); //Bien, habrá que seguir intentándolo.
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_14"); //Espero que puedas con al menos tres de ellos.
	}
	else // 3 oder mehr
	{	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_15"); //Basta, basta.
		if (victories == 6)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_16"); //Les has zumbado a todos ellos, ¿eh?
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_17"); //Estoy impresionado: si Lee me pregunta, te votaré sin dudarlo.
		
		MIS_Jarvis_SldKO = LOG_SUCCESS;
		
		self.aivar[AIV_IGNORE_Murder] = FALSE;
		
		B_GivePlayerXP ((XP_Ambient)*victories);
		B_LogEntry (TOPIC_SLDRespekt,"Jarvis votará por mí si quiero unirme a los mercenarios.");
	};
};


// ###############################
// ##							##
// 			Höhere Gilden
// ##							##
// ###############################


// ************************************************************
// 			  				HowMany
// ************************************************************
var int Jarvis_GuildComment;
var int Jarvis_SylvioComment;

instance DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= FALSE;
	description = "¿Alguna novedad?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_PERM_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_PERM_15_00"); //¿Alguna novedad?
	
	if (Kapitel <= 3)
	{
		if (Jarvis_GuildComment == FALSE)
		{
			if (other.guild == GIL_SLD)
			|| (other.guild == GIL_DJG)
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_01"); //Ahora eres uno de los nuestros. Eso está bien.
			}
			else
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_02"); //Te has equivocado. Podrías haber sido uno de los nuestros.
			};
		
			Jarvis_GuildComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_03"); //Últimamente la gente de Sylvio ha estado muy tranquilita. (Se ríe).
		};
	};
	
	if (Kapitel >= 4)
	{
		if (Jarvis_SylvioComment == FALSE)
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_04"); //Por fin se ha ido Sylvio. Cuando oyó hablar de dragones, algunos de sus chicos y él se fueron a la colonia minera.
			AI_Output (self, other, "DIA_Jarvis_PERM_04_05"); //Seguramente piense que allí se puede ganar más.
			Jarvis_SylvioComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_06"); //Nada, hasta ahora todo está tranquilo. Estoy impaciente por ver qué pasa.
		};
	};
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jarvis_PICKPOCKET (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 900;
	condition	= DIA_Jarvis_PICKPOCKET_Condition;
	information	= DIA_Jarvis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jarvis_PICKPOCKET_Condition()
{
	C_Beklauen (41, 55);
};
 
FUNC VOID DIA_Jarvis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jarvis_PICKPOCKET);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_BACK 		,DIA_Jarvis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jarvis_PICKPOCKET_DoIt);
};

func void DIA_Jarvis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};
	
func void DIA_Jarvis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};





		





